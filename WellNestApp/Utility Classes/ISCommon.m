//
//  ISCommon.m
//  InkShop
//
//  Created by narendra kumar on 23/09/13.
//  Copyright (c) 2013 Funki Orange Tecnology. All rights reserved.
//

#import "ISCommon.h"

@implementation ISCommon

/*
 * @returns a customised button with title over button's image
 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                       target:(id)target
                     selector:(SEL)selector
                        frame:(CGRect)frame
                        image:(UIImage *)image
                         font:(UIFont *)font
                        color:(UIColor *)titleColor
                  ShadowColor:(UIColor *)shadowColor

{
	// or you can do this:
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setFrame:frame];
	button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	
	[button setTitle:title forState:UIControlStateNormal];
    [[button titleLabel] setFont:font];
    
    [button setTitleShadowColor:shadowColor forState:UIControlStateNormal];
    //[button setTitleShadowColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    // button.titleLabel.shadowOffset = CGSizeMake(0.5, 0.5);
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
	[button setBackgroundImage:image forState:UIControlStateNormal];
    
	[button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	
    // in case the parent view draws with a custom color or gradient, use a transparent color
	button.backgroundColor = [UIColor clearColor];
	
	return button;
}

/*
 * this method adds back and save button to navigation bar
 */
+ (void)addLocalNavigationItems:(id)controller{
    
    id target = controller;
    if ([controller isKindOfClass:[UITabBarController class]]) {
        target = [(UITabBarController*)controller selectedViewController];
    }
    
    UIImage *image = [UIImage imageNamed:@"web.png"];
    NSString * title = @"webView";
    //ウェブ
    CGRect frame = CGRectMake(0, 0, image.size.width, image.size.height);
    UIFont * font = [ISEnumClass font:ISHelveticaNeue_Medium size:13];
    
    UIColor * shadowColor = [UIColor whiteColor];
    UIButton * Btn = [self buttonWithTitle:title target:target selector:@selector(webButtonAction:) frame:frame image:image font:font color:[UIColor whiteColor] ShadowColor:shadowColor];
    // Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    Btn.layer.shadowOpacity=0.6;
    Btn.layer.shadowRadius=1.0;
    Btn.layer.shadowOffset = CGSizeMake(1, 1);
    
    UIBarButtonItem * btnItem = [[UIBarButtonItem alloc] initWithCustomView:Btn];
    [[(UIViewController*)controller navigationItem] setRightBarButtonItem:btnItem];
    
    //adding right bar button
    image = [UIImage imageNamed:@"search.png"];
    frame = CGRectMake(0, 0,  image.size.width, image.size.height);
    Btn = [self buttonWithTitle:@"" target:target selector:@selector(searchButtonAction:) frame:frame image:image font:font color:TABLE_TEXT_COLOR ShadowColor:shadowColor];
    Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    Btn.layer.shadowOpacity=0.6;
    Btn.layer.shadowRadius=1.0;
    Btn.layer.shadowOffset = CGSizeMake(1, 1);
    
    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:Btn];
    [[(UIViewController*)controller navigationItem] setRightBarButtonItem:rightBtnItem];
}


/*
 * this method adds back and save button to navigation bar
 */
+ (void)addLocalNavigationItems:(id)controller leftBarImage:(UIImage *)leftImage rightBarImage:(UIImage *)rightImage{
    
    id target = controller;
    if ([controller isKindOfClass:[UITabBarController class]]) {
        target = [(UITabBarController*)controller selectedViewController];
    }
    
    //NSString * title = @"New";
    //CGRect frame = CGRectMake(0, 0, leftImage.size.width, leftImage.size.height);
    //UIFont * font = [ISEnumClass font:ISHelveticaNeue_Medium size:13];
    //UIButton * Btn = [self buttonWithTitle:title target:target selector:@selector(backButtonAction:) frame:frame image:leftImage font:font color:[UIColor whiteColor] ShadowColor:shadowColor];
    // Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    //Btn.layer.shadowOpacity=0.6;
    //Btn.layer.shadowRadius=1.0;
    //Btn.layer.shadowOffset = CGSizeMake(1, 1);
   //UIBarButtonItem * btnItem = [[UIBarButtonItem alloc] initWithCustomView:Btn];
   //[[(UIViewController*)controller navigationItem] setLeftBarButtonItem:btnItem];
    
    //adding right bar button
    UIColor * shadowColor = [UIColor whiteColor];
    CGRect frame = CGRectMake(0, 0,  rightImage.size.width, rightImage.size.height);
    UIButton * Btn = [self buttonWithTitle:@"dsfsdf" target:target selector:@selector(webButtonAction:) frame:frame image:rightImage font:[UIFont fontWithName:@"Helvetica-Bold" size:15.0f] color:[UIColor whiteColor] ShadowColor:shadowColor];
    Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    Btn.layer.shadowOpacity=0.6;
    Btn.layer.shadowRadius=1.0;
    Btn.layer.shadowOffset = CGSizeMake(1, 1);

    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:Btn];
    [[(UIViewController*)controller navigationItem] setRightBarButtonItem:rightBtnItem];
}
-(IBAction)webButtonAction:(id)sender {
    
}

/*
 * this method adds back and save button to navigation bar
 */
+ (void)addLocalNavigationItemsWithHelpButtons:(id)controller{
    
    id target = controller;
    if ([controller isKindOfClass:[UITabBarController class]]) {
        target = [(UITabBarController*)controller selectedViewController];
    }
    //adding right bar button
    UIImage *image = [UIImage imageNamed:@"web.png"];
    NSString *title = @"";
    UIColor * shadowColor = [UIColor whiteColor];
    CGRect frame = CGRectMake(0, 0, image.size.width - 15, image.size.height - 22);
    UIFont * font = [ISEnumClass font:ISHelveticaNeue_Medium size:13];
    UIButton *Btn = [self buttonWithTitle:title target:target selector:@selector(webButtonAction:) frame:frame image:image font:font color:[UIColor whiteColor] ShadowColor:shadowColor];
    Btn.layer.shadowColor = [UIColor blackColor].CGColor;
    Btn.layer.shadowOpacity=0.6;
    Btn.layer.shadowRadius=1.0;
    Btn.layer.shadowOffset = CGSizeMake(1, 1);

    UIBarButtonItem * rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:Btn];
    [[(UIViewController*)controller navigationItem] setRightBarButtonItem:rightBtnItem];
}

@end
