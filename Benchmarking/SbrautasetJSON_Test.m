#import "NSString+SBJSON.h"

NSDictionary *Test(NSData *theData)
{
NSString *theContentString = [[[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding] autorelease];
NSDictionary *theOutput = [theContentString JSONValue];
return(theOutput);
}