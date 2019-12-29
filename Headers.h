@interface _UIBackdropViewSettings : NSObject {}
@property int style;
+ (id)settingsForStyle:(int)arg1;
- (void)setColorTint:(id)arg1;
- (void)setColorTintAlpha:(CGFloat)arg1;
- (void)setUsesColorTintView:(BOOL)arg1;
- (id) colorTint;
@end

@interface _UIBackdropView : UIView {}
- (id)initWithFrame:(CGRect)arg1 settings:(id)arg2;
- (void)transitionToColor:(id)arg1;
- (void)transitionToSettings:(id)arg1;
- (void)setWantsColorSettings:(BOOL)arg1;
- (void)setAllowsColorSettingsSuppression:(BOOL)arg1;
@property(retain) _UIBackdropViewSettings * outputSettings;
@property(retain) _UIBackdropViewSettings * inputSettings;
@property(retain) UIView * grayscaleTintView;
@property(retain) id backdropEffectView;
@property int maskMode;
@property int style;
@end


@interface SBControlCenterContentContainerView : UIView
@property(readonly, nonatomic) _UIBackdropView *backdropView;
@end

@interface SBNotificationCenterViewController : UIView
@property(readonly, nonatomic) _UIBackdropView *backdropView;
@end

@interface SBBannerContextView : UIView {}
@property(readonly, nonatomic) _UIBackdropView *backdrop;
@end

@interface UIColor (chew)
+(id)systemGreenColor;
+(id)systemOrangeColor;
+(id)systemYellowColor;
+(id)systemTealColor;
+(id)systemPinkColor;
+(id)systemGrayColor;
+(id)systemMidGrayColor;
@end
