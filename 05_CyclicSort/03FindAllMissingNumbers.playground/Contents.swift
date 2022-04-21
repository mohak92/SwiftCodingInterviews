func findAllMissingNumbers(_ nums: inout [Int]) -> [Int] {
    var i: Int = 0;
    while i < nums.count {
        if nums[i] != nums[nums[i] - 1] {
            nums.swapAt(i, nums[i] - 1);
        } else {
            i += 1;
        }
    }
    
    var result = [Int]();
    for i in 0 ..< nums.count {
        if nums[i] != i + 1 {
            result.append(i + 1);
        }
    }
    
    return result;
}

var nums: [Int] = [2, 3, 1, 8, 2, 3, 5, 1];
print("Input: ", nums);
print("Output: ", findAllMissingNumbers(&nums), "\n")

nums = [2, 4, 1, 2];
print("Input: ", nums);
print("Output: ", findAllMissingNumbers(&nums), "\n")

nums = [2, 3, 2, 1];
print("Input: ", nums);
print("Output: ", findAllMissingNumbers(&nums))
