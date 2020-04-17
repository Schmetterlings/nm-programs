#include "differentiation.hpp"

double firstOrder(int n, double h, double x0, double (*f)(double))
{
    /*
    Returns the value of first order derivative of the function f(x) at the point x.
    Uses backward difference operator.

    @params:
        n (int) - maximum order of the difference operator
        h (double) - step used to determine the value of difference operator
        x0 (double) - point at which the value of the derivative should be determined
        f (pointer to function with double as arg) - base function
    
    @returns: Value (double) of first order derivative
    */
    double* tableDiff = new double [n + 1];
    double* backDiff = new double [n];
    double* temp;
    double sum = 0;

    for (int i = 0; i <= n; i++)
    {
        tableDiff[i] = f(x0 - i * h);
    }

    for (int i = 0; i < n; i++)
    {
        temp = new double[n - i];

        for (int j = 0; j < n - i; j++)
        {
            temp[j] = tableDiff[j + 1] - tableDiff[j];
            if (j == 0)
            {
                backDiff[i] = temp[j];
            }
        }
        tableDiff = temp;
    }

    for (int i = 0; i < n; i++)
    {
        if (i % 2 == 0)
        {
            sum -= backDiff[i] / (i + 1);
        }
        else
        {
            sum += backDiff[i] / (i + 1);
        }
    }

    return (sum / h);
}

double firstOrderModified(int n0, double h0, double x0, double eps, bool modifyN, double (*f)(double))
{
    /*
    Returns the value of first order derivative of the function f(x) with certain accuracy.
    Uses backward difference operator.

    @params:
        n0 (int) - initial value of the maximum order of the difference operator
        h0 (double) - initial step used to determine the value of difference operator
        eps (double) - differentiation accuracy
        modifyN (bool) - whether to modify n (will modify h otherwise)
        f (pointer to function with double as arg) - base function
    
    @returns: Value (double) of first order derivative
    */
   double h = h0, diff;
   int n = n0, factorialN = 1;

   while (true)
   {
       diff = firstOrder(n, h, x0, f);

       for (int i = 2; i <= n; i++)
       {
           factorialN *= i;
       }

       if (fabs(diff / (factorialN * h)) < eps)
       {
           break;
       }

       if (modifyN) { n++; }
       else { h -= (h / 100); }
   }

    if (modifyN)
    {
        cout << "Final `n` parameter: " << n << endl;
    }
    else
    {
        cout << "Final `h` parameter: " << h << endl;
    }

    return diff;
}

double secondOrder(int n, double h, double x0, double (*f)(double))
{
    /*
    Returns the value of second order derivative of the function f(x) at the point x.
    Uses backward difference operator.

    @params:
        n (int) - maximum order of the difference operator
        h (double) - step used to determine the value of difference operator
        x0 (double) - point at which the value of the derivative should be determined
        f (pointer to function with double as arg) - base function
    
    @returns: Value (double) of second order derivative
    */
    double* tableDiff = new double [n + 1];
    double* backDiff = new double [n];
    double* temp;
    double sum = 0;

    for (int i = 0; i <= n; i++)
    {
        tableDiff[i] = f(x0 - i * h);
    }

    for (int i = 0; i < n; i++)
    {
        temp = new double[n - i];

        for (int j = 0; j < n - i; j++)
        {
            temp[j] = tableDiff[j + 1] - tableDiff[j];
            if (j == 0)
            {
                backDiff[i] = temp[j];
            }
        }
        tableDiff = temp;
    }

    n = floor(n / 2);
    double *coefficients = new double[n];
    for (int i = 0; i < n; i++)
    {
        coefficients[i] = pow(-1, i) / (i + 1);
    }
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            sum += backDiff[i + j + 1] * coefficients[i] * coefficients[j];
        }
    }

    return (sum / pow(h, 2));
}