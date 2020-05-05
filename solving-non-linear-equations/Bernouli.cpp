#include<iostream>
#include<cmath>
using namespace std;

void Bernouli(int n,double epsilon){
double*coefficients= new double[n+1];
double*initial_vector= new double[n];
double*roots=new double [n];
double newvector=0;
double* horner;
bool flag=false;
int k,z,a;
z=0;
a=n;
for(int i=0;i<n+1;i++){
    cout<<"give a"<< i<<" coefficient"<<endl;
    cin>>coefficients[i];
}
for(int j=0;j<a;j++){
        flag=false;
        k=0;
        horner=new double[n+1];
    initial_vector= new double[n];
    for(int i=0;i<n;i++){
        initial_vector[i]=0;
//    cin>>initial_vector[i];
    }
    initial_vector[n-1]=1;

    while(!flag){
            newvector=0;
        for(int i=0;i<n;i++){
            newvector+=coefficients[n-i]*initial_vector[i];
        if(i==n-1)
            newvector=-newvector/coefficients[0];
        }
        for(int i=0;i<n-1;i++){
            initial_vector[i]=initial_vector[i+1];
        }
        if(n!=1){
            initial_vector[n-1]=newvector;
            newvector=newvector/initial_vector[n-2];
        }else{
            newvector=newvector/initial_vector[0];
            initial_vector[0]=newvector*initial_vector[0];
        }
        horner[0]=coefficients[0];
        for(int i=0;i<n;i++){
        horner[i+1]=newvector*horner[i]+coefficients[i+1];
        }
        if(abs(horner[n])<epsilon){
            flag=true;
        }
        if(k>100)
            flag=true;
        k++;
        }

    if(k>100){
        break;
    }
    roots[j]=newvector;
    n=n-1;
    for(int i=0;i<n+1;i++){
        coefficients[i]=horner[i];
    }
    z++;
    }
    cout<<"Real roots of the equation are:"<<endl;
    for(int i=0;i<z;i++){
        cout<<roots[i]<<endl;
    }

}

int main(){
Bernouli(4,0.00001);




}
