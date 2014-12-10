//
//  NNYMobW303HWHomePageMessage.h
//  Pods
//
//  Created by numa08 on 2014/12/10.
//
//

#import <Foundation/Foundation.h>
#import "NNYMobClientConnection.h"

static NSString *const NNYMobW303HomePagePath = @"html/home.html";

@interface NNYMobW303HWHomePageMessage : NSObject<NNYMobClientMessage>
@property (nonatomic, readonly) NSString *sessionID;
@property (nonatomic, readonly) NSURL *targetURL;
- (id)initWithSessionID:(NSString*)sessionID withTargetURL:(NSURL*)url;
@end