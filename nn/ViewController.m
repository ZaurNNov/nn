//
//  ViewController.m
//  nn
//
//  Created by Zaur Giyasov on 22/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"


///////////////////////////////////////// Protocol name
@protocol MyProtocolIsDelegateMethod

-(void)print42;
@optional
-(void)print22;
@end


///////////////////////////////////////// Category name
@interface NSObject(Animal)

-(void)exampleOne;
-(void)exampleTwo;

@end

@implementation NSObject(Animal)

-(void)exampleOne {
    NSLog(@"self: exampleOne");
}

-(void)exampleTwo {
    NSLog(@"self: exampleTwo");
}
@end
///////////////////////////////////////

///////////////////////////////////////// Extentions name
@interface UIViewController (ExampleExt)

-(void)viewDiDDiDDiDnotLoad;
@end

@implementation UIViewController (ExampleExt)
-(void)viewDiDDiDDiDnotLoad {
    NSLog(@"it is fake! :)");
}
@end

@interface NSString(func)
-(void)func;
@end

@implementation NSString(func)
-(void)func {
    NSLog(@"NSString Class: %@ -> %@: ** new nsstring method: funcfuncfunc", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
@end
///////////////////////////////////////

///////////////////////////////////////// noname category (hide extention)
@interface ViewController() <MyProtocolIsDelegateMethod>

-(void)secretMethod;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self newPoligin];
    [self viewDiDDiDDiDnotLoad];
    
    [self print42];
    
    // optional method (line 127 - 132)
    // [self print22]; // this line is valid and not show warning - app wil crash
    
    if ([self respondsToSelector:@selector(print22)]) {
        [self print22]; // optional method
    }
}

-(void) newPoligin {
    
    NSObject *one = [[NSObject alloc] init];
    
    // call self ext. methods
    [one exampleOne];
    [one exampleTwo];
    
    // private method
    [self secretMethod];
}

-(void)secretMethod {
    // visible only this implementation
    NSLog(@"this is %@", NSStringFromSelector(_cmd));
    
    NSString *str = @"new string";
    NSLog(@"str description: %@", str.description);
    NSLog(@"str new method: ");
    [str func];
    
}

/*
// override partetm method

-(void)viewDiDDiDDiDnotLoad {
    // [super viewDiDDiDDiDnotLoad] // or add to parent method
    NSLog(@"override partetm method!");
}

*/

// protocil methods
-(void)print42 {
    NSLog(@"%@: 42", NSStringFromSelector(_cmd));
}

// optional:
/*
-(void)print22 {
    NSLog(@"%@: 22", NSStringFromSelector(_cmd));
}
*/


@end

/*
//+ ext cocoa lib
@interface NSString (selfDescription)
-(NSString *)description;
@end

@implementation NSString (selfDescription)
-(NSString *)description {
    NSLog(@"self description");
    return @"kuku";
}
@end
 */
