// number of items we are going to sort
var N = 32;

// create an array containing n values from 1 to N inclusive and then shuffle it
var A = _.shuffle(_.times(N, function(i) {return 1+i;}));

// the viewing area for the entire tree struture we are going to use to visualize the process
var B = algo.BOUNDS.inflate(-8, -8);
    
// the algorithm to run
function* algorithm() {

    // recursive function that partitions its array into left and right halves until
    // only 1 item remains at which time the recursion terminates. As each partition is
    // recorded we create an element for it and assign it an x/y position in the recursive tree.
    // After we are done and we know the structure of the tree we can lay out the items using
    // a simple grid layout.
    // The width of each item is related to its depth in the tree
    
    var x = 0, maxDepth = 0, items = [];
    
    function partition(array, depth) {
        
        // keep track of left, right children and the item we create
        var left, right, nodeItem;
        
        // depth first traversal requires that we do left side of the tree first
        if (array.length > 1) {
            left = partition(array.slice(0, array.length >> 1), depth + 1);
        }
        
        // get track of how deep we go, this will gives us the number of rows in tree.
        maxDepth = Math.max(maxDepth, depth);
        
        // create the item to represent this node of the tree, using depth to set the width
        nodeItem = new item(x, depth, array);
        items.push(nodeItem);
        
        // bump x, using a depth first procedure each node in the tree is arranged left to right.
        x += 1;
        
        // now recur into the right child if there is one
        if (array.length > 1) {
            right = partition(array.slice(array.length >> 1, array.length), depth + 1);
        }
        
        // set up references to our children and give the children a reference to us
        if (left) {
            nodeItem.left = left;
            nodeItem.right = right;
            left.parent = nodeItem;
            right.parent = nodeItem;
        }
        
        // return the item we created
        return nodeItem;
    }
    
    // setup partitions and get a reference to the root node
    this.root = partition(A, 0);

    // create a grid layout to hold the tree items
    var gridLayout = new algo.layout.GridLayout(B, maxDepth + 1, x);
    
    // now position all the items, using a recursive procedure
    this.root.position(gridLayout);
    
    // now perform another depth traversal that reveals the partitions to the viewer
    //=partition
    function* partitionTraversal(item) {
        
        // create or bring down our red bars from the parent
        item.showRed();
        
        yield({
            step: "Recursively divided the original array into left and right partitions." + 
            " In a real merge sort we would then immediately merge the partitioned halves back together in sorted order." +
            " But here we want to show all the partitioned sub arrays first.",
            line: "partition"
        });
        
        // show the gray bars behind the red, these are used to indicate the unsorted
        // state of the partition
        item.showGray();
        
        // recur into children
        if (item.left) {
            yield* partitionTraversal(item.left);
            yield* partitionTraversal(item.right);
        }
    }
    
    // animate the partition of the data, that occurs before merging
    yield* partitionTraversal(this.root);
    
    yield({
        step: "The original array has been repeatedly subdivided into left and right halves until each subdivision contains only 1 item."
    });
    
    // now perform the merge traversal where we merge children of each node
    // back into a sorted set
    
    function* mergeTraversal(item) {
     
        // if we have no children then there is nothing to merge
        if (item.left) {
            
            // obviously we have to let our children merge first
            yield* mergeTraversal(item.left);
            yield* mergeTraversal(item.right);
            
            // now we can merge the contents of our children
            
            var i = 0, lbars = item.left.redBars.elements, rbars = item.right.redBars.elements;
            
            // loop while there are bars remaining in either child
            
            while (lbars.length || rbars.length) {
                
                // if there are items in both children take the lowest, otherwise just take from which ever side has bars
                //=merge
                var source;
                
                if (lbars.length)
                    lbars[0].set({state: algo.render.kS_GREEN});
                if (rbars.length)
                    rbars[0].set({state: algo.render.kS_GREEN});
                
                if (lbars.length && rbars.length) {
                    source = lbars[0].value < rbars[0].value ? lbars : rbars; 
                } else {
                    source = lbars.length ? lbars : rbars; 
                }
                
                // take bar from child and position within ourselves again
                var bar = source.shift();
                
                // shape of bar uses the height of the child bar
                var shape = item.getBarBox(i);
                shape.y = shape.b - bar.h;
                shape.h = bar.h;
                bar.set({shape: shape});
                
                // update the red bars collection for the node being merged into
                item.redBars.elements[i] = bar;
                
                // ready for next item
                i += 1;
                
                // show the merge to the user
                yield({
                    step: "Pull values from the items left or right child, always taking the lowest available value until both children are empty.",
                    line: "merge"
                });
                
                bar.set({state: algo.render.kS_RED});
            }
        }
    }
    
    // show the merge
    yield* mergeTraversal(this.root);
    
    yield({
        step: "All items have been merged back together in sorted order!"
    });
}

