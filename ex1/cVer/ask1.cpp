#include <iostream>
// #include <math.h>
#include <string.h>
#include <fstream>      // std::ifstream

using namespace std; 


// double log(double x){
// return -1.7417939 + (2.8212026 + (-1.4699568 + (0.44717955 - 0.056570851 * x) * x) * x) * x;
// }

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


int main (int argc, char** argv){
    // ios_base::sync_with_stdio(false);

    double ratios[26] = {0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, 0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749, 0.07507, 0.01929, 0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02360, 0.00150, 0.01974, 0.00074};

    double logratios[26];

    int charInput = 0;
    int appearances[26];
    double frequencies[26];
    // double possibleSummations[26];

    for(int i=0; i<26; i++){
        appearances[i]=0;
        logratios[i]=log(ratios[i]);
        // printf("%f, ", logratios[i]);
    }
    // printf("J+13 = %c\n", 'J'+13);
    // printf("'S'-'L' = %d\n", 'S'-'L');

    /*Ayto typwnei to input toy arxeioy 8a to xrhsimopoihsw gia diabasma*/
    // cout << argv[1] << "\n";
    std::ifstream fileName(argv[1], std::ifstream::binary);
    fileName.seekg(0, fileName.end);
    int length = fileName.tellg();
    fileName.seekg(0, fileName.beg);

    
    char *input = new char [length];
    fileName.read(input,length);

    // printf("%s", input);

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

    for(int i=0; i<26; i++){
        if(appearances[i]!=0){
            frequencies[i]=appearances[i]/((double)charInput);
        }
        else{
            frequencies[i]=0;
        }
        // printf("frequencies[%d] = %f\n", i, frequencies[i]);
        // printf("appearances[%d] = %d\n", i, appearances[i]);
    }

    double min = 0;
    int offset = 0;
    for(int i=0; i<26; i++){
        min = min -frequencies[i]*logratios[i];
    }
    // printf("min %f\n", main);

    double curr;
    for(int n=1; n<26; n++){
        curr = 0;
        for(int j=0; j<26; j++){
            // printf("n+j = %d+%d = %d\n",n,j,(n+j)%26 );
            curr = curr -frequencies[(n+j)%26]*logratios[j];
        }
        // printf("curr[%d]=%f\n", n, curr);
        if(curr<=min){
            min = curr;
            offset = n; 
        }
    }
    // printf("offset = %d\n", offset);

    // if(length==3){offset=19;}
    // if(length==61){offset=13;}

    int c;
    // offset += 5;
    // offset++;
    // offset--;
    // offset--;
    for(int i=0; i<length; i++){
        if(input[i]>='A' && input[i]<='Z'){
            // c = ((input[i])+offset);
            // if(c>'Z'){
            //     c = c % ('Z'+1);
            //     c = c + 'A';
            // }
            // c = ((int)input[i]-'A')%26-offset;
            // c = c%26;
            // c = c+'A';

            c = (int)input[i]-'A'-offset;
            if(c<0) c+=26;
            c += 'A';
            // putchar(c);
            printf("%c", c);

            // printf("%3d|",c);
            // printf("%c|",(char)c);
            // printf("%c|",input[i]);
            // printf("%d|",input[i]);
            // printf("input[%d]+offset+1 = %d\n", i, c);
        }
        else if(input[i]>='a' && input[i]<='z'){
            // c = ((input[i])+offset);
            // if(c>'z'){
            //     c = c % ('z'+1);
            //     c = c + 'a';
            // }

            // c = ((int)input[i]-'Z')%26 - offset;
            // c = c%26;
            // c = c+'a';

            c = ((int)input[i]-'a'-offset);
            if(c<0) c+=26;
            c += 'a';
            // putchar(c);  
            printf("%c", c);

            // printf("%3d|",c);
            // printf("%c|",(char)c);
            // printf("%c|",input[i]);
            // printf("%d|",input[i]);
            // printf("input[%d]+offset+1 = %d\n", i, c);
        }
        else{

            // putchar(input[i]);
            printf("%c", input[i]);
            

            // printf("%c",input[i]);
            // printf("------------\n");
        }
        // if(input[i]<='A' || input[i]>='Z'){
        //     putchar((input[i]+offset+1)%'Z');
        // }
        // else if(input[i]<='a' || input[i]>='z'){
        //     putchar((input[i]+offset+1)%'z');
        // }
        // else{
        //     putchar(input[i]);
        // }
        // putchar(input[i]);
    }
    // printf("\n");

    return 0;
}
