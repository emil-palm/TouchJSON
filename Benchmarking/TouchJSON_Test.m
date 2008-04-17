#import "CJSONDeserializer.h"

NSDictionary *Test(NSData *theData)
{
NSString *theContentString = [[[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding] autorelease];
NSDictionary *theOutput = [[CJSONDeserializer deserializer] deserialize:theContentString];
return(theOutput);
}