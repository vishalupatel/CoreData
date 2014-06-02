//
//  PickerView.m
//  Demo
//
//  Created by Triforce-1-Imac on 15/04/13.
//  Copyright (c) 2013 Triforce-1-Imac. All rights reserved.
//

#import "PickerView.h"

@implementation PickerView
@synthesize delegate, superDelegate,datePicker,idKey,idString;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        strValue = [[NSMutableString alloc]init];
    }
    return self;
}

- (void)getArray:(NSMutableArray *)arr
{

    pkrView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 44, 320, 216)];
    arrData = [[NSMutableArray alloc]initWithArray:arr];
    pkrView.showsSelectionIndicator = YES;
    pkrView.delegate = self;
    pkrView.dataSource = self;
    
    toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 0, 320, 44);
    toolbar.tintColor = [UIColor blackColor];

    UIBarButtonItem *buttonOne = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done",@"") style:UIBarButtonItemStyleBordered target:self action:@selector(btnAction:)];
    buttonOne.tag = 1;
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *buttonTwo = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(btnAction:)];
    
    buttonTwo.tag = 2;
    NSArray *buttons = [NSArray arrayWithObjects: buttonOne, flexible,buttonTwo, nil];
    [toolbar setItems: buttons animated:NO];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.backgroundColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor blackColor];
    }
    [self addSubview:toolbar];    
    [self addSubview:pkrView];
    
    [strValue setString:@"0"];
}

-(void)getPkrDate
{
    toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 0, 320, 44);
    toolbar.tintColor = [UIColor blackColor];
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, 320, 216)];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.hidden = NO;
    datePicker.date = [NSDate date];
    [datePicker addTarget:self action:@selector(LabelChange:) forControlEvents:UIControlEventValueChanged];
    [self LabelChange:datePicker];

    
    UIBarButtonItem *buttonOne = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done",@"") style:UIBarButtonItemStyleBordered target:self action:@selector(btnAction:)];
    buttonOne.tag = 1;
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *buttonTwo = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(btnAction:)];
    buttonTwo.tag = 2;
    NSArray *buttons = [NSArray arrayWithObjects: buttonOne, flexible,buttonTwo, nil];
    [toolbar setItems: buttons animated:NO];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.backgroundColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor blackColor];
    }
    
    [self addSubview:toolbar];
    [self addSubview:datePicker];
}

-(void)getMultiPalSelPkr:(NSMutableArray *)arr withIds:(NSString *) ids
{
    
    entries = [[NSArray alloc] initWithArray:arr];
	selectionStates = [[NSMutableArray alloc] init];
	
    [self setSelectedDictValue:ids];

	ALPickerView *pickerView = [[ALPickerView alloc] initWithFrame:CGRectMake(0, 44, 320, 200)];
	pickerView.delegate = self;

    toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 0, 320, 44);
    toolbar.tintColor = [UIColor blackColor];
    
    UIBarButtonItem *buttonOne = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Done",@"") style:UIBarButtonItemStyleBordered target:self action:@selector(btnAction:)];
    buttonOne.tag = 1;
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIBarButtonItem *buttonTwo = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(btnAction:)];
    
    buttonTwo.tag = 2;
    NSArray *buttons = [NSArray arrayWithObjects: buttonOne, flexible,buttonTwo, nil];
    [toolbar setItems: buttons animated:NO];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.backgroundColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor blackColor];
    }
    [self addSubview:toolbar];
    [self addSubview:pickerView];
    
    [strValue setString:@"0"];
}

-(void)setDatePikerModeDateTime
{
    strDateTime = @"yes";
    [self LabelChange:datePicker];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([arrData count] > 0) {
//        strValue = [arrData objectAtIndex:row];
        strValue = [NSMutableString stringWithFormat:@"%ld",(long)row];
        [strValue retain];
//        if (appDel.isLogEnable) NSLog(@"strValue : %@",strValue);
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if ([arrData count] == 0) {
        return 1;
    }
    return [arrData count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    if ([arrData count] > 0)
    {
        return [arrData objectAtIndex:row];
    }
    return nil;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 37)];
    
//    if (appDel.isLogEnable) NSLog(@"%@",NSStringFromClass([superDelegate class]));
//    if (appDel.isLogEnable) NSLog(@"%@",NSStringFromClass([delegate class]));
    
    if ([NSStringFromClass([superDelegate class]) isEqualToString:NSStringFromClass([RegistrationPage class])])
    {
        label.font = [UIFont boldSystemFontOfSize:13.f];
    }else{
        label.font = [UIFont boldSystemFontOfSize:15.f];
    }

    if ([arrData count] > 0)
    {
        label.text = [arrData objectAtIndex:row];
    }else{
        label.text = @"";
    }
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

- (void)LabelChange:(UIDatePicker *)sender
{
    if ([strDateTime isEqualToString:@"yes"])
    {
        NSDate *myDate = sender.date;
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"MMM dd, yyyy hh:mm aa"];
        strValue = [NSMutableString stringWithFormat:@"%@",[dateFormat stringFromDate:myDate] ];
    }else{
        NSDateFormatter *df = [[NSDateFormatter alloc]init];
        [df setDateFormat:@"MMM dd, yyyy"];
        strValue = [NSMutableString stringWithFormat:@"%@",[df stringFromDate:sender.date]];
    }
    if (appDel.isLogEnable) NSLog(@"strValue : %@",strValue);
    
    [strValue retain];
}

- (void)btnAction:(id)sender
{
    if (appDel.isLogEnable) NSLog(@"strValue : %@",strValue);
    if ([sender tag] == 1)
    {
        if ([delegate respondsToSelector:@selector(performAction:withSelectedValue:)])
        {
            [delegate performSelector:@selector(performAction:withSelectedValue:) withObject:self withObject:strValue];
        }
    }else
    {
        if ([delegate respondsToSelector:@selector(performAction:withSelectedValue:)])
        {
            [delegate performSelector:@selector(performAction:withSelectedValue:) withObject:self withObject:@""];
        }
    }
    
    [UIView beginAnimations:nil context:delegate];
    [UIView setAnimationDuration:0.3];
    [delegate setFrame:CGRectMake(0,((UIView *)delegate).frame.size.height,320,appDel.windowHeight)];
    [UIView commitAnimations];
}

#pragma mark ALPickerView delegate methods

- (NSInteger)numberOfRowsForPickerView:(ALPickerView *)pickerView {
	return [entries count];
}

- (NSString *)pickerView:(ALPickerView *)pickerView textForRow:(NSInteger)row {
	return [[entries objectAtIndex:row] valueForKey:idString];
}

- (BOOL)pickerView:(ALPickerView *)pickerView selectionStateForRow:(NSInteger)row {
    if ([selectionStates containsObject:[entries objectAtIndex:row]]) {
        return YES;
    }
	return NO;
}

- (void)pickerView:(ALPickerView *)pickerView didCheckRow:(NSInteger)row {
	// Check whether all rows are checked or only one
	if (row == -1)
    {
        for (NSDictionary * dict in entries)
			if (![selectionStates containsObject:dict]) {
                [selectionStates addObject:dict];
            }
    }
	else
    {
        if (![selectionStates containsObject:[entries objectAtIndex:row]]) {
            [selectionStates addObject:[entries objectAtIndex:row]];
        }
    }
    [self getSelectedId];
}

- (void)pickerView:(ALPickerView *)pickerView didUncheckRow:(NSInteger)row {
	// Check whether all rows are unchecked or only one
	if (row == -1)
    {
        for (NSDictionary * dict in entries)
			if ([selectionStates containsObject:dict]) {
                [selectionStates removeObject:dict];
            }
    }
	else
    {
        if ([selectionStates containsObject:[entries objectAtIndex:row]]) {
            [selectionStates removeObject:[entries objectAtIndex:row]];
        }
    }
    [self getSelectedId];
}

-(void)getSelectedId
{
    NSMutableArray *arrSelected = [[NSMutableArray alloc] init];
    for (int x = 0; x < [selectionStates count]; x++)
    {
       [arrSelected addObject:[[selectionStates objectAtIndex:x] valueForKey:idKey]];
    }
    
    strValue = (NSMutableString *)[arrSelected componentsJoinedByString:@","];
    [strValue retain];
    [arrSelected release];
}

- (void) setSelectedDictValue:(NSString *) ids {
    NSMutableArray * selectedIds = [NSMutableArray arrayWithArray:[ids componentsSeparatedByString:@","]];
    for (int x = 0; x < [entries count]; x++)
    {
        if ([selectedIds containsObject:[[entries objectAtIndex:x] valueForKey:idKey]]) {
            [selectionStates addObject:[entries objectAtIndex:x]];
        }
    }
}


@end









