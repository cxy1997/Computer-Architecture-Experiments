#include <iostream>
#include <fstream>
using namespace std;
int main()
{
    ofstream fout("mem_data.txt");
    for (int i =0;i < 256;++i) if (i<=9) fout<<"0000000"<<i<<'\n';else fout<<"00000000\n";
    fout.close();
}
