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
    
    it(@"conform procol", ^{
        NSObject *client = [NNYMobClient clientForName:NNYMobW303HW withIPAddress:@"192.168.100.1"];
        expect([client conformsToProtocol:@protocol(NNYMobClient)]).to.equal(YES);
    });
});

describe(@"Request", ^{
    it(@"get session id", ^{
        id<NNYMobClient> client = [NNYMobClient clientForName:NNYMobW303HW withIPAddress:@"192.168.128.1"];
        NSError *error = nil;
        NSString *sessionID = [client requestSessionIDWithError:&error];
        NSLog(@"session ID is %@", sessionID);
    });
    
    it(@"can get signal strength", ^{
        id<NNYMobClient> client = [NNYMobClient clientForName:NNYMobW303HW withIPAddress:@"192.168.128.1"];
        NSError *error = nil;
        NSString *sessionID = [client requestSessionIDWithError:&error];
//        expect(error).toNot.beNil;
        client.sessionID = sessionID;
        NSInteger signalStrength = [client requestSignalStrengthWithError:&error];
//        expect(error).toNot.beNil;
//        expect(signalStrength).toNot.equal(0);
        NSLog(@"signal strength is %@", @(signalStrength));
    });
});

SpecEnd
