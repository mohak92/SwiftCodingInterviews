public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    func isPalindrome(_ head: inout ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return true;
        }
        
        var slow: ListNode? = head;
        var fast: ListNode? = head;
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next;
            fast = fast?.next?.next;
        }
        
        var headSecondHalf: ListNode? = reverse(&slow);
        var copyHeadSecondHalf: ListNode? = headSecondHalf;
        
        while head != nil && headSecondHalf != nil {
            if head?.val != headSecondHalf?.val {
                break;
            }
            head = head?.next;
            headSecondHalf = headSecondHalf?.next;
        }
        
        reverse(&copyHeadSecondHalf);
        if head == nil || headSecondHalf == nil {
            return true;
        }
        
        return false;
    }
    
    func reverse(_ head: inout ListNode?) -> ListNode? {
        var prev: ListNode? = nil;
        while head != nil {
            let next: ListNode? = head?.next;
            head?.next = prev;
            prev = head;
            head = next;
        }
        return prev;
    }
}

var myList: ListNode? = ListNode(2);
myList?.next = ListNode(4)
myList?.next?.next = ListNode(6)
myList?.next?.next?.next = ListNode(4)
myList?.next?.next?.next?.next = ListNode(2)
let sol = Solution();
print(sol.isPalindrome(&myList));

var myList2: ListNode? = ListNode(2);
myList2?.next = ListNode(4)
myList2?.next?.next = ListNode(6)
myList2?.next?.next?.next = ListNode(4)
myList2?.next?.next?.next?.next = ListNode(2)
myList2?.next?.next?.next?.next?.next = ListNode(2);
print(sol.isPalindrome(&myList2));
