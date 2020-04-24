#include "solvers.hpp"
#include "../numerical-differentiation/differentiation.hpp"

double bisection(double a, double b, double (*f)(double), double eps)
{
    /*
    Finds the root of a given equation over a given interval.

    @params:
        a (double) - interval lower bound
        b (double) - interval upper bound
        eps (double) - accuracy of root calculation
        f (pointer to function with double as arg) - equation
    
    @returns: Position (double) of the root
    */
    double x = a + (b - a) / 2;
    int i = 1;

    while (fabs(f(x)) > eps)
    {
        if (f(a) * f(x) < 0)
        {
            b = x;
        }
        else
        {
            a = x;
        }

        x = a + (b - a) / 2;
        i++;
    }

    cout << "Bisection method iterations: " << i << endl;
    return x;
}

double regula_falsi(double a, double b, double (*f)(double), double eps)
{
    /*
    Finds the root of a given equation over a given interval.
    Uses the function values to converge faster.

    @params:
        a (double) - interval lower bound
        b (double) - interval upper bound
        eps (double) - accuracy of root calculation
        f (pointer to function with double as arg) - equation
    
    @returns: Position (double) of the root
    */
    double x = (f(a) * b - f(b) * a) / (f(a) - f(b));
    cout << "Regula Falsi starting point: " << x << endl;
    int i = 1;

    while (fabs(f(x)) > eps)
    {
        if (f(a) * f(x) < 0)
        {
            b = x;
        }
        else
        {
            a = x;
        }

        x = (f(a) * b - f(b) * a) / (f(a) - f(b));
        i++;
    }

    cout << "Regula Falsi method iterations: " << i << endl;
    return x;
}

double secant(double a, double b, double (*f)(double), double eps)
{
    /*
    Finds the root of a given equation over a given interval.
    Rejects the demand requiring f(x) to have different signs at the two subsequent points.

    @params:
        a (double) - interval lower bound
        b (double) - interval upper bound
        eps (double) - accuracy of root calculation
        f (pointer to function with double as arg) - equation
    
    @returns: Position (double) of the root
    */
    double x = a - (f(a) / (f(a) - f(b))) * (a - b);
    int i = 1;

    while (fabs(f(x)) > eps)
    {
        b = a;
        a = x;
        x = a - (f(a) / (f(a) - f(b))) * (a - b);

        i++;
    }

    cout << "Secant method iterations: " << i << endl;
    return x;
}

double newton(double a, double b, double (*f)(double), double eps)
{
    /*
    Finds the root of a given equation over a given interval.
    Very dependant on the initial choice.

    @params:
        a (double) - interval lower bound
        b (double) - interval upper bound
        eps (double) - accuracy of root calculation
        f (pointer to function with double as arg) - equation
    
    @returns: Position (double) of the root
    */
    double x;
    int i = 1;

    if (f(a) * secondOrder(4, 0.01, a, f) > 0)
    {
        x = a;
    }
    else
    {
        x = b;
    }

    cout << "Newton starting point: " << x << endl;

    do
    {
        x = x - (f(x) / firstOrder(4, 0.01, x, f));
        i++;
    } while (fabs(f(x)) > eps);

    cout << "Newton method iterations: " << i << endl;
    return x;
}

double bernoulli(int n, double coeff[], double vec[], double eps)
{
    /*
    Finds the root of a given polynomial.

    @params:
        n (int) - degree of polynomial
        coeff (double[]) - coefficients of polynomial
        vec (double[]) - initial vector
        eps (double) - accuracy of root calculation
    
    @returns: Position (double) of the root
    */
    double x, y = 0;
    int iter = 0, nTemp;

    if (coeff[0] == 0)
    {
        cout << "First coefficient cannot be 0!" << endl;
        return 0;
    }

    do
    {
        nTemp = n;
        for (int i = iter - 1; i < n + iter - 2; i++)
        {
            y += coeff[nTemp] * vec[i];
            cout << "y: " << y << endl;
            nTemp--;
        }
        y *= (-1 / coeff[0]);
        vec[iter] = y;
        iter++;

        x = vec[iter] / vec[iter - 1];

        cout << "y: " << y << endl;

        cout << "x: " << x << endl;
        cout << "f(x): " << polynomial(n, coeff, x) << endl;

    } while (fabs(polynomial(n, coeff, x)) > eps);

    cout << "Bernoulli method iterations: " << iter << endl;
    return x;
}

double polynomial(int n, double coeff[], double x)
{
    double result = 0;
    for (int i = n; i > 0; i--)
    {
        result += pow(x, i) * coeff[i];
    }
    return result;
}