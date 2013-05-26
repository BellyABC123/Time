//
//  ViewController.m
//  Time
//
//  Created by Sam Vale on 18/05/13.
//  Copyright (c) 2013 GRAPHITE. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController ()

@end

@implementation ViewController 
@synthesize buttonClock, buttonTimer, currentLocation, currentTime, alarmTimeLabel, worldTimeLabel, worldTimeLocationLabel, AmPm;


- (void)viewDidLoad
{

    
    [super viewDidLoad];
    [self setTime];
    
    [self.view setBackgroundColor:[UIColor brownColor]]; //example code for changing background
    
    
    [currentLocation setFont:[UIFont fontWithName:@"Quicksand" size:26]];
    [currentLocation setTextColor:[UIColor whiteColor]];
    
    
    [currentTime setFont:[UIFont fontWithName:@"Quicksand" size:80]];
    [currentTime setTextColor:[UIColor whiteColor]];
    
    [alarmTimeLabel setFont:[UIFont fontWithName:@"Quicksand" size:17]];
    [alarmTimeLabel setTextColor:[UIColor whiteColor]];
    
    [worldTimeLocationLabel setFont:[UIFont fontWithName:@"Quicksand" size:17]];
    [worldTimeLocationLabel setTextColor:[UIColor whiteColor]];
    
    [worldTimeLabel setFont:[UIFont fontWithName:@"Quicksand" size:27]];
    [worldTimeLabel setTextColor:[UIColor whiteColor]];
    
    [AmPm setFont:[UIFont fontWithName:@"Quicksand" size:27]];
    [AmPm setTextColor:[UIColor whiteColor]];
    
        
    checkTime = [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(setTime) userInfo: nil repeats: YES];
    

    
    //NSLog(@"%@", [NSTimeZone knownTimeZoneNames]);

}

//this will get the users favourite city and set the timezone offset
-(NSString *)getTimeZone{
    NSString *time;
    time = @"America/New_York";
    return time;
}


-(NSString *)getUTCFormateDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:[self getTimeZone]];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"hh:mma"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];
    
    //NSLog(@"time has been changed to: %@", dateString);
    return dateString;
}


//the method here can be used to get other times in other countries, using some math with timezones
-(NSString *)getCurrentTime{
    
    NSDate *Time = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm"];
    NSString *resultString = [dateFormatter stringFromDate: Time];

    //NSLog(@"Time has been updated to %@", resultString);
    
    
    return resultString;
}


-(NSString *)getAmPM{
    NSDate *Time = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"a"];
    NSString *resultString = [dateFormatter stringFromDate: Time];
    
    //NSLog(@"it is currently: %@", resultString);
    return resultString;
    
}

//in ios6 the exit is used to unwind a segue and can re intialise the checkTime timer that had been invalidated upon
//going to another viewcontroller
-(IBAction)returned:(UIStoryboardSegue *)segue {
    checkTime = [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(setTime) userInfo: nil repeats: YES];
    alarmTimeLabel.frame = CGRectMake(123, 0, 93, 21);
    
   }

-(IBAction)buttonWorld:(id)sender{
    //this stops the nstimer ticking away to save battery and overall performance of the app
    [checkTime invalidate];
    checkTime = nil;
}

-(IBAction)Timer{
    
    if ([self fullscreen]== 1) {
        [self setFullscreen:0];
    }else if ([self fullscreen]== 0){
        [self setFullscreen:1];
    }
}

-(int)fullscreen{
    int a;
    if ([UIApplication sharedApplication].statusBarHidden == YES){
        a = 1;
        return a;
    }else{
        a = 0;
        return a;
    }
}


-(void)setFullscreen:(int)x{
  
    
    if (x == 1) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
        CGRect endFrame = CGRectMake(123, 0, 93, 21);
        [UIView animateWithDuration:0.6 animations:^{ alarmTimeLabel.frame = endFrame;}];
        NSLog(@"Fullscreen!: Moving Objects....");

    }else if(x == 0){
        //set the objects to their original place
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        CGRect endFrame = CGRectMake(123, 25, 93, 21);
        [UIView animateWithDuration:0.6 animations:^{ alarmTimeLabel.frame = endFrame;}];
        NSLog(@"Not Fullscreen!: Moving Ojects...");
    }
    
}


//this can be assigned for all labels and with math can be alterted to get different times
-(void)setTime{
    [currentTime setText:[self getCurrentTime]];
   //[currentTime setText:@"11:11"];
    [AmPm setText:[self getAmPM]];
    [worldTimeLabel setText:[self getUTCFormateDate:[NSDate date]]];
    }


- (void)didReceiveMemoryWarning
{
    checkTime = [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(setTime) userInfo: nil repeats: YES];

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
