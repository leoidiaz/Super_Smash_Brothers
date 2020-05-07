//
//  LIDCharacters.h
//  SmashBrothers
//
//  Created by Leonardo Diaz on 5/7/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LIDCharacters : NSObject

@property(nonatomic, copy, readonly)NSString *name;
@property(nonatomic, copy, readonly)NSString *thumbnail;
@property(nonatomic, copy,  readonly)NSString *moves;

-(instancetype)initWithCharacterName:(NSString *)characterName thumbnail:(NSString *)thumbnail moves:(NSString *)moves;

@end

@interface LIDCharacters (JSONConvertable)
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id>*)dictionary;

@end


NS_ASSUME_NONNULL_END
