#include "differentiation.hpp"

double testf(double x)
{
    return log(x);
}

int main()
{
    int n = 4;
    double x0 = 1;
    double h = 0.1;
    double eps = 0.001;

    double diff1 = firstOrder(n, h, x0, testf);
    cout << "Value of the first derivative: " << diff1 << endl << endl;
   
    double diffm1 = firstOrderModified(n, h, x0, eps, true, testf);
    cout << "Value of the modified first derivative: " << diffm1 << endl << endl;
    
    double diff2 = secondOrder(n, h, x0, testf);
    cout << "Value of the second derivative: " << diff2 << endl;

    return 0;
}