func twoSum(_ nums:[Int], _ target: Int) -> [Int] {
    var map = [Int: Int]();
    
    for i in 0 ..< nums.count {
        let remainder: Int = target - nums[i];
        if map.keys.contains(remainder) {
            return [map[remainder]!, i];
        }
        map[nums[i]] = i;
    }
    
    return [-1, -1];
}


var nums: [Int] = [2,7,11,15];
var target:Int = 9;
print(twoSum(nums, target));

nums = [3,2,4];
target = 6;
print(twoSum(nums, target));

nums = [3,3];
target = 6;
print(twoSum(nums, target));
