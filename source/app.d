import std.stdio;
import puzzle.nqueen : NQueenSolver;

version (unittest)
{
}
else
{
	void main()
	{
		writeln("start search 8-queen");
		auto solver8 = new NQueenSolver(8);
		solver8.solve();

		writeln(solver8.results);
		writeln("results: ", solver8.resultCount);
	}
}
