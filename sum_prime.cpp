/*
========================================
filename	: SumPrime.cpp
description	: sum of the 1000 first prime numbers
author		: Dai Nguyen-Van
email		: dainv1989@gmail.com
========================================
*/

#include<iostream>
using namespace std;

//funtion       : is_prime
//description   : check a number is prime number or not
bool is_prime(int a)
{
    bool result=true;
    for(int i=2;i<=a/2; i++)
        if(a%i==0) result=false;
    return result;
}

int main()
{
    int i, n, sum;
    i=0;
    n=2;
    sum=0;
    while(i<1000)
    {
        if(is_prime(n))
        {
            sum += n;
            i++;
        }
        n++;
    }
    cout<<sum<<"\n";
    return 0;
}