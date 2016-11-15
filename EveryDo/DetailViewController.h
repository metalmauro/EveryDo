//
//  DetailViewController.h
//  EveryDo
//
//  Created by Matthew Mauro on 2016-11-15.
//  Copyright © 2016 Matthew Mauro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

