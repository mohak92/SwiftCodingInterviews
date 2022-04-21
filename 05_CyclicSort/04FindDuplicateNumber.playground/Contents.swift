func findDuplicate(_ nums: [Int]) -> Int {
    var slow: Int = 0, fast: Int = 0;
    
    repeat {
        slow = nums[slow];
        fast = nums[nums[fast]];
    } while slow != fast;
    
    var current = nums[slow];
    var cycleLength: Int = 0;
    repeat {
        current = nums[current];
        cycleLength += 1;
    } while current != nums[slow];
    
    return findStart(nums, &cycleLength);
}

func findStart(_ nums: [Int], _ cycleLength: inout Int) -> Int {
    var pointer1 = nums[0], pointer2 = nums[0];
    
    while cycleLength > 0 {
        pointer2 = nums[pointer2];
        cycleLength -= 1;
    }
    
    while pointer1 != pointer2 {
        pointer1 = nums[pointer1];
        pointer2 = nums[pointer2];
    }
    
    return pointer1;
}

var nums: [Int] = [1, 4, 4, 3, 2];
print("Input: ", nums);
print("Output: ", findDuplicate(nums), "\n");

nums = [2, 1, 3, 3, 5, 4];
print("Input: ", nums);
print("Output: ", findDuplicate(nums), "\n");

nums = [2, 4, 1, 4, 4];
print("Input: ", nums);
print("Output: ", findDuplicate(nums));
