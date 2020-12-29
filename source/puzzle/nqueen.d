module puzzle.nqueen;

import std.stdio : writeln;
import std.algorithm.searching : canFind;

/** 
 * y positions for n-queen puzzle.
 */
struct NQueenBoard
{
    /// 
    int size = 8;
    ///
    int count;
    ///
    int[] pos;

    ///
    this(int size)
    {
        this.size = size;
        this.pos = new int[size];

        foreach (ref int i; this.pos)
        {
            i = -1;
        }

        this.count = 0;
    }

    ///
    bool canPut(int y)
    {
        if (this.count >= this.size)
        {
            return false;
        }

        if (this.pos.canFind(y))
        {
            return false;
        }

        for (int i = 0; i < this.count; i++)
        {
            const auto d = this.count - i;
            if (this.pos[i] - d == y || this.pos[i] + d == y)
            {
                return false;
            }
        }
        return true;
    }

    @("canPut")
    unittest
    {
        auto b = new NQueenBoard(8);

        b.push(0);
        assert(b.canPut(0) == false);
        assert(b.canPut(1) == false);
        assert(b.canPut(2) == true);
        assert(b.canPut(7) == true);

        b.pop();

        b.push(0);
        b.push(5);
        assert(b.canPut(1) == true);
        assert(b.canPut(2) == false);
        assert(b.canPut(4) == false);
        assert(b.canPut(5) == false);

    }

    ///
    void push(int y)
    {
        this.pos[this.count] = y;
        this.count++;
    }

    /// pop removes the last pos and returns it.
    int pop()
    {
        this.count--;
        auto r = this.pos[this.count];
        this.pos[this.count] = -1;
        return r;
    }

    @("push/pop")
    unittest
    {
        auto b = new NQueenBoard(8);
        assert(b.pos == [-1, -1, -1, -1, -1, -1, -1, -1]);
        assert(b.count == 0);

        b.push(0);
        assert(b.pos == [0, -1, -1, -1, -1, -1, -1, -1]);
        assert(b.count == 1);

        b.push(5);
        assert(b.pos == [0, 5, -1, -1, -1, -1, -1, -1]);
        assert(b.count == 2);

        const auto r1 = b.pop();
        assert(r1 == 5);
        assert(b.pos == [0, -1, -1, -1, -1, -1, -1, -1]);
        assert(b.count == 1);

        const auto r2 = b.pop();
        assert(r2 == 0);
        assert(b.pos == [-1, -1, -1, -1, -1, -1, -1, -1]);
        assert(b.count == 0);

    }
}

///
class NQueenSolver
{
    /// solved count
    int resultCount = 0;
    ///
    int[][] results;

    /// size of board
    const int N;

    ///
    this(int size)
    {
        this.N = size;
        this.results = [];
    }

    /// solve 8-queen and print results.
    void solve()
    {
        auto b = new NQueenBoard(this.N);
        searchR(b);
    }

    private void searchR(NQueenBoard* b)
    {
        for (int i = 0; i < b.size; i++)
        {
            if (b.canPut(i))
            {
                b.push(i);

                if (b.count >= b.size)
                {
                    this.resultCount++;
                    this.results ~= b.pos.dup;
                }
                else
                {
                    searchR(b);
                }

                b.pop();
            }
        }
    }
}

@("1-queen solver")
unittest
{
    auto s1 = new NQueenSolver(1);
    s1.solve();
    assert(s1.resultCount == 1);
    assert(s1.results == [[0]]);
}

@("4-queen solver")
unittest
{
    auto s4 = new NQueenSolver(4);
    s4.solve();
    assert(s4.resultCount == 2);
    assert(s4.results == [[1, 3, 0, 2], [2, 0, 3, 1]]);
}
