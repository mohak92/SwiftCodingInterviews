func isHappyNumber(_ num: Int) -> Bool {
    var slow: Int = num, fast: Int = num;
    repeat {
        slow = findSquaredSum(&slow);
        fast = findSquaredSum(&fast);
        fast = findSquaredSum(&fast);
    } while slow != fast;
    
    return slow == 1;
}

func findSquaredSum(_ num: inout Int) -> Int {
    var sum: Int = 0, digits: Int ;
    while num > 0 {
        digits = num % 10;
        sum += digits * digits
        num /= 10;
    }
    return sum
}

print(isHappyNumber(23));
print(isHappyNumber(12));
