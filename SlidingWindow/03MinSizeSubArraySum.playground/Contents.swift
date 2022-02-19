func findMinSumSubArray(_ s: Int, _ nums: [Int]) -> Int {
    var windowSum: Int = 0, minLength = Int.max;
    var windoStart: Int = 0;
    
    for windowEnd in 0 ..< nums.count {
        windowSum += nums[windowEnd];
        
        while windowSum >= s {
            minLength = min(minLength, windowEnd - windoStart + 1);
            windowSum -= nums[windoStart];
            windoStart += 1;
        }
    }
    
    return minLength == Int.max ? 0 : minLength;
}

var s: Int  = 7;
var nums: [Int] = [2, 1, 5, 2, 3, 2];
print(findMinSumSubArray(s, nums));

nums = [2, 1, 5, 2, 8];
print(findMinSumSubArray(s, nums));

s = 8;
nums = [3, 4, 1, 1, 6];
print(findMinSumSubArray(s, nums));
