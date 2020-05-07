//
//  LIDCharacterController.h
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LIDCharacters.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LIDCharacterController : NSObject

+(void)fetchWithCharacters:(void(^)(NSArray <LIDCharacters *>*))completion;
+(void)fetchthumbNailWithCharacter:(LIDCharacters*)character completion:(void(^)(UIImage *))completion;
+(void)fetchMovesWithCharacter:(LIDCharacters *)character completion:(void(^)(NSArray<NSString *>*))completion;

@end

NS_ASSUME_NONNULL_END
