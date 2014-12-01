//
//  NNYMobClientTests.m
//  NNYMobClientTests
//
//  Created by numa08 on 11/27/2014.
//  Copyright (c) 2014 numa08. All rights reserved.
//
#import <NNYMobClient/NNYMobClient.h>
SpecBegin(InitialSpecs)

describe(@"Create Client", ^{

    it(@"match client name", ^{
        NNYMobClient *client = [NNYMobClient clientForName:NNYMobW303HW withIPAddress:@"192.168.100.1"];
        expect(client.name).to.equal(NNYMobW303HW);
    });
});
SpecEnd
