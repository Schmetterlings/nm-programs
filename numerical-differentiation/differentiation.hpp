#include <iostream>
#include <cmath>

using namespace std;

double firstOrder(int n, double h, double x0, double (*f)(double));
double firstOrderModified(int n0, double h0, double x0, double eps, bool modifyN, double (*f)(double));
double secondOrder(int n, double h, double x0, double (*f)(double));
