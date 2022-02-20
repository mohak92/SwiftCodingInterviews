func findLength(_ fruits: [Character]) -> Int {
    var windowStart: Int = 0, maxLength: Int = 0;
    var fruitFreqMap = [Character: Int]();
    
    for windowEnd in 0 ..< fruits.count {
        fruitFreqMap[fruits[windowEnd], default: 0] += 1;
        
        while fruitFreqMap.count > 2 {
            fruitFreqMap[fruits[windowStart], default: 0] -= 1;
            if let count = fruitFreqMap[fruits[windowStart]], count == 0 {
                fruitFreqMap[fruits[windowStart]] = nil;
            }
            windowStart += 1;
        }
        
        maxLength = max(maxLength, windowEnd - windowStart + 1);
    }
    
    return maxLength;
}

var fruits: [Character] = ["A", "B", "C", "A", "C"];
print(findLength(fruits));

fruits = ["A", "B", "C", "B", "B", "C"];
print(findLength(fruits));
