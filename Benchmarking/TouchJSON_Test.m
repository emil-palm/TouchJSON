#import "CJSONDeserializer.h"

NSDictionary *Test(NSData *theData)
{
NSDictionary *theOutput = [[CJSONDeserializer deserializer] deserialize:theData error:NULL];
return(theOutput);
}