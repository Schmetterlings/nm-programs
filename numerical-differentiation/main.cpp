#include "differentiation.hpp"

double testf(double x)
{
    return pow(x, 5);
}

int main()
{
    int n = 5;
    double x0 = 2;
    double h = 1;
    double eps = 0.001;

    double diff1 = firstOrder(n, h, x0, testf);
    cout << "Value of the first derivative: " << diff1 << endl << endl;
   
    double diffm1 = firstOrderModified(n, h, x0, eps, false, testf);
    cout << "Value of the modified first derivative: " << diffm1 << endl << endl;
    
    double diff2 = secondOrder(n, h, x0, testf);
    cout << "Value of the second derivative: " << diff2 << endl;

    return 0;
}