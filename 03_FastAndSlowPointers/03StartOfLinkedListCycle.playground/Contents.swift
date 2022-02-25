public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func findCycleStart(_ head: ListNode?) -> ListNode? {
        var cycleLength: Int = 0;
        var slow: ListNode? = head;
        var fast: ListNode? = head;
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next;
            fast = fast?.next?.next;
            if slow === fast {
                cycleLength = findCycleLength(slow);
                break;
            }
        }
        
        return findStart(head, &cycleLength);
    }
    
    func findCycleLength(_ slow: ListNode?) -> Int {
        var cycleLength: Int = 0;
        var current: ListNode? = slow;
        
        repeat {
            cycleLength += 1;
            current = current?.next;
        } while current !== slow;
        
        return cycleLength;
    }
    
    func findStart(_ head: ListNode?, _ cycleLength: inout Int) -> ListNode? {
        var pointer1: ListNode? = head;
        var pointer2: ListNode? = head;
        
        while cycleLength > 0 {
            cycleLength -= 1;
            pointer2 = pointer2?.next;
        }
        
        while pointer1 !== pointer2 {
            pointer1 = pointer1?.next;
            pointer2 = pointer2?.next;
        }
        
        return pointer1;
    }
}

var myList: ListNode? = ListNode(1);
myList?.next = ListNode(2);
myList?.next?.next = ListNode(3)
myList?.next?.next?.next = ListNode(4)
myList?.next?.next?.next?.next = ListNode(5)
myList?.next?.next?.next?.next?.next = ListNode(6)
let sol = Solution();

myList?.next?.next?.next?.next?.next?.next = myList?.next?.next;
print(sol.findCycleStart(myList)?.val as Any);

myList?.next?.next?.next?.next?.next?.next = myList?.next?.next?.next;
print(sol.findCycleStart(myList)?.val as Any);

myList?.next?.next?.next?.next?.next?.next = myList;
print(sol.findCycleStart(myList)?.val as Any);
