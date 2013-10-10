//
//  WNHomeViewController.m
//  Well Nest
//
//  Created by Narendra Kumar on 08/10/13.
//  Copyright (c) 2013 Narendra Kumar. All rights reserved.
//

#import "WNHomeViewController.h"

@interface WNHomeViewController () < ABPeoplePickerNavigationControllerDelegate,ABPersonViewControllerDelegate>
@property (nonatomic, assign) ABAddressBookRef addressBook;
@property (nonatomic, strong) NSMutableArray *menuArray;

@end


@implementation WNHomeViewController

@synthesize detailViewController = _detailViewController;
@synthesize eventStore = _eventStore;
@synthesize defaultCalendar = _defaultCalendar;
@synthesize eventsList = _eventsList;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:[self makeTabBarView:CGRectMake(0, 520, 320, 50)]];
    [self manageNAvigationBar];
    [self settingForCalendar];
    
  }

- (void)manageNAvigationBar{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor]; // change this color
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Well Nest", @"");
    [label sizeToFit];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"White_Image_Pattern.png"]]];
	
    
    UIImage *leftButton = [UIImage imageNamed:@"signal"];
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setImage:leftButton forState:UIControlStateNormal];
    myButton.showsTouchWhenHighlighted = YES;
    myButton.frame = CGRectMake(0.0, 0.0, leftButton.size.width-20, leftButton.size.height-20);
    [myButton addTarget:self action:@selector(menuButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc]
                                   initWithCustomView:myButton];
    self.navigationItem.leftBarButtonItem = menuButton;


}

-(void)settingForCalendar{
    
    //Adding new event in calendar
    self.eventStore = [[EKEventStore alloc] init];
    self.eventsList = [[NSMutableArray alloc] initWithArray:0];
    self.defaultCalendar = [self.eventStore defaultCalendarForNewEvents];
    //Adding new event in calendar
}

- (UIView *)makeTabBarView:(CGRect)frame
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar.png"]]];
    view.opaque = NO;
    UIImage *buttonImage;
    buttonImage = [UIImage imageNamed:@"music"];
    [self loginButtonForView:CGRectMake(30, 5, 45, 45) Text:@"" Image:buttonImage Tag:301 View:view];
    buttonImage = [UIImage imageNamed:@"phone"];
    [self loginButtonForView:CGRectMake(130, 5, 45, 45) Text:@"" Image:buttonImage Tag:302 View:view];
    buttonImage = [UIImage imageNamed:@"calender"];
    [self loginButtonForView:CGRectMake(230, 5, 45, 45) Text:@"" Image:buttonImage Tag:303 View:view];
    return view;
}

-(void)loginButtonForView:(CGRect)frame Text:(NSString *)buttonText Image:(UIImage *)image Tag:(int)tag View:(UIView*)view {
    ISButton *loginButton = [[ISButton alloc] initWithFrame:frame];
    loginButton.tag = tag;
    [loginButton setTitle:buttonText forState:UIControlStateNormal];
    [loginButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0]];
    [loginButton setBackgroundImage:image forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:loginButton];
    //return loginButton;
}


-(IBAction)buttonPressed:(id)sender{
    
    if ([sender tag] == 301) {
        NSString *name = [[NSString alloc] initWithFormat:@"Relaxingsea_64kb"];
        NSString *source = [[NSBundle mainBundle] pathForResource:name ofType:@"mp3"];
        if (data) {
            [data stop];
            data = nil;
        }else{
            data=[[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath: source] error:NULL];
            data.delegate = self;
            [data play];
        }
        
    }else if([sender tag] == 302){
        [self checkAddressBookAccess];
        
    }
    else if([sender tag] == 303){
        [self addEvent:sender];
    }
    
    
}



-(void)menuButtonClicked{
    [self.navigationController popToRootViewControllerAnimated:YES];
}




#pragma mark -
#pragma mark Address Book Access
// Check the authorization status of our application for Address Book
-(void)checkAddressBookAccess
{
    switch (ABAddressBookGetAuthorizationStatus())
    {
            // Update our UI if the user has granted access to their Contacts
        case  kABAuthorizationStatusAuthorized:
            [self accessGrantedForAddressBook];
            break;
            // Prompt the user for access to Contacts if there is no definitive answer
        case  kABAuthorizationStatusNotDetermined :
            [self requestAddressBookAccess];
            break;
            // Display a message if the user has denied or restricted access to Contacts
        case  kABAuthorizationStatusDenied:
        case  kABAuthorizationStatusRestricted:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Privacy Warning"
                                                            message:@"Permission was not granted for Contacts."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
            break;
        default:
            break;
    }
}


