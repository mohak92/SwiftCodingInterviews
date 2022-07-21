func alienOrder(_ words: [String]) -> String {
    var inDegree = [Character: Int]();
    var graph = [Character: [Character]]();
    for word in words {
        for char in word {
            inDegree[char] = 0;
            graph[char] = [];
        }
    }
    
    for i in 0 ..< words.count - 1 {
        let word1 = Array(words[i]);
        let word2 = Array(words[i + 1]);
        
        if word1.count > word2.count && word1.starts(with: word2) {
            return "";
        }
        
        for j in 0 ..< min(word1.count, word2.count) {
            let parent: Character = word1[j], child: Character = word2[j];
            if parent != child {
                inDegree[child]! += 1;
                graph[parent]!.append(child);
                break;
            }
        }
    }
    
    var sources = [Character]();
    for (key, value) in inDegree {
        if value == 0 {
            sources.append(key);
        }
    }
    
    var sortedOrder: String = "";
    while !sources.isEmpty {
        let vertex: Character = sources.removeFirst();
        sortedOrder.append(vertex);
        let children: [Character] = graph[vertex]!;
        for child in children {
            inDegree[child]! -= 1;
            if inDegree[child] == 0 {
                sources.append(child);
            }
        }
    }
    
    if sortedOrder.count != inDegree.count {
        return "";
    }
    
    return sortedOrder;
}

var words: [String] = ["wrt","wrf","er","ett","rftt"]
print("Input: words = ", words);
print("Output: ", alienOrder(words), "\n")

words = ["z","x"]
print("Input: words = ", words);
print("Output: ", alienOrder(words), "\n")

words = ["z","x","z"]
print("Input: words = ", words);
print("Output: ", alienOrder(words), "\n")
