func findPermutation(_ s: String, _ p: String) -> Bool {
    var windowStart: Int  = 0, matched: Int  = 0;
    var charFreqMap = [Character: Int]();
    let str = Array(s);
    let pattern = Array(p);
    
    for index in 0 ..< pattern.count {
        charFreqMap[pattern[index], default: 0] += 1;
    }
    
    for windowEnd in 0 ..< str.count {
        let rightChar: Character = str[windowEnd];
        if charFreqMap.keys.contains(rightChar) {
            charFreqMap[rightChar, default: 0] -= 1;
            if charFreqMap[rightChar] == 0 {
                matched += 1;
            }
        }
        
        if matched == charFreqMap.count {
            return true;
        }
        
        if windowEnd >= pattern.count - 1 {
            let leftChar: Character = str[windowStart];
            windowStart += 1;
            if charFreqMap.keys.contains(leftChar) {
                if charFreqMap[leftChar] == 0 {
                    matched -= 1;
                }
                charFreqMap[leftChar, default: 0] += 1;
            }
        }
    }
    
    return false;
}

var s: String = "oidbcaf";
var p: String = "abc";
print(findPermutation(s, p));

s = "odicf";
p = "dc"
print(findPermutation(s, p));

s = "bcdxabcdy";
p = "bcdyabcdx"
print(findPermutation(s, p));

s = "aaacb";
p = "abc";
print(findPermutation(s, p));
