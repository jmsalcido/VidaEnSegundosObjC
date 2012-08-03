//
//  main.m
//  NumeroDeSegundosConVida
//
//  Para comenzar en el mundo de Objective-C ire subiendo cada proyecto
//  "interesante" que haga, este me parece interesante por que es
//  la primera aplicacion que hago en Objective-C, si, es un poco
//  pues, sencilla pero es lo primero que hago asi que habra que darle
//  un poco de amor.
//
//  Created by Jose Miguel Salcido on 8/2/12.
//  Copyright (c) 2012 Jose Salcido. All rights reserved.
//


//  Notese que se utiliza la notacion #import no #include de C
#import <Foundation/Foundation.h>

//  ======================
//  Prototipo de Funciones
//  ======================
double numeroDeSegundosConVida(NSDate *birthday);
NSDate * obtenerFechaCumple();

//  Funcion/Metodo main
int main(int argc, const char * argv[])
{
    // Aun no estoy muy seguro de la notacion @autoreleasepool creo que
    // tiene que ver con el manejo de memoria (almenos lo que he leido sobre iOS si)
    @autoreleasepool {
        // Crearemos un objeto de tipo NSDate con la funcion obtenerFechaCumple()
        NSDate *birthday = obtenerFechaCumple();
        
        // Obtenemos el numero de segundos con vida por medio de la funcion numeroDeSegundosConVida
        // que recibe como parametro un objeto de tipo NSDate
        double segundosConVida = numeroDeSegundosConVida(birthday);
        
        // Por medio de la clase NSLog podemos mostrar un output al usuario.
        NSLog(@"Segundos con vida %f", segundosConVida);
    }
    return 0;
}

// No se como se comenten las funciones/metodos actualmente
// Asi que utilizare notacion por medio de // como siempre.
double numeroDeSegundosConVida(NSDate *birthday)
{
    // Creamos un objeto de tipo NSDate llamado now
    // por medio del metodo de la clase NSDate date
    // que nos regresa el valor de la fecha actual.
    NSDate *now = [NSDate date];
    
    // Por medio del metodo de instancia timeIntervalSinceDate que recibe de
    // parametro la fecha de cumpleaños nos regresa el intervalo en segundos (double)
    return [now timeIntervalSinceDate:birthday];
}

// Para obterner la fecha de nacimiento la debemos especificar manualmente
// aun no llego al tema de entrada y salida, asi que manualmente se hara.
NSDate * obtenerFechaCumple()
{
    // Este objeto tiene como fecha inicial mi cumpleanios
    // Instanciamos un objeto por medio de la practica aprobada por Apple
    // La practica para instanciar objetos es:
    //  - mandar un mensaje con el metodo de la clase alloc
    //  - mandar llamar el metodo init al mensaje anterior
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    // Mensajes para poner la fecha de nacimiento
    // son mensajes de instancia por lo que utilizaremos el objeto comps
    // creado anteriormente y los metodos setYear, setMonth, setDay, setHour, setDay y setSecond
    [comps setYear:1991];
    [comps setMonth:10];
    [comps setDay:21];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    
    // Creamos un objeto de tipo NSCalendar por medio del metodo initWithCalendarIdentifier:NSGregorianCalendar
    NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    // Creamos un objeto de tipo NSDate por medio de la instancia anterior con el metodo dateFromComponents
    // que recibe como parametro el objeto NSDateComponents que instanciamos anteriormente.
    NSDate *dateOfBirth = [gregorianCal dateFromComponents:comps];
    
    // Regresamos el objeto NSDate
    return dateOfBirth;
}