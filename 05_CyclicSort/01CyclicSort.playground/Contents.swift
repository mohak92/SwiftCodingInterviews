func cyclicSort(_ nums: inout [Int]) {
    var i: Int = 0;
    while i < nums.count {
        if nums[i] != nums[nums[i] - 1] {
            nums.swapAt(i, nums[i] - 1);
        } else {
            i += 1;
        }
    }
}

var nums: [Int] = [3, 1, 5, 4, 2];
print("Input: ", nums);
cyclicSort(&nums)
print("Output: ", nums, "\n")

nums = [2, 6, 4, 3, 1, 5];
print("Input: ", nums);
cyclicSort(&nums)
print("Output: ", nums, "\n")

nums = [1, 5, 6, 4, 3, 2];
print("Input: ", nums);
cyclicSort(&nums)
print("Output: ", nums)
