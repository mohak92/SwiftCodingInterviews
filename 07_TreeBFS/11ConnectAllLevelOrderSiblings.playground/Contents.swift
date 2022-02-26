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
        
        var currentNode: Node? = nil, previousNode: Node? = nil;
        while !queue.isEmpty {
            currentNode = queue.removeFirst();
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
        
        return root;
    }
    
}

func printTree(_ root: Node?) {
    var current: Node? = root;
    print("Traversal using 'next' pointer: ", terminator: "");
    while current != nil {
        print(current!.val, terminator: "->");
        if current?.next == nil {
            print("nil");
        }
        current = current?.next;
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
printTree(connectedSiblings);
