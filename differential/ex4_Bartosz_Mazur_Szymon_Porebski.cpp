#include<iostream>
#include<cmath>

using namespace std;

double function(double x)
{
    return pow(x,4);
}

double firstOrder(int n, double h, double x)
{
    double* diffFunc = new double[n];
    double* prevDiff = new double[n+1];
    double* temp;
    double sum = 0;

    for(int i = 0; i <= n; i++)
    {
        prevDiff[i] = function(x + i * h);
    }
    
    for(int i = 0; i < n; i++)
    {
        temp = new double[n - i];
        for(int j = 0; j < n - i; j++)
        {
            temp[j] = prevDiff[j + 1] - prevDiff[j];
            if(j == 0)
            {
                diffFunc[i] = temp[0];
            }
        }
        prevDiff = temp;
    }
    
    for(int i = 0; i < n; i++)
    {
        if(i%2==0)
        {
            sum -= diffFunc[i] / (i +1);
        }
        else
        {
            sum += diffFunc[i] / (i + 1);
        }
    }  
    return (sum / h);
}

double firstOrderModif(int n, double h, double x, double accuracy, bool modifN)
{
    int nextN = n;
    double nextH = h;
    double* diffFunc;
    double* prevDiff;
    double* temp;
    double sum = 0;
    int fact = 1;

    while(true)
    {
        diffFunc = new double[nextN+1];
        prevDiff = new double[nextN+2];

        for(int i = 0; i <= nextN + 1; i++)
        {
            prevDiff[i] = log(x + i * nextH);
        }

        for(int i = 0; i < nextN + 1; i++)
        {
            temp = new double[nextN - i + 1];
            for(int j = 0; j < nextN - i + 1; j++)
            {
                temp[j] = prevDiff[j + 1] - prevDiff[j];
                if(j == 0)
                {
                    diffFunc[i] = temp[0];
                }
            }
            prevDiff = temp;
        }

        for(int i = nextN; i > 0; i--)
        {
            fact *= i;
        }
        if(abs(diffFunc[nextN] / (fact * nextH)) < accuracy)
        {
            break;
        }
        if(modifN == true)
        {
            nextN++;
        }
        else
        {
            nextH -= (h / 10000);
        }
    }

    if(modifN == true)
    {
        cout << "Modify n is equal: " << nextN << endl;
    }
    else
    {
        cout << "Modify h is equal: " << nextH << endl;
    }
    
    for(int i = 0; i < nextN; i++)
    {
        if(i%2 == 0)
        {
            sum += diffFunc[i] / (i+1);
        }
        else
        {
            sum -= diffFunc[i] / (i+1);
        }
    }
    return sum/nextH;
}

double secondOrder(int n, double h, double x)
{
    double* diffFunc=new double[n];
    double* prevDiff=new double[n+1];
    double* temp;
    double sum=0;

    for(int i = 0; i <= n; i++)
    {
        prevDiff[i] = firstOrder(n, h, x + i * h);
    }

    for(int i = 0; i < n; i++)
    {
        temp = new double[n - i];
        for(int j = 0; j < n - i; j++)
        {

            temp[j] = prevDiff[j + 1] - prevDiff[j];

            if(j==0)
            {
                diffFunc[i] = temp[0];
            }
        }
        prevDiff = temp;
    }

    for(int i = 0; i < n; i++)
    {
        if(i%2 == 0)
        {
            sum += diffFunc[i] / (i + 1);
        }
        else
        {
            sum -= diffFunc[i] / (i + 1);
        }
    }
    return (sum / h);
}



int main()
{
    cout << "Value of first order differential: " << firstOrder(2, 1, 1) << endl << endl;
    cout << "Value of first order differential with modify n or h: " << 
    firstOrderModif(2, 1, 1, 0.001, false) << endl << endl;
    cout << "Value of second order differential: " << secondOrder(2, 1, 1) << endl;

    return 0;
}
