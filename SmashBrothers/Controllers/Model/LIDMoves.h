//
//  LIDMoves.h
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LIDMoves : NSObject


@property(nonatomic, copy, readonly)NSString *moveName;

- (instancetype)initWithMove:(NSString*)moveName;

@end

@interface LIDMoves (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id>*)movesDictionary;

@end


NS_ASSUME_NONNULL_END
