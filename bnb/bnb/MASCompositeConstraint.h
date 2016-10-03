//
//  MASCompositeConstraint.h
//  bnb
//
//  Created by 谭 卓勋 on 16/9/28.
//  Copyright (c) 2016年 Tidus. All rights reserved.
//


#import "MASConstraint.h"
#import "MASUtilities.h"

/**
 *	A group of MASConstraint objects
 */
@interface MASCompositeConstraint : MASConstraint

/**
 *	Creates a composite with a predefined array of children
 *
 *	@param	children	child MASConstraints
 *
 *	@return	a composite constraint
 */
- (id)initWithChildren:(NSArray *)children;

@end
