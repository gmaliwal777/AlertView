//
//  AlertView.h
//  eCitizens
//
//  Created by Ghanshyam on 3/9/15.
//  Copyright (c) 2015 Suchita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AlertView : NSObject<UIAlertViewDelegate>{
    NSMutableArray     *arrTabs;
}

/**
 *  Used to show alert view
 *
 *  @param title      : alertView title
 *  @param message    : alertView message
 *  @param arrActions : actions container array
 */
-(void)showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message arrActions:(NSArray *)arrActions;

@end
