module source.hello.hello;

/** 
 * hello world
 */
void hello()
{
	import std.stdio : writeln;

	writeln("Hello, World!");
	writeln(__VENDOR__);
	writeln(__VERSION__);
}
