#include "APBRootListController.h"
#import <CepheiPrefs/HBAppearanceSettings.h>
#import "libcolorpicker.h"

#define PreferencesFilePath [NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.ivanc.accentpreferences.plist"]
static NSDictionary* preferences;

@implementation APBRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)respring {
	[HBRespringController respring];
}

-(void)test {
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Color Test"
                               message:[preferences valueForKey:@"rgbValue"]
                               preferredStyle:UIAlertControllerStyleAlert];
 
	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
   	handler:^(UIAlertAction * action) {}];
 
	[alert addAction:defaultAction];
	[self presentViewController:alert animated:YES completion:nil];
}

- (void)pickColor
{
		NSMutableDictionary *prefsDict = [NSMutableDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
		if (!prefsDict) prefsDict = [NSMutableDictionary dictionary];
		preferences = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];
		
		NSString *readFromKey = [preferences valueForKey:@"rgbValue"];
		NSString *fallbackHex = [preferences valueForKey:@"rgbValue"];

		UIColor *startColor = LCPParseColorString(readFromKey, fallbackHex); // this color will be used at startup
		PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:YES];

		// show alert and set completion callback
		[alert displayWithCompletion:
			^void (UIColor *pickedColor) {
				// save pickedColor or do something with it
				NSString *hexString = [UIColor hexFromColor:pickedColor];
				[prefsDict setObject:hexString forKey:@"rgbValue"];
				[prefsDict writeToFile:PreferencesFilePath atomically:YES];
			}];
}

@end
