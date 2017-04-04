#include <iostream>
#include <fstream>
using namespace std;
int main()
{
    ofstream fout("data.coe");
    fout<<"memory_initialization_radix=16;\nmemory_initialization_vector=\n00000001,\n00000005,\n00000008,";
    for (int i=3;i<1024;++i)
    {
        fout<<"\n00000000";
        if (i!=1023) fout<<",";
    }
    fout.close();
    cout<<"All complete!\n";
}
