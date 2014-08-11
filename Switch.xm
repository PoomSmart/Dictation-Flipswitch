#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"
#import "Common.h"

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