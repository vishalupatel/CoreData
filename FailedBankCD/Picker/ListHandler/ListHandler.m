//
//  ListHandler.m
//  Demo
//
//  Created by Triforce-1-Imac on 15/04/13.
//  Copyright (c) 2013 Triforce-1-Imac. All rights reserved.
//

#import "ListHandler.h"

@implementation ListHandler

@synthesize delegate,responder,obj,objPop;
@synthesize idKey,idString;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {

    }
    return self;
}

- (void)getDatawithArray:(NSMutableArray *)arr
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        self.backgroundColor = [UIColor clearColor];
        
        obj = [[PickerView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-216-44, 320, 216+44)];
        obj.backgroundColor = [UIColor whiteColor];
        [obj getArray:[NSMutableArray arrayWithArray:arr]];
        obj.delegate = self;
        obj.superDelegate = delegate;
        [self addSubview:obj];
    }
    else
    {
        objPop = [[PopoverView alloc]initWithFrame:CGRectMake(0, appDel.windowHeight-216-44, 320, 216)];
        objPop.delegate = self;
        objPop.popoverPresentView = delegate;
        objPop.responder = responder;
        [objPop getArray:[NSMutableArray arrayWithArray:arr]];
    }
}

-(void)getDatePicker
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        self.backgroundColor = [UIColor clearColor];
        obj = [[PickerView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-216-44, 320, 216+44)];
        obj.delegate = self;
        obj.superDelegate = delegate;
        [self addSubview:obj];
        [obj getPkrDate];
    }
    else
    {
        objPop = [[PopoverView alloc]initWithFrame:CGRectMake(0, appDel.windowHeight-216-44, 320, 216)];
        objPop.delegate = self;
        objPop.popoverPresentView = delegate;
        objPop.responder = responder;
        [objPop getPkrDate];
    }
}

- (void)allowMultipalSelection:(NSMutableArray *)arr withSelectedId:(NSString *) ids
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        self.backgroundColor = [UIColor clearColor];
        
        obj = [[PickerView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-216-44, 320, 216+44)];
        obj.backgroundColor = [UIColor whiteColor];
        obj.idKey = idKey;
        obj.idString = idString;
        [obj getMultiPalSelPkr:[NSMutableArray arrayWithArray:arr] withIds:ids];
        obj.delegate = self;
        obj.superDelegate = delegate;
        [self addSubview:obj];
    }
    else
    {
        objPop = [[PopoverView alloc]initWithFrame:CGRectMake(0, appDel.windowHeight-216-44, 320, 216)];
        objPop.idKey = idKey;
        objPop.idString = idString;
        objPop.delegate = self;
        objPop.popoverPresentView = delegate;
        objPop.responder = responder;
        [objPop getMultiPalSelPkr:[NSMutableArray arrayWithArray:arr] withIds:ids];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    [self removeFromSuperview];
}

- (void)show
{
    [UIView beginAnimations:nil context:self];
    [UIView setAnimationDuration:0.25];
    [self setFrame:self.frame];
    [UIView commitAnimations];
}

-(void)setPikerModeDateTime
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [obj setDatePikerModeDateTime];
    }
    else
    {
        [objPop setDatePikerModeDateTime];
    }
}

-(void) performAction:(id)object withSelectedValue:(NSString *) string
{
    if (appDel.isLogEnable) NSLog(@"string : %@",string);
    if ([delegate respondsToSelector:@selector(performAction:withSelectedValue:)])
    {
        [delegate performSelector:@selector(performAction:withSelectedValue:) withObject:self withObject:string];
    }
}

@end
