#import <Foundation/Foundation.h>

@interface AFPreferences : NSObject
+ (AFPreferences *)sharedPreferences;
- (void)_setDictationIsEnabledLocal:(BOOL)enabled;
- (BOOL)dictationIsEnabled;
- (void)setDictationIsEnabled:(BOOL)enabled;
- (void)synchronize;
@end