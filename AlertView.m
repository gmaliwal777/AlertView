//
//  AlertView.m
//  eCitizens
//
//  Created by Ghanshyam on 3/9/15.
//  Copyright (c) 2015 Suchita. All rights reserved.
//

#import "AlertView.h"
#import "AppDelegate.h"


@implementation AlertView

#pragma mark--
#pragma mark-- AlertView Methods
-(void)showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message arrActions:(NSArray *)arrActions{
    //Holding reference of all Tabs
    if (!arrTabs) {
        arrTabs = [[NSMutableArray alloc] init];
    }
    
    [arrTabs removeAllObjects];
    
    UIAlertView *alertView = [[UIAlertView alloc] init];
    for (int counter = 0; counter<arrActions.count; counter++) {
        NSString *buttonTitle = [[arrActions objectAtIndex:counter] objectForKey:@"title"];
        [alertView addButtonWithTitle:buttonTitle];
        
        void(^tabAction)() = [[arrActions objectAtIndex:counter] objectForKey:@"action"];
        [arrTabs addObject:tabAction];
    }
    alertView.delegate = self;
    [alertView setMessage:message];
    if (title && title.length>0) {
        alertView.title = title;
    }
    [alertView show];
    
    
    
    //[UIAlertView appearance] ;
    //    if(IOS_VERSION<8.0){
    //        UIAlertView *alertView = [[UIAlertView alloc] init];
    //        for (int counter = 0; counter<arrActions.count; counter++) {
    //            NSString *buttonTitle = [[arrActions objectAtIndex:counter] objectForKey:@"title"];
    //           [alertView addButtonWithTitle:buttonTitle];
    //
    //            void(^tabAction)() = [[arrActions objectAtIndex:counter] objectForKey:@"action"];
    //            [arrTabs addObject:tabAction];
    //        }
    //        alertView.delegate = self;
    //        [alertView setMessage:message];
    //        [alertView show];
    //    }else{
    //        UIAlertController * alert=   [UIAlertController
    //                                      alertControllerWithTitle:@""
    //                                      message:message
    //                                      preferredStyle:UIAlertControllerStyleAlert];
    //
    //        for (int counter = 0; counter<arrActions.count; counter++) {
    //            NSString *buttonTitle = [[arrActions objectAtIndex:counter] objectForKey:@"title"];
    //            void(^tabAction)() = [[arrActions objectAtIndex:counter] objectForKey:@"action"];
    //
    //            UIAlertAction *action = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:tabAction];
    //            [alert addAction:action];
    //        }
    //        [topVC presentViewController:alert animated:YES completion:NULL];
    //        AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //        UIViewController *topHandler = appdelegate.window.rootViewController;
    //       if ([appdelegate.window.rootViewController isKindOfClass:[UINavigationController class]]) {
    //          //RootController is Navigation
    //           topHandler = (UINavigationController *)appdelegate.window.rootViewController;
    //
    //
    //        }else if ([appdelegate.window.rootViewController isKindOfClass:[UITabBarController class]]){
    //            //RootControlle is Tabbar
    //            topHandler = (UITabBarController *)appdelegate.window.rootViewController;
    //        }
    //
    //        [appdelegate.window bringSubviewToFront:alert.view];
    //        [topHandler presentViewController:alert animated:YES completion:^{
    //            [appdelegate.window bringSubviewToFront:alert.view];
    //        }];
    //    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //NSDictionary *dict = (NSDictionary *)[arrTabs objectAtIndex:0];
    void(^tabAction)() = (void(^)(void))[arrTabs objectAtIndex:buttonIndex];
    if (tabAction) {
        tabAction();
        [arrTabs removeAllObjects];
    }
}

@end