// Prompt the user for access to their Address Book data
-(void)requestAddressBookAccess
{
    WNHomeViewController *  weakSelf = self;
    // WNHomeViewController * __weak weakSelf = self;
    
    ABAddressBookRequestAccessWithCompletion(self.addressBook, ^(bool granted, CFErrorRef error)
                                             {
                                                 if (granted)
                                                 {
                                                     dispatch_async(dispatch_get_main_queue(), ^{
                                                         [weakSelf accessGrantedForAddressBook];
                                                         
                                                     });
                                                 }
                                             });
}

// This method is called when the user has granted access to their address book data.
-(void)accessGrantedForAddressBook
{
    [self showPeoplePickerController];
    
}


//Calendar events
#pragma mark Add a new Event
-(IBAction) addEvent:(id)sender {
    
    self.eventStore = [[EKEventStore alloc] init];
    if([self.eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
        [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
           
        }];
    }
    
    
    //Genarate random time for weekend only
    
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *dateComponents = [calendar components:NSWeekdayCalendarUnit | NSHourCalendarUnit fromDate:now];
    NSInteger weekday = [dateComponents weekday];
    
    NSDate *nextSunday = nil;
    
    if (weekday == 1 && [dateComponents hour] < 5) {
        // The next day is today
        nextSunday = now;
    }
    else  {
        NSInteger daysTillNextSunday = 8 - weekday;
        
        int secondsInDay = 86400; // 24 * 60 * 60
        nextSunday = [now dateByAddingTimeInterval:secondsInDay * daysTillNextSunday];
    }
    
    
    NSDate *nextSaturday = nil;
    
    if (weekday == 7 && [dateComponents hour] < 5) {
        // The next day is today
        nextSaturday = now;
    }
    else  {
        
        NSInteger daysTillNextSaturday = 8 - weekday-1;
        
        int secondsInDay = 86400; // 24 * 60 * 60
        nextSaturday = [now dateByAddingTimeInterval:secondsInDay * daysTillNextSaturday];
    }
    
   
    
   
    int mints = arc4random_uniform(60) + 1;
    int hrs = arc4random_uniform(24) + 1;
    
    NSLog(@"mints %d and hrs %d",mints,hrs);
    
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate: nextSaturday];
    [components setHour: hrs];
    [components setMinute: mints];
    [components setSecond: 17];
    
    nextSaturday = [gregorian dateFromComponents: components];
    
    NSLog(@"nextSaturday %@",nextSaturday);
    
    mints = arc4random_uniform(60) + 1;
    hrs = arc4random_uniform(24) + 1;
    components = [gregorian components: NSUIntegerMax fromDate: nextSunday];
    [components setHour: hrs];
    [components setMinute: mints];
    
    nextSunday = [gregorian dateFromComponents: components];
    NSLog(@"nextSunday %@",nextSunday);
   
    //Generate random time for weekend only
    
    EKEvent *event = [EKEvent eventWithEventStore:self.eventStore];
    NSArray *eventList = [NSArray arrayWithObjects:@"hang out",@"have fun",@"relax", nil];
    event.startDate = nextSaturday;
    event.endDate = nextSunday;
    
     
    int randomID = arc4random() % 3+0;
    
    event.title = [eventList objectAtIndex:randomID];
   
    EKEventEditViewController *addController = [[EKEventEditViewController alloc] initWithNibName:nil bundle:nil];
    addController.event = event;
    addController.eventStore = self.eventStore;
    [event setCalendar:[self.eventStore defaultCalendarForNewEvents]];
    [self presentModalViewController:addController animated:YES];
    addController.editViewDelegate = self;
   
    
}




#pragma mark -
#pragma mark EKEventEditViewDelegate

