//
//  WNAppDelegate.h
//  Well Nest
//
//  Created by Narendra Kumar on 08/10/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationBar+ISExtension.h"

@class WNViewController;
@interface WNAppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) WNViewController *viewController;
@property (strong, nonatomic) UIWindow *window;

@end
