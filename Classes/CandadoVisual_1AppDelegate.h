//
//  CandadoVisual_1AppDelegate.h
//  CandadoVisual_1
//
//  Created by Jorge Bernal on 9/15/10.
//  Copyright 2010 Jorge Bernal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CandadoVisual_1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIImageView *mobileLock;
	float currentAngle;
	float savedAngle;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIImageView *mobileLock;

@end

