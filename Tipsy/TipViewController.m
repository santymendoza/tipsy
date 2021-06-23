//
//  TipViewController.m
//  Tipsy
//
//  Created by Santy Mendoza on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numPeopleControl;
@property (weak, nonatomic) IBOutlet UILabel *perPersonLabel;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:true];
}

- (IBAction)updateLabels:(id)sender {
    if (self.billAmountField.text.length == 0){
        [self hideLabels];
    }
    else{
        [self showLabels];
    }
    
    double tipPercentages [] = {.15,.2,.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double numPpls [] = {1.0,2.0,3.0,4.0};
    double numPpl = numPpls[self.numPeopleControl.selectedSegmentIndex];
    
    double bill = [self.billAmountField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    double perPerson = total / numPpl;
    
    
    self.tipLabel.text = [NSString stringWithFormat: @"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f", total];;
    self.perPersonLabel.text = [NSString stringWithFormat:@"$%.2f",perPerson];
}

- (void) hideLabels {
    [UIView animateWithDuration:.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y += 200;
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        self.labelsContainerView.frame = labelsFrame;
        self.labelsContainerView.alpha = 0;
        
        CGRect tipPercentageFrame = self.tipPercentageControl.frame;
        tipPercentageFrame.origin.y += 200;
        self.tipPercentageControl.frame = tipPercentageFrame;
        self.tipPercentageControl.alpha = 0;
        
        CGRect numPeopleFrame = self.numPeopleControl.frame;
        numPeopleFrame.origin.y += 200;
        self.numPeopleControl.frame = numPeopleFrame;
        self.numPeopleControl.alpha = 0;
    }];
    
    
}

- (void) showLabels {
    [UIView animateWithDuration:.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y = 100;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y = 200;
        self.labelsContainerView.frame = labelsFrame;
        self.labelsContainerView.alpha = 1;
        
        CGRect tipPercentageFrame = self.tipPercentageControl.frame;
        tipPercentageFrame.origin.y = 350;
        self.tipPercentageControl.frame = tipPercentageFrame;
        self.tipPercentageControl.alpha = 1;
        
        CGRect numPeopleFrame = self.numPeopleControl.frame;
        numPeopleFrame.origin.y = 400;
        self.numPeopleControl.frame = numPeopleFrame;
        self.numPeopleControl.alpha = 1;
    }];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self.billAmountField becomeFirstResponder];
    [self hideLabels];
    self.labelsContainerView.alpha = 0;
    self.tipPercentageControl.alpha = 0;
    self.numPeopleControl.alpha = 0;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
