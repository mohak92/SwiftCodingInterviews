func findAllDuplicates(_ nums: inout [Int]) -> [Int] {
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
            result.append(nums[i]);
        }
    }
    return result;
}

var nums: [Int] = [3, 4, 4, 5, 5];
print("Input: ", nums);
print("Output: ", findAllDuplicates(&nums), "\n");

nums = [5, 4, 7, 2, 3, 5, 3];
print("Input: ", nums);
print("Output: ", findAllDuplicates(&nums));
