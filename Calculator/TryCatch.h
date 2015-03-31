//
//  TryCatch.h
//  Calculator
//
//  Created by Tiago Martinho on 31/03/15.
//  Copyright (c) 2015 Tiago Martinho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TryCatch : NSObject

+ (void) try:(void(^)())try catch:(void(^)(NSException *exception))catch finally:(void(^)())finally;
+ (void) try:(void(^)())try catch:(void(^)(NSException *exception))catch;
+ (void) try:(void(^)())try;
@end
