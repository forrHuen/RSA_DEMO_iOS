//
//  ViewController.m
//  RSADemo
//
//  Created by Forr on 16/4/26.
//  Copyright © 2016年 Finansir. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncryptor.h"

@interface ViewController ()
{
    RSAEncryptor *rsa;
    NSString *screctString;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    rsa = [[RSAEncryptor alloc] init];
    [self rsaEncode];
    [self rsaDecode];
}

- (void)rsaEncode
{
    NSLog(@"encryptor using rsa");
    NSString *publicKeyPath = [[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
    NSLog(@"public key: %@", publicKeyPath);
    [rsa loadPublicKeyFromFile:publicKeyPath];
    
    NSString *securityText = @"hello ~";
    NSString *encryptedString = [rsa rsaEncryptString:securityText];
    NSLog(@"encrypted data: %@", encryptedString);
    screctString = encryptedString;
}

- (void)rsaDecode
{
    NSLog(@"decryptor using rsa");
    [rsa loadPrivateKeyFromFile:[[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"] password:@"123456"];
    NSString *decryptedString = [rsa rsaDecryptString:screctString];
    NSLog(@"decrypted data: %@", decryptedString);
}


@end
