//
//  CalculatorViewController.m
//  AssessmentWeekOne
//
//  Created by Cameron Flowers on 3/13/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "CalculatorViewController.h"
#import "WebViewController.h"

@interface CalculatorViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *numberTextFieldOne;
@property (strong, nonatomic) IBOutlet UITextField *numberTextFieldTwo;
@property (strong, nonatomic) IBOutlet UINavigationItem *navBar;
@property (strong, nonatomic) IBOutlet UIButton *webButton;
@property NSString* resultString;

@end


@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberTextFieldOne.delegate = self; //IMPORTANT STEP
    self.numberTextFieldTwo.delegate = self; //IMPORTANT STEP 
    //disable the web button
    [self.webButton setEnabled:NO];
}


- (IBAction)onCalculateButtonTapped:(id)sender {
    NSString *valueOne, *valueTwo;

    valueOne = self.numberTextFieldOne.text;
    valueTwo = self.numberTextFieldTwo.text;

    //multiply
  int calculation = [valueOne intValue] * [valueTwo intValue];
    if (calculation % 5 == 0) {
        //enable web button
        [self.webButton setEnabled:YES];
    }
    self.resultString = [NSString stringWithFormat:@"%i", calculation];
    self.navBar.title = self.resultString;
//
//    Option One to Resign Keyboard
    [self.view endEditing:YES];
}


// Option two to resign keyboard
//-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//
//    [self.numberTextFieldOne resignFirstResponder];
//    [self.numberTextFieldTwo resignFirstResponder];
//    return YES;
//}

//TO REFRESH OUR VIEW AFTER THE SEGUE COMES BACK
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBar.title = @"";
    self.numberTextFieldOne.text = @"";
    self.numberTextFieldTwo.text = @"";
    [self.webButton setEnabled:NO];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    WebViewController *vc = [segue destinationViewController];
    vc.result = self.resultString;
    vc.title = self.resultString;
}


@end
