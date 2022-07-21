func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    if numCourses <= 0 {
        return [];
    }
    
    var inDegree = [Int: Int]();
    var graph = [Int: [Int]]();
    for i in 0 ..< numCourses {
        inDegree[i] = 0;
        graph[i] = [];
    }
    
    for i in 0 ..< prerequisites.count {
        let parent: Int = prerequisites[i][1], child: Int = prerequisites[i][0];
        graph[parent]!.append(child);
        inDegree[child]! += 1;
    }
    
    var sources = [Int]();
    for (key, value) in inDegree {
        if value == 0 {
            sources.append(key);
        }
    }
    
    var sortedOrder = [Int]();
    while !sources.isEmpty {
        let vertex: Int = sources.removeFirst();
        sortedOrder.append(vertex);
        let children: [Int] = graph[vertex]!;
        for child in children {
            inDegree[child]! -= 1;
            if inDegree[child] == 0 {
                sources.append(child);
            }
        }
    }
    
    if sortedOrder.count != numCourses {
        return [];
    }
    
    return sortedOrder;
}

var numCourses: Int = 2;
var prerequisites: [[Int]] =  [ [1, 0] ];
print("Input: numCourses = ", numCourses, ", prerequisites = ", prerequisites);
print("Output: ", canFinish(numCourses, prerequisites), "\n");

numCourses = 2;
prerequisites =  [ [1, 0], [0, 1 ] ];
print("Input: numCourses = ", numCourses, ", prerequisites = ", prerequisites);
print("Output: ", canFinish(numCourses, prerequisites));
