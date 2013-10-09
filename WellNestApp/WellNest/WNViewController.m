//
//  ISViewController.m
//  InkShop
//
//  Created by narendra kumar on 23/09/13.
//  Copyright (c) 2013 Funki Orange Tecnology. All rights reserved.
//

#import "WNViewController.h"
#define MAX_LENGTH 15

@interface WNViewController ()

@property (nonatomic, retain) NSString *user_name;
@property (nonatomic, retain) NSString *user_password;

@end

@implementation WNViewController

@synthesize user_name = _user_name;
@synthesize user_password = _user_password;




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    [self addComponentOnView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    // ^-Use UITextAlignmentCenter for older SDKs.
    label.textColor = [UIColor whiteColor]; // change this color
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Login", @"");
    [label sizeToFit];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addComponentOnView {
    
    [self createViewComponent];
    [self addCheckBox:CGRectMake(self.view.frame.origin.x + 15, self.view.frame.size.height/2 - 25, 30, 30) Tag:998];
    [self addCheckBox:CGRectMake(self.view.frame.origin.x + 15, self.view.frame.size.height/2+10, 30, 30) Tag:999];
    [self loginAndCheckboxLabelWithLabelText:@"UserName:" Frame:CGRectMake(self.view.frame.origin.x + 10, self.view.frame.size.height/2 - 145, 100, 30)];
    [self loginTextFieldView:CGRectMake(self.view.frame.origin.x + 130, self.view.frame.size.height/2 - 145, 170, 30) Tag:1111 Secure:NO];
    [self loginAndCheckboxLabelWithLabelText:@"Password:" Frame:CGRectMake(self.view.frame.origin.x + 10, self.view.frame.size.height/2 - 100, 100, 30)];
    [self loginTextFieldView:CGRectMake(self.view.frame.origin.x + 130, self.view.frame.size.height/2 - 100, 170, 30) Tag:1112 Secure:YES];
    
    [self loginButtonForView:CGRectMake(self.view.frame.origin.x + 15, self.view.frame.size.height/2 + 90, 130, 30) Text:@"SignUp" Image:[UIImage imageNamed:@"terms@2x.png"] Tag:2221];
    [self loginButtonForView:CGRectMake(self.view.frame.origin.x + 170, self.view.frame.size.height/2 + 90, 130, 30) Text:@"SignIn" Image:[UIImage imageNamed:@"foergot-password.png"] Tag:2222];
    [self loginButtonForView:CGRectMake(self.view.frame.origin.x + 45, self.view.frame.size.height/2 + 150, 220, 30) Text:@"Forgot Password" Image:[UIImage imageNamed:@"foergot-password.png"] Tag:2223];
    [self loginButtonForView:CGRectMake(self.view.frame.size.width/2 + 100, self.view.frame.size.height/2 + 120, 35, 30) Text:@"" Image:[UIImage imageNamed:@"help.png"] Tag:2224];
    [self loginAndCheckboxLabelWithLabelText:@"                         © By Well Nest" Frame:CGRectMake(self.view.frame.origin.x + 10, self.view.frame.size.height/2 + 200, 300, 30)];
}


-(void)createViewComponent {
    //My Logo
    UIImageView *logoImageIcon = [[UIImageView alloc] init];
    logoImageIcon.backgroundColor = [UIColor clearColor];
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    logoImageIcon.image = logoImage ;
    [logoImageIcon setFrame:CGRectMake(self.view.frame.origin.x + 80, self.view.frame.origin.y - 15 , logoImage.size.width, logoImage.size.height)];
    [self.view addSubview:logoImageIcon];
}
-(void)loginTextFieldView:(CGRect)frame Tag:(int)tag Secure:(Boolean)boolValue {
    
    UITextField * textField = [[UITextField alloc] init];
    textField.delegate = self;
    textField.tag =tag;
    [textField  setFrame:frame];
    textField.layer.borderWidth= 2.0f;
    textField.layer.cornerRadius=2.0f;
    textField.layer.masksToBounds=YES;
    [textField setSecureTextEntry:boolValue];
    [textField setClearsOnBeginEditing:YES];
    textField.font = [UIFont systemFontOfSize:15.0];
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.textColor = [UIColor blackColor];
    [textField setBackgroundColor:[UIColor whiteColor]];
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.layer.borderColor=[[UIColor colorWithRed:240.0/255.0 green:153.0/255.0 blue:0.0/255.0 alpha:1.0]CGColor];
    [self.view addSubview:textField];
    //return textField;
}

-(void)loginButtonForView:(CGRect)frame Text:(NSString *)buttonText Image:(UIImage *)image Tag:(int)tag {
    ISButton *loginButton = [[ISButton alloc] initWithFrame:frame];
    loginButton.tag = tag;
    [loginButton setTitle:buttonText forState:UIControlStateNormal];
    [loginButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12.0]];
    [loginButton setBackgroundImage:image forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginAndregirtrationButtonTarget:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    //return loginButton;
}

-(MGCheckbox *)addCheckBox:(CGRect)frame Tag:(int)tag {
    MGCheckbox *checkboxWithStyle = [MGCheckbox checkboxWithStyle:CheckboxStyleDefault];
    [checkboxWithStyle setFrame:frame];
    [checkboxWithStyle addTarget:self action:@selector(checkBoxValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    checkboxWithStyle.tag = tag;
    BOOL isSelected = [ISUserDefault getBOOLValue:@"CheckMarkState"];
    if(isSelected) {
        checkboxWithStyle.selected = YES;
        [checkboxWithStyle updateCheckbox:YES];
    }
    [self loginAndCheckboxLabelWithLabelText:@"Remember Me" Frame:CGRectMake(self.view.frame.origin.x + 60, self.view.frame.size.height/2 - 30, 190, 40)];
    [self loginAndCheckboxLabelWithLabelText:@"Stay Sign In" Frame:CGRectMake(self.view.frame.origin.x + 60, self.view.frame.size.height/2 +5, 82, 40)];
    [self.view addSubview:checkboxWithStyle];
    return checkboxWithStyle;
}

// Helper Method for the Label
- (UILabel *)loginAndCheckboxLabelWithLabelText:(NSString *)labelText Frame:(CGRect)frame {
    UILabel *checkboxLabel = [[UILabel alloc] initWithFrame:frame];
    [checkboxLabel setBackgroundColor:[UIColor clearColor]];
    [checkboxLabel setTextAlignment:UITextAlignmentLeft];
    [checkboxLabel setText:labelText];
    [checkboxLabel setTextColor:[UIColor blackColor]];
    [checkboxLabel setFont:[ISEnumClass font:ISHelveticaNeue_Bold size:14.0f]];
    [self.view addSubview:checkboxLabel];
    return checkboxLabel;
}

- (void)checkBoxValueChanged:(id)sender {
    
    NSLog(@"handle checkbox value change here");
    MGCheckbox *checkMark = (MGCheckbox *)sender;
    if (checkMark.tag == 998) {
        [ISUserDefault setBoolValue:(checkMark.selected) forKey:@"CheckMarkState"];
        [ISUserDefault setStringValue:(checkMark.selected) ? self.user_name : @""  forKey:@"UserName"];
        [ISUserDefault setStringValue:(checkMark.selected) ? self.user_password : @""  forKey:@"Password"];
        if(checkMark.selected) {
            UITextField *textField1 = (UITextField *)[self.view viewWithTag:1111];
            UITextField *textField2 = (UITextField *)[self.view viewWithTag:1112];
            self.user_name = textField1.text;
            self.user_password = textField2.text;
            textField1.enabled = NO;
            textField2.enabled = NO;
        }
    } else {
        if (checkMark.selected) {
            NSLog(@"account is always login");
        }
    }
}


-(IBAction)loginAndregirtrationButtonTarget:(id)sender {
    
    if ([[[(UITextField*)[self.view viewWithTag:1111] text] lowercaseString] isEqualToString:@"user"] && [[[(UITextField*)[self.view viewWithTag:1112] text] lowercaseString] isEqualToString:@"user"]) {
        WNHomeViewController *viewController = [[WNHomeViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
        
    }else {
        showAlert(@"Please enter valid username and password", @"Attention!");
    }
    
    /*UIButton *isPress = (UIButton *)sender;
    if (isPress.tag ==2221) {
        ISSignUpViewController *viewController = [[ISSignUpViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }else if(isPress.tag ==2222) {
        UITextField *textField1 = (UITextField *)[self.view viewWithTag:1111];
        UITextField *textField2 = (UITextField *)[self.view viewWithTag:1112];
        if ((textField1.text.length == 0) || (textField2.text.length == 0)) {
            showAlert(@"Please Enter UserName and Password", @"Attention!");
        }else {
            showActivityViewWithOwnView(@"Please wait...", self.navigationController.navigationBar.superview);
            [self getAuthenticationCheckingProcess:textField1.text user_password:textField2.text];
        }
    }else if(isPress.tag ==2223) {
        ISForgotPasswordViewController *viewController = [[ISForgotPasswordViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }else {
        [VBWebView useSafariButtonPressed];
    }*/
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
   
    [textField resignFirstResponder];
    return YES;
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.text.length >= MAX_LENGTH && range.length == 0) {
    	return NO; // return NO to not change text
    }else {
        return YES;
    }
}
@end
