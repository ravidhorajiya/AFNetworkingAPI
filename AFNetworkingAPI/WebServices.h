//
//  WebService.h
//  AFNetworking (API)
//
//  Created by Ravi Dhorajiya on 29/10/15.
//  Copyright © 2015 com.iphone.ed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol WebServicesDelegate;



@interface WebServices : NSObject

//Shared Instance
+(instancetype)sharedInstance;

//Delegate
@property(nonatomic, strong) id <WebServicesDelegate> delegate;


//Api Call
-(void)callApiWithParameters:(NSDictionary *)parameters apiName:(NSString *)apiName type:(NSString*)type loader:(BOOL)isLoaderNeed view:(UIViewController *)view;
//ImageUpload
-(void)callApiWithParameters:(NSDictionary *)parameters imageParameters:(NSString *)imageName imageData:(NSData *)data apiName:(NSString *)apiName type:(NSString *)type loader:(BOOL)isLoaderNeed view:(UIViewController *)view;
//AudioFile
-(void)callApiWithParameters:(NSDictionary *)parameters AudioParameters:(NSString *)imageName AudioData:(NSData *)data apiName:(NSString *)apiName type:(NSString *)type loader:(BOOL)isLoaderNeed view:(UIViewController *)view;


@end

// protocol to get the response of API call
@protocol WebServicesDelegate <NSObject>
@required

-(void)response:(NSDictionary *)responseDict apiName:(NSString *)apiName ifAnyError:(NSError *)error;




@end
