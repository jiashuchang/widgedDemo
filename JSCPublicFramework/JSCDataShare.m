//
//  JSCDataShare.m
//  JSCPublicFramework
//
//  Created by 贾书唱的macbook on 2019/3/22.
//  Copyright © 2019年 jsc. All rights reserved.
//

#import "JSCDataShare.h"

@implementation JSCDataShare

#pragma mark - 通过NSUserDefaults共享数据
- (void)saveDataByNSUserDefaults
{
    NSUserDefaults *shareDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.xxx.xxx"];
    [shareDefault setObject:@"test" forKey:@"widget"];
    [shareDefault synchronize];
}

- (NSString *)readDataFromNSUserDefaults
{
    NSUserDefaults *shareDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.xxx.xxx"];
    NSString *value = [shareDefault valueForKey:@"widget"];
    return value;
}

#pragma mark - 通过NSFileManager共享数据
- (BOOL)saveDataByNSFileManager
{
    NSError *error = nil;
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.xxx.xxx"];
    containerURL = [containerURL URLByAppendingPathComponent:@"Library/Caches/test"];
    
    NSString *value = @"test";
    BOOL result = [value writeToURL:containerURL atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!result) {
        NSLog(@"%@",error);
    } else {
        NSLog(@"save value:%@ success.",value);
    }
    return result;
}

- (NSString *)readDataByNSFileManager
{
    NSError *error = nil;
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.xxx.xxx"];
    containerURL = [containerURL URLByAppendingPathComponent:@"Library/Caches/test"];
    NSString *value = [NSString stringWithContentsOfURL:containerURL encoding:NSUTF8StringEncoding error:&error];
    return value;
}

- (void)copyImageToLibrary{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"DSL.png" ofType:nil];
    NSFileManager * manger = [NSFileManager defaultManager];
    NSString * documentPath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/DSL.png"];
    NSLog(@"%@",documentPath);
    NSError * error = nil;
    if (path != nil) {
        if (![manger fileExistsAtPath:documentPath]) {
            [manger copyItemAtPath:path toPath:documentPath error:&error];
            if (error) {
                NSLog(@"==copy error==%@",[error
                                           localizedDescription]);
            }
        }
    }else{
        NSLog(@"sourcePath is nil");
    }
    [self copyImage];
}
- (void)copyImage{
    NSError * error = nil;
    NSURL * contentURL = [[NSFileManager defaultManager]containerURLForSecurityApplicationGroupIdentifier:@"group.DSLBlobWidget"];
    NSString * newPath = [contentURL URLByAppendingPathComponent:@"/Library/Caches/DSL.png"].path;
    [[NSFileManager
      defaultManager]copyItemAtPath:[NSHomeDirectory()
                                     stringByAppendingPathComponent:@"/Library/Caches/DSL.png"]
     toPath:newPath error:&error];
    if (error) {
        NSLog(@"copy error==%@",[error localizedDescription]);
    }
}

@end
