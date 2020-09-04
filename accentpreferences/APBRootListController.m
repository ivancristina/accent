#include "APBRootListController.h"
#import <CepheiPrefs/HBAppearanceSettings.h>
#import "libcolorpicker.h"

#define PreferencesFilePath [NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.ivanc.accentpreferences.plist"]
static NSDictionary* preferences;
NSString* currentHex;
NSString* currentChoice;
NSString* displayHex;

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

	preferences = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];

	currentHex = [preferences valueForKey:@"rgbValue"];
	currentChoice = [preferences valueForKey:@"isColor"];
	
	if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Picked"]) {
		displayHex = currentHex;
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Teal"]) {
		displayHex = @"#5AC8FA";
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Blue"]) {
		displayHex = @"#007AFF";
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Purple"]) {
		displayHex = @"#AF52DE";
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Pink"]) {
		displayHex = @"#FF779A";
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Red"]) {
		displayHex = @"#FF3B30";
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Orange"]) {
		displayHex = @"#FF9500";
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Yellow"]) {
		displayHex = @"#FFCC00";
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Green"]) {
		displayHex = @"#28CD41";
	} else if ([[preferences valueForKey:@"isColor"] isEqualToString:@"Gray"]) {
		displayHex = @"#8E8E93";
	}
	
	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Current Hex"
                               message:displayHex
                               preferredStyle:UIAlertControllerStyleAlert];
 
	UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Cool!" style:UIAlertActionStyleDefault
   	handler:^(UIAlertAction * action) {}];
 
	[alert addAction:defaultAction];
	[self presentViewController:alert animated:YES completion:nil];
}

- (void)pickColor
{
		NSMutableDictionary *prefsDict = [NSMutableDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
		if (!prefsDict) prefsDict = [NSMutableDictionary dictionary];
		preferences = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];

		if([preferences valueForKey:@"rgbValue"] != nil) {
			currentHex = [preferences valueForKey:@"rgbValue"];
		}else {
			//If its nil use whatever color from the dictionary
			currentHex = @"#FF779A";
			[prefsDict setObject:currentHex forKey:@"rgbValue"];
			[prefsDict writeToFile:PreferencesFilePath atomically:YES];
		}
		
		NSString *readFromKey = currentHex;
		NSString *fallbackHex = currentHex;

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
