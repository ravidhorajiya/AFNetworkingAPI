//
//  ViewController.m
//  AFNetworkingAPI
//
//  Created by Ravi Dhorajiya on 04/06/17.
//  Copyright © 2017 Ravi Dhorajiya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<WebServicesDelegate>
{
    WebServices *objWebServices;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    objWebServices = [WebServices sharedInstance];
    objWebServices.delegate = self;
    
    NSDictionary *dict =  @{
                            @"key":@"Value",
                            @"key":@"Value"
                            };
    [objWebServices callApiWithParameters:dict apiName:APIURL type:POST_REQUEST loader:YES view:self];
    
    //upload audio to server.
    [objWebServices callApiWithParameters:dict AudioParameters:@"ADD KEY NAME" AudioData:[NSData dataWithContentsOfFile:@"ADD FILE"] apiName:APIURL type:POST_REQUEST loader:YES view:self];
    
    //upload image to server.
    [objWebServices callApiWithParameters:dict imageParameters:@"ADD KEY NAME" imageData:[NSData dataWithContentsOfFile:@"ADD FILE"] apiName:APIURL type:POST_REQUEST loader:YES view:self];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - webservice call delegate methods
-(void)response:(NSDictionary *)responseDict apiName:(NSString *)apiName ifAnyError:(NSError *)error
{
    if ([apiName isEqualToString:APIURL])
    {
        if(responseDict != nil)
        {
            NSLog(@"%@",responseDict.description);
        }
    }
    else
    {
        NSLog(@"Connection time out!");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
