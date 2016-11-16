//
//  ToDoTableViewCell.m
//  EveryDo
//
//  Created by Matthew Mauro on 2016-11-15.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "ToDoTableViewCell.h"

@implementation ToDoTableViewCell


-(NSString*)displayToDo:(ToDo*)todo
{
    NSRange range = NSMakeRange(0, todo.title.length);
    NSRangePointer rangeP = &range;
    
    NSAttributedString *check = [[NSAttributedString alloc]initWithString:todo.title];
    if(todo.completedIndicator == YES){
        [check attribute:NSStrikethroughStyleAttributeName atIndex:todo.title.length effectiveRange:rangeP];
    }
    return [NSString stringWithFormat:@"%@", check];
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
