func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left: Int = 0, right: Int = numbers.count - 1;
    
    while left < right {
        let currentSum = numbers[left] + numbers[right];
        
        if target == currentSum {
            return [left + 1, right + 1];
        }
        
        if currentSum < target {
            left += 1;
        } else {
            right -= 1;
        }
    }
 
    return [-1, -1];
}


var numbers: [Int] = [2,7,11,15];
var target: Int = 9;
print(twoSum(numbers, target));

numbers = [2,3,4];
target = 6;
print(twoSum(numbers, target));

numbers = [-1,0];
target = -1;
print(twoSum(numbers, target));
