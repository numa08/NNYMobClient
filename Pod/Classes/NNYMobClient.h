//
//  NNYMobClient.h
//  Pods
//
//  Created by numa08 on 2014/12/02.
//
//

#import <Foundation/Foundation.h>

// Supported Clients
static NSString *const NNYMobW303HW = @"W303H";

@interface NNYMobClient : NSObject
+ (id)clientForName:(NSString*)name withIPAddress:(NSString*)ipaddress;
@property (nonatomic, readonly) NSString *name;
@end
