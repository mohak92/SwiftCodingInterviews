func findLength(_ s: String, _ k: Int) -> Int {
    var windowStart: Int = 0, maxLength: Int = 0, maxRepeatLetterCount: Int = 0;
    var charFreqMap = [Character: Int]();
    let S = Array(s);
    
    for windowEnd in 0 ..< s.count {
        let rightChar: Character = S[windowEnd];
        charFreqMap[rightChar, default: 0] += 1;
        maxRepeatLetterCount = max(maxRepeatLetterCount, charFreqMap[rightChar]!);
        
        if windowEnd - windowStart + 1 - maxRepeatLetterCount > k {
            let leftChar = S[windowStart];
            charFreqMap[leftChar, default: 0] -=  1;
            windowStart += 1;
        }
        
        maxLength = max(maxLength, windowEnd - windowStart + 1);
    }
    
    return maxLength;
}

var s: String = "aabccbb";
var k: Int = 2;
print(findLength(s, k));

s = "abbcb";
k = 1;
print(findLength(s, k));

s = "abccde";
print(findLength(s, k));
