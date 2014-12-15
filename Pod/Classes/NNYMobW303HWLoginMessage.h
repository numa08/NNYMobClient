//
//  NNYMobW303HWLoginMessage.h
//  Pods
//
//  Created by numa08 on 2014/12/12.
//
//

#import <Foundation/Foundation.h>

#import "NNYMobClientConnection.h"

static NSString *const NNYMobW303LoginPath = @"api/user/login";

@interface NNYMobW303HWLoginMessage : NSObject<NNYMobClientMessage>
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *csrfToken;
@property (nonatomic, copy) NSString *sessionID;
@property (nonatomic, retain) NSURL *targetURL;
- (id)initWithSessionID:(NSString*)sessionID withTargetURL:(NSURL*)url;
@end