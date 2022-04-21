class TicTacToe {
    var rows: [Int];
    var cols: [Int];
    var diag: Int;
    var antiDiag: Int;
    
    init(_ n: Int) {
        self.rows = Array(repeating: 0, count: n);
        self.cols = Array(repeating: 0, count: n);
        self.diag = 0;
        self.antiDiag = 0;
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let curentPlayer: Int = player == 1 ? 1 : -1;
        rows[row] += curentPlayer;
        cols[col] += curentPlayer;
        if row == col {
            diag += curentPlayer;
        }
        if col == (cols.count - row - 1) {
            antiDiag += curentPlayer;
        }
        let n = rows.count;
        if abs(rows[row]) == n ||
            abs(cols[col]) == n ||
            abs(diag) == n ||
            abs(antiDiag) == n {
            return player;
        }
        return 0;
    }
}
