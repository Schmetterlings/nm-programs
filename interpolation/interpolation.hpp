#define _USE_MATH_DEFINES

#include <iostream>
#include <cmath>

using namespace std;

double chebyshev(double a, double b, int i, int n);
double lagrange(double a, double b, int n, double x, double (*f)(double), bool cheb = false);