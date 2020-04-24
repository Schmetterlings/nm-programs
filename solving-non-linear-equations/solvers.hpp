#define _USE_MATH_DEFINES

#include <iostream>
#include <cmath>

using namespace std;

double polynomial(int n, double coeff[], double x);

double bisection(double a, double b, double (*f)(double), double eps);
double regula_falsi(double a, double b, double (*f)(double), double eps);
double secant(double a, double b, double (*f)(double), double eps);
double newton(double a, double b, double (*f)(double), double eps);
double bernoulli(int n, double coeff[], double vec[], double eps);