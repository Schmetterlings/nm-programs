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

    do {
        x = x - (f(x) / firstOrder(4, 0.01, x, f));
        i++;
    } while (fabs(f(x)) > eps);

    cout << "Newton method iterations: " << i << endl;
    return x;
}