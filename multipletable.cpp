/*
=========================================
filename	: MultiTabs
description	: Print out the grade school 
		  multiplication table upto 12*12
author		: Dai Nguyen-Van
email		: dainv1989@gmail.com
=========================================
*/

#include<iostream>
#include<iomanip>
using namespace std;
int main()
{
   int i,j;
   for(i=1; i<=12; i++)
   {
      for(j=1; j<=12; j++)
         cout<<setw(4)<<i*j;
      cout<<"\n";	//start a new line
   }
   return 0;
}