//
//  ToDoTableViewCell.h
//  EveryDo
//
//  Created by Matthew Mauro on 2016-11-15.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell
@property NSString *title;
@property NSString *toDoDescription;
@property NSInteger priorityNumber;
@property BOOL completedIndicator;

- (instancetype)initWithTitle:(NSString*)title description:(NSString*)description priority:(NSInteger)priority;
@end
