//
//  WebService.m
//  AFNetworking (API)
//
//  Created by Ravi Dhorajiya on 29/10/15.
//  Copyright © 2015 com.iphone.ed. All rights reserved.
//

#import "WebServices.h"
#import "AppDelegate.h"

@implementation WebServices
+(instancetype)sharedInstance
{
    static WebServices * webservices;
    if (webservices == nil)
    {
        webservices = [[WebServices alloc]init];
    }
    return webservices;
}

-(void)callApiWithParameters:(NSDictionary *)parameters apiName:(NSString *)apiName type:(NSString*)type loader:(BOOL)isLoaderNeed view:(UIViewController *)view
{
    if([[AppDelegate sharedAppDelegate] checkInternetConnection])
    {
        if ([type isEqualToString:POST_REQUEST])
        {
            __block NSDictionary * dictResponse = nil;
            
            if (isLoaderNeed == YES)
            {
                [[Utility sharedInstance] ShowProgress];
            }
            else
            {
                UIApplication* networkProgress = [UIApplication sharedApplication];
                networkProgress.networkActivityIndicatorVisible = YES;
            }
            
            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            [manager POST:apiName parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
             {
                 NSError *jsonError;
                 dictResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&jsonError];
                 
                  /********API LOG ERROR*********/
                  NSLog(@"------------- API NAME -------------");
                  NSLog(@"API NAME: %@",apiName);
                  NSLog(@"------------- PARAMETERS -------------");
                  NSLog(@"PARAMETERS: %@",parameters);
                  NSLog(@"------------- RESPONSE -------------");
                  NSLog(@"RESPONCE: %@",dictResponse);
                  NSLog(@"--------------------------------------");
                  /********API LOG ERROR*********/
 
                  if (isLoaderNeed == YES)
                  {
                      [[Utility sharedInstance] hideProgress];
                  }
                  else
                  {
                      UIApplication* networkProgress = [UIApplication sharedApplication];
                      networkProgress.networkActivityIndicatorVisible = NO;
                      
                  }
                [self.delegate response:dictResponse apiName:apiName ifAnyError:nil];
            }
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                 
                 /********API LOG ERROR*********/
                 NSLog(@"------------- API NAME -------------");
                 NSLog(@"API NAME: %@",apiName);
                 NSLog(@"------------- PARAMETERS -------------");
                 NSLog(@"PARAMETERS: %@",parameters);
                 NSLog(@"------------- RESPONSE -------------");
                 NSLog(@"RESPONCE: %@",dictResponse);
                 NSLog(@"--------------------------------------");
                 /********API LOG ERROR*********/
 
                  if (isLoaderNeed == YES)
                  {
                      [[Utility sharedInstance] hideProgress];
                  }
                  else
                  {
                      UIApplication* networkProgress = [UIApplication sharedApplication];
                      networkProgress.networkActivityIndicatorVisible = NO;
                  }
                  [self.delegate response:dictResponse apiName:apiName ifAnyError:nil];
                 
            }];
        }
        else if ([type isEqualToString:GET_REQUEST])
        {
            __block NSDictionary * dictResponse = nil;
            if (isLoaderNeed == YES)
            {
                [[Utility sharedInstance] ShowProgress];
            }
            else
            {
                UIApplication* networkProgress = [UIApplication sharedApplication];
                networkProgress.networkActivityIndicatorVisible = YES;
            }
            
            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            
            [manager GET:apiName parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
             {
                 NSError *jsonError;
                 dictResponse = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&jsonError];
                 dictResponse = (NSDictionary *)responseObject;
                 
                 /********API LOG ERROR*********/
                 NSLog(@"------------- API NAME -------------");
                 NSLog(@"API NAME: %@",apiName);
                 NSLog(@"------------- PARAMETERS -------------");
                 NSLog(@"PARAMETERS: %@",parameters);
                 NSLog(@"------------- RESPONSE -------------");
                 NSLog(@"RESPONCE: %@",dictResponse);
                 NSLog(@"--------------------------------------");
                 /********API LOG ERROR*********/
                 
                 if (isLoaderNeed == YES)
                 {
                     [[Utility sharedInstance] hideProgress];
                 }
                 else
                 {
                     UIApplication* networkProgress = [UIApplication sharedApplication];
                     networkProgress.networkActivityIndicatorVisible = NO;
                 }
                 [self.delegate response:dictResponse apiName:apiName ifAnyError:nil];
             }
             failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
             {
                 
                 /********API LOG ERROR*********/
                 NSLog(@"------------- API NAME -------------");
                 NSLog(@"API NAME: %@",apiName);
                 NSLog(@"------------- PARAMETERS -------------");
                 NSLog(@"PARAMETERS: %@",parameters);
                 NSLog(@"------------- RESPONSE -------------");
                 NSLog(@"RESPONCE: %@",dictResponse);
                 NSLog(@"--------------------------------------");
                 /********API LOG ERROR*********/
                 
                 if (isLoaderNeed == YES)
                 {
                     [[Utility sharedInstance] hideProgress];
                 }
                 else
                 {
                     UIApplication* networkProgress = [UIApplication sharedApplication];
                     networkProgress.networkActivityIndicatorVisible = NO;
                 }
                 [self.delegate response:dictResponse apiName:apiName ifAnyError:nil];
             }];
        }
    }
    else
    {
        NSLog(@"Please connect to internet.");

//        [[Utility sharedInstance] ShowAlertView:view title:nil subtitle:MSG_INTERNET image:[UIImage imageNamed:@"internet"]];
    }
}

