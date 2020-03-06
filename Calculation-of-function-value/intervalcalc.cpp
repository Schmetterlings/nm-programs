#include <cmath>
#include <iostream>
using namespace std;

double bound(int x0, int n, double a[]){
    
    double b = a[0];
    for(int i = n; i>=0;i--){
        b = b*x0 + a[i];
        if(b < 0){
            return bound(x0+0.1, n, a);
        }
    }
    return x0;
}


int main(){
    int n;
    double up, down;

    cout << "Degree of polynomial: \n";
    cin >> n; 
    double* a = new double[n+1];
    for(int i=n;i>=0;i--){
        cout << "Coefficient of x" << i << endl;
        cin >> a[i];
    }

    up = bound(0.1, n, a);
    for(int i = n; i>=0;i--)
    {
        if(i+2%2!=0){
            a[i] *= -1;
        }
        if(n%2!=0){
            a[i] *= -1;
        }
    }
    down = (bound(0.1, n, a))*-1;
    cout << "Real roots of polynomial are in interval [ " << down << ", "<< up << " ]\n";
    return 0;   
}