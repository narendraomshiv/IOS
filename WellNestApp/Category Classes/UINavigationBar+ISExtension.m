//
//  UINavigationBar+ISExtension.m
//  InkShop
//
//  Created by narendra kumar on 23/09/13.
//  Copyright (c) 2013 Funki Orange Tecnology. All rights reserved.
//

#import "UINavigationBar+ISExtension.h"

@implementation UINavigationBar (ISExtension)

- (void)drawRect:(CGRect)rect {
    
    //    UIImage *navBg = [UIImage imageNamed:@"navBar.png"];
    //    [navBg drawInRect:CGRectMake(0, 0, 320, 44)];
}

- (void)displayCustomNavBar {
   // self.barStyle = UIBarStyleBlack;
    
        if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
            UIImage *navBarImg = [UIImage imageNamed:@"navigationbar.png"];
            [self setBackgroundImage:navBarImg forBarMetrics:UIBarMetricsDefault];
        }
}
@end
