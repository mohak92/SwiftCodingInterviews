func remove(_ nums: inout [Int]) -> Int {
    var nextNonDuplicate: Int = 1;
    
    for i in 0 ..< nums.count {
        if nums[nextNonDuplicate - 1] != nums[i] {
            nums[nextNonDuplicate] = nums[i];
            nextNonDuplicate += 1;
        }
    }
    
    return nextNonDuplicate;
}

var nums: [Int] = [2, 3, 3, 3, 6, 9, 9];
print(remove(&nums));

nums = [2, 2, 2, 11 ];
print(remove(&nums));
