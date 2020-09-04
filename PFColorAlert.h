// Used for testing with libcolorpicker

#import  <UIKit/UIKit.h>

@interface PFColorAlert : NSObject
@property (nonatomic, retain) UIWindow *popWindow;
- (void)showWithStartColor:(UIColor *)startColor showAlpha:(BOOL)showAlpha completion:(void (^)(UIColor *pickedColor))completionBlock;
- (void)close;
@end
