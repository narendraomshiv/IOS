//
//  ISNativeCode.m
//  MDS
//
//  Created by Narendra Kumar on 09/07/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import "ISNativeCode.h"

@implementation ISNativeCode

void showAlert(NSString *messageString, NSString *titleString) {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:titleString message:messageString
                                                   delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}

void showActivityView(NSString *text_label) {
    
    [DejalKeyboardActivityView activityView];
}

void showActivityViewWithOwnView(NSString *text_label, UIView *view) {

    [DejalKeyboardActivityView activityViewForView:view withLabel:text_label width:140];
}
void removeActivityView ()
{
    // Remove the activity view, with animation for the two styles that support it:
    [DejalKeyboardActivityView removeViewAnimated:YES];
}


@end
