//
//  JBDictationRecognize.h
//  Over Task
//
//  Created by Богомолов Евгений on 19.03.15.
//  Copyright (c) 2015 Евгений Богомолов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JBDictationRecognize : NSObject

+ (JBDictationRecognize *)instance;

typedef void (^JBDictationCallback)(BOOL isDictationMode);
@property (nonatomic, strong) JBDictationCallback callback;

+ (void)startCallbackNoteDictation:(void(^)(BOOL isDictation))isDictation;

@end
