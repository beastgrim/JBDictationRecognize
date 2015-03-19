//
//  JBDictationRecognize.m
//  Over Task
//
//  Created by Богомолов Евгений on 19.03.15.
//  Copyright (c) 2015 Евгений Богомолов. All rights reserved.
//

#import "JBDictationRecognize.h"

@implementation JBDictationRecognize {
    
}

+ (JBDictationRecognize *)instance {
    static JBDictationRecognize *instance = nil;
    static dispatch_once_t predicate = 0;
    
    dispatch_once(&predicate, ^{ instance = [self new]; });
    
    return instance;
}

- (instancetype)init {
    if ( self = [super init]) {
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(handleCurrentInputModeDidChange:)
         name:UITextInputCurrentInputModeDidChangeNotification
         object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Base
+ (void)startCallbackNoteDictation:(JBDictationCallback)callback {
    [JBDictationRecognize instance].callback = callback;
}

#pragma mark - Notifications
- (void) handleCurrentInputModeDidChange:(NSNotification *)notification
{
    NSString *primaryLanguage = [UITextInputMode currentInputMode].primaryLanguage;
    static BOOL dictationMode;
    if ([primaryLanguage isEqualToString:@"dictation"]) {
        _callback(dictationMode = YES);
    } else if   (dictationMode) {
        _callback(dictationMode = NO);
    }
    
//    NSLog(@"current primaryLanguage is: %@", primaryLanguage);
}

@end
