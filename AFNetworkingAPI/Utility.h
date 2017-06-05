//
//  Utility.h
//  AFNetworkingAPI
//
//  Created by Ravi Dhorajiya on 04/06/17.
//  Copyright © 2017 Ravi Dhorajiya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (instancetype)sharedInstance;
- (void)ShowProgress;
- (void)hideProgress;

@end
