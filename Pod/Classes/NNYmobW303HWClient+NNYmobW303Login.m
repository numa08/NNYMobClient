//
//  NNYmobW303HWClient+NNYmobW303Login.m
//  Pods
//
//  Created by numa08 on 2014/12/10.
//
//

#import "NNYmobW303HWClient+NNYmobW303Login.h"

#import <KissXML/DDXML.h>
#import "HTMLParser.h"

#import "NNYMobW303HWHomePageMessage.h"
#import "NNYMobW303HWLoginMessage.h"
#import "NNYMobClientConnection.h"

@implementation NNYmobW303HWClient (NNYmobW303Login)
- (NSString*)loginSessionIDWithUserName:(NSString*)userName withPassword:(NSString*)password withError:(NSError**)error
{
    NSError *myError = nil;
    NSString *loginSessionID = nil;
    @try {
        // Get CSRF Token
        NSString *csrfToken = [self requestCSRFTokenWithError:&myError];
        if (myError) {
            @throw myError;
        }
        NSLog(@"token %@", csrfToken);
        loginSessionID = [self requestLoginSessionIDWithUserName:userName withPassword:password withCSRFToken:csrfToken withError:&myError];
        if (myError) {
            @throw myError;
        }
    }
    @catch (NSError *e) {
        if (error) {
            *error = e;
        }
    }
    return loginSessionID;
}

- (NSString*)requestCSRFTokenWithError:(NSError**)error
{
    NSString *csrfToken = nil;
    NSError *myError = nil;
    
    id<NNYMobClientMessage> message = [[NNYMobW303HWHomePageMessage alloc] initWithSessionID:self.sessionID withTargetURL:self.targetURL];
    NNYMobClientConnection *connection = [[NNYMobClientConnection alloc] init];
    @try {
        NSData *response = [connection requestForMessage:message error:&myError];
        if (myError) {
            @throw myError;
        }
        
        HTMLParser *parser = [[HTMLParser alloc] initWithData:response error:&myError];
        if (myError) {
            @throw myError;
        }
        
        HTMLNode *tokenTag = [parser.head findChildWithAttribute:@"name" matchingName:@"csrf_token" allowPartial:NO];
        csrfToken = [tokenTag getAttributeNamed:@"content"];
    }
    @catch (NSError *e) {
        if (error) {
            *error = e;
        }
    }
    return csrfToken;
}

- (NSString*)requestLoginSessionIDWithUserName:(NSString*)userName withPassword:(NSString*)password withCSRFToken:(NSString*)token withError:(NSError**)error
{
    NSString *sessionId = nil;
    NSError *myError = nil;
    
    NNYMobW303HWLoginMessage *loginMessage = [[NNYMobW303HWLoginMessage alloc] initWithSessionID:self.sessionID withTargetURL:self.targetURL];
    loginMessage.userName = userName;
    loginMessage.password = password;
    loginMessage.csrfToken = token;
    NNYMobClientConnection *connection = [[NNYMobClientConnection alloc] init];
    @try {
        NSData *response = [connection requestForMessage:loginMessage error:&myError];
        if (myError) {
            @throw myError;
        }
        NSLog(@"response %@", [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]);
    }
    @catch (NSError *e) {
        if (error) {
            *error = e;
        }
    }
    return @"";
}
@end
