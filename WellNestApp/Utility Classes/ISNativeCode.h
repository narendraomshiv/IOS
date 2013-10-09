//
//  ISNativeCode.h
//  MDS
//
//  Created by Narendra Kumar on 09/07/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import "ISHeaderClass.h"
#import <Foundation/Foundation.h>

@interface ISNativeCode : NSObject

void showAlert(NSString *messageString, NSString *titleString);

void showActivityView(NSString *text_label);

void showActivityViewWithOwnView(NSString *text_label, UIView *view);

void removeActivityView ();
@end
