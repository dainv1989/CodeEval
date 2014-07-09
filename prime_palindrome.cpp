/*
=============================================
filename	: prime_palindrome.cpp
description	: Determine the biggest prime palindrome number under 1000
author		: Dai Nguyen-Van
email		: dainv1989@gmail.com
=============================================
*/
#include<iostream>
using namespace std;

//function      : is_palindrome
//description   : check a number is palindromic or not
bool is_palindrome(int num)
{
    bool result=false;
    int renum, tmp;
    tmp = num;

    //calculate number when reverse its constituent digits
    renum = 0;
    while(tmp)
    {
        renum=renum*10 + (tmp%10);
        tmp=tmp/10;
    }
    //checking whether it's palindromic or not
    if(renum==num) result=true;
    return result;
}

//function	: is_prime
//description	: check a number is prime number or not
bool is_prime(int num)
{
    bool result=true;
    for(int i=2; i<=num/2; i++)
        if(num%i==0) result=false;
    return result;
}

//main function
int main()
{
    int n;
    n=999;
    do
    {
        if(is_prime(n))
            if(is_palindrome(n)) break;
            else n--;
        else n--;
    }
    while(n!=0);

    cout<<n<<endl;
    return 0;
}