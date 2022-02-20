func findAllAnagrams(_ s: String, _ p: String) -> [Int] {
    var windowStart: Int  = 0, matched: Int  = 0;
    var charFreqMap = [Character: Int]();
    let str = Array(s);
    let pattern = Array(p);
    var result = [Int]();
    
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
            result.append(windowStart);
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
    
    return result;
}


var s: String = "ppqp";
var p: String = "pq";
print(findAllAnagrams(s, p));

s = "abbcabc";
p = "abc";
print(findAllAnagrams(s, p));
