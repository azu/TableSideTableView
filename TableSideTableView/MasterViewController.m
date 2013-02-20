//
//  MasterViewController.m
//  TableSideTableView
//
//  Created by azu on 02/19/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "ReportCell.h"
#import "PlotDatesView.h"
#import "PlotDateModel.h"
#import "NSDate+NRandomTime.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTapNotification:) name:kNotifitiocan_Plot_tap object:nil];
}

- (void)handleTapNotification:(NSNotification *) center {
    PlotDateModel *model = [[center userInfo] objectForKey:@"model"];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"yyyyMMHHmm" options:0 locale:[NSLocale currentLocale]]];
    self.title = [formatter stringFromDate:model.date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)insertNewObject:(id) sender {
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate randomDateTime] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    return _objects.count;

}

- (CGFloat)tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath {
    return 50;
}

- (void)updateVisibleCells {
    // セルの表示更新
    for (UITableViewCell *cell in [self.tableView visibleCells]) {
        [self updateCell:cell atIndexPath:[self.tableView indexPathForCell:cell]];
    }
}
//--------------------------------------------------------------//
#pragma mark - UITableViewDataSource
//--------------------------------------------------------------//

- (void)updateCell:(ReportCell *) cell atIndexPath:(NSIndexPath *) indexPath {
    NSDate *date = [_objects objectAtIndex:indexPath.row];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"Md" options:0 locale:[NSLocale currentLocale]]];
    cell.dateLabel.text = [formatter stringFromDate:date];
    PlotDateModel *model = [PlotDateModel modelWithDate:date];
    [cell.plotDatesView drawButtonWithModels:@[model]];

}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [self updateCell:(ReportCell *)cell atIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *) tableView canEditRowAtIndexPath:(NSIndexPath *) indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *) tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *) indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end