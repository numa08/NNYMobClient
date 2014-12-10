//
//  NNYmobW303HWClient+NNYmobW303Login.m
//  Pods
//
//  Created by numa08 on 2014/12/10.
//
//

#import "NNYmobW303HWClient+NNYmobW303Login.h"

#import "HTMLParser.h"
#import "HTMLNode.h"
#import <KissXML/DDXML.h>

#import "NNYMobW303HWHomePageMessage.h"
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
@end
