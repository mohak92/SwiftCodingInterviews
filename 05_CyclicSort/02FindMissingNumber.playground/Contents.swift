func findMissingNumber(_ nums: inout [Int]) -> Int {
    var i: Int = 0;
    while i < nums.count {
        if nums[i] < nums.count && nums[i] != nums[nums[i]] {
            nums.swapAt(i, nums[i]);
        } else {
            i += 1;
        }
    }
    
    for i in 0 ..< nums.count {
        if nums[i] != i {
            return i;
        }
    }
    
    return nums.count;
}

var nums: [Int] = [4, 0, 3, 1];
print("Input: ", nums);
print("Output: ", findMissingNumber(&nums), "\n");

nums = [8, 3, 5, 2, 4, 6, 0, 1];
print("Input: ", nums);
print("Output: ", findMissingNumber(&nums));
