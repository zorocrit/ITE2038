#include "bpt.h"
#include <time.h>

int main(){
    int64_t input;
    char instruction;
    char buf[120];
    char *result;
    open_table("test.db");
    int i = 0;

    int j,k = 1001;
    int ch = 0;
    int num = -1;
    clock_t startTick, endTick;
    struct timeval tv;
    while(scanf("%c", &instruction) != EOF){

        switch(instruction){
            case 'i':
                //startTick = clock();
                scanf("%ld %s", &input, buf);
                db_insert(input, buf);
                //endTick = clock(); //
                //printf("%d> Tick: %d\n", ++i, endTick - startTick);//
                break;
            case 'f':
                scanf("%ld", &input);
                result = db_find(input);
                if (result) {
                    printf("Key: %ld, Value: %s\n", input, result);
                }
                else
                    printf("Not Exists\n");

                fflush(stdout);
                break;
            case 'd':
                scanf("%ld", &input);
                if(num <= 100) {
                    //printf("%d dele!\n",j);
                    db_delete2(input);
                    break;
                }
                else if(num > 100000) {
                    if(ch > num/800) {
                        init_delete(ch);
                        ch = 0;
                    }
                    num = db_delete(input, ch);
                    ch++;
                    break;
                }
                else {
                    if(ch > num/100) {
                        init_delete(ch);
                        ch = 0;
                    }
                    num = db_delete(input, ch);
                    ch++;
                    //printf("%d Done!\n",j);
                    break;
                }
            case 'q':
                while (getchar() != (int)'\n');
                init_delete(ch); //밀려 삭제되지 않은 internal들을 삭제한다.
                ch = 0;
                return EXIT_SUCCESS;
                break;
            case 'k':
                gettimeofday(&tv, NULL);
                scanf("%d", &k);
                double start2 = (tv.tv_sec) * 1000 + (tv.tv_usec) /1000;
                for(j = 1; j < k; j++) {
                    sprintf(buf, "%d", k-j);
                    db_insert(j, buf);
                    //printf("%d Done!\n",j);
                }
                for(j = 1; j < k; j++) {
                    //sprintf(buf, "%d", k-j);
                    if(num > 100000) {
                        if(ch > num/800) {
                            init_delete(ch);
                            ch = 0;
                        }
                        num = db_delete(j, ch);
                        ch++;
                    }
                    else if(num > 100) {
                        if(ch > num/100) {
                            init_delete(ch);
                            ch = 0;
                        }
                        num = db_delete(j, ch);
                        ch++;
                        //printf("%d Done!\n",j);
                    }
                    else {
                        db_delete2(j);
                        //printf("%d Done!\n",j);

                    }
                }
                gettimeofday(&tv, NULL);
                double end2 = (tv.tv_sec) * 1000 + (tv.tv_usec) /1000;
                printf("%d> Time: %f\n", ++i, (end2 - start2)/1000);//
                break;
        }

        while (getchar() != (int)'\n');
    }
    printf("\n");
    return 0;
}



