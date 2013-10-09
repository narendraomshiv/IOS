//
//  ISUserDefault.m
//  MDS
//
//  Created by Narendra Kumar on 12/07/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import "ISUserDefault.h"

@implementation ISUserDefault

+(void)setStringValue:(NSString *)value forKey:(NSString *)key {
    
    [[NSUserDefaults standardUserDefaults]
     setObject:value forKey:[NSString stringWithFormat:@"%@", key]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)setBoolValue:(BOOL)value forKey:(NSString *)key {
    
    [[NSUserDefaults standardUserDefaults]
     setBool:value forKey:[NSString stringWithFormat:@"%@", key]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(BOOL)getBOOLValue:(NSString *)key {
    
    return [[NSUserDefaults standardUserDefaults]
            boolForKey:[NSString stringWithFormat:@"%@", key]];
}

+(NSString *)getStringValue:(NSString *)key {
    
    return [[NSUserDefaults standardUserDefaults]
                            valueForKey:[NSString stringWithFormat:@"%@", key]];
}
@end
