func findAverages(_ k: Int, _ nums: [Int]) -> [Double] {
    var result = [Double](repeating: 0.00, count: nums.count - k + 1);
    var windowSum: Double = 0;
    var windoStart: Int = 0;
    
    for windowEnd in 0 ..< nums.count{
        windowSum += Double(nums[windowEnd]);
        
        if windowEnd >= k - 1 {
            result[windoStart] = windowSum / Double(k);
            windowSum -= Double(nums[windoStart]);
            windoStart += 1;
        }
    }
    
    return result;
}

var nums: [Int] = [1, 3, 2, 6, -1, 4, 1, 8, 2];
var k: Int = 5;

print(findAverages(k, nums));
