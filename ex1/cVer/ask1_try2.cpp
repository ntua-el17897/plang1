#include <iostream>
#include <string.h>
#include <fstream>      // std::ifstream

using namespace std;


double log(double y) {
    int log2 = 0;
    int inty = (int)y;
    double divisor, x, result;

    while(inty>>=1){
        log2++;
    }
    // log2 = msb((int)y); // See: https://stackoverflow.com/a/4970859/6630230

    divisor = (double)(1 << log2);
    x = y / divisor;    // normalized value between [1.0, 2.0]

    result = -1.7417939 + (2.8212026 + (-1.4699568 + (0.44717955 - 0.056570851 * x) * x) * x) * x;
    result += ((double)log2) * 0.69314718; // ln(2) = 0.69314718

    return result;
}

int main(int argc, char** argv){
    double ratios[26] = {0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, 0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749, 0.07507, 0.01929, 0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02360, 0.00150, 0.01974, 0.00074};
    int charInput = 0; 
    int appearances[26];
    double frequencies[26];

    std::ifstream fileName(argv[1], std::ifstream::binary);
    fileName.seekg(0, fileName.end);
    int length = fileName.tellg();
    fileName.seekg(0, fileName.beg);

    char *input = new char [length];
    fileName.read(input,length);

    for(int i=0; i <length; i++){
        if(input[i]>='A'&&input[i]<='Z'){
            appearances[input[i]-'A']++;
            charInput++;
        }
        if(input[i]>='a'&&input[i]<='z'){
            appearances[input[i]-'a']++;
            charInput++;
        }
    }    



}
