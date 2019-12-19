//
//  ViewController.h
//  ClientDeCalculIOS
//
//  Created by Théo on 10/12/2019.
//  Copyright © 2019 Théo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *calcul;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *res;

- (IBAction)buttonact:(id)sender;

@end

