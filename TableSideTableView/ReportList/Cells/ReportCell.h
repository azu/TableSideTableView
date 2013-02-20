//
// Created by azu on 2013/02/19.
//


#import <Foundation/Foundation.h>

@class PlotDatesView;


@interface ReportCell : UITableViewCell{}

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet PlotDatesView *plotDatesView;
@end