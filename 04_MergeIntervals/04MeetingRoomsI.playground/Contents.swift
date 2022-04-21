func canAttaendMeetings(_ intervals: [[Int]]) -> Bool {
    if intervals.count == 0 {
        return true;
    }
    
    let intervals: [[Int]] = intervals.sorted{$0[0] < $1[0]};
    
    for i in 1 ..< intervals.count {
        if intervals[i][0] < intervals[i - 1][1] {
            return false;
        }
    }
    
    return true;
}

var intervals: [[Int]] = [[0,30],[5,10],[15,20]];
print("Input: ", intervals);
print("Output: ", canAttaendMeetings(intervals), "\n");


intervals = [[7,10],[2,4]]
print("Input: ", intervals);
print("Output: ", canAttaendMeetings(intervals));
