//
//  MasterViewController.m
//  EveryDo
//
//  Created by Matthew Mauro on 2016-11-15.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "ToDoTableViewCell.h"
#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()
@property NSMutableArray<ToDoTableViewCell *> *priorityOne;
@property NSMutableArray<ToDoTableViewCell *> *priorityTwo;
@property NSMutableArray<ToDoTableViewCell *> *priorityThree;
@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.objects = [NSMutableArray new];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.priorityOne= [NSMutableArray new];
    self.priorityTwo= [NSMutableArray new];
    self.priorityThree= [NSMutableArray new];
    
    
    ToDoTableViewCell *ToDoTableViewCell1 = [[ToDoTableViewCell alloc]initWithTitle:@"Code Review" description:@"remember to submit projects for code review" priority:2];
    [self addToPriorityArray:ToDoTableViewCell1];
    ToDoTableViewCell *ToDoTableViewCell2 = [[ToDoTableViewCell alloc]initWithTitle:@"Groceries" description:@"but food on the way home tonight" priority:1];
    [self addToPriorityArray:ToDoTableViewCell2];
    ToDoTableViewCell *ToDoTableViewCell3 = [[ToDoTableViewCell alloc]initWithTitle:@"Landscape" description:@"Mow the Lawn (wtf, I have an apartment)" priority:3];
    [self addToPriorityArray:ToDoTableViewCell3];
    ToDoTableViewCell *ToDoTableViewCell4 = [[ToDoTableViewCell alloc]initWithTitle:@"Beer" description:@"Out of beer at home" priority:1];
    [self addToPriorityArray:ToDoTableViewCell4];
    ToDoTableViewCell *ToDoTableViewCell5 = [[ToDoTableViewCell alloc]initWithTitle:@"Guitar" description:@"warm up the fingers!" priority:2];
    [self addToPriorityArray:ToDoTableViewCell5];
    [self.objects addObject:self.priorityOne];
    [self.objects addObject:self.priorityTwo];
    [self.objects addObject:self.priorityThree];
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)addToPriorityArray:(ToDoTableViewCell*)ToDo
{
    if(ToDo.priorityNumber == 1)
    {
        [self.priorityOne addObject:ToDo];
    }if(ToDo.priorityNumber ==2)
    {
        [self.priorityTwo addObject:ToDo];
    }if(ToDo.priorityNumber ==3)
    {
        [self.priorityThree addObject:ToDo];
    }
}

- (void)insertNewObject:(id)sender {
    ToDoTableViewCell *ToDoTableViewCell1 = [[ToDoTableViewCell alloc]initWithTitle:@"Code Review" description:@"remember to submit projects for code review" priority:2];
    [self addToPriorityArray:ToDoTableViewCell1];
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    }
}


#pragma mark - Table View
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"mafucker";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.objects.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.objects[section]count];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
