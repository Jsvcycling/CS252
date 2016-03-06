#include <stdio.h>
extern int add2( int i, int j ) ;

void main( int argc, char * argv[] )
{
    int i = 5 ;
    int j = 10 ;
    int result ;

    result = add2( i, j ) ;
    printf( "result: %d\n", result ) ;
}
