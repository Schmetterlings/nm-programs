#include "interpolation.hpp"

double chebyshev(double a, double b, int i, int n)
{
    /*
    Returns value of Chebyshev interpolation node.

    @params:
        a (double) - lower bound of the interpolation interval
        b (double) - upper bound of the interpolation interval
        i (int) - current step in the polynomial
        n (int) - degree of polynomial
    
    @returns: Value (double) of the current node
    */
    double node;
    node = cos(((2 * (double)i + 1) / (2 * (double)n + 2)) * M_PI);
    node = 0.5 * (b - a) * node + a + b;
    return node;
}

double lagrange(double a, double b, int n, double x, double (*f)(double), bool cheb)
{
    /*
    Returns the Lagrange interpolation polynomial.
    Writes equidistant interpolation nodes to stdout.

    @params:
        a (double) - lower bound of the interpolation interval
        b (double) - upper bound of the interpolation interval
        n (int) - degree of polynomial
        x (double) - point at which the value should be calculated
        f (pointer to function with double as arg) - function to calculate the nodes from
        cheb (bool) - whether to use Chebyshev's interpolation nodes
    
    @returns: Value (double) of the interpolating polynomial at point x
    */
    double *W = new double[n];
    double *nodes = new double[n];
    double *f_nodes = new double[n];
    double value = 0;

    float step = (b - a) / n;
    //cout << "\nDistance between points: " << step << endl;
    if (cheb) {cout << "\nChebyshev nodes: " << endl;}
    else {cout << "Lagrange nodes: " << endl;}

    for (int i = 0; i <= n; i++)
    {
        W[i] = 1;

        if (!cheb)
        {
            nodes[i] = a + i * step;
        }
        else
        {
            nodes[i] = chebyshev(a, b, i, n);
        }
        f_nodes[i] = f(nodes[i]);

        cout << "Node [" << i << "]: " << nodes[i] << endl;
    }

    for (int i = 0; i <= n; i++)
    {
        for (int j = 0; j <= n; j++)
        {
            if (i != j)
            {
                W[i] *= (x - nodes[j]);
            }
        }

        for (int j = 0; j <= n; j++)
        {
            if (i != j)
            {
                W[i] /= (nodes[i] - nodes[j]);
            }
        }
        //cout << "Current W[i]: " << W[i] << endl;
    }

    for (int i = 0; i <= n; i++)
    {
        value += W[i] * f_nodes[i];
    }

    return value;
}