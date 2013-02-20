//
// Created by azu on 2013/02/19.
//


#import "ReportCell.h"
#import "PlotDatesView.h"


#import <QuartzCore/QuartzCore.h>

@implementation ReportCell {

}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.plotDatesView.layer.borderWidth = 1;
    self.plotDatesView.layer.borderColor = [UIColor redColor].CGColor;
}

@end