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
             [[Artist alloc] initWithArtist:@"Beck" image:[UIImage imageNamed:@"Beck"] bio:@"Beck Hansen (born Bek David Campbell, July 8, 1970[4]), known by the stage name Beck, is an American musician, singer-songwriter and multi-instrumentalist. Beck rose to fame in the early 1990s with his lo-fi, sonically experimental style, and he became well known for creating musical collages of a wide range of styles. His later recordings encompass folk, funk, soul, hip hop, alternative rock, country, and psychedelia. He has released 12 studio albums, as well as several non-album singles and a book of sheet music. Born in Los Angeles in 1970, Beck discovered hip hop and folk music in his teens and began to perform locally at coffeehouses and clubs. He moved to New York City in 1989 and became involved in the city's small but intense anti-folk movement. " image:[UIImage imageNamed:@"BeckDetailsHero"] birthName:@"Beck David Campbell" born:@"July 8, 1970" occupation:@"Singer-songwriter, musician, producer,songwriter, musician, producer,songwriter, musician, producer,songwriter, musician, producer,songwriter, musician, producer,songwriter, musician, producer"],
             [[Artist alloc] initWithArtist:@"Childish Gambino" image:[UIImage imageNamed:@"ChildishGambino"] bio:@"Donald McKinley Glover /ˈɡlʌvər/ (born September 25, 1983), also known by his stage name Childish Gambino, is an American actor, writer, comedian, rapper, singer, and producer. He first came to attention for his work with Derrick Comedy and subsequently became a writer for the NBC comedy series 30 Rock. He is perhaps best known for his role as college student Troy Barnes on the NBC series Community. After several self-released albums and mixtapes, Glover signed to Glassnote Records in 2011 as Childish Gambino. He released Camp on Glassnote on November 15, 2011. His second studio album, Because the Internet, was released on December 10, 2013. Glover was nominated for two Grammy Awards in 2014, Best Rap Album for Because the Internet and Best Rap Performance for his single, '3005'." image:[UIImage imageNamed:@"ChildishDetailsHero"] birthName:@"Donald McKinley Glover" born:@"September 25, 1983" occupation:@"Actor, writer, comedian, rapper, singer, record producer"],
             [[Artist alloc] initWithArtist:@"Jay Z" image:[UIImage imageNamed:@"JayZ"] bio:@"Shawn Corey Carter (born December 4, 1969), known by his stage name Jay Z (formerly Jay-Z), is an American rapper, record producer, and entrepreneur. He is one of the most financially successful hip-hop artists and entrepreneurs in America. In 2014, Forbes estimated Carter's net worth at nearly $520 million. He is one of the world's best-selling artists of all time, having sold more than 100 million records, while receiving 19 Grammy Awards for his musical work, and numerous additional nominations. Consistently ranked as one of the greatest rappers ever, he was ranked number one by MTV in their list of The Greatest MCs of All-Time in 2006. Three of his albums, Reasonable Doubt (1996), The Blueprint (2001), and The Black Album (2003), are considered landmarks in the genre with all of them featured in Rolling Stone '​s list of the 500 greatest albums of all time. As an entrepreneur and investor, Jay Z co-owns the 40/40 Club, and is the co-creator of the clothing line Rocawear. He is the former president of Def Jam Recordings, co-founder of Roc-A-Fella Records, and the founder of Roc Nation. He also founded the sports agency Roc Nation Sports and is a certified NBA and MLB sports agent. As an artist, he holds the record for most number one albums by a solo artist on the Billboard 200 with 13. Jay-Z also has had four number ones on the Billboard Hot 100, one as lead artist. On December 11, 2009, Jay-Z was ranked as the tenth-most successful artist of the 2000s by Billboard as well as the fifth top solo male artist and fourth top rapper behind Eminem, Nelly, and 50 Cent. He was also ranked the 88th greatest artist of all time by Rolling Stone. Jay-Z married American R&B singer Beyoncé in 2008. They have a daughter named Blue Ivy Carter, born January 7, 2012." image:[UIImage imageNamed:@"JayZDetailsHero"] birthName:@"Donald McKinley Glover" born:@"September 25, 1983" occupation:@"Actor, writer, comedian, rapper, singer, record producer"],
             
             [[Artist alloc] initWithArtist:@"Justin Timberlake" image:[UIImage imageNamed:@"JustinTimberlake"] bio:@"Justin Randall Timberlake (born January 31, 1981) is an American singer, songwriter, and actor. Born in Memphis, Tennessee, he appeared on the television shows Star Search and The All-New Mickey Mouse Club as a child. In the late 1990s, Timberlake rose to prominence as one of the two lead vocalists and youngest member of the boy band NSYNC, which eventually became one of the best-selling boy bands of all time. During the group's hiatus, Timberlake released his solo studio albums Justified (2002) and FutureSex/LoveSounds (2006); the former spawned hits 'Cry Me a River' and 'Rock Your Body', while the latter debuted atop the U.S. Billboard 200 and produced the Billboard Hot 100 number-one singles 'SexyBack', 'My Love', and 'What Goes Around... Comes Around'. With each album exceeding sales of seven million copies worldwide, he was established as one of the most commercially successful singers of the decade. From 2007 through 2012, Timberlake focused on his acting career, effectively putting his music career on hiatus; he held starring roles in the films The Social Network, Bad Teacher, In Time, and Friends with Benefits. In 2013, Timberlake resumed his music career with his third and fourth albums The 20/20 Experience and The 20/20 Experience – 2 of 2, exploring neo soul with the song structures of 1960s and 1970s rock. The former became the best-selling record of the year and spawned hits 'Suit & Tie' and 'Mirrors', while the latter is preceded by lead single 'Take Back the Night' and followed by 'Not a Bad Thing'. Time named him one of the 100 most influential people in the world the same year. Timberlake's work has earned him numerous awards, including nine Grammy Awards and four Emmy Awards. His other ventures include record label Tennman Records, fashion label William Rast, and the restaurants Destino and Southern Hospitality."  image:[UIImage imageNamed:@"JustinDetailsHero"] birthName:@"Justin Timberlake" born:@"September 25, 1983" occupation:@"Singer-songwriter, actor, record producer, businessman"],
             
             [[Artist alloc] initWithArtist:@"Kanye West" image:[UIImage imageNamed:@"KanyeWest"] bio:@"Kanye Omari West (/ˈkɑːnjeɪ/; born June 8, 1977) is an American rapper, songwriter, record producer, director, entrepreneur, and fashion designer. West first gained prominence as a producer for Roc-A-Fella Records; he achieved recognition for his work on rapper Jay-Z's The Blueprint (2001), as well as hit singles for musical artists including Alicia Keys, Ludacris, and Janet Jackson. His style of production originally used high-pitched vocal samples from soul songs incorporated with his own drums and instruments. He later broadened his influences to include 1970s R&B, baroque pop, trip hop, arena rock, house, folk, alternative, electronica, synthpop, industrial, and classical music. West was raised in a middle-class household in Chicago, Illinois, and began rapping in the third grade, becoming involved in the city's hip hop scene. West attended art school for one semester before dropping out to pursue music entirely in the late 1990s. Although his real desire was to become a rapper, record executives did not take West seriously, viewing him as a producer first and foremost. After being signed to Roc-A-Fella in 2002, West released his debut album The College Dropout in 2004 to commercial and critical acclaim. The baroque-inspired Late Registration followed in 2005, and Graduation in 2007. West switched rapping for singing on his emotive 2008 effort 808's & Heartbreak, and embraced maximalism on 2010's My Beautiful Dark Twisted Fantasy. Following several collaborations, West released his sixth album, Yeezus, in 2013. West is one of the world's best-selling artists of all time, having sold more than 21 million albums and 66 million digital downloads. He has won a total of 21 Grammy Awards, making him one of the most awarded artists of all-time and the most Grammy-awarded artist of his age. Time has named West one of the 100 most influential people in the world. He has also been included in a number of Forbes annual lists. Three of his albums rank on Rolling Stone's 2012 '500 Greatest Albums of All Time' list; two of his albums feature at #8 and #1 respectively in Pitchfork Media's The 100 Best Albums of 2010-2014. West's background and style, from his debut album, deviated from the then-dominant 'gangsta' persona in hip hop, and he would later alter the genre stylistically as rappers adopted his alternative aesthetic. An outspoken and controversial celebrity, West has often been the source of incidents at award shows. His interest in fashion has also attracted media attention and differentiates him from other rappers. West runs his own record label GOOD Music and has directed several short films." image:[UIImage imageNamed:@"KanyeDetailsHero"] birthName:@"Kanye Omari West" born:@"June 8, 1977" occupation:@"Rapper, singer-songwriter, record producer, director, fashion designer, entrepreneur"],
             [[Artist alloc] initWithArtist:@"Katy Perry" image:[UIImage imageNamed:@"KatyPerry"] bio:@"Katheryn Elizabeth Hudson (born October 25, 1984), better known by her stage name Katy Perry, is an American singer and songwriter. She had limited exposure to secular music during her childhood and pursued a career in gospel music as a teenager. Perry signed with Red Hill Records, and released her debut studio album, Katy Hudson, in 2001. She moved to Los Angeles the following year to venture into secular music. After being dropped by The Island Def Jam Music Group and Columbia Records, she signed a deal with Capitol Records in April 2007. Perry rose to fame in 2008 with the release of the singles 'I Kissed a Girl' – which had an attention-grabbing and somewhat controversial lyrical theme – and 'Hot n Cold' from her second album, a pop rock record titled One of the Boys. Her third album, Teenage Dream (2010), ventured into disco, and contained the U.S. Billboard Hot 100 chart-topping singles 'California Gurls', 'Teenage Dream', 'Firework', 'E.T.', and 'Last Friday Night (T.G.I.F.)' as well as the number-three single 'The One That Got Away'. The album became the first by a female artist to produce five number-one Billboard Hot 100 songs, and the second overall after Michael Jackson's album Bad (1987). In March 2012, she reissued the album as Teenage Dream: The Complete Confection, which produced the chart-topping singles 'Part of Me' and 'Wide Awake'. Her fourth album, Prism, was released in 2013, and is influenced by pop and dance. It has spawned the number-one singles 'Roar' and 'Dark Horse'. Her songwriting is mostly done in collaboration with others, especially Dr. Luke and Max Martin, and in songs such as 'Firework' and 'Roar' she stresses themes of self-empowerment and self-esteem. Perry is known for an idiosyncratic and fun-based sense of personal fashion that incorporates bright colors and food-based themes. Her concert performances feature elaborate stagings and costumings. Perry has received many awards, including three Guinness World Records, and been included in the Forbes list of 'Top-Earning Women In Music' for 2011, 2012, and 2013. Throughout her career, she has sold 11 million albums and 81 million singles worldwide, making her one of the best-selling artists of all time. Perry has also made celebrity endorsements and released perfumes Purr, Meow!, and Killer Queen. In July 2012, she released an autobiographical documentary titled Katy Perry: Part of Me, which concentrated on her life as a touring artist and the dissolution of her brief marriage to English actor and comedian Russell Brand in the early 2010s." image:[UIImage imageNamed:@"KatyDetailsHero"] birthName:@"Katheryn Elizabeth Hudson" born:@"October 25, 1984" occupation:@"Singer, songwriter, actress, businesswoman, philanthropist"],
             [[Artist alloc] initWithArtist:@"Madonna" image:[UIImage imageNamed:@"Madonna"] bio:@"Madonna Louise Ciccone (/tʃɪˈkoʊni/; born August 16, 1958) is an American singer, songwriter, actress, and businesswoman. She achieved popularity by pushing the boundaries of lyrical content in mainstream popular music and imagery in her music videos, which became a fixture on MTV. Madonna is known for reinventing both her music and image, and for maintaining her autonomy within the recording industry. Music critics have acclaimed her musical productions which have also been known to induce controversy. Often referred to as the 'Queen of Pop', she is cited as an influence among other artists around the world. Born in Bay City, Michigan, Madonna attended the University of Michigan School of Music, Theatre & Dance before moving to New York City to pursue a career in modern dance. After performing in the music groups Breakfast Club and Emmy, she signed with Sire Records (an affiliate of Warner Bros. Records) in 1982 and released her self-titled debut album the following year. She followed it with a series of commercially successful albums, including the Grammy Award winners Ray of Light (1998) and Confessions on a Dance Floor (2005). Throughout her career, she has written and produced most of her songs, with many of them reaching number one on the record charts, including 'Like a Virgin', 'Into the Groove', 'Papa Don't Preach', 'Like a Prayer', 'Vogue', 'Frozen', 'Music', 'Hung Up', and '4 Minutes'. Madonna's popularity was further enhanced by her film roles; she won a Golden Globe Award for Best Actress for Evita (1996) while most of her other films have been panned by critics. Her other ventures include fashion design, writing children's books, and filmmaking. She has been acclaimed as a businesswoman, particularly after she founded entertainment company Maverick (including the label Maverick Records) in 1992 as a joint venture with Time Warner. In 2007, she signed an unprecedented US $120 million 360 deal with Live Nation. Madonna has sold more than 300 million records worldwide and is recognized as the best-selling female recording artist of all time by Guinness World Records. According to the Recording Industry Association of America (RIAA), she is the best-selling female rock artist of the 20th century and the second best-selling female artist in the United States, with 64.5 million certified albums. Billboard ranked her at number two, behind only The Beatles, on the Billboard Hot 100 All-Time Top Artists, making her the most successful solo artist in the history of American singles chart. The magazine also declared her as the top-touring female artist of all time. She became one of the five founding members of the UK Music Hall of Fame and was inducted into the Rock and Roll Hall of Fame in her first year of eligibility." image:[UIImage imageNamed:@"MadonnaDetailsHero"] birthName:@"Madonna Louise Ciccone" born:@"August 16, 1958" occupation:@"Singer-songwriter, actress, businesswomen, dancer, author, director, record producer"],
             [[Artist alloc] initWithArtist:@"The National" image:[UIImage imageNamed:@"TheNational"] bio:@"The National may refer to: News media: The National (CBC), a Canadian Broadcasting Corporation television news programme The National (Abu Dhabi), a newspaper published in the United Arab Emirates The National (sports newspaper), a defunct U.S. sports newspaper The National (Papua New Guinea), a newspaper in Papua New Guinea The National (Scotland), a newspaper in Scotland Other: The National (band), an American indie rock band The National (album), an album by the band of the same name The National (curling), a curling tournament National Football Scouting, an NFL scouting organization" image:[UIImage imageNamed:@"TheNationalDetailsHero"] birthName:@"The National" born:@"1999-present" occupation:@"Indie Rock, post punk revival"],
             [[Artist alloc] initWithArtist:@"Willie Nelson" image:[UIImage imageNamed:@"WillieNelson"] bio:@"Willie Hugh Nelson (/wɪli nɛlsən/; born April 29, 1933) is an American singer-songwriter, musician, guitarist, author, poet, actor, and activist. The critical success of the album Shotgun Willie (1973), combined with the critical and commercial success of Red Headed Stranger (1975) and Stardust (1978), made Nelson one of the most recognized artists in country music. He was one of the main figures of outlaw country, a subgenre of country music that developed in the late 1960s as a reaction to the conservative restrictions of the Nashville sound. Nelson has acted in over 30 films, co-authored several books, and has been involved in activism for the use of biofuels and the legalization of marijuana. Born during the Great Depression, and raised by his grandparents, Nelson wrote his first song at age seven and joined his first band at ten. During high school, he toured locally with the Bohemian Polka as their lead singer and guitar player. After graduating from high school, in 1950, he joined the Air Force but was later discharged due to back problems. After his return, Nelson attended Baylor University for two years but dropped out because he was succeeding in music. During this time, he worked as a disc jockey in Texas radio stations and a singer in honky tonks. Nelson moved to Vancouver, Washington, where he wrote 'Family Bible' and recorded the song 'Lumberjack' in 1956. In 1958, he moved to Houston, Texas after signing a contract with D Records. He sang at the Esquire Ballroom weekly and he worked as a disk jockey. During that time, he wrote songs that would become country standards, including 'Funny How Time Slips Away', 'Hello Walls', 'Pretty Paper', and 'Crazy'. In 1960 he moved to Nashville, Tennessee, and later signed a publishing contract with Pamper Music which allowed him to join Ray Price's band as a bassist. In 1962, he recorded his first album, ...And Then I Wrote. Due to this success, Nelson signed in 1964 with RCA Victor and joined the Grand Ole Opry the following year. After mid-chart hits in the late 1960s and the early 1970s, Nelson retired in 1972 and moved to Austin, Texas. The rise of the popularity of hippie music in Austin motivated Nelson to return from retirement, performing frequently at the Armadillo World Headquarters. In 1973, after signing with Atlantic Records, Nelson turned to outlaw country, including albums such as Shotgun Willie and Phases and Stages. In 1975, he switched to Columbia Records, where he recorded the critically acclaimed album, Red Headed Stranger. The same year, he recorded another outlaw country album, Wanted! The Outlaws, along with Waylon Jennings, Jessi Colter, and Tompall Glaser. During the mid-1980s, while creating hit albums like Honeysuckle Rose and recording hit songs like 'On the Road Again', 'To All the Girls I've Loved Before', and 'Pancho & Lefty', he joined the country supergroup The Highwaymen, along with fellow singers Johnny Cash, Waylon Jennings, and Kris Kristofferson. In 1990 Nelson's assets were seized by the Internal Revenue Service, which claimed that he owed US $32,000,000. It was later discovered that his accountants, Price Waterhouse, did not pay Nelson's taxes for years. The difficulty of paying his outstanding debt was aggravated by weak investments he had made during the 1980s. In 1991, Nelson released The IRS Tapes: Who'll Buy My Memories? in 1992, the profits of the double album, destined to the IRS, and the auction of Nelson's assets cleared his debt. During the 1990s and 2000s, Nelson continued touring extensively, and released albums every year. Reviews ranged from positive to mixed. He explored genres such as reggae, blues, jazz, and folk. Nelson made his first movie appearance in the 1979 film The Electric Horseman, followed by other appearances in movies and on television. Nelson is a major liberal activist and the co-chair of the advisory board of the National Organization for the Reform of Marijuana Laws, which is in favor of marijuana legalization. On the environmental front, Nelson owns the bio-diesel brand Willie Nelson Biodiesel, which is made from vegetable oil. Nelson is also the honorary chairman of the Advisory Board of the Texas Music Project, the official music charity of the state of Texas." image:[UIImage imageNamed:@"WillieDetailsHero"] birthName:@"Willie Hugh Nelson" born:@"April 29, 1933" occupation:@"Country, progressive country, country rock, outlaw country, alternative country"],
             [[Artist alloc] initWithArtist:@"Carrie Underwood" image:[UIImage imageNamed:@"CarrieUnderwood"] bio:@"Carrie Marie Underwood (born March 10, 1983) is an American singer, songwriter, and actress. She rose to fame as the winner of the fourth season of American Idol in 2005. Underwood has since become one of the most prominent mainstream recording artists in the music industry, setting and breaking several records throughout her career. Her achievements led her to be inducted into the Grand Ole Opry in 2008 and into the Oklahoma Music Hall of Fame in 2009. She has won a vast array of awards, including seven Grammy Awards, sixteen Billboard Music Awards, eleven Academy of Country Music Awards and eight American Music Awards, along with being nominated for a Golden Globe Award for Best Original Song. Her debut album, Some Hearts, was released in 2005. Bolstered by the huge crossover success of the singles 'Jesus, Take the Wheel' and 'Before He Cheats', it went on to become the fastest selling debut country album in Nielsen SoundScan history, the best-selling solo female debut album in country music history and the best-selling country album of the last ten years. Underwood won three Grammy Awards for the album, including Best New Artist. Her second album, Carnival Ride, released in 2007, had one of the biggest ever opening weeks by a female artist and earned Underwood two Grammy Awards, for the singles 'Last Name' and 'I Told You So'. Her next two albums, 2009's Play On and 2012's Blown Away, were both their year's second best-selling release by a female artist. The former spawned the successful single 'Cowboy Casanova' and the latter's single 'Blown Away' won Underwood a Grammy Award. In 2014, she released her first compilation album. It spawned the crossover single 'Something in the Water', which earned Underwood her seventh Grammy Award. With more than 64 million records sold globally, her tour revenues and a net worth estimated by Forbes at over $110 million, Underwood is the biggest American Idol earner of all time. Recognized by Rolling Stone as the female vocalist of her generation in any genre and by Billboard as Country Music's reigning Queen, Underwood is the only solo country artist in the 2000s to have a number one hit on the Billboard Hot 100 and the first and only country artist to ever debut at number one on the Hot 100, as 'Inside Your Heaven' topped the chart in 2005. She is also the female country artist with the most No. 1 hits on the Billboard Hot Country Songs chart, from 1991 to present, having 14 number one's and breaking her own Guinness Book record of ten. Some Hearts was named the No. 1 country album of the 2000s by Billboard and she was the top-ranked female artist on Billboard's Best Country Artists of the 2000s list. Time has listed Underwood as one of the 100 most influential people in the world." image:[UIImage imageNamed:@"CarrieDetailsHero"] birthName:@"Carrie Marie Underwood" born:@"March 10, 1983" occupation:@"Singer, songwriter, actress, American Idol Contestant, Grammy Awards"]
             
             ];
}

@end
