#include <stdio.h>

using namespace std;

int main(){
    unsigned int a, shift, ans;
    scanf("%u %u", &a, &shift);

    __asm__ (
        "mov eax, %1 \n"
        "rol eax, %2 \n"
        "mov %0, eax \n"
        :"=r"(ans)
        :"m"(a), "m"(shift)
        :"%eax"
    );

    printf("Number inputed is %u \n",ans);
    return 0;
}
