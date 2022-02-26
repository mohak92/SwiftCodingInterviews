public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    func findMiddle(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head;
        var fast: ListNode? = head;
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next;
            fast = fast?.next?.next;
        }
        
        return slow;
    }
    
}

var myList: ListNode? = ListNode(1);
myList?.next = ListNode(2);
myList?.next?.next = ListNode(3)
myList?.next?.next?.next = ListNode(4)
myList?.next?.next?.next?.next = ListNode(5)
let sol = Solution();
print(sol.findMiddle(myList)?.val as Any);

myList?.next?.next?.next?.next?.next = ListNode(6)
print(sol.findMiddle(myList)?.val as Any);

myList?.next?.next?.next?.next?.next?.next = ListNode(7)
print(sol.findMiddle(myList)?.val as Any);
