public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow: ListNode? = head;
        var fast: ListNode? = head;
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next;
            fast = fast?.next?.next;
            if slow === fast {
                return true;
            }
        }
        
        return false;
    }
}

var myList: ListNode? = ListNode(1);
myList?.next = ListNode(2);
myList?.next?.next = ListNode(3)
myList?.next?.next?.next = ListNode(4)
myList?.next?.next?.next?.next = ListNode(5)
myList?.next?.next?.next?.next?.next = ListNode(6)
let sol = Solution();
print(sol.hasCycle(myList));

myList?.next?.next?.next?.next?.next?.next = myList?.next?.next;
print(sol.hasCycle(myList));

myList?.next?.next?.next?.next?.next?.next = myList?.next?.next?.next;
print(sol.hasCycle(myList));
