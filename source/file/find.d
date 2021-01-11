module file.find;
import std.format;
import std.file;
import std.array;
import std.string;
import std.stdio;

/// search with 
string[] findFiles(string currentDir, string subName) {
    string[] files = [];
    foreach (DirEntry e; dirEntries(currentDir, SpanMode.shallow, true)) {
        if (e.isDir) {
            string[] names = e.name.split("/");
            auto found = findFiles(format("%s/%s", currentDir, names[names.length - 1]), subName); // @suppress(dscanner.suspicious.length_subtraction)
            foreach (f; found) {
                files ~= f;
            }

            continue;
        }

        string[] filenames = e.name.split("/");
        string filename = filenames[filenames.length - 1];
        if (indexOf(filename, subName) >= 0) {
            files ~= e.name;
        }
    }

    return files;
}
