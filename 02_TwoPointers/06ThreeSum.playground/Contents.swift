func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return [[Int]]();
    }
    let sortedArray = nums.sorted();
    var result = [[Int]]();
    
    for i in 0 ..< sortedArray.count - 2 {
        if i > 0 && sortedArray[i] == sortedArray[i - 1] {
            continue;
        }
        searchPairs(sortedArray, &result, i, i + 1, 0);
    }
    
    return result;
}

func searchPairs(_ nums: [Int], _ result: inout [[Int]], _ first: Int, _ leftP: Int, _ target: Int) {
    var left: Int = leftP;
    var right: Int =  nums.count - 1;
    
    while left < right {
        let currentSum: Int = nums[first] + nums[left] + nums[right];
        
        if currentSum == target {
            result.append([nums[first], nums[left], nums[right]]);
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

var nums: [Int] = [-3, 0, 1, 2, -1, 1, -2];
print(threeSum(nums));

nums = [-5, 2, -1, -2, 3];
print(threeSum(nums));
