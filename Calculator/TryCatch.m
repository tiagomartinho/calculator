//
//  TryCatch.m
//  Calculator
//
//  Created by Tiago Martinho on 31/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

#import "TryCatch.h"

@implementation TryCatch

+ (void) try:(void(^)())try{
    [self try:try catch:nil finally:nil];
}

+ (void) try:(void(^)())try catch:(void(^)(NSException *exception))catch{
    [self try:try catch:catch finally:nil];
}

+ (void) try:(void(^)())try catch:(void(^)(NSException *exception))catch finally:(void(^)())finally{
    
    @try {
        try ? try() : nil;
    }
    @catch (NSException *exception) {
        catch ? catch(exception) : nil;
    }
    @finally {
        finally ? finally() : nil;
    }
}

@end