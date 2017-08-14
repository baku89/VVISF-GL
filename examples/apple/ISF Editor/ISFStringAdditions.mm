#import "ISFStringAdditions.h"
#import "ISFKit.h"

#include <string>




using namespace std;
using namespace VVISF;




@implementation NSString (ISFStringAdditions)


- (NSString *) stringByDeletingLastAndAddingFirstSlash	{
	NSString	*returnMe = nil;
	NSUInteger	myLength = [self length];
	if (myLength < 1)
		return nil;
	BOOL		endsWSlash = ([self characterAtIndex:myLength-1]=='/')?YES:NO;
	BOOL		startsWSlash = ([self characterAtIndex:0]=='/')?YES:NO;
	if (startsWSlash && myLength<2)
		endsWSlash = NO;
	if (startsWSlash && endsWSlash)
		returnMe = [self substringWithRange:NSMakeRange(0,myLength-1)];
	else if (startsWSlash && !endsWSlash)
		returnMe = self;
	else if (!startsWSlash && endsWSlash)
		returnMe = [NSString stringWithFormat:@"/%@",[self substringWithRange:NSMakeRange(0,myLength-1)]];
	else if (!startsWSlash && !endsWSlash)
		returnMe = [NSString stringWithFormat:@"/%@",self];
	return returnMe;
}
- (NSRange) lexFunctionCallInRange:(NSRange)funcNameRange addVariablesToArray:(NSMutableArray *)varArray	{
	if (varArray==nil)
		return NSMakeRange(0,0);
	unsigned long		searchStartIndex = funcNameRange.location + funcNameRange.length;
	unsigned long		lexIndex = searchStartIndex;
	int					openGroupingCount = 0;
	NSRange				substringRange;
	substringRange.location = searchStartIndex+1;
	do	{
		switch ([self characterAtIndex:lexIndex])	{
			case '(':
			case '{':
				++openGroupingCount;
				break;
			case ')':
			case '}':
				--openGroupingCount;
				if (openGroupingCount == 0)	{
					substringRange.length = lexIndex - substringRange.location;
					NSString	*groupString = [self substringWithRange:substringRange];
					groupString = (groupString==nil) ? nil : [groupString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
					if (groupString!=nil && varArray!=nil)
						[varArray addObject:groupString];
				}
				break;
			case ',':
				if (openGroupingCount==1)	{
					substringRange.length = lexIndex - substringRange.location;
					NSString	*groupString = [self substringWithRange:substringRange];
					groupString = (groupString==nil) ? nil : [groupString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
					if (groupString!=nil && varArray!=nil)
						[varArray addObject:groupString];
					substringRange.location = lexIndex + 1;
				}
				break;
		}
		++lexIndex;
		if (lexIndex >= [self length])
			return NSMakeRange(0,0);
	} while (openGroupingCount>0);
	NSRange			rangeToReplace = NSMakeRange(funcNameRange.location, lexIndex-funcNameRange.location);
	return rangeToReplace;
}
- (NSUInteger) numberOfLines	{
	NSUInteger		numberOfLines;
	NSUInteger		index;
	NSUInteger		stringLength = [self length];
	
	for (index=0, numberOfLines=0; index<stringLength; numberOfLines++)
		index = NSMaxRange([self lineRangeForRange:NSMakeRange(index, 0)]);
	return numberOfLines;
}
- (id) objectFromJSONString	{
	//NSLog(@"%s",__func__);
	NSData			*tmpData = [self dataUsingEncoding:NSUTF8StringEncoding];
	NSError			*nsErr = nil;
	id				returnMe = (tmpData==nil) ? nil : [NSJSONSerialization JSONObjectWithData:tmpData options:NSJSONReadingAllowFragments error:&nsErr];
	if (returnMe == nil)
		NSLog(@"\t\terr: %s, %@. %@",__func__,nsErr,self);
	return returnMe;
}
- (id) mutableObjectFromJSONString	{
	//NSLog(@"%s",__func__);
	NSData			*tmpData = [self dataUsingEncoding:NSUTF8StringEncoding];
	NSError			*nsErr = nil;
	id				returnMe = (tmpData==nil) ? nil : [NSJSONSerialization JSONObjectWithData:tmpData options:NSJSONReadingAllowFragments|NSJSONReadingMutableContainers error:&nsErr];
	if (returnMe == nil)
		NSLog(@"\t\terr: %s, %@. %@",__func__,nsErr,self);
	return returnMe;
}
- (NSString *) prettyJSONString	{
	//NSLog(@"%s",__func__);
	NSData			*selfData = [self dataUsingEncoding:NSUTF8StringEncoding];
	NSError			*nsErr = nil;
	id				tmpObj = (selfData==nil) ? nil : [NSJSONSerialization JSONObjectWithData:selfData options:NSJSONReadingAllowFragments error:&nsErr];
	NSData			*tmpData = (tmpObj==nil) ? nil : [NSJSONSerialization dataWithJSONObject:tmpObj options:NSJSONWritingPrettyPrinted error:&nsErr];
	if (tmpData == nil || [tmpData length] < 1)
		NSLog(@"\t\terr: %s: %@.  %@",__func__,nsErr,self);
	NSString		*returnMe = (tmpData==nil) ? nil : [[[NSString alloc] initWithData:tmpData encoding:NSUTF8StringEncoding] autorelease];
	return returnMe;
}
- (NSNumber *) parseAsBoolean	{
	if (![self isKindOfClass:[NSString class]])
		return nil;
	string		tmpStr([self UTF8String]);
	ISFVal		tmpVal = ParseStringAsBool(tmpStr);
	if (tmpVal.isBoolVal() && tmpVal.getBoolVal())
		return [NSNumber numberWithBool:YES];
	return [NSNumber numberWithBool:NO];
	/*
	NSNumber		*returnMe = nil;
	if (self!=nil && [self isKindOfClass:[NSString class]])	{
		if ([self localizedCaseInsensitiveCompare:@"YES"]==NSOrderedSame	||
		[self localizedCaseInsensitiveCompare:@"TRUE"]==NSOrderedSame)	{
			returnMe = [NSNumber numberWithBool:YES];
		}
		else if ([self localizedCaseInsensitiveCompare:@"NO"]==NSOrderedSame	||
		[self localizedCaseInsensitiveCompare:@"FALSE"]==NSOrderedSame)	{
			returnMe = [NSNumber numberWithBool:NO];
		}
	}
	return returnMe;
	*/
}
- (NSNumber *) numberByEvaluatingString	{
	if (![self isKindOfClass:[NSString class]])
		return nil;
	string		tmpStr([self UTF8String]);
	ISFVal		tmpVal = ISFValByEvaluatingString(tmpStr);
	if (!tmpVal.isFloatVal())
		return nil;
	return [NSNumber numberWithDouble:tmpVal.getDoubleVal()];
}


@end

