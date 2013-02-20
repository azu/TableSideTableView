//
// Created by azu on 2013/02/20.
//


#import "PlotDatesViewController.h"
#import "PlotDatesView.h"
#import "PlotDateModel.h"
#import "NSDate+AZBuilder.h"


@implementation PlotDatesViewController {

}

- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL) animated {
    [super viewDidAppear:animated];


    NSMutableArray *models = [NSMutableArray array];
    for (int i = 0; i < 24; i++) {
        NSDate *date = [NSDate dateByUnit:@{
                AZDateBuilderUnit.hour : @(i),
                AZDateBuilderUnit.minute : @0,
                AZDateBuilderUnit.second : @0
        }];
        [models addObject:[PlotDateModel modelWithDate:date]];
    }
    [self.scrollView drawButtonWithModels:models];
}

- (void)viewWillDisappear:(BOOL) animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL) animated {
    [super viewDidDisappear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end