// MultiStepper.pde
// -*- mode: C++ -*-
//
// Shows how to multiple simultaneous steppers
// Runs one stepper forwards and backwards, accelerating and decelerating
// at the limits. Runs other steppers at the same time
//
// Copyright (C) 2009 Mike McCauley


#include <AccelStepper.h>

// Define some steppers and the pins the will use
AccelStepper stepperx(3,6); // Defaults to 4 pins on 2, 3, 4, 5



void setup()
{  
    stepperx.setMaxSpeed(200.0);
    stepperx.setAcceleration(100.0);
    stepperx.moveTo(24);
    

    
 
}

void loop()
{
    // Change direction at the limits
    if (stepperx.distanceToGo() == 0)
	stepperx.moveTo(-stepperx.currentPosition());
    stepperx.run();

}
