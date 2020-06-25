//
//  DVMPersonController.h
//  SWAPI-OBJC
//
//  Created by Hunter McNeil on 6/25/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMPersonController : NSObject

+ (void)fetchPersonWithSearchTerm:(NSString *)searchTerm completion:(void (^) (DVMPerson *)) completion;

@end

NS_ASSUME_NONNULL_END