/**
 * instances of this object are used to represent the items and partitioned
 * subitems that this algorithm operates on. 
 */
var item = function(x, y, a) {
    
    // save our x/y position, data array
    this.x = x;
    this.y = y;
    this.a = a;
    
};

// pixel width of bars used to represent a single value in the item
item.kBAR = 16;

// z values for element layers
item.kTOP = 100;
item.kBOTTOM = 0;

/**
 * position the item according to its x/y position using the given grid layout
 */
item.prototype.position = function(gridLayout) {
    
    // create our element, initially hidden
    this.e = new algo.render.Rectangle({
        state: algo.render.kS_GRAY,
        visible: 'hidden',
        z: item.kTOP
    });
    
    // get node bounds from grid layout, which we use to calculate the height.
    var box = gridLayout.getBox(this.y, this.x);
    
    // required width should equal items in the array * width of each bar
    var w = this.a.length * item.kBAR;
    
    // height is 80% of containing box
    var h = box.h * 0.8;
    
    // actual box is derived from center of node, our width and the box height
    box = new algo.layout.Box(box.cx - w / 2,box.cy - h / 2,w,h);
    
    // apply to our item
    this.e.set({shape: box}); 
    
    // create a layout for ourselves, used to position bars within the item
    this.layout = new algo.layout.GridLayout(box, 1, this.a.length);
    
    // once created we can create the gray bars which never move
    this.grayBars = this.createBars('white');
    this.grayBars.set({visible: 'hidden'});
    
    // recur into children
    if (this.left) {
        this.left.position(gridLayout);
        this.right.position(gridLayout)
    }
};

/**
 * create bars for each value, using the given color and return them.
 */
item.prototype.createBars = function(color) {
  
    // display a bar for each value in our array
    var bars = new algo.render.ElementGroup();
    for(var i = 0; i < this.a.length; i +=1) {
        
        // add bar
        bars.add(new algo.render.Rectangle({
            shape: this.getBarBox(i),
            strokeWidth: 1,
            fill : color,
            stroke: color,
            opacity: 0.75,
            z: item.kTOP,
            value: this.a[i]
        }));
        
        bars.elements[bars.elements.length-1].set({fill: color});
    }
    return bars;
};

/**
 * get the bounds for the bar at index i in our arra
 */
item.prototype.getBarBox = function(i) {
 
     // get box for this column, and narrow slightly to space the bars
    var box = this.layout.getBox(0, i).inflate(-4, 0);
    
    // get height for bar (including + 1 for N so there is small gap at the top)
    var h = box.h / (N+1) * this.a[i];
    
    // return box
    return new algo.layout.Box(box.x, box.b - h, box.w, h);
};

/**
 * called when are ready to show this bar. For the root node is displays all the
 * values. For non root nodes we pull down the red bars from our parent. This
 * is called from within a depth first traversal of the tree so it provides
 * a visualization of the partitioning process.
 */
item.prototype.showRed = function () {

    // make outer element visible
    this.e.set({visible: 'visible'}); 
    
    // if we have a parent pull down the red bars from above, if we are the root
    // then we are responsible for creating the bars
    if (this.parent) {
      
        // get the starting index into the parents red bars, according to whether we are the
        // left or right child
        
        var index = this.parent.left === this ? 0 : this.parent.a.length >> 1;
        
        this.redBars = new algo.render.ElementGroup();
        
        for(var i = index, j = 0; j < this.a.length; i += 1, j += 1) {
            var bar = this.parent.redBars.elements[i]; 
            bar.set({
                shape: this.getBarBox(j)
            });
            this.redBars.add(bar);
        }
        
        // create a connector to our parent
        var a = this.e.getBounds(), b = this.parent.e.getBounds();
        new algo.render.Line({
            state: algo.render.kS_GRAY,
            x1: a.cx, y1: a.cy,
            x2: b.cx, y2: b.cy,
            thickness: item.kBAR / 4
        });
        
        
    } else {
        // if we are root node then create the red bars
        this.redBars = this.createBars(algo.Color.iRED);  
    }
};

/**
 * after we have created or pulled down the red bars we show the gray bars
 * behind them. The gray bars indicate the un-sorted values we hold initially
 */
item.prototype.showGray = function () {
  
  this.grayBars.set({visible: 'visible'});
  
};
