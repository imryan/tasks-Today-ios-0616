//
//  FISDetailViewController.m
//  tasksToday
//
//  Created by Ryan Cohen on 6/20/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISDetailViewController.h"
#import <EventKit/EventKit.h>

@interface FISDetailViewController ()

@property (nonatomic, strong) IBOutlet UITextView *textView;

@end

@implementation FISDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.lastYearsEvents) {
        for (EKEvent *event in self.nextYearsEvents) {
            if (self.nextYearsEvents.count == 1) {
                self.textView.text = event.title;
            } else {
                self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"%@\n", event.title]];
            }
        }
    } else {
        for (EKEvent *event in self.lastYearsEvents) {
             self.textView.text = [self.textView.text stringByAppendingString:[NSString stringWithFormat:@"%@\n", event.title]];
        }
        
        self.textView.text = [self.textView.text substringToIndex:(self.textView.text.length - 1)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
