func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.isEmpty || nums.count >= 3 else {
        return 0;
    }
    
    let sortedArray = nums.sorted();
    var count: Int = 0;
    
    for i in 0 ..< sortedArray.count - 2 {
        let targetSum : Int = target - sortedArray[i];
        count += searchPairs(sortedArray, targetSum, i);
    }
    
    return count;
}

func searchPairs(_ sortedArray: [Int], _ targetSum: Int, _ first: Int) -> Int {
    var left: Int = first + 1, right: Int = sortedArray.count - 1;
    var count: Int = 0;
    while left < right {
        if sortedArray[left] + sortedArray[right] < targetSum {
            count += right - left;
            left += 1;
        } else {
            right -= 1;
        }
    }
    return count;
}

var nums: [Int] = [-1, 0, 2, 3];
var target: Int = 3;
print(threeSumSmaller(nums, target));

nums = [-1, 4, 2, 1, 3];
target = 5;
print(threeSumSmaller(nums, target));
