public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func findCycleLength(_ head: ListNode?) -> Int {
        var slow: ListNode? = head;
        var fast: ListNode? = head;
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next;
            fast = fast?.next?.next;
            if slow === fast {
                return calculateLength(slow);
            }
        }
        
        return 0;
    }
    
    func calculateLength(_ slow: ListNode?) -> Int {
        var current: ListNode? = slow;
        var cycleLength: Int = 0;
        repeat {
            current = current?.next;
            cycleLength += 1;
        } while current !== slow;
        return cycleLength;
    }
}

var myList: ListNode? = ListNode(1);
myList?.next = ListNode(2);
myList?.next?.next = ListNode(3)
myList?.next?.next?.next = ListNode(4)
myList?.next?.next?.next?.next = ListNode(5)
myList?.next?.next?.next?.next?.next = ListNode(6)
let sol = Solution();
print(sol.findCycleLength(myList));

myList?.next?.next?.next?.next?.next?.next = myList?.next?.next;
print(sol.findCycleLength(myList));

myList?.next?.next?.next?.next?.next?.next = myList?.next?.next?.next;
print(sol.findCycleLength(myList));
