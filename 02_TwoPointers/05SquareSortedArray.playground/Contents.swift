func squareArray(_ nums: [Int]) -> [Int] {
    var left: Int = 0, right: Int = nums.count - 1;
    var highestSquareIndex = nums.count - 1;
    var result = [Int](repeating: 0, count: nums.count);
    
    while left <= right {
        let leftSquare = nums[left] * nums[left];
        let rightSquare = nums[right] * nums[right];
        
        if (leftSquare > rightSquare) {
            result[highestSquareIndex] = leftSquare;
            left += 1;
        } else {
            result[highestSquareIndex] = rightSquare;
            right -= 1;
        }
        highestSquareIndex -= 1;
    }
    
    return result;
}

var nums: [Int] = [-2, -1, 0, 2, 3 ];
print(squareArray(nums));

nums = [-3, -1, 0, 1, 2 ];
print(squareArray(nums));
