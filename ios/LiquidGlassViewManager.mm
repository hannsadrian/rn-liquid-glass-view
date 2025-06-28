#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"
#import "LiquidGlassView.h"
#import "Utils.h"

#ifdef RCT_NEW_ARCH_ENABLED
#import <react/renderer/components/RNLiquidGlassViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNLiquidGlassViewSpec/EventEmitters.h>
#import <react/renderer/components/RNLiquidGlassViewSpec/Props.h>
#import <react/renderer/components/RNLiquidGlassViewSpec/RCTComponentViewHelpers.h>
#import "RCTFabricComponentsPlugins.h"
#endif

@interface LiquidGlassViewManager : RCTViewManager
@end

@implementation LiquidGlassViewManager

RCT_EXPORT_MODULE(LiquidGlassView)

- (UIView *)view {

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 260000
  UIGlassEffect *glassEffect = [[UIGlassEffect alloc] init];
    glassEffect.interactive = YES;

  UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:glassEffect];
  effectView.backgroundColor = [UIColor clearColor];

  LiquidGlassView *containerView = [[LiquidGlassView alloc] init];
  containerView.backgroundColor = [UIColor clearColor];


  effectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

  [containerView addSubview:effectView];
  containerView.layer.masksToBounds = YES ;

  return containerView;

#else
  return [[LiquidGlassView alloc] init];
#endif
}

RCT_EXPORT_VIEW_PROPERTY(onPress, RCTBubblingEventBlock);

#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::ViewManager>)viewManager
{
  return std::make_shared<facebook::react::LiquidGlassViewManager>();
}
#endif

@end
