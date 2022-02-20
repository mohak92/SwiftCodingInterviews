func findLength(_ nums: [Int], _ k: Int) -> Int {
    var windowStart: Int = 0, maxLength: Int = 0, maxOnesCount: Int = 0;
    
    for windowEnd in 0 ..< nums.count {
        if nums[windowEnd] == 1 {
            maxOnesCount += 1;
        }
        
        if windowEnd - windowStart + 1 - maxOnesCount > k {
            if nums[windowStart] == 1 {
                maxOnesCount -= 1;
            }
            windowStart += 1;
        }
        
        maxLength = max(maxLength, windowEnd - windowStart + 1);
    }
    
    return maxLength;
}

var nums: [Int] = [ 0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1 ];
var k: Int = 2;
print(findLength(nums, k));

k = 3;
nums = [0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1];
print(findLength(nums, k));
