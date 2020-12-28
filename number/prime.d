module number.prime;
import std.stdio : writeln;

/**
    returns true if the given number is prime number.
*/
public bool is_prime(int n)
{
    if (n <= 1)
    {
        return false;
    }
    for (int i = 2; i * i <= n; i += 2)
    {
        if (n % i == 0)
        {
            return false;
        }
    }

    return true;
}

void main()
{
    foreach (i; 1 .. 201)
    {
        if (is_prime(i))
        {
            writeln(i);
        }
    }
}
