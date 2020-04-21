#include "solvers.hpp"

double testf(double x)
{
    //return pow(tan(x), 3) - (4 * tan(x));
    return exp(x - 1) + pow(x, 2) - 2;
}

int main()
{
    double a = 0, b = 2;
    double eps = 0.001;

    double bis = bisection(a, b, testf, eps);
    double reg = regula_falsi(a, b, testf, eps);
    double sec = secant(a, b, testf, eps);
    double newt = newton(a, b, testf, eps);

    cout.precision(8);
    cout << endl;
    cout << "(Bisection) Found root at x: " << fixed << bis << endl;
    cout << "(Regula Falsi) Found root at x: " << fixed << reg << endl;
    cout << "(Secant) Found root at x: " << fixed << sec << endl;
    cout << "(Newton) Found root at x: " << fixed << newt << endl;

    return 0;
}