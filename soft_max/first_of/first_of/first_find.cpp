#include<iostream>
#include<string>
using namespace std;

int main()
{


	while ((pos = s.find_first_of(numerics, pos))!=string::npos)
		cout << "s[" << pos << "]" << "=" << s[pos++] << endl;

	pos = 0;
	while ((pos = s.find_first_not_of(numerics, pos)) != string::npos)
		cout << "s[" << pos << "]" << "=" << s[pos++] << endl;

	pos = 0;
	while ((pos = s.find_first_of(alphabetic, pos)) != string::npos)
		cout << "s[" << pos << "]" << "=" << s[pos++] << endl;

	pos = 0;
	while ((pos = s.find_first_not_of(alphabetic, pos)) != string::npos)
		cout << "s[" << pos << "]" << "=" << s[pos++] << endl;
	return 0;
}