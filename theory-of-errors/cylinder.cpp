#include <iostream>
#include <cmath>

constexpr float PI = 3.14159;

using namespace std;

float cylinder_df_r(float radius, float height) {
    return 2 * PI * height * radius;
}

float cylinder_df_h(float radius) {
    return PI * pow(radius, 2);
}

float absolute_error(int n, float accuracy, float result) {
    return accuracy / (n * result);
}

int main() {
    float r, h, acc;
    cout << "Please enter radius of the cylinder." << endl;
    cin >> r;

    cout << "Please enter height of the cylinder." << endl;
    cin >> h;

    cout << "Please enter assumed accuracy." << endl;
    cin >> acc;

    cout << "Accuracy of radius: " << absolute_error(2, acc, cylinder_df_r(r, h)) << endl;
    cout << "Accuracy of height: " << absolute_error(2, acc, cylinder_df_h(r)) << endl;

    return 0;
}