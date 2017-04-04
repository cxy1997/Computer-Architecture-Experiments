#include <iostream>
#include <fstream>
using namespace std;
int main()
{
    ofstream fout("reset.txt");
    for (int i=0;i<32;++i) fout<<"        regFile["<<i<<"]=0;\n";
    fout.close();
}
