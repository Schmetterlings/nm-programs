#include <iostream>
#include <cmath>

using namespace std;

float half_circle_length(float a, float b, float c) {
    return (a + b + c) / 2;
}

float triangle_area(float a, float b, float c) {
    return sqrt(half_circle_length(a, b, c) * (
        (half_circle_length(a, b, c) - a) * (half_circle_length(a, b, c) - b) * (half_circle_length(a, b, c) - c))
    );
}

float area_df(float a, float b, float c) {
    return (-pow(a, 3) + 3 * pow(a, 2) * (b + c) - a * (pow(b, 2) + 4 * b * c + pow(c, 2)) - pow(b + c, 3)) 
           / 
           (2 * sqrt(-(a - b - 3 * c) * (a - 3 * b - c) * (a - b - c) * (a + b + c)));
}

int main() {
    float a, b, c, deltaA, deltaB, deltaC;
    cout << "[1] Please enter length of the triangle side." << endl;
    cin >> a;

    cout << "[1] Please enter the accuracy of the given length." << endl;
    cin >> deltaA;

    cout << "[2] Please enter length of the triangle side." << endl;
    cin >> b;

    cout << "[2] Please enter the accuracy of the given length." << endl;
    cin >> deltaB;

    cout << "[3] Please enter length of the triangle side." << endl;
    cin >> c;

    cout << "[3] Please enter the accuracy of the given length." << endl;
    cin >> deltaC;

    float area, areaDf, areaAccuracy;
    area = triangle_area(a, b, c);
    areaDf = fabs(area_df(a, b, c));
    areaAccuracy = areaDf * deltaA + areaDf * deltaB + areaDf * deltaC;

    cout << endl << "A = " << area << " +- " << areaAccuracy << endl;

    return 0;
}