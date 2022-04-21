func findLength(_ s: String) -> Int {
    if s.count == 0 {
        return 0;
    }
    
    var windowStart: Int = 0, maxLength: Int = 0;
    let str = Array(s);
    var charIndexMap = [Character: Int]();
    
    for windowEnd in 0 ..< str.count {
        let rightChar: Character = str[windowEnd];
        
        if charIndexMap.keys.contains(rightChar) {
            windowStart = max(windowStart, charIndexMap[rightChar]! + 1);
        }
        
        charIndexMap[rightChar] = windowEnd;
        maxLength = max(maxLength, windowEnd - windowStart + 1);
    }
    
    return maxLength;
}

var s: String = "aabccbb";
print(findLength(s));

s = "abbbb";
print(findLength(s));

s = "abccde";
print(findLength(s));
