//
//  Artist.m
//  WikiBand
//
//  Created by Steve Hernandez on 8/17/14.
//  Copyright (c) 2014 Steve Hernandez. All rights reserved.
//

#import "Artist.h"

@implementation Artist

- (instancetype)initWithArtist:(NSString *)artistName
                         image:(UIImage *)artistImage
                           bio:(NSString *)artistBio
                         image:(UIImage *)artistDetailImage
                     birthName:(NSString *)artistBirthName
                          born:(NSString *)artistBornDate
                    occupation:(NSString *)artistOccupation
{
    
    self = [super init];
    if (self != nil) {
        _artistName = [artistName copy];
        _artistImage = artistImage;
        _artistBio = [artistBio copy];
        _artistDetailImage = artistDetailImage;
        _artistBirthName = artistBirthName;
        _artistBornDate = artistBornDate;
        _artistOccupation = artistOccupation;
    }
    
    return self;
}

+ (NSArray *)artistItems {
    return @[
             [[Artist alloc] initWithArtist:@"Beck" image:[UIImage imageNamed:@"Beck"] bio:@"Beck Hansen (born Bek David Campbell, July 8, 1970[4]), known by the stage name Beck, is an American musician, singer-songwriter and multi-instrumentalist. Beck rose to fame in the early 1990s with his lo-fi, sonically experimental style, and he became well known for creating musical collages of a wide range of styles. His later recordings encompass folk, funk, soul, hip hop, alternative rock, country, and psychedelia. He has released 12 studio albums, as well as several non-album singles and a book of sheet music. Born in Los Angeles in 1970, Beck discovered hip hop and folk music in his teens and began to perform locally at coffeehouses and clubs. He moved to New York City in 1989 and became involved in the city's small but intense anti-folk movement. " image:[UIImage imageNamed:@"BeckDetailsHero"] birthName:@"Bek David Campbell" born:@"July 8, 1970" occupation:@"Singer-songwriter, musician, producer"],
             [[Artist alloc] initWithArtist:@"Childish Gambino" image:[UIImage imageNamed:@"ChildishGambino"] bio:@"Donald McKinley Glover[1] /ˈɡlʌvər/ (born September 25, 1983), also known by his stage name Childish Gambino, is an American actor, writer, comedian, rapper, and producer. He first came to attention for his work with Derrick Comedy and subsequently became a writer for the NBC comedy series 30 Rock." image:[UIImage imageNamed:@"ChildishDetailsHero"] birthName:@"Donald McKinley Glover" born:@"September 25, 1983" occupation:@"Actor, writer, comedian, rapper, singer, record producer"],
             [[Artist alloc] initWithArtist:@"Jay Z" image:[UIImage imageNamed:@"JayZ"] bio:@"Shawn Corey Carter (born December 4, 1969),[2] known by his stage name Jay-Z (sometimes stylized as Jay Z, or JAY Z),[3][4][5] is an American rapper, record producer, and entrepreneur. He is one of the most financially successful hip-hop artists and entrepreneurs in America. In 2014, Forbes estimated Carter's net worth at nearly $520 million.[" image:[UIImage imageNamed:@"JayZDetailsHero"] birthName:@"Donald McKinley Glover" born:@"September 25, 1983" occupation:@"Actor, writer, comedian, rapper, singer, record producer"],
             [[Artist alloc] initWithArtist:@"Justin Timberlake" image:[UIImage imageNamed:@"JustinTimberlake"] bio:@"Justin Randall Timberlake (born January 31, 1981) is an American singer-songwriter, actor, record producer, businessman, and philanthropist. Born in Memphis, Tennessee, he appeared on the television shows Star Search and The All-New Mickey Mouse Club as a child. In the late 1990s, Timberlake rose to prominence as one of the two lead vocalists and youngest member of the boy band NSYNC" image:[UIImage imageNamed:@"JustinDetailsHero"] birthName:@"Justin Randall Timberlake" born:@"January 31, 1981" occupation:@"Singer-songwriter, actor, record producer, businessman"],
             [[Artist alloc] initWithArtist:@"Kanye West" image:[UIImage imageNamed:@"KanyeWest"] bio:@"Kanye Omari West (/ˈkɑːnjeɪ/; born June 8, 1977) is an American rapper, songwriter, record producer, film director, entrepreneur, and fashion designer. West first gained prominence as a producer for Roc-A-Fella Records; he achieved recognition for his work on rapper Jay-Z's The Blueprint (2001), as well as hit singles for musical artists including Alicia Keys, Ludacris, and Janet Jackson. His style of production originally used high-pitched vocal samples from soul songs incorporated with his own drums and instruments." image:[UIImage imageNamed:@"KanyeDetailsHero"] birthName:@"Kanye Omari West" born:@"June 8, 1977" occupation:@"Rapper, singer-songwriter, record producer, director, fashion designer, entrepreneur"],
             [[Artist alloc] initWithArtist:@"Katy Perry" image:[UIImage imageNamed:@"KatyPerry"] bio:@"Katheryn Elizabeth Katy Hudson (born October 25, 1984), better known by her stage name Katy Perry, is an American singer, songwriter, and actress. She had limited exposure to secular music during her childhood and pursued a career in gospel music as a teenager, releasing her debut studio album, Katy Hudson, in 2001. She moved to Los Angeles the following year to venture into secular music." image:[UIImage imageNamed:@"KatyDetailsHero"] birthName:@"Katheryn Elizabeth Hudson" born:@"October 25, 1984" occupation:@"Singer, songwriter, actress, businesswoman, philanthropist"],
             [[Artist alloc] initWithArtist:@"Madonna" image:[UIImage imageNamed:@"Madonna"] bio:@"Madonna Louise Ciccone[2] (/tʃɪˈkoʊneɪ/) (born August 16, 1958) is an American singer, songwriter, actress, and businesswoman. She achieved popularity by pushing the boundaries of lyrical content in mainstream popular music and imagery in her music videos, which became a fixture on MTV. Madonna is known for reinventing both her music and image, and for retaining a standard of autonomy within the recording industry." image:[UIImage imageNamed:@"MadonnaDetailsHero"] birthName:@"Madonna Louise Ciccone" born:@"August 16, 1958" occupation:@"Singer-songwriter, actress, businesswomen, dancer, author, director, record producer"],
             [[Artist alloc] initWithArtist:@"The National" image:[UIImage imageNamed:@"TheNational"] bio:@"The National is an American indie rock band formed in Cincinnati, Ohio, United States, in 1999, and currently based in Brooklyn. The band's lyrics, which have been described as dark, melancholy and difficult to interpret,[1] are written and sung by Matt Berninger, a baritone." image:[UIImage imageNamed:@"TheNationalDetailsHero"] birthName:@"The National" born:@"1999-present" occupation:@"Indie Rock, post punk revival"],
             [[Artist alloc] initWithArtist:@"Willie Nelson" image:[UIImage imageNamed:@"WillieNelson"] bio:@"Willie Hugh Nelson (/wɪli nɛlsən/; born April 29, 1933) is an American country music singer-songwriter, as well as an author, poet, actor, and activist. The critical success of the album Shotgun Willie (1973), combined with the critical and commercial success of Red Headed Stranger (1975) and Stardust (1978), made Nelson one of the most recognized artists in country music. He was one of the main figures of outlaw country, a subgenre of country music that developed in the late 1960s as a reaction to the conservative restrictions of the Nashville sound." image:[UIImage imageNamed:@"WillieDetailsHero"] birthName:@"Willie Hugh Nelson" born:@"April 29, 1933" occupation:@"Country, progressive country, country rock, outlaw country, alternative country"],
             [[Artist alloc] initWithArtist:@"Carrie Underwood" image:[UIImage imageNamed:@"CarrieUnderwood"] bio:@"Carrie Marie Underwood (born March 10, 1983) is an American country music singer, songwriter, and actress. She rose to fame as the winner of the fourth season of American Idol in 2005. Underwood has since become one of the most prominent mainstream recording artists in the music industry, setting and breaking several records throughout her career. This is finished." image:[UIImage imageNamed:@"CarrieDetailsHero"] birthName:@"Carrie Marie Underwood" born:@"March 10, 1983" occupation:@"Singer, songwriter, actress"]
             
             ];
}

@end
