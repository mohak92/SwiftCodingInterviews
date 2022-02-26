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
    
    func findLevelAverages(_ root: TreeNode?) -> [Double] {
        if root == nil {
            return [];
        }
        
        var result = [Double]();
        var queue = [TreeNode?]();
        queue.append(root);
        
        while !queue.isEmpty {
            let levelSize = queue.count;
            var levelSum: Double = 0;
            for _ in 0 ..< levelSize {
                let currentNode: TreeNode? = queue.removeFirst();
                levelSum += Double(currentNode!.val);
                if currentNode?.left != nil {
                    queue.append(currentNode?.left);
                }
                if currentNode?.right != nil {
                    queue.append(currentNode?.right);
                }
            }
            
            result.append(levelSum / Double(levelSize));
        }
        
        return result;
    }
}

var root: TreeNode? = TreeNode(12);
root?.left = TreeNode(7);
root?.right = TreeNode(1);
root?.left?.left = TreeNode(9);
root?.left?.right = TreeNode(2);
root?.right?.left = TreeNode(10);
root?.right?.right = TreeNode(5);
let sol = Solution();
print(sol.findLevelAverages(root));