// Overriding EKEventEditViewDelegate method to update event store according to user actions.
- (void)eventEditViewController:(EKEventEditViewController *)controller
          didCompleteWithAction:(EKEventEditViewAction)action {
    
    NSError *error = nil;
    EKEvent *thisEvent = controller.event;
    
    switch (action) {
        case EKEventEditViewActionCanceled:
            // Edit action canceled, do nothing.
            break;
            
        case EKEventEditViewActionSaved:
          
            if (self.defaultCalendar ==  thisEvent.calendar) {
                [self.eventsList addObject:thisEvent];
            }
            [controller.eventStore saveEvent:controller.event span:EKSpanThisEvent error:&error];
            //  [self.tableView reloadData];
            break;
            
        case EKEventEditViewActionDeleted:
            // When deleting an event, remove the event from the event store,
            // and reload table view.
            // If deleting an event from the currenly default calendar, then update its
            // eventsList.
            if (self.defaultCalendar ==  thisEvent.calendar) {
                [self.eventsList removeObject:thisEvent];
            }
            [controller.eventStore removeEvent:thisEvent span:EKSpanThisEvent error:&error];
            //[self.tableView reloadData];
            break;
            
        default:
            break;
    }
    // Dismiss the modal view controller
    [controller dismissModalViewControllerAnimated:YES];
    
}


// Set the calendar edited by EKEventEditViewController to our chosen calendar - the default calendar.
- (EKCalendar *)eventEditViewControllerDefaultCalendarForNewEvents:(EKEventEditViewController *)controller {
    EKCalendar *calendarForEdit = self.defaultCalendar;
    return calendarForEdit;
}

#pragma mark Show all contacts
// Called when users tap "Display Picker" in the application. Displays a list of contacts and allows users to select a contact from that list.
// The application only shows the phone, email, and birthdate information of the selected contact.
-(void)showPeoplePickerController
{
	ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
	// Display only a person's phone, email, and birthdate
	NSArray *displayedItems = [NSArray arrayWithObjects:[NSNumber numberWithInt:kABPersonPhoneProperty],
                               [NSNumber numberWithInt:kABPersonEmailProperty],
                               [NSNumber numberWithInt:kABPersonBirthdayProperty], nil];
	
	
	picker.displayedProperties = displayedItems;
	// Show the picker
    [self presentViewController:picker animated:YES completion:nil];
}


#pragma mark ABPeoplePickerNavigationControllerDelegate methods
// Displays the information of a selected person
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
   
    ABMultiValueRef phones =(__bridge ABMultiValueRef)((__bridge NSString*)ABRecordCopyValue(person, kABPersonPhoneProperty));
    NSString* mobile=@"";
    NSString* mobileLabel;
    for(CFIndex i = 0; i < ABMultiValueGetCount(phones); i++) {
        mobileLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(phones, i);
        if([mobileLabel isEqualToString:(NSString *)kABPersonPhoneMobileLabel])
        {
            
            mobile = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, i);
        }
        else if ([mobileLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel])
        {
            
            mobile = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, i);
            break ;
        }
    }
    
  
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",mobile]]];

   	return NO;
}

// Does not allow users to perform default actions such as dialing a phone number, when they select a person property.
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
								property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
   /* NSLog(@"shouldContinueAfterSelectingPersonshouldContinueAfterSelectingPerson");
    ABMultiValueRef phones =(__bridge ABMultiValueRef)((__bridge NSString*)ABRecordCopyValue(person, kABPersonPhoneProperty));
    NSString* mobile=@"";
    NSString* mobileLabel;
    for(CFIndex i = 0; i < ABMultiValueGetCount(phones); i++) {
        mobileLabel = (__bridge NSString*)ABMultiValueCopyLabelAtIndex(phones, i);
        if([mobileLabel isEqualToString:(NSString *)kABPersonPhoneMobileLabel])
        {
            
            mobile = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, i);
        }
        else if ([mobileLabel isEqualToString:(NSString*)kABPersonPhoneIPhoneLabel])
        {
            
            mobile = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phones, i);
            break ;
        }
    }
    
    NSLog(@"mobilemobile %@",mobile);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",mobile]]];
  */
	return NO;
}

// Dismisses the people picker and shows the application when users tap Cancel.
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker;
{
	[self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark ABPersonViewControllerDelegate methods
// Does not allow users to perform default actions such as dialing a phone number, when they select a contact property.
- (BOOL)personViewController:(ABPersonViewController *)personViewController shouldPerformDefaultActionForPerson:(ABRecordRef)person
					property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifierForValue
{
	return YES;
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
