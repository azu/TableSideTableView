//
// Created by azu on 2013/02/20.
//


#import "PlotDatesView.h"
#import "PlotDateModel.h"
#import "PlotDatesLogic.h"


@implementation PlotDatesView {

}

- (void)drawButtonWithModel:(PlotDateModel *) model {
    NSNumber *ratioXPosition = [PlotDatesLogic positionInDayForModel:model];
    if (ratioXPosition == nil || [ratioXPosition isEqualToNumber:@0]) {

    }
    CGFloat width = self.bounds.size.width;
    CGFloat buttonXPosition = [ratioXPosition floatValue] * width;
    UIButton *button = [self createButton:buttonXPosition];
    [self.buttonStorage addObject:button];
    [self.modelStorage addObject:model];
    [self addSubview:button];
}

- (UIButton *)createButton:(CGFloat) buttonXPosition {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [button addTarget:self action:@selector(handleButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    CGRect frame = button.frame;
    frame.origin.x = buttonXPosition - (button.frame.size.width / 2);
    frame.origin.y = (self.bounds.size.height - button.frame.size.height) / 2;
    button.frame = frame;
    return button;
}

- (void)handleButtonTap:(id) sender {
    NSUInteger indexOfObject = [self.buttonStorage indexOfObject:sender];
    if (indexOfObject == NSNotFound) {
        return;
    }
    NSAssert([self.modelStorage count] >= indexOfObject, @"modelとbuttonは同じ大きさの配列を持ってる");
    PlotDateModel *model = [self.modelStorage objectAtIndex:indexOfObject];
    [self postNotification:model];
}

- (void)postNotification:(PlotDateModel *)model {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotifitiocan_Plot_tap object:nil userInfo:@{
            @"model" : model
    }];
}
- (void)drawButtonWithModels:(NSArray *) models {
    [self cleanup];
    for (PlotDateModel *model in models) {
        [self drawButtonWithModel:model];
    }
}

#pragma mark - cleanup
- (void)cleanup {
    self.buttonStorage = [NSMutableArray array];
    self.modelStorage = [NSMutableArray array];


    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
//    self.contentSize = CGSizeMake(344, self.frame.size.height);
}

@end