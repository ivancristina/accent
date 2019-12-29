#import "Headers.h"

#define isCurrentApp(string) [[[NSBundle mainBundle] bundleIdentifier] isEqual : string]

static BOOL enabled;
UIColor *newColor;

void setColor() {
    newColor = [UIColor colorWithRed:1.00 green:0.47 blue:0.60 alpha:1.0];
}

%ctor
{
    setColor();
}

// iOS default colors

%hook UIColor

+(id)systemBlueColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemRedColor {
    if (enabled && (isCurrentApp(@"com.apple.mobilecal") || isCurrentApp(@"com.apple.mobiletimer")) ) {
        return newColor;
    }
    else {
        return %orig;
    }
}

    +(id)systemGreenColor{
    if(enabled )
      return newColor;
    else
      return %orig;
    }

+(id) systemOrangeColor {
    if (enabled  && ! isCurrentApp(@"com.apple.mobilemail")) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemYellowColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemTealColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemPinkColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) _systemInteractionTintColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) _systemSelectedColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemDarkRedColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemDarkGreenColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemDarkBlueColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemDarkOrangeColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemDarkTealColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemDarkPinkColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) systemDarkYellowColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) externalSystemTealColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) externalSystemRedColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) externalSystemGreenColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) tableCellBlueTextColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

+(id) twitterColorTwitterBlue {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

%end

%hook UIApplication

-(id)keyWindow {
    UIWindow* o = %orig;
    if (enabled  && ! isCurrentApp(@"com.apple.weather")) {
        if (isCurrentApp(@"com.apple.camera") || isCurrentApp(@"com.apple.facetime") || isCurrentApp(@"com.apple.Passbook") || isCurrentApp(@"com.apple.compass")) {       //[o.tintColor isEqual:[UIColor systemTealColor]] || [o.tintColor isEqual:[UIColor systemYellowColor]])
            [o setTintColor:newColor];
        }
        else {
            [o setTintColor:newColor];
        }
    }
    return o;
}

%end

%hook UISwitch

-(void)layoutSubviews {
    %orig;
    [self setOnTintColor:newColor];
}
-(void) setOnTintColor:(id)col {
    %orig(newColor);
}

%end

//  GC

%hook GKColorPalette

- (id)emphasizedTextColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}
-(id) emphasizedTextOnDarkBackgroundColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

-(id) systemInteractionColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}

%end

%hook GKUITheme

- (id)tabbarIconChallengesSelected : (BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(id) tabbarIconFriendsSelected:(BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(id) tabbarIconGamesSelected:(BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(id) tabbarIconMeSelected:(BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

-(id) tabbarIconTurnsSelected:(BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

%end

//  iTunes

%hook SUApplication
-(id)interactionTintColor {
    if (enabled) {
        return newColor;
    }
    else {
        return %orig;
    }
}
%end