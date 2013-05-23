//
//  ViewController.h
//  Time
//
//  Created by Sam Vale on 18/05/13.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController{
    
    IBOutlet UILabel *currentTime;
    IBOutlet UILabel *currentLocation;
    IBOutlet UILabel *alarmTimeLabel;
    IBOutlet UILabel *worldTimeLabel;
    IBOutlet UILabel *worldTimeLocationLabel;
    IBOutlet UILabel *AmPm;


    
    IBOutlet UIButton *buttonTimer;
    IBOutlet UIButton *buttonClock;
    
    
    NSTimer *checkTime;

}


@property (nonatomic, retain) IBOutlet UILabel *currentTime;
@property (nonatomic, retain) IBOutlet UILabel *currentLocation;
@property (nonatomic, retain) IBOutlet UILabel *alarmTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *worldTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *worldTimeLocationLabel;
@property (nonatomic, retain) IBOutlet UILabel *AmPm;




@property (nonatomic, retain)IBOutlet UIButton *buttonTimer;
@property (nonatomic, retain)IBOutlet UIButton *buttonClock;


@end
