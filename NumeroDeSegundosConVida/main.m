//
//  main.m
//  NumeroDeSegundosConVida
//
//  Created by Jose Miguel Salcido on 8/2/12.
//  Copyright (c) 2012 Jose Salcido. All rights reserved.
//

#import <Foundation/Foundation.h>

double numeroDeSegundosConVida(NSDate *birthday);
NSDate * obtenerFechaCumple();

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDate *birthday = obtenerFechaCumple();
        double segundosConVida = numeroDeSegundosConVida(birthday);
        //printf?
        NSLog(@"Segundos con vida %f", segundosConVida);
    }
    return 0;
}

double numeroDeSegundosConVida(NSDate *birthday)
{
    NSDate *now = [NSDate date];
    return [now timeIntervalSinceDate:birthday];
}

NSDate * obtenerFechaCumple()
{
    // Este objeto tiene como fecha inicial mi cumpleanios
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:1991];
    [comps setMonth:10];
    [comps setDay:21];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    
    NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *dateOfBirth = [gregorianCal dateFromComponents:comps];
    
    return dateOfBirth;
}