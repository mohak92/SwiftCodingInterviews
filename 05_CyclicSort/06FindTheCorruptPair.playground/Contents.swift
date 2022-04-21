func findCorruptPair(_ nums: inout [Int]) -> [Int] {
    var i: Int = 0;
    while i < nums.count {
        if nums[i] != nums[nums[i] - 1] {
            nums.swapAt(i, nums[i] - 1);
        } else {
            i += 1;
        }
    }
    
    for i in 0 ..< nums.count {
        if nums[i] != i + 1 {
            return [nums[i], i + 1];
        }
    }
    return [-1, -1];
}

var nums: [Int] = [3, 1, 2, 5, 2];
print("Input: ", nums);
print("Output: ", findCorruptPair(&nums), "\n");

nums = [3, 1, 2, 3, 6, 4 ];
print("Input: ", nums);
print("Output: ", findCorruptPair(&nums));
