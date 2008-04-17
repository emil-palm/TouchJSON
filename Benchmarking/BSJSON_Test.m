#import "NSDictionary+BSJSONAdditions.h"

NSDictionary *Test(NSData *theData)
{
NSString *theContentString = [[[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding] autorelease];
NSDictionary *theOutput = [NSDictionary dictionaryWithJSONString:theContentString];
return(theOutput);
}