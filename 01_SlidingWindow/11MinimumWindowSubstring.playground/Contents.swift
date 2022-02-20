func minWindow(_ s: String, _ t: String) -> String {
    var windowStart:Int = 0, matched: Int = 0, minLength: Int = s.count + 1, subStringStart: Int = 0;
    let str = Array(s);
    let pattern = Array(t);
    var charFreqMap = [Character: Int]();
    
    for index in 0 ..< pattern.count {
        charFreqMap[pattern[index], default: 0] += 1;
    }
    
    for windowEnd in 0 ..< str.count {
        let rightChar: Character = str[windowEnd];
        if charFreqMap.keys.contains(rightChar) {
            charFreqMap[rightChar, default: 0] -= 1;
            if charFreqMap[rightChar]! >= 0 {
                matched += 1;
            }
        }
        
        while matched == pattern.count {
            if minLength > windowEnd - windowStart + 1 {
                minLength = windowEnd - windowStart + 1;
                subStringStart = windowStart;
            }
            
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
    
    return minLength > s.count ? "" : String(str[subStringStart ..< (subStringStart + minLength)]);
}

var s: String = "mpsbqedzsqyskjqydomdanqfmtqri";
var t: String = "rrbqrnbbzyijnwfnimshbjimbfe";
print(minWindow(s, t));

s = "abdbca";
t = "abc";
print(minWindow(s, t));

s = "adcad";
t = "abc";
print(minWindow(s, t));
