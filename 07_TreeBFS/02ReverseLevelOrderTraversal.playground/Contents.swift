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
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return [];
        }
        
        var result = [[Int]]();
        var queue = [TreeNode?]();
        queue.append(root);
        
        while !queue.isEmpty {
            let levelSize = queue.count;
            var currentLevel = [Int]();
            for _ in 0 ..< levelSize {
                let currentNode: TreeNode? = queue.removeFirst();
                currentLevel.append(currentNode!.val);
                if currentNode?.left != nil {
                    queue.append(currentNode?.left);
                }
                if currentNode?.right != nil {
                    queue.append(currentNode?.right);
                }
            }
            result.insert(currentLevel, at: 0);
        }
        
        return result;
    }
}

var root: TreeNode? = TreeNode(12);
root?.left = TreeNode(7);
root?.right = TreeNode(1);
root?.left?.left = TreeNode(9);
root?.right?.left = TreeNode(10);
root?.right?.right = TreeNode(5);

var sol = Solution();
print(sol.levelOrderBottom(root));
