func threeSumClosestTotarget(_ nums: [Int], _ target: Int) -> Int {
    if nums.isEmpty || nums.count < 3 {
        return 0;
    }
    
    let sortedArray = nums.sorted();
    var smallestDifference: Int = Int.max;
    
    for i in 0 ..< sortedArray.count - 2 {
        var left: Int = i + 1, right: Int = sortedArray.count - 1;
        while left < right {
            let targetDiff: Int = target - sortedArray[i] - sortedArray[left] - sortedArray[right];
            
            if targetDiff == 0 {
                return target;
            }
            
            if abs(targetDiff) < abs(smallestDifference)
                || (abs(targetDiff) == abs(smallestDifference) && targetDiff > smallestDifference) {
                smallestDifference = targetDiff;
            }
            
            if targetDiff > 0 {
                left += 1;
            } else {
                right -= 1;
            }
        }
    }
    
    return target - smallestDifference;
}


var nums: [Int] = [-2, 0, 1, 2];
var target: Int = 2;
print(threeSumClosestTotarget(nums, target));

nums = [-3, -1, 1, 2];
target = 1;
print(threeSumClosestTotarget(nums, target));

nums = [1, 0, 1, 1 ];
target =  100;
print(threeSumClosestTotarget(nums, target));
