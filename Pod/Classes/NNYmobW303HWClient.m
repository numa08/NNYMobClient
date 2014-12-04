//
//  NNYmobW303HWClient.m
//  Pods
//
//  Created by numa08 on 2014/12/04.
//
//

#import "NNYmobW303HWClient.h"
@interface NNYmobW303HWClient()
@property (nonatomic, copy) NSString *ipaddress;
@end

@implementation NNYmobW303HWClient

- (id)initWithIPAddress:(NSString *)ipaddress
{
    self = [super init];
    if (self) {
        self.ipaddress = ipaddress;
    }
    return self;
}

- (NSString*)name
{
    return NNYMobW303HW;
}

@end
