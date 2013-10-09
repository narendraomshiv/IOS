//
//  ISEnumClass.h
//  InkShop
//
//  Created by narendra kumar on 23/09/13.
//  Copyright (c) 2013 Funki Orange Tecnology. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)

#define KRowHeight     59.0
// Define the font
#define KHeveticaNeue_Bold @"HelveticaNeue-Bold"
#define KHeveticaNeue_Medium @"HelveticaNeue-Medium"
#define KHeveticaNeue_ULtraLight @"HelveticaNeue-UltraLight"
#define KHeveticaNeue_Light @"HelveticaNeue-Light"
#define KHelvetica_45 @"Helvetica 45 Light"
#define KColor [UIColor colorWithRed:32.0f/255.0f green:114.0f/255.0f blue:144.0f/255.0f alpha:1.0f]
#define TABLE_TEXT_COLOR        [UIColor colorWithRed:39.0/255.0 green:106.0/255.0 blue:133.0/255.0 alpha:1.0]
#define STextFieldM(tag) (UITextField *)[self.view viewWithTag:tag]
/*
 * enum for font types
 */
typedef enum FontType {
    ISHelveticaNeue_Bold = 0,
    ISHelveticaNeue_light = 1,
    ISHelveticaNeue_Medium = 2,
    ISHelveticaNeue_UltraLight = 3,
} ISFontType;

/*
 * enum for back Ground Image type
 */
typedef enum ImageName {
    ISBackGroundImage = 0,
} ISImageName;

/*
 * enum for all services
 */
typedef enum ServiceType {
    ISLoginService = 0,
} ISServiceType;
/*
 * enum for back Ground Image type
 */
typedef enum SignUpComponent {
    
    UserName = 0,
    Password = 1,
    ConformPassword = 2,
    FirstName = 3,
    LastName = 4,
    DOB = 5,
    EMail = 6,
    Address = 7,
    Pin = 8,
    Phone = 9,

} ISSignUpComponent;
/*
 * enum for Change Details type
 */
typedef enum changeDetails {
    
    FName = 0,
    LName = 1,
    password = 2,
    birth_Date = 3,
    eMail = 4,
    b_Address = 5,
    pin = 6,
    phone = 7,
    
} ISChangeDetails;
@interface ISEnumClass : NSObject

+ (NSString *)getBaseURL;
+ (NSString *)servicesName:(ISServiceType)serviceType;
+ (UIFont *)font:(ISFontType)fontType size:(NSUInteger)fontsize;
+ (UIImage *)imageNamedAccordingToDevice:(ISImageName)imageName;
+ (NSString *)signUpComponentField:(ISSignUpComponent)signUpComponent;
+ (NSString *)changeDetailsField:(ISChangeDetails)changeDetails;
@end
