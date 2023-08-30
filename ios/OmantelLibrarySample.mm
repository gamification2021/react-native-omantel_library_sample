#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(OmantelLibrarySample, NSObject)

RCT_EXTERN_METHOD(loadGame)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
