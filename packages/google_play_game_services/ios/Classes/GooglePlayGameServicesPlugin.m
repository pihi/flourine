#import "GooglePlayGameServicesPlugin.h"

@implementation FLGooglePlayGameServicesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = 
    [FlutterMethodChannel methodChannelWithName:@"flourine.pihimedia.com/google_play_game_services"
                                binaryMessenger:[registrar messenger]];
  FLGooglePlayGameServicesPlugin* instance = [[FLGooglePlayGameServicesPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  result(FlutterMethodNotImplemented)
}

@end
