#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface AFPreferences : NSObject
+ (AFPreferences *)sharedPreferences;
- (BOOL)dictationIsEnabled;
- (void)_setDictationIsEnabledLocal:(BOOL)enabled;
- (void)setDictationIsEnabled:(BOOL)enabled;
- (void)synchronize;
@end

@interface DictationToggleSwitch : NSObject <FSSwitchDataSource>
@end

@implementation DictationToggleSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return [[AFPreferences sharedPreferences] dictationIsEnabled] ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	[[AFPreferences sharedPreferences] setDictationIsEnabled:newState == FSSwitchStateOn];
	[[AFPreferences sharedPreferences] _setDictationIsEnabledLocal:newState == FSSwitchStateOn];
	[[AFPreferences sharedPreferences] synchronize];
}

@end