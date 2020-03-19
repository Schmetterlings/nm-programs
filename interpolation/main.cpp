#include "interpolation.hpp"

using namespace std;

double function(double x)
{
    return pow(x, 4);
}

int main()
{
    double l = lagrange(-10, 10, 2, 2, *function);
    double c = lagrange(-10, 10, 2, 2, *function, true);

    cout << "\nValue of interpolation polynomial: " << l << endl;
    cout << "Value of Chebyshev interpolation polynomial: " << c << endl;

    return 0;
}