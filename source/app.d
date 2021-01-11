import std.stdio;
import puzzle.nqueen : NQueenSolver;
import puzzle.hanoi;
import file.find;

version (unittest) {
	// do nothing
} else {
	void main() {
		writeln("start search 8-queen");
		auto solver8 = new NQueenSolver(8);
		solver8.solve();

		writeln(solver8.results);
		writeln("results: ", solver8.resultCount);

		auto hanoiMoves = solveHanoi(5);
		writeln(hanoiMoves);

		auto files = findFiles(".", "dub");
		foreach (f; files) {
			writeln(f);
		}
	}
}
