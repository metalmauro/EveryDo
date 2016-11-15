//
//  toDo.m
//  EveryDo
//
//  Created by Matthew Mauro on 2016-11-15.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import "toDo.h"

@implementation toDo

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



@end
