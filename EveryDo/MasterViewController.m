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
@property NSMutableArray<ToDo *> *priorityOne;
@property NSMutableArray<ToDo *> *priorityTwo;
@property NSMutableArray<ToDo *> *priorityThree;
@property NSMutableArray<ToDo *> *priorityZero;
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
    self.priorityOne = [NSMutableArray new];
    self.priorityTwo = [NSMutableArray new];
    self.priorityThree = [NSMutableArray new];
    self.priorityZero = [NSMutableArray new];
    
    ToDo *ToDo1 = [[ToDo alloc]initWithTitle:@"Code Review" description:@"remember to submit projects for code review" priority:2];
    [self addToPriorityArray:ToDo1];
    ToDo *ToDo2 = [[ToDo alloc]initWithTitle:@"Groceries" description:@"buy food on the way home tonight" priority:1];
    [self addToPriorityArray:ToDo2];
    ToDo *ToDo3 = [[ToDo alloc]initWithTitle:@"Landscape" description:@"Mow the Lawn (wtf, I have an apartment)" priority:3];
    [self addToPriorityArray:ToDo3];
    ToDo *ToDo4 = [[ToDo alloc]initWithTitle:@"Beer" description:@"Out of beer at home" priority:1];
    [self addToPriorityArray:ToDo4];
    ToDo *ToDo5 = [[ToDo alloc]initWithTitle:@"Guitar" description:@"warm up the fingers!" priority:2];
    [self addToPriorityArray:ToDo5];
    [self.objects addObject:self.priorityOne];
    [self.objects addObject:self.priorityTwo];
    [self.objects addObject:self.priorityThree];
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)addToPriorityArray:(ToDo*)ToDo
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
-(void)receiveUpdatedToDo:(ToDo*)updated
{
    updated = self.updatedToDo;
    for(int i = 0; i < self.objects.count; i++){
        if([[self.objects objectAtIndex:i]isEqual:updated]){
            [self.objects replaceObjectAtIndex:i withObject:updated];
        }
    }
}
- (void)insertNewObject:(id)sender {
    ToDo *ToDoNew1 = [[ToDo alloc]initWithTitle:@"Code Review" description:@"remember to submit projects for code review" priority:2];
    [self addToPriorityArray:ToDoNew1];
    
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *send = self.objects[indexPath.section][indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:send];
    }
}


#pragma mark - Table View
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    ToDo *new = self.objects[indexPath.section][indexPath.row];
    cell.textLabel.text = [cell displayToDo:new];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
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
