func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    guard intervals.count > 1 else {
        return 1;
    }
    
    var start = [Int]();
    var end = [Int]();
    
    for i in 0 ..< intervals.count {
        start.append(intervals[i][0]);
        end.append(intervals[i][1]);
    }
    
    start = start.sorted();
    end = end.sorted();
    
    var rooms: Int = 0, endItr: Int = 0;
    for i in 0 ..< intervals.count {
        if start[i] < end[endItr] {
            rooms += 1;
        } else {
            endItr += 1;
        }
    }
    
    return rooms;
}

var intervals: [[Int]] = [[0,30],[5,10],[15,20]];
print("Input: intervals = ", intervals);
print("Output: ", minMeetingRooms(intervals));
