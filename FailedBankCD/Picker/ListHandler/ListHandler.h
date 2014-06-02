//
//  ListHandler.h
//  Demo
//
//  Created by Triforce-1-Imac on 15/04/13.
//  Copyright (c) 2013 Triforce-1-Imac. All rights reserved.
//

@class PickerView;
#import <Foundation/Foundation.h>
#import "PickerView.h"
#import "PopoverView.h"
@interface ListHandler : UIView
{
    NSMutableArray *arrData;
    id responder;
    id delegate;
    
    PickerView *obj;
    PopoverView *objPop;
}
@property(nonatomic,retain)NSString *idKey,*idString;
@property(nonatomic,retain)PickerView *obj;
@property(nonatomic,retain)PopoverView *objPop;
@property(nonatomic,retain)id delegate;
@property(nonatomic,retain)id responder;
- (void)getDatawithArray:(NSMutableArray *)arr;
-(void)show;
-(void) performAction:(id)object withSelectedValue:(NSString *) string;
-(void)getDatePicker;
-(void)setPikerModeDateTime;
-(void)allowMultipalSelection:(NSMutableArray *)arr withSelectedId:(NSString *) ids;
@end
