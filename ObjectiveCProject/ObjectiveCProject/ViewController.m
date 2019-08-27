//
//  ViewController.m
//  ObjectiveCProject
//
//  Created by MCS on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize theTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* (^theBlock)(int, int) = ^(int int1, int int2) {
        return @"taking in two number";
    };
    NSLog (@"%d", theBlock(2, 3));
    [self theBlockFunction:theBlock];
    [self printHelloWorld];
    NSLog(@"%@", [self theBlockFunction:theBlock]);
    // Do any additional setup after loading the view.
}

-(NSString*) sayHelloWorld {
    return @"Hello World";
}

- (void) printHelloWorld {
    NSLog (@"Hello World");
}

- (NSString*) theBlockFunction: (NSString* (^)(int int1, int int2))block {
    return block(4, 5);
}
@end
