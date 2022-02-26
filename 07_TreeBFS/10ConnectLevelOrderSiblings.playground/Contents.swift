public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Solution {
    
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil;
        }
        
        var queue = [Node?]();
        queue.append(root);
        
        while !queue.isEmpty {
            var previousNode: Node? = nil;
            let levelSize = queue.count;
            for _ in 0 ..< levelSize {
                let currentNode: Node? = queue.removeFirst();
                if previousNode != nil {
                    previousNode?.next = currentNode;
                }
                previousNode = currentNode;
                if currentNode?.left != nil {
                    queue.append(currentNode?.left);
                }
                if currentNode?.right != nil {
                    queue.append(currentNode?.right);
                }
            }
        }
        
        return root;
    }
    
}

func printLevelOrder(_ root: Node?) {
    var nextLevelRoot: Node? = root;
    while nextLevelRoot != nil {
        var current: Node? = nextLevelRoot;
        nextLevelRoot = nil;
        while current != nil {
            print(current!.val as Any, terminator: " ");
            if nextLevelRoot == nil {
                if current?.left != nil {
                    nextLevelRoot = current?.left;
                }
                else if current?.right != nil {
                    nextLevelRoot = current?.right;
                }
            }
            if current?.next == nil {
                print("# ", terminator: "");
            }
            current = current?.next;
        }
    }
}

var root: Node? = Node(12);
root?.left =  Node(7);
root?.right =  Node(1);
root?.left?.left =  Node(9);
root?.right?.left =  Node(10);
root?.right?.right =  Node(5);

let sol = Solution();
var connectedSiblings: Node? = sol.connect(root);

printLevelOrder(connectedSiblings);
