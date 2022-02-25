func sort(_ nums: [Int]) -> Int {
    var low: Int = 0, high: Int = nums.count - 1;
    
    while low < nums.count - 1 && nums[low] <= nums[low + 1] {
        low += 1;
    }
    
    if low == nums.count - 1 {
        return 0;
    }
    
    while high > 0 && nums[high] >= nums[high - 1] {
        high -= 1;
    }
    
    var subArrayMin: Int = Int.max, subArrayMax: Int = Int.min;
    for k in low ... high {
        subArrayMax = max(subArrayMax, nums[k]);
        subArrayMin = min(subArrayMin, nums[k]);
    }
    
    while low > 0 && nums[low - 1] > subArrayMin {
        low -= 1;
    }
    
    while high < nums.count - 1 && nums[high + 1] < subArrayMax {
        high += 1;
    }
    
    return high - low + 1;
}


print(sort([1, 2, 5, 3, 7, 10, 9, 12 ]));
print(sort([1, 3, 2, 0, -1, 7, 10]));
print(sort([1, 2, 3]));
print(sort([3, 2, 1]));
