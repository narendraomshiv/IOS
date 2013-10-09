//
//  WNHomeViewController.h
//  Well Nest
//
//  Created by Narendra Kumar on 08/10/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNCommanViewController.h"
#import "ISHeaderClass.h"
#import <AVFoundation/AVFoundation.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface WNHomeViewController : WNCommanViewController <AVAudioPlayerDelegate,EKEventViewDelegate,EKEventEditViewDelegate>{

    AVAudioPlayer *data;
    EKEventViewController *detailViewController;
    EKEventStore *eventStore;
    EKCalendar *defaultCalendar;
    NSMutableArray *eventsList;
}

@property(nonatomic,strong)EKEventViewController *detailViewController;
@property(nonatomic,strong)EKEventStore *eventStore;
@property(nonatomic,strong)EKCalendar *defaultCalendar;
@property(nonatomic,strong)NSMutableArray *eventsList;

-(IBAction) addEvent:(id)sender;
@end
