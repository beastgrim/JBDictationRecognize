//
//  JBDictationRecognize.m
//  Over Task
//
//  Created by Богомолов Евгений on 19.03.15.
//  Copyright (c) 2015 Евгений Богомолов. All rights reserved.
//

#import "JBDictationRecognize.h"

@implementation JBDictationRecognize

+ (JBDictationRecognize *)instance {
    static JBDictationRecognize *instance = nil;
    static dispatch_once_t predicate = 0;
    
    dispatch_once(&predicate, ^{ instance = [self new]; });
    
    return instance;
}

@end
