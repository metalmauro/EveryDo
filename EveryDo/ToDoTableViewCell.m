//
//  ToDoTableViewCell.m
//  EveryDo
//
//  Created by Matthew Mauro on 2016-11-15.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "ToDoTableViewCell.h"

@implementation ToDoTableViewCell

- (instancetype)initWithTitle:(NSString*)title description:(NSString*)description priority:(NSInteger)priority
{
    self = [super init];
    if (self) {
        _completedIndicator = NO;
        _title = title;
        _toDoDescription = description;
        _priorityNumber = priority;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
