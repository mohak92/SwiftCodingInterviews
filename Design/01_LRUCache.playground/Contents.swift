class ListNode {
    var key: Int;
    var value: Int;
    var next: ListNode?;
    var prev: ListNode?;
    public init(_ key: Int, _ value: Int) {
        self.key = key;
        self.value = value;
    }
}

class DoubleLinkedList {
    var head: ListNode?;
    var tail: ListNode?;
    
    public init() {
        head = ListNode(0, 0);
        tail = ListNode(0, 0);
        head?.next = tail;
        tail?.next = head;
    }
    
    func add(_ node: ListNode?) {
        node?.prev = head;
        node?.next = head?.next;
        head?.next?.prev = node;
        head?.next = node;
    }
    
    func remove(_ node: ListNode?) {
        node?.prev?.next = node?.next;
        node?.next?.prev = node?.prev;
    }
    
    func update(_ node: ListNode?) {
        remove(node);
        add(node);
    }
}

class LRUCache {
    
    var capacity: Int;
    var count: Int;
    var map = [Int: ListNode]();
    var list: DoubleLinkedList;
    
    init(_ capacity: Int) {
        self.capacity = capacity;
        self.count = 0;
        list = DoubleLinkedList();
    }
    
    func get(_ key: Int) -> Int {
        let node = map[key];
        if node == nil {
            return -1;
        }
        list.update(node);
        return node!.value;
    }
    
    func put(_ key: Int, _ value: Int) {
        var node = map[key];
        
        if node == nil {
            node = ListNode(key, value);
            list.add(node);
            map[key] = node;
            count += 1;
        } else {
            node?.value = value;
            list.update(node);
        }
        
        if count > capacity {
            let nodeToDelete: ListNode? = list.tail?.prev;
            list.remove(nodeToDelete);
            map[nodeToDelete!.key] = nil;
            count -= 1;
        }
    }
}

var lRUCache: LRUCache = LRUCache(2);
lRUCache.put(1, 1); // cache is {1=1}
lRUCache.put(2, 2); // cache is {1=1, 2=2}
lRUCache.get(1);    // return 1
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
lRUCache.get(2);    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lRUCache.get(1);    // return -1 (not found)
lRUCache.get(3);    // return 3
lRUCache.get(4);    // return 4

print("""
 Input \n["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 """);
print("\nOutput: [null, null, null, 1, null, -1, null, -1, 3, 4]")
