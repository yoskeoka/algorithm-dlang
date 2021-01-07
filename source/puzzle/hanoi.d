module puzzle.hanoi;

import std.format : format;

private void hanoi(string[]* moves, int n, string src, string dest, string via) {
    if (n > 1)
        hanoi(moves, n - 1, src, via, dest);

    *moves ~= format("%s -> %s", src, dest);

    if (n > 1)
        hanoi(moves, n - 1, via, dest, src);
}

/// return moves to solve
public string[] solveHanoi(int n) {
    string[] moves = [];
    hanoi(&moves, n, "a", "c", "b");
    return moves;
}

@("hanoi")
unittest {

    assert(solveHanoi(2) == ["a -> b", "a -> c", "b -> c"]);
}
