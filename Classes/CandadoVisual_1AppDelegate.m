//
//  CandadoVisual_1AppDelegate.m
//  CandadoVisual_1
//
//  Created by Jorge Bernal on 9/15/10.
//  Copyright 2010 Jorge Bernal. All rights reserved.
//

#import "CandadoVisual_1AppDelegate.h"
#define DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(__RADIANS__) ((__RADIANS__) * 180 / M_PI)

@implementation CandadoVisual_1AppDelegate

@synthesize window, mobileLock;

// Es llamada cada vez que hacemos un gesto de rotacion
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)sender {
    // sender.rotation es el angulo relativo desde que empezamos
    // a girar, asi que guardamos lo que llevamos girado hasta 
    // ahora en savedAngle
    currentAngle = savedAngle + RADIANS_TO_DEGREES(sender.rotation);
    
    // Cuando el gesto termina (levantamos los dedos), 
    // guardamos el angulo actual en savedAngle
    if (sender.state == UIGestureRecognizerStateEnded) {
        savedAngle = currentAngle;
    }
    
    // Aplicamos una transformacion de giro a la 
    // imagen del candado
    CGAffineTransform cgCTM = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(currentAngle));
    mobileLock.transform = cgCTM;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    currentAngle = 0;
    savedAngle = 0;

    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    [mobileLock addGestureRecognizer:rotationGesture];
    [rotationGesture release];

    [window makeKeyAndVisible];

    return YES;
}

- (void)dealloc {
	[mobileLock release];
    [window release];
    [super dealloc];
}


@end
