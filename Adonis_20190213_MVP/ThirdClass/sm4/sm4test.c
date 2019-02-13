/*
 * SM4/SMS4 algorithm test programme
 * 2012-4-21
 */

#include <string.h>
#include <stdio.h>
#include "sm4.h"

void yutestjiami(unsigned long lenght,unsigned char in[], unsigned char output[],unsigned char key[]){
//    unsigned char key[16]   = {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
    
    sm4_context ctx;
    unsigned long i;
    
    sm4_setkey_enc(&ctx,key);
    
//    printf("yu传入明文是：");
//    for(i=0;i<lenght;i++)
//        printf("%02x ", in[i]);
//    printf("\n");
//    for(i=0;i<lenght;i++)
//        printf("%02d ", in[i]);
//    printf("\n");
    
    sm4_crypt_ecb(&ctx,1,strlen((const char*)in),in,output);
    
//    printf("yu密文是：");
//    for(i=0;i<lenght;i++)
//        printf("%02x ", output[i]);
//    printf("\n");
}


void yutestjiemi(unsigned long lenght, unsigned char in[], unsigned char output[], unsigned char key[]){
//    unsigned char key[16] = {0x12,0x34,0x56,0x78,0x90,0xab,0xcd,0xef,0x12,0x34,0x56,0x78,0x90,0xab,0xcd,0xef};
   
    sm4_context ctx;
    unsigned long i;
//    printf("长度是");
//    printf("%lu",lenght);
//    printf("\n  \n");
    sm4_setkey_dec(&ctx,key);

//    printf("keya:%s",key);
//    printf("\n  \n");
    sm4_crypt_ecb(&ctx,0,lenght,in,output);
//    printf("长度是");
//    printf("%lu",lenght);
//    printf("\n  \n");
//    printf("yu解密：");
//    for(i=0;i<lenght;i++)
//        printf("%02x ", output[i]);
//    printf("\n");
//    printf("yu解密：");
//    for(i=0;i<lenght;i++)
//        printf("%d ", output[i]);
//    printf("\n");
//        printf("长度是");
//    printf("%lu",lenght);
//    printf("\n  \n");
}

void yutest(unsigned char in[], unsigned char output[]){
//    unsigned char key[16]   = {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
////    unsigned char input[16] = {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
//    sm4_context ctx;
//    unsigned long i;
//    
//    
//    
//    sm4_setkey_dec(&ctx,key);
////    sm4_crypt_cbc(&ctx, 0, 1905, in, in, output);
//    sm4_crypt_ecb(&ctx,0,strlen((const char*)in),in,output);
//    printf("yu解密：");
//    for(i=0;i<strlen((const char*)in);i++)
//        printf("%02x ", output[i]);
//    printf("\n");
}

int mainSM4() {
	unsigned char key[16]   = {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
	unsigned char input[16] = {0x01,0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0xfe,0xdc,0xba,0x98,0x76,0x54,0x32,0x10};
	unsigned char output[16];
	sm4_context ctx;
	unsigned long i;

    
    
    
    
	//encrypt standard testing vector
	sm4_setkey_enc(&ctx,key);
	sm4_crypt_ecb(&ctx,1,16,input,output);
//    printf("yu密文是：");
//    for(i=0;i<16;i++)
//		printf("%02x ", output[i]);
//	printf("\n");

    

    
	//decrypt testing
	sm4_setkey_dec(&ctx,key);
	sm4_crypt_ecb(&ctx,0,16,output,output);
//    printf("yu解密：");
//    for(i=0;i<16;i++)
//		printf("%02x ", output[i]);
//	printf("\n");

    
    
    
    
    
    
//    
//    printf("利用相同加密密钥对一组明文反复加密1000000 次：");
//
//	//decrypt 1M times testing vector based on standards.
//	i = 0;
//	sm4_setkey_enc(&ctx,key);
//	while (i<1000000) 
//    {
//		sm4_crypt_ecb(&ctx,1,16,input,input);
//		i++;
//    }
//	for(i=0;i<16;i++)
//		printf("%02x ", input[i]);
//	printf("\n");
//	
    return 0;
}
