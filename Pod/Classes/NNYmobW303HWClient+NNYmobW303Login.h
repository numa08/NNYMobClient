//
//  NNYmobW303HWClient+NNYmobW303Login.h
//  Pods
//
//  Created by numa08 on 2014/12/10.
//
//

#import "NNYmobW303HWClient.h"

@interface NNYmobW303HWClient (NNYmobW303Login)
- (NSString*)loginSessionIDWithUserName:(NSString*)userName withPassword:(NSString*)password withError:(NSError**)error;
- (NSString*)requestCSRFTokenWithError:(NSError**)error;
@end
