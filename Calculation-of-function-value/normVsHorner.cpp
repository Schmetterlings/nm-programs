#include <cmath>
#include <chrono>
#include <iostream>
#include <ctime>
using namespace std;
double normPolym(double x0, int n, double a[]){
    double y = 0;
    for(int i = n;i>=0;i--){
        y += a[i]*pow(x0, i);
    }
    return y;
}

double hornerPolym(double x0, int n, double a[]){
    double y = a[n]*x0+a[n-1];
    for(int i = n-2;i>=0;i--){
        y = y * x0+a[i];
    }
    return y;
}

int main(){
    int n;
    double x0;
    double answer;

    cout << "Degree of polynomial: \n";
    cin >> n; 
    double* a = new double[n+1];
    for(int i=n;i>=0;i--){
        cout << "Coefficient of x" << i << endl;
        cin >> a[i];
    }

    cout << "Value of X \n";
    cin >> x0;
    cout << "Time of normal calculating of polynomial \n";
    auto start = chrono::system_clock::now();
    for(int i=1;i <= 1000000; i++){
       normPolym(x0, n, a);
    }
    answer = normPolym(x0, n, a);
    cout << "Answer: " << answer << endl;
    auto end = chrono::system_clock::now();
    chrono::duration<double> elapsed_seconds = end-start;

    time_t end_time = std::chrono::system_clock::to_time_t(end);
    cout << "elapsed time: " << elapsed_seconds.count() << "s\n";

    cout << "Time of Horner calculating of polynomial \n";
    start = chrono::system_clock::now();
    for(int i=1;i <= 1000000; i++){
        hornerPolym(x0, n, a);
    }
    answer = hornerPolym(x0, n, a);
    cout << "Answer: " << answer << endl;
    end = chrono::system_clock::now();
    elapsed_seconds = end-start;

    end_time = std::chrono::system_clock::to_time_t(end);
    cout << "elapsed time: " << elapsed_seconds.count() << "s\n";
    return 0;
}