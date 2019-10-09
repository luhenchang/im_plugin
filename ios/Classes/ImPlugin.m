#import "ImPlugin.h"
#import <im_plugin/im_plugin-Swift.h>

@implementation ImPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImPlugin registerWithRegistrar:registrar];
}
@end
