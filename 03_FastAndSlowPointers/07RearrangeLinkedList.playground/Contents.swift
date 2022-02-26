public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    func reorder(_ head: ListNode?) {
        if head == nil || head?.next == nil {
            return;
        }
        
        var slow: ListNode? = head, fast: ListNode? = head;
        while fast != nil && fast?.next != nil {
            slow = slow?.next;
            fast = fast?.next?.next;
        }
        
        var headSecondHalf: ListNode? = reverse(&slow);
        var headFirstHalf: ListNode? = head;
        
        while headFirstHalf != nil && headSecondHalf != nil {
            var temp: ListNode? = headFirstHalf?.next;
            headFirstHalf?.next = headSecondHalf;
            headFirstHalf = temp;
            
            temp = headSecondHalf?.next;
            headSecondHalf?.next = headFirstHalf;
            headSecondHalf = temp;
        }
        
        if headFirstHalf != nil {
            headFirstHalf?.next = nil;
        }
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

var head: ListNode? = ListNode(2);
head?.next = ListNode(4);
head?.next?.next = ListNode(6);
head?.next?.next?.next = ListNode(8);
head?.next?.next?.next?.next = ListNode(10);
head?.next?.next?.next?.next?.next = ListNode(12);
let sol = Solution();
sol.reorder(head);
while head != nil {
    print(head!.val, terminator: " -> ");
    if head?.next == nil {
        print("nil")
    }
    head = head?.next;
}
