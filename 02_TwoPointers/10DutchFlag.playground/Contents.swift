func sort(_ nums: inout [Int]) {
    var low: Int = 0,high: Int = nums.count - 1;
    var i: Int = 0;
    
    while i <= high {
        let currElement: Int = nums[i];
        if currElement == 0 {
            nums.swapAt(i, low);
            low += 1;
            i += 1;
        } else if currElement == 1 {
            i += 1;
        } else {
            nums.swapAt(i, high);
            high -= 1;
        }
    }
}

var nums: [Int] = [1, 0, 2, 1, 0 ];
sort(&nums);
print(nums);

nums = [2, 2, 0, 1, 2, 0 ];
sort(&nums);
print(nums);
