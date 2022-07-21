func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    if numCourses <= 0 {
        return false;
    }
    
    var sortedOrder = [Int]();
    var graph = [Int: [Int]]();
    var inDgeree = [Int: Int]();
    for i in 0 ..< numCourses {
        inDgeree[i] = 0;
        graph[i] = [];
    }
    
    for i in 0 ..< prerequisites.count {
        let parent: Int = prerequisites[i][1], child: Int = prerequisites[i][0];
        inDgeree[child]! += 1;
        graph[parent]?.append(child);
    }
    
    var sources = [Int]();
    for (key, values) in inDgeree {
        if (values == 0) {
            sources.append(key);
        }
    }
    
    while !sources.isEmpty {
        let vertex = sources.removeFirst();
        sortedOrder.append(vertex);
        let children: [Int] = graph[vertex]!;
        for child in children {
            inDgeree[child]! -= 1;
            if inDgeree[child] == 0 {
                sources.append(child);
            }
        }
    }
    
    return sortedOrder.count == numCourses;
}

var numCourses: Int = 2;
var prerequisites: [[Int]] =  [ [1, 0] ];
print("Input: numCourses = ", numCourses, ", prerequisites = ", prerequisites);
print("Output: ", canFinish(numCourses, prerequisites), "\n");

numCourses = 2;
prerequisites =  [ [1, 0], [0, 1 ] ];
print("Input: numCourses = ", numCourses, ", prerequisites = ", prerequisites);
print("Output: ", canFinish(numCourses, prerequisites));
