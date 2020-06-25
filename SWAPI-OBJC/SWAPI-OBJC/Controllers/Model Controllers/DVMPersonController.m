//
//  DVMPersonController.m
//  SWAPI-OBJC
//
//  Created by Hunter McNeil on 6/25/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

#import "DVMPersonController.h"

static NSString * const baseURLString = @"https://swapi.dev/api";
static NSString * const peopleComponent = @"people";

@implementation DVMPersonController

+ (void)fetchPersonWithSearchTerm:(NSString *)searchTerm completion:(void (^)(DVMPerson * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *peopleURL = [baseURL URLByAppendingPathComponent:peopleComponent];
    NSURL *finalURL = [peopleURL URLByAppendingPathComponent:searchTerm];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error fetching the Person - %@", error);
            completion(nil);
        }
        
        if (data)
        {
            NSDictionary *topLevel = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            
            if (!topLevel)
            {
                NSLog(@"Error parsing the data - %@", error);
                return completion(nil);
            }
            
            DVMPerson *person = [[DVMPerson alloc] initWithDictionary:topLevel];
            completion(person);
        }
    }] resume];
}

@end
