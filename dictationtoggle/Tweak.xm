#import "../Common.h"

%hook UIDictationController

- (BOOL)dictationEnabled
{
    BOOL isFirmware7x = (kCFCoreFoundationVersionNumber < 1140.10) ? YES : NO;
    
    if (isFirmware7x) {
        return [[AFPreferences sharedPreferences] dictationIsEnabled];
    } else {
        return %orig;
    }
	
}

%end