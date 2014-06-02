//
//  PickerView.h
//  Demo
//
//  Created by Triforce-1-Imac on 15/04/13.
//  Copyright (c) 2013 Triforce-1-Imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALPickerView.h"

@interface PopoverView : UIView<UIPickerViewDelegate, UIPickerViewDataSource,UIPopoverControllerDelegate,ALPickerViewDelegate>
{
    id responder;
    id delegate, popoverPresentView;
    NSMutableArray *arrData;
    CGRect frameNew;
    UIPickerView *pkrView;
    UIToolbar *toolbar;
    
    UIPopoverController  *popoverController;
    UIPickerView *picker;
//    NSArray *QuesArray;
    NSMutableString *strValue;
    UIDatePicker *datePicker;
    NSString *strDateTime;
    
    NSMutableArray *selectionStates;
    NSArray *entries;
    
}
@property(nonatomic,retain)NSString *idKey,*idString;
@property(nonatomic,retain)UIDatePicker *datePicker;
@property(nonatomic,retain)id delegate;
@property(nonatomic,retain)id responder;
@property(nonatomic,retain)id popoverPresentView;

- (void)getArray:(NSMutableArray *)arr;
- (void)btnAction:(id)sender;
-(void)getPkrDate;
-(void)setDatePikerModeDateTime;
-(void)getMultiPalSelPkr:(NSMutableArray *)arr withIds:(NSString *) ids;
@end
