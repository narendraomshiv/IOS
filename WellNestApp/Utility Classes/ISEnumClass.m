//
//  ISEnumClass.m
//  InkShop
//
//  Created by narendra kumar on 23/09/13.
//  Copyright (c) 2013 Funki Orange Tecnology. All rights reserved.
//

#import "ISEnumClass.h"

@implementation ISEnumClass

+ (UIFont *)font:(ISFontType)fontType size:(NSUInteger)fontsize {
    switch (fontType) {
        case ISHelveticaNeue_Bold:
            return [UIFont fontWithName:KHeveticaNeue_Bold size:fontsize];
            break;
        case ISHelveticaNeue_light:
            return [UIFont fontWithName:KHeveticaNeue_Light size:fontsize];
            break;
        case ISHelveticaNeue_Medium:
            return [UIFont fontWithName:KHeveticaNeue_Medium size:fontsize];
            break;
        case ISHelveticaNeue_UltraLight:
            return [UIFont fontWithName:KHeveticaNeue_ULtraLight size:fontsize];
            break;
        default:
            return [UIFont fontWithName:KHelvetica_45 size:fontsize];
            break;
    }
}

+ (NSString *)getBaseURL {
    
    return [NSString stringWithFormat:@"%@", @"http://inkshop.cureacnesafely.com/services/"];
}
+ (NSString *)servicesName:(ISServiceType)serviceType {
    switch (serviceType) {
        case ISLoginService:
            return [NSString stringWithFormat:@"%@",@"index.php"];
            break;
            
        default:
            break;
    }
    return nil;
}
+ (NSString *)imagePath:(NSString *)imageName imageType:(NSString *)type {
    
    return [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@", imageName] ofType:[NSString stringWithFormat:@"%@", type]];
}

+ (UIImage *)imageNamedAccordingToDevice:(ISImageName)imageName {
    switch (imageName) {
        case ISBackGroundImage:
            return [UIImage imageWithContentsOfFile:(!IS_IPHONE_5) ? [ISEnumClass imagePath:@"cloud-background" imageType:@"png"] : [ISEnumClass imagePath:@"cloud-320-x-568" imageType:@"png"]];
            break;
        default:
            break;
    }
}


+ (NSString *)signUpComponentField:(ISSignUpComponent)signUpComponent {
    
    switch (signUpComponent) {
        case UserName:
            return [NSString stringWithFormat:@"User Name"];
            break;
        case Password:
            return [NSString stringWithFormat:@"Password"];
            break;
        case ConformPassword:
            return [NSString stringWithFormat:@"Conform Password"];
            break;
        case FirstName:
            return [NSString stringWithFormat:@"First Name"];
            break;
        case LastName:
            return [NSString stringWithFormat:@"Last Name"];
            break;
        case DOB:
            return [NSString stringWithFormat:@"DOB"];
            break;
        case EMail:
            return [NSString stringWithFormat:@"e-Mail"];
            break;
        case Address:
            return [NSString stringWithFormat:@"Address"];
            break;
        case Pin:
            return [NSString stringWithFormat:@"Pin"];
            break;
        case Phone:
            return [NSString stringWithFormat:@"Phone"];
            break;
        default:
            break;
            
    }
    return nil;
}
+ (NSString *)changeDetailsField:(ISChangeDetails)changeDetails {
    
    switch (changeDetails) {
        case FName:
            return [NSString stringWithFormat:@"First Name"];
            break;
        case LName:
            return [NSString stringWithFormat:@"Last Name"];
            break;
        case password:
            return [NSString stringWithFormat:@"Password"];
            break;
        case birth_Date:
            return [NSString stringWithFormat:@"DOB"];
            break;
        case eMail:
            return [NSString stringWithFormat:@"e-Mail"];
            break;
        case b_Address:
            return [NSString stringWithFormat:@"Address"];
            break;
        case pin:
            return [NSString stringWithFormat:@"Pin"];
            break;
        case phone:
            return [NSString stringWithFormat:@"Phone"];
            break;
        default:
            break;
    }
    return nil;
}
@end
