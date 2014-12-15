//
//  NNYMobW303HWLoginMessage.m
//  Pods
//
//  Created by numa08 on 2014/12/12.
//
//

#import "NNYMobW303HWLoginMessage.h"

#import <CommonCrypto/CommonHMAC.h>
#import <Base64nl/Base64.h>
#import <KissXML/DDXML.h>

@interface NNYMobW303HWLoginMessage()
- (NSString*)conversionSHA256String:(NSString*)string;
@end
@implementation NNYMobW303HWLoginMessage
- (id)init
{
    self = [super init];
    if (self) {
        _sessionID = @"";
        _targetURL = [[NSURL alloc] init];
    }
    return self;
}

- (id)initWithSessionID:(NSString *)sessionID withTargetURL:(NSURL *)url
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
    NSURL *targetURL = [self.targetURL URLByAppendingPathComponent:NNYMobW303LoginPath];
    NSDictionary *retval = @{NNYMobClientMessageSessionID : self.sessionID,
                             NNYMobClientMessageURL : targetURL};
    return retval;
}

- (NSDictionary*)messageForRequest
{
    //base64encode(SHA256(name + base64encode(SHA256($('#password').val())) + g_requestVerificationToken[0]));
    NSString *passwordHash = [[self conversionSHA256String:self.password] base64EncodedString];
    NSString *secret = [[self conversionSHA256String:[[self.userName stringByAppendingString:passwordHash] stringByAppendingString:self.csrfToken]] base64EncodedString];
    //todo create request xml
    // <?xml version:"1.0" encoding="UTF-8"?><request><Username>admin</Username><Password>ZGEzMjk1M2VlNzNiY2FlY2E5ZDk1ODJhYTI2ZTgxMmY1YWMxNWUyNmE5NDI3M2RlYzRmOWE3ZGIzNWUxZGY3OQ==</Password><password_type>4</password_type></request>
    DDXMLNode *userName = [[DDXMLElement alloc] initWithName:@"Username" stringValue:self.userName];
    DDXMLNode *password = [[DDXMLElement alloc] initWithName:@"Password" stringValue:secret];
    DDXMLNode *passwordType = [[DDXMLElement alloc] initWithName:@"password_type" stringValue:@"4"];
    DDXMLNode *request = [DDXMLNode elementWithName:@"request" children:@[userName, password, passwordType] attributes:nil];

    NSString *xml = [@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>" stringByAppendingString:request.XMLString];
    NSLog(@"request %@", xml);

    NSDictionary *retval = @{NNYMobClientContentType : @"application/x-www-form-urlencoded; charset=UTF-8",
                             NNYMobClientBody : [xml dataUsingEncoding:NSUTF8StringEncoding]};
    return retval;
}

# pragma mark - private methods
- (NSData*)conversionSHA256String:(NSString *)string
{
    const char *s=[string cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData=[NSData dataWithBytes:s length:strlen(s)];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH]={0};
    CC_SHA256(keyData.bytes, keyData.length, digest);
    NSData *hash = [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    return hash;
}
@end