module source.number.prime;
import std.stdio : writeln;

/**
    returns true if the given number is prime number.
*/
public bool is_prime(int n) {
    if (n <= 1) {
        return false;
    }
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            return false;
        }
    }

    return true;
}

@("is_prime basic")
unittest {
    assert(is_prime(1) == false);
    assert(is_prime(2) == true);
    assert(is_prime(5) == true);
    assert(is_prime(11) == true);
    assert(is_prime(1025) == false);
}
