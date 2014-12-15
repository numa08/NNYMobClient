//
//  NNYMobW303HWHomePageMessage.m
//  Pods
//
//  Created by numa08 on 2014/12/10.
//
//

#import "NNYMobW303HWHomePageMessage.h"

@implementation NNYMobW303HWHomePageMessage
- (id)init
{
    self = [super init];
    if (self) {
        _sessionID = @"";
        _targetURL = [[NSURL alloc] init];
    }
    return self;
}

- (id)initWithSessionID:(NSString*)sessionID withTargetURL:(NSURL*)url
{
    self = [super init];
    if (self) {
        _sessionID = sessionID;
        _targetURL = url;
    }
    return self;
}

- (NSDictionary*)messageForRequestHead
{
    NSURL *targetURL = [self.targetURL URLByAppendingPathComponent:NNYMobW303HomePagePath];
    NSDictionary *retval = @{NNYMobClientMessageSessionID : self.sessionID,
                             NNYMobClientMessageURL : targetURL};
    return retval;
}

@end