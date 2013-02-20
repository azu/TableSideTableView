//
// Created by azu on 2013/02/20.
//


#import <Foundation/Foundation.h>

@class PlotDateModel;


static NSString * const kNotifitiocan_Plot_tap = @"model_tap";

@interface PlotDatesView : UIScrollView

@property(nonatomic, strong) NSMutableArray *buttonStorage;

@property(nonatomic, strong) NSMutableArray *modelStorage;

- (void)drawButtonWithModel:(PlotDateModel *) model;

- (void)drawButtonWithModels:(NSArray *) models;
@end