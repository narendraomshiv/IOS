//
//  ISCommon.h
//  InkShop
//
//  Created by narendra kumar on 23/09/13.
//  Copyright (c) 2013 Funki Orange Tecnology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISHeaderClass.h"

@interface ISCommon : NSObject

+ (void)addLocalNavigationItems:(id)controller;
+ (void)addLocalNavigationItemsWithHelpButtons:(id)controller;
+ (void)addLocalNavigationItems:(id)controller leftBarImage:(UIImage *)leftImage rightBarImage:(UIImage *)rightImage;
+ (UIButton *)buttonWithTitle:(NSString *)title
                       target:(id)target
                     selector:(SEL)selector
                        frame:(CGRect)frame
                        image:(UIImage *)image
                         font:(UIFont *)font
                        color:(UIColor *)titleColor
                  ShadowColor:(UIColor *)shadowColor;

@end
