//
//  Utility.m
//  AFNetworkingAPI
//
//  Created by Ravi Dhorajiya on 04/06/17.
//  Copyright © 2017 Ravi Dhorajiya. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (instancetype)sharedInstance
{
    static Utility *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Utility alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

//Show progress
- (void)ShowProgress
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"Please wait.."];
}

//Hide progress
- (void)hideProgress
{
    [SVProgressHUD dismiss];

}

@end
