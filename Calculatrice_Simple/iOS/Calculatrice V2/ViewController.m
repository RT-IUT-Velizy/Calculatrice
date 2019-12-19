//
//  ViewController.m
//  CalculatriceSimple2
//
//  Created by admin on 14/11/2019.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *insert;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *resultat;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//Tout code encadré en vert, est destiné a la console, pour verification du fonctionnement de l'application

- (IBAction)calcul:(id)sender {
    
    NSString *get = self.insert.text;
    NSInteger result = 0;
    ///////////////////////////////////////////////////
    printf("\n");
    ///////////////////////////////////////////////////
    
    if([get containsString:@"+"]){
        NSArray * array = [get componentsSeparatedByString:@"+"];
        NSString * num1 = [array objectAtIndex:0];
        NSString * num2 = [array objectAtIndex:1];
        result = [num1 integerValue] + [num2 integerValue];
        ///////////////////////////////////////////////////
        NSLog(@"\n\nLe premier numero est : %@\n\n",num1);
        NSLog(@"\n\nLe deuxieme numero est : %@\n\n",num2);
        NSLog(@"\n\nIl s'agit d'une addition\n\n");
        ///////////////////////////////////////////////////
        NSString * string = [NSString stringWithFormat:@"%ld", result];
        self.resultat.text = string;
        ///////////////////////////////////////////////////
        NSLog(@"\n\nLe resultat est : %@",string);
        ///////////////////////////////////////////////////
    }
    else if([get containsString:@"-"]){
        NSArray * array = [get componentsSeparatedByString:@"-"];
        NSString * num1 = [array objectAtIndex:0];
        NSString * num2 = [array objectAtIndex:1];
        result = [num1 integerValue] - [num2 integerValue];
        ///////////////////////////////////////////////////
        NSLog(@"\n\nLe premier numero est : %@\n\n",num1);
        NSLog(@"\n\nLe deuxieme numero est : %@\n\n",num2);
        NSLog(@"\n\nIl s'agit d'une soustraction\n\n");
        ///////////////////////////////////////////////////
        NSString * string = [NSString stringWithFormat:@"%ld", result];
        self.resultat.text = string;
        ///////////////////////////////////////////////////
        NSLog(@"\n\nLe resultat est : %@",string);
        ///////////////////////////////////////////////////
    }
    else if([get containsString:@"*"]){
        NSArray * array = [get componentsSeparatedByString:@"*"];
        NSString * num1 = [array objectAtIndex:0];
        NSString * num2 = [array objectAtIndex:1];
        result = [num1 integerValue] * [num2 integerValue];
        ///////////////////////////////////////////////////
        NSLog(@"\n\nLe premier numero est : %@\n\n",num1);
        NSLog(@"\n\nLe deuxieme numero est : %@\n\n",num2);
        NSLog(@"\n\nIl s'agit d'une multiplication\n\n");
        ///////////////////////////////////////////////////
        NSString * string = [NSString stringWithFormat:@"%ld", result];
        self.resultat.text = string;
        ///////////////////////////////////////////////////
        NSLog(@"\n\nLe resultat est : %@",string);
        ///////////////////////////////////////////////////
        
    }
    else if([get containsString:@"/"]){
        NSArray * array = [get componentsSeparatedByString:@"/"];
        NSString * num1 = [array objectAtIndex:0];
        NSString * num2 = [array objectAtIndex:1];
        result = [num1 integerValue] / [num2 integerValue];
        ///////////////////////////////////////////////////
        NSLog(@"\n\nLe premier numero est : %@\n\n",num1);
        NSLog(@"\n\nLe deuxieme numero est : %@\n\n",num2);
        NSLog(@"\n\nIl s'agit d'une division\n\n");
        ///////////////////////////////////////////////////
        NSString * string = [NSString stringWithFormat:@"%ld", result];
        self.resultat.text = string;
        ///////////////////////////////////////////////////
        NSLog(@"\n\nLe resultat est : %@",string);
        ///////////////////////////////////////////////////
        
    }
    else
    {
        self.resultat.text = @"L'operation n'est pas valide";
    }
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
