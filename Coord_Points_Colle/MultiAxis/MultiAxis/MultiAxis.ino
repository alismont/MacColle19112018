/*
 * Multi-motor control (experimental)
 *
 * Move two or three motors at the same time.
 * This module is still work in progress and may not work well or at all.
 *
 * Copyright (C)2017 Laurentiu Badea
 *
 * This file may be redistributed under the terms of the MIT license.
 * A copy of this license has been included with this distribution in the file LICENSE.
 */
#include <Arduino.h>
#include "BasicStepperDriver.h"
#include "MultiDriver.h"
#include "SyncDriver.h"

// Motor steps per revolution. Most steppers are 200 steps or 1.8 degrees/step
#define MOTOR_STEPS 200
// Target RPM for X axis motor
#define MOTOR_X_RPM 200
// Target RPM for Y axis motor
#define MOTOR_Y_RPM 200

// X motor
#define DIR_X 6
#define STEP_X 3

// Y motor
#define DIR_Y 5
#define STEP_Y 2

#define ENBL 8
// If microstepping is set externally, make sure this matches the selected mode
// 1=full step, 2=half step etc.
#define MICROSTEPS 1

// 2-wire basic config, microstepping is hardwired on the driver
// Other drivers can be mixed and matched but must be configured individually
BasicStepperDriver stepperX(MOTOR_STEPS, DIR_X, STEP_X,ENBL);
BasicStepperDriver stepperY(MOTOR_STEPS, DIR_Y, STEP_Y,ENBL);

// Pick one of the two controllers below
// each motor moves independently, trajectory is a hockey stick
// MultiDriver controller(stepperX, stepperY);
// OR
// synchronized move, trajectory is a straight line
SyncDriver controller(stepperX, stepperY);

int enableX=48;

void setup() {
    /*
     * Set target motors RPM.
     */

     
  pinMode(enableX, INPUT);           // set pin to input
digitalWrite(enableX, HIGH);       // turn on pullup resistors

    stepperX.begin(MOTOR_X_RPM, MICROSTEPS);
    stepperY.begin(MOTOR_Y_RPM, MICROSTEPS);
}

void loop() {
  
//GESTION DE LA COMMANDE START
if (!digitalRead(enableX)) {  // 
   stepperX.disable();
   stepperY.disable();

}else {
  stepperX.enable();
  stepperY.enable(); 

}
    controller.move(1000, 100);
    //delay(1000);
     //controller.move(-1000, -100);
    delay(1000);
}
