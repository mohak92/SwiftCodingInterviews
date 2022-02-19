func findMaxSumSubarray(_ k: Int, _ nums:[Int]) -> Int {
    var windowSum: Int = 0, maxSum = 0;
    var windowStart: Int = 0;
    
    for windowEnd in 0 ..< nums.count {
        windowSum += nums[windowEnd];
        if windowEnd >= k - 1 {
            maxSum = max(maxSum, windowSum);
            windowSum -= nums[windowStart];
            windowStart += 1;
        }
    }
    
    return maxSum;
}

var nums: [Int] = [2, 1, 5, 1, 3, 2];
var k: Int = 3;
print(findMaxSumSubarray(k, nums));

nums = [2, 3, 4, 1, 5];
k = 2;
print(findMaxSumSubarray(k, nums));
