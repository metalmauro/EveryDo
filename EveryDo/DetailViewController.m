//
//  DetailViewController.m
//  EveryDo
//
//  Created by Matthew Mauro on 2016-11-15.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "MasterViewController.h"
#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = self.detailItem.toDoDescription;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.completeSwitch setOn:self.detailItem.completedIndicator];
    
    [self configureView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)taskComplete:(UISwitch*)sender {
    BOOL test = self.detailItem.completedIndicator;
    if(test == YES)
    {
        self.detailItem.completedIndicator = NO;
    }else{
        self.detailItem.completedIndicator = YES;
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        ToDo *send = self.detailItem;
        MasterViewController *controller = (MasterViewController *)[segue destinationViewController];
        controller.updatedToDo = send;
    }
}

@end
