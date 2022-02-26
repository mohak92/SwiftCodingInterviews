public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    
    func findSuccessor(_ head: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            return nil;
        }
        
        var queue = [TreeNode?]();
        queue.append(root);
        
        while !queue.isEmpty {
            let currentNode: TreeNode? = queue.removeFirst();
            
            if currentNode?.left != nil {
                queue.append(currentNode?.left);
            }
            if currentNode?.right != nil {
                queue.append(currentNode?.right);
            }
            
            if currentNode?.val == key {
                break;
            }
            
        }
        
        return queue[0];
    }
    
}

var root: TreeNode? =  TreeNode(12);
root?.left =  TreeNode(7);
root?.right =  TreeNode(1);
root?.left?.left =  TreeNode(9);
root?.right?.left =  TreeNode(10);
root?.right?.right =  TreeNode(5);
let sol = Solution();
print(sol.findSuccessor(root, 12)?.val as Any);
print(sol.findSuccessor(root, 9)?.val as Any);
