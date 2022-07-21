func findLength(_ s: String, _ k: Int) -> Int {
    if  s.isEmpty || s.count == 0 || s.count < k{
        return 0;
    }
    var windowStart: Int = 0, maxLength = 0;
    var charFreqMap = [Character: Int]();
    let str = Array(s);
    
    for windowEnd in 0 ..< str.count {
        let rightChar: Character = str[windowEnd];
        charFreqMap[rightChar, default: 0] += 1;
        
        while charFreqMap.count > k {
            let leftChar: Character = str[windowStart];
            charFreqMap[leftChar, default: 0] -= 1;
            if charFreqMap[leftChar] == 0 {
                charFreqMap[leftChar] = nil;
            }
            windowStart += 1;
        }
        maxLength = max(maxLength, windowEnd - windowStart + 1);
    }
    return maxLength;
}

var s: String = "araaci";
var k: Int = 2;

print(findLength(s, k));

k = 1;
print(findLength(s, k));

s = "cbbebi";
k = 3;
print(findLength(s, k));
