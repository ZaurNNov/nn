//
//  ViewController.m
//  nn
//
//  Created by Zaur Giyasov on 22/06/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "ViewController.h"
#import "NewClass.h"
#import "NewClass2.h"

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
@property (nonatomic, copy) NSArray *mutArr1;
@property (nonatomic) NSArray *mutArr2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self newPoligin];
    /*
    [self viewDiDDiDDiDnotLoad];
    
    [self print42];
    
    // optional method (line 127 - 132)
    // [self print22]; // this line is valid and not show warning - app wil crash
    
    if ([self respondsToSelector:@selector(print22)]) {
        [self print22]; // optional method
    }
     */
    
//    [self newExample];
    [self archiveUnarchive];
}

-(void)newExample {
    
    NewClass *a1 = [[NewClass alloc] init];
    NSLog(@"%@", a1);
    
    a1.string1 = @"NSString *string1";
    a1.string2Copy = @"NSString *string2Copy";
    a1.array1 = @[@"one", @"two", @"three"];
    a1.array2Copy = @[@"nine", @"eight", @"seven"];
    NSLog(@"%@", a1);
    
    NewClass *a2 = [[NewClass alloc] initWithData];
    
    NewClass2 *class2Obj = [[NewClass2 alloc] init];
    class2Obj.name = @"Ivan";
    
    a1.class2Object = class2Obj;
//    NewClass *b1 = [a1 copy];
    a2 = a1;
    
    //NewClass *b1 = [a1 copy];
    //a2 = a1.copy;
    /* *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[NewClass copyWithZone:]: unrecognized selector sent to instance 0x600000253830'
     */

    NSLog(@"%@", a2);
    a2.array2Copy = [a1.array1 arrayByAddingObject:@"kyky"];
    a1.array1 = [a2.array2Copy arrayByAddingObject:@"mumu"];
    
    NSLog(@"%@", a2);
    
}

-(void)archiveUnarchive {
    
    NSString *fileName = @"myFile.plist";
    NewClass2 *a1 = [[NewClass2 alloc] initWithName:@"Superman"];
    [a1 archiveMyPropertyAs:fileName];
    
    NewClass2 *a2 = [[NewClass2 alloc] initWithName:@"Batman"];
    [a2 unarchiveMyPropertyFrom:fileName];
    
    NSLog(@"%@ vs %@", a1, a2);
}

-(void) newPoligin {
    /*
    NSObject *one = [[NSObject alloc] init];
    
    // call self ext. methods
    [one exampleOne];
    [one exampleTwo];
    
    // private method
    [self secretMethod];
    
     */
    // arrays examples
    [self arraysExamples];
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

-(void)arraysExamples {
    
//    @property (nonatomic, copy) NSMutableArray *mutArr1;
//    @property (nonatomic) NSMutableArray *mutArr2;
    
    NSArray *arr = @[@"111", @"222", @"333", @"444"];
    NSArray *arr2 = @[@"999", @"888", @"777"];
    
//    // print
//    [self printArray:self.mutArr1];
//    [self printArray:self.mutArr2];
    
    self.mutArr1 = [NSArray arrayWithArray:arr];
    self.mutArr2 = [NSArray arrayWithArray:arr];

    NSMutableArray *arr3 = self.mutArr1;
    NSMutableArray *arr4 = self.mutArr2;
    
    self.mutArr1 = nil;
    self.mutArr2 = nil;
    

    self.mutArr1 = [NSArray arrayWithArray:arr2];
    self.mutArr2 = [NSArray arrayWithArray:arr2];
    
    int a = 4;
    // print
    [self printArray:arr3];
    [self printArray:arr4];
}

-(void)printArray:(NSArray *)array {
//    NSLog(@"%@", [array description]);
    for (int i = 0; i < array.count; i++) {
        NSLog(@"%@ Array[%d]=%@", NSStringFromSelector(_cmd), i, array[i]);
    }
}

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
