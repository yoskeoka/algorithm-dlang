module source.number.fibonacci;

/**
    returns Nth fibonacci number. (recursive way)
*/
int fibonacci_r(int n) {
    if (n == 1) {
        return 1;
    }
    if (n == 2) {
        return 1;
    }

    return fibonacci_r(n - 1) + fibonacci_r(n - 2);
}

@("fibonacci_r")
unittest {
    assert(fibonacci_r(1) == 1);
    assert(fibonacci_r(2) == 1);
    assert(fibonacci_r(3) == 2);
    assert(fibonacci_r(8) == 21);
}
