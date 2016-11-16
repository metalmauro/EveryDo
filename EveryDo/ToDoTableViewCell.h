//
//  ToDoTableViewCell.h
//  EveryDo
//
//  Created by Matthew Mauro on 2016-11-15.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//
#import "ToDo.h"
#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell

-(NSString*)displayToDo:(ToDo*)todo;
@end
