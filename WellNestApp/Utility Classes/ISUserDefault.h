//
//  ISUserDefault.h
//  MDS
//
//  Created by Narendra Kumar on 12/07/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISUserDefault : NSObject

+(BOOL)getBOOLValue:(NSString *)key;
+(NSString *)getStringValue:(NSString *)key;
+(void)setBoolValue:(BOOL)value forKey:(NSString *)key;
+(void)setStringValue:(NSString *)value forKey:(NSString *)key;
@end
