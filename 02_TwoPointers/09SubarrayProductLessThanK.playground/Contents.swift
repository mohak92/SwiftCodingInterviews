func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
    if k <= 1 {
        return 0;
    }
    
    var product: Int = 1, left: Int = 0, count: Int = 0;
    
    for right in 0 ..< nums.count {
        product *= nums[right];
        while product >= k {
            product /= nums[left];
            left += 1;
        }
        
        count += right - left + 1;
    }
    
    return count;
}

var nums: [Int] = [10, 5, 2, 6];
var k: Int = 100
print(numSubarrayProductLessThanK(nums, k));

nums = [1, 2, 3];
k = 0;
print(numSubarrayProductLessThanK(nums, k));
