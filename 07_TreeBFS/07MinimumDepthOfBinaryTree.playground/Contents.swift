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
    
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0;
        }
        
        var minDepth: Int = 0;
        var queue = [TreeNode?]();
        queue.append(root);
        
        while !queue.isEmpty {
            minDepth += 1;
            let levelSize: Int = queue.count;
            for _ in 0 ..< levelSize {
                let currentNode: TreeNode? = queue.removeFirst();
                
                if currentNode?.left == nil && currentNode?.right == nil {
                    return minDepth;
                }
                
                if currentNode?.left != nil {
                    queue.append(currentNode?.left);
                }
                if currentNode?.right != nil {
                    queue.append(currentNode?.right);
                }
            }
        }
        
        return minDepth;
    }
    
}

var root: TreeNode? = TreeNode(12);
root?.left = TreeNode(7);
root?.right = TreeNode(1);
root?.right?.left = TreeNode(10);
root?.right?.right = TreeNode(5);
let sol = Solution();
print(sol.minDepth(root));

root?.left?.left = TreeNode(9);
root?.right?.left?.left = TreeNode(11);
print(sol.minDepth(root));