-(void)callApiWithParameters:(NSDictionary *)parameters imageParameters:(NSString *)imageName imageData:(NSData *)data apiName:(NSString *)apiName type:(NSString *)type loader:(BOOL)isLoaderNeed view:(UIViewController *)view
{
    if([[AppDelegate sharedAppDelegate] checkInternetConnection])
    {
        if ([type isEqualToString:POST_REQUEST])
        {
            __block NSDictionary * dictResponse = nil;
            
            if (isLoaderNeed == YES)
            {
                [[Utility sharedInstance] ShowProgress];
            }
            else
            {
                UIApplication* networkProgress = [UIApplication sharedApplication];
                networkProgress.networkActivityIndicatorVisible = YES;
            }
            
            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            [manager POST:apiName parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                [formData appendPartWithFileData:data name:imageName fileName:@"testing.jpg" mimeType:@"image/jpeg"];
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSError *jsonError;
                dictResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&jsonError];
                
                /********API LOG ERROR*********/
                NSLog(@"------------- API NAME -------------");
                NSLog(@"API NAME: %@",apiName);
                NSLog(@"------------- PARAMETERS -------------");
                NSLog(@"PARAMETERS: %@",parameters);
                NSLog(@"------------- RESPONSE -------------");
                NSLog(@"RESPONCE: %@",dictResponse);
                NSLog(@"--------------------------------------");
                /********API LOG ERROR*********/
                
                if (isLoaderNeed == YES)
                {
                    [[Utility sharedInstance] hideProgress];
                }
                else
                {
                    UIApplication* networkProgress = [UIApplication sharedApplication];
                    networkProgress.networkActivityIndicatorVisible = NO;
                    
                }
                [self.delegate response:dictResponse apiName:apiName ifAnyError:nil];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                /********API LOG ERROR*********/
                NSLog(@"------------- API NAME -------------");
                NSLog(@"API NAME: %@",apiName);
                NSLog(@"------------- PARAMETERS -------------");
                NSLog(@"PARAMETERS: %@",parameters);
                NSLog(@"------------- RESPONSE -------------");
                NSLog(@"RESPONCE: %@",dictResponse);
                NSLog(@"--------------------------------------");
                /********API LOG ERROR*********/
                
                if (isLoaderNeed == YES)
                {
                    [[Utility sharedInstance] hideProgress];
                }
                else
                {
                    UIApplication* networkProgress = [UIApplication sharedApplication];
                    networkProgress.networkActivityIndicatorVisible = NO;
                }
                [self.delegate response:dictResponse apiName:apiName ifAnyError:nil];
            }];
        }
    }
    else
    {
        NSLog(@"Please connect to internet.");
//        [[Utility sharedInstance] ShowAlertView:view title:nil subtitle:MSG_INTERNET image:[UIImage imageNamed:@"internet"]];
    }
}
-(void)callApiWithParameters:(NSDictionary *)parameters AudioParameters:(NSString *)imageName AudioData:(NSData *)data apiName:(NSString *)apiName type:(NSString *)type loader:(BOOL)isLoaderNeed view:(UIViewController *)view
{
    if([[AppDelegate sharedAppDelegate] checkInternetConnection])
    {
        if ([type isEqualToString:POST_REQUEST])
        {
            __block NSDictionary * dictResponse = nil;
            
            if (isLoaderNeed == YES)
            {
                [[Utility sharedInstance] ShowProgress];
            }
            else
            {
                UIApplication* networkProgress = [UIApplication sharedApplication];
                networkProgress.networkActivityIndicatorVisible = YES;
            }
            NSString *strRandomVal = [self generateRandomString:20];
            NSString *strAudioFileName = [NSString stringWithFormat:@"%@.wav",strRandomVal];
            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
            [manager POST:apiName parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                [formData appendPartWithFileData:data name:imageName fileName:strAudioFileName mimeType:@"audio/wav"];
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSError *jsonError;
                dictResponse = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&jsonError];
                
                /********API LOG ERROR*********/
                NSLog(@"------------- API NAME -------------");
                NSLog(@"API NAME: %@",apiName);
                NSLog(@"------------- PARAMETERS -------------");
                NSLog(@"PARAMETERS: %@",parameters);
                NSLog(@"------------- RESPONSE -------------");
                NSLog(@"RESPONCE: %@",dictResponse);
                NSLog(@"--------------------------------------");
                /********API LOG ERROR*********/
                
                if (isLoaderNeed == YES)
                {
                    [[Utility sharedInstance] hideProgress];
                }
                else
                {
                    UIApplication* networkProgress = [UIApplication sharedApplication];
                    networkProgress.networkActivityIndicatorVisible = NO;
                }
                [self.delegate response:dictResponse apiName:apiName ifAnyError:nil];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                /********API LOG ERROR*********/
                NSLog(@"------------- API NAME -------------");
                NSLog(@"API NAME: %@",apiName);
                NSLog(@"------------- PARAMETERS -------------");
                NSLog(@"PARAMETERS: %@",parameters);
                NSLog(@"------------- RESPONSE -------------");
                NSLog(@"RESPONCE: %@",dictResponse);
                NSLog(@"--------------------------------------");
                /********API LOG ERROR*********/
                
                if (isLoaderNeed == YES)
                {
                    [[Utility sharedInstance] hideProgress];
                }
                else
                {
                    UIApplication* networkProgress = [UIApplication sharedApplication];
                    networkProgress.networkActivityIndicatorVisible = NO;
                }
                [self.delegate response:dictResponse apiName:apiName ifAnyError:nil];
            }];
        }
    }
    else
    {
        NSLog(@"Please connect to internet.");

//        [[Utility sharedInstance] ShowAlertView:view title:nil subtitle:MSG_INTERNET image:[UIImage imageNamed:@"internet"]];
    }
}
-(NSString*)generateRandomString:(int)num {
    NSMutableString* string = [NSMutableString stringWithCapacity:num];
    for (int i = 0; i < num; i++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}
@end
