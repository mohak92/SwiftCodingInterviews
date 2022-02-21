func remove(_ nums: inout [Int], _ element: Int) -> Int {
    var nextElement: Int = 0;
    
    for i in 0 ..< nums.count {
        if nums[i] != element {
            nums[nextElement] = nums[i];
            nextElement += 1;
        }
    }
    
    return nextElement;
}

var nums: [Int] = [3, 2, 3, 6, 3, 10, 9, 3 ];
var element: Int = 3;
print(remove(&nums, element));

nums = [2, 11, 2, 2, 1 ];
element = 2;
print(remove(&nums, element));
