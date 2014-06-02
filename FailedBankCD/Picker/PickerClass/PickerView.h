//
//  PickerView.h
//  Demo
//
//  Created by Triforce-1-Imac on 15/04/13.
//  Copyright (c) 2013 Triforce-1-Imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALPickerView.h"
@interface PickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource,ALPickerViewDelegate>
{
    id delegate, superDelegate;
    NSMutableArray *arrData;
    CGRect frameNew;
    UIPickerView *pkrView;
    UIToolbar *toolbar;
    NSMutableString *strValue;
    UIDatePicker *datePicker;
    NSString *strDateTime;
    
    NSMutableArray *selectionStates;
    NSArray *entries;
}
@property(nonatomic,retain)NSString *idKey,*idString;
@property(nonatomic,retain)UIDatePicker *datePicker;
@property(nonatomic,retain)id delegate, superDelegate;
- (void)getArray:(NSMutableArray *)arr;
- (void)btnAction:(id)sender;
- (void)getPkrDate;
- (void)LabelChange:(id)sender;
- (void)setDatePikerModeDateTime;
-(void)getMultiPalSelPkr:(NSMutableArray *)arr withIds:(NSString *) ids;
@end
