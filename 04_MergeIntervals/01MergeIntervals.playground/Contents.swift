func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.count < 2 {
        return intervals;
    }
    
    let intervals: [[Int]] = intervals.sorted{$0[0] < $1[0]};
    var result = [[Int]]();
    var start: Int = intervals[0][0];
    var end: Int = intervals[0][1];
    
    for i in 1 ..< intervals.count {
        if end >= intervals[i][0] {
            end = max(end, intervals[i][1]);
        } else {
            result.append([start, end]);
            start = intervals[i][0];
            end = intervals[i][1];
        }
    }
    
    result.append([start, end]);
    return result;
}

var intervals: [[Int]] = [[1,4], [2,5], [7,9]];
print("Input: ", intervals);
print("Output: ", merge(intervals), "\n");

intervals = [[6,7], [2,4], [5,9]];
print("Input: ", intervals);
print("Output: ", merge(intervals), "\n");

intervals = [[1,4], [2,6], [3,5]]
print("Input: ", intervals);
print("Output: ", merge(intervals));
