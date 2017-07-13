#import "../Common.h"

%hook UIDictationController

- (BOOL)dictationEnabled
{
	return [[AFPreferences sharedPreferences] dictationIsEnabled];
}

%end