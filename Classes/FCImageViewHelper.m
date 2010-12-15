/*
 
 TiY (tm) - an adaptable iPhone application for self-management of type 1 diabetes
 Copyright (C) 2010  Anders Sigfridsson
 
 TiY (tm) is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 TiY (tm) is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with TiY (tm).  If not, see <http://www.gnu.org/licenses/>.
 
 */

//
//  FCImageViewHelper.m
//  Future2
//
//  Created by Anders Sigfridsson on 14/12/2010.
//

#import "FCImageViewHelper.h"


@implementation UIImageView (FCImageViewHelper)

-(void)configureImageViewForCategory:(FCCategory *)category {
	
	// icon
	
	self.image = category.icon;
	
	// border and background color
	
	UIColor *color = [[FCColorCollection sharedColorCollection] colorForCID:category.cid];
	
	if (color == nil && category.colorIndex != nil) {
	
		NSInteger colorIndex = [category.colorIndex integerValue];
		color = [[FCColorCollection sharedColorCollection] colorForIndex:colorIndex];
	}
	
	[self setBorderAndBackgroundWithColor:color];
}

-(void)setBorderAndBackgroundWithColor:(UIColor *)color {
	
	if (color != nil) {
	
		CALayer *caLayer = self.layer;
	
		[caLayer setBorderWidth:2.0];
		[caLayer setCornerRadius:5.0];
		[caLayer setBorderColor:[color CGColor]];
	
		self.backgroundColor = [color colorWithAlphaComponent:0.5f];
	
	} else {
	
		NSLog(@"FCImageViewHelper setBorderAndBackgroundColorWithColor: || Warning, color == nil! Did nothing.");
	} 
}

@end
