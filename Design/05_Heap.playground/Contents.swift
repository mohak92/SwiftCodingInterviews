public struct Heap<T> {
    
    var nodes = [T]();
    
    private var orderCriteria: (T, T) -> Bool;
    
    public init(sort: @escaping (T,T) -> Bool) {
        self.orderCriteria = sort;
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty;
    }
    
    public var count: Int {
        return nodes.count;
    }
    
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2;
    }
    
    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 1;
    }
    
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 2;
    }
    
    public func top() -> T? {
        return nodes.first;
    }
}
