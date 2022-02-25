func compare(_ s1: String, _ s2: String) -> Bool {
    let S1 = Array(s1);
    let S2 = Array(s2);
    
    var index1: Int = S1.count - 1, index2: Int = S2.count - 1;
    while index1 >= 0 || index2 >= 0 {
        let i1 = getNextValidCharacterIndex(S1, &index1);
        let i2 = getNextValidCharacterIndex(S2, &index2);
        
        if i1 < 0 && i2 < 0 {
            return true;
        }
        
        if i1 < 0 || i2 < 0 {
            return false;
        }
        
        if S1[i1] != S2[i2] {
            return false;
        }
        
        index1 = i1 - 1;
        index2 = i2 - 1;
    }
    
    return true;
}

func getNextValidCharacterIndex(_ S: [Character], _ index: inout Int) -> Int {
    var backspaceCount: Int = 0;
    
    while index >= 0 {
        if S[index] == "#" {
            backspaceCount += 1;
        } else if backspaceCount > 0 {
            backspaceCount -= 1;
        } else {
            break;
        }
        
        index -= 1;
    }
    
    return index;
}

print(compare("xy#z", "xzz#"));
print(compare("xy#z", "xyz#"));
print(compare("xp#", "xyz##"));
print(compare("xywrrmp", "xywrrmu#p"));
