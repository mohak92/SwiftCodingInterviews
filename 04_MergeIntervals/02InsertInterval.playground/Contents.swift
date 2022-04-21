func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    if intervals.count == 0 {
        return [newInterval];
    }
    
    var result = [[Int]]();
    var index: Int = 0;
    
    while index < intervals.count && intervals[index][1] < newInterval[0] {
        result.append(intervals[index]);
        index += 1;
    }
    
    var startInterVal: Int = newInterval[0];
    var endInterval: Int = newInterval[1];
    while index < intervals.count && intervals[index][0] <= newInterval[1] {
        startInterVal = min(startInterVal, intervals[index][0]);
        endInterval = max(endInterval, intervals[index][1]);
        index += 1;
    }
    
    result.append([startInterVal, endInterval]);
    while index < intervals.count {
        result.append(intervals[index]);
        index += 1;
    }
    
    return result;
}

var intervals: [[Int]] = [[1,3],[6,9]]
var newInterval: [Int] = [2,5]
print("Input: intervals = ", intervals, " newInterval = ", newInterval);
print("Output: ", insert(intervals, newInterval), "\n");

intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]];
newInterval = [4,8];
print("Input: intervals = ", intervals, " newInterval = ", newInterval);
print("Output: ", insert(intervals, newInterval), "\n");
