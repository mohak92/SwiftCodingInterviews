func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let sortedArray = nums.sorted();
    var result = [[Int]]();
   
    for i in 0 ..< sortedArray.count - 3 {
        if i > 0 && sortedArray[i] == sortedArray[i - 1] {
            continue;
        }
        for j in i + 1 ..< sortedArray.count - 2 {
            if j > i + 1 && sortedArray[j] == sortedArray[j - 1] {
                continue;
            }
            searchPairs(sortedArray, target, &result, i, j);
        }
    }
    
    return result;
}

func searchPairs(_ nums: [Int], _ target: Int, _ result: inout [[Int]], _ first: Int, _ second: Int) {
    var left: Int = second + 1;
    var right: Int = nums.count - 1;
    while left < right {
        let currentSum: Int = nums[first] + nums[second] + nums[left] + nums[right];
        if currentSum == target {
            result.append([nums[first], nums[second], nums[left], nums[right]]);
            left += 1;
            right -= 1;
            while left < right && nums[left] == nums[left - 1] {
                left += 1;
            }
            while left < right && nums[right] == nums[right + 1] {
                right -= 1;
            }
        } else if currentSum < target {
            left += 1;
        } else {
            right -= 1;
        }
    }
}

var nums: [Int] = [4, 1, 2, -1, 1, -3];
var target: Int = 1;
print(fourSum(nums, target));

nums = [2, 0, -1, 1, -2, 2];
target = 2;
print(fourSum(nums, target));

nums = [-2,-1,-1,1,1,2,2]
target = 0;
print(fourSum(nums, target));
