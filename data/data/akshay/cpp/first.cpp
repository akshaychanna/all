#include <iostream>
using namespace std;

void add(int n1,int n2)
{
	cout << "this is fun with 2 arguments";
	cout << n1+n2;
}

void add ( int n1,int n2, int n3)
{
	cout << "this is fun with 3 argument"; 
	cout << n1+n2+n3;
}

int main()
{
	int x = 9;
	add(10,20,30);
	cout << x;
	add(3,4)
	return 0;
}
