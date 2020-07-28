class Infor{

  final String Moviename;
  final String Cast;
  final String Director;
  final String Genre;
  final String image;
  final String Descrption;
  final int id;
  final DateTime Releasedate;
  int Slidervalue;

  Infor({this.Moviename, this.Cast, this.Director, this.Genre,this.image,this.Descrption,this.id,this.Releasedate,this.Slidervalue,});
}
List<Infor> data = [
  Infor(
    image: '300.jpg',
    id: 300,
    Moviename: 'The Irishman  ',
    Cast: ' Robert De Niro ,Joe Pesci ,Ray Romano ,Bobby Cannavale ',
    Director: ' Martin Scorsese',
    Genre: 'drama',
    Slidervalue: 0,
    Descrption: 'In the 1950s, truck driver Frank Sheeran gets involved with Russell Bufalino and his Pennsylvania crime family. As Sheeran climbs the ranks to become a top hit man, he also goes to work for Jimmy Hoffa -- a powerful Teamster tied to organized crime.',
    Releasedate: DateTime(2019, 09, 27),
  ),
  Infor(
    image: '301.jpg',
    id: 301,
    Moviename: 'Little Women',
    Cast: 'Saoirse Ronan, Emma Watson,Florence Pugh,Eliza Scanlen',
    Director: ' Greta Gerwig',
    Genre: 'drama',
    Slidervalue: 0,
    Descrption: 'In the years after the Civil War, Jo March lives in New York and makes her living as a writer, while her sister Amy studies painting in Paris. Amy has a chance encounter with Theodore, a childhood crush who proposed to Jo but was ultimately rejected. Their oldest sibling, Meg, is married to a schoolteacher, while shy sister Beth develops a devastating illness that brings the family back together.',
    Releasedate: DateTime(2019, 12, 07),
  ),
  Infor(
    image: '302.jpg',
    id: 302,
    Moviename: 'Joker',
    Cast: 'Saoirse Ronan, Emma Watson,Florence Pugh,Eliza Scanlen',
    Director: 'Todd Phillips',
    Genre: 'drama',
    Slidervalue: 0,
    Descrption: "Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he's part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.",
    Releasedate: DateTime(2019, 10, 2),
  ),
  Infor(
    image: '303.jpg',
    id: 303,
    Moviename: 'The Tax Collector',
    Cast: 'Bobby Soto,Cinthya Carmona,George Lopez',
    Director: ' David Ayer',
    Genre: 'drama',
    Slidervalue: 0,
    Descrption: 'Two enforcers for a crime lord face an uncertain future when an old rival reappears.',
    Releasedate: DateTime(2020, 08, 07),
  ),
  Infor(
    image: '400.jpg',
    id: 400,
    Moviename: 'Chemical Hearts',
    Cast: 'Austin Abrams , Lili Reinhart',
    Director: ' Richard Tanne',
    Genre: 'romance',
    Slidervalue: 0,
    Descrption: 'Chemical Hearts is an upcoming American romantic drama film, written, produced, and directed by Richard Tanne, based on the novel Our Chemical Hearts by Krystal Sutherland',
    Releasedate: DateTime(2020, 10, 21),
  ),
  Infor(
    image: '401.jpg',
    id: 401,
    Moviename: 'After We Collided',
    Cast: 'Josephine Langford,Hero Fiennes Tiffin,Dylan Sprouse',
    Director: 'Roger Kumble',
    Genre: 'romance',
    Slidervalue: 0,
    Descrption: 'Tessa finds herself struggling with her complicated relationship with Hardin; she faces a dilemma that could change their lives forever.',
    Releasedate: DateTime(2020, 09, 03),
  ),
  Infor(
    image: '402.jpg',
    id: 402,
    Moviename: 'After',
    Cast: 'Josephine Langford,Hero Fiennes-Tiffin',
    Director: 'Jenny Gage',
    Genre: 'romance',
    Slidervalue: 0,
    Descrption: "Tessa Young is a dedicated student, dutiful daughter and loyal girlfriend to her high school sweetheart. Entering her first semester of college, Tessa's guarded world opens up when she meets Hardin Scott, a mysterious and brooding rebel who makes her question all she thought she knew about herself -- and what she wants out of life.",
    Releasedate: DateTime(2019, 04, 11),
  ),
  Infor(
    image: '403.jpg',
    id: 403,
    Moviename: 'Happiest Season',
    Cast: 'Kristen Stewart,Mackenzie Davis,Mary Steenburgen',
    Director: ' Clea DuVall',
    Genre: 'romance',
    Slidervalue: 0,
    Descrption: "A young woman with a plan to propose to her girlfriend while at her family's annual holiday party discovers her partner hasn't yet come out to her conservative parents.",
    Releasedate: DateTime(2020, 11, 25),
  ),
Infor(
image: '111.jpg',
id : 111,
Moviename:'John Wick',
Cast:'Keanu Reeves, Michael Nyqvist, Alfie Allen',
Director:'Chad Stahelski, David Leitch',
Genre: 'action',
Slidervalue: 0,
Descrption: 'An ex-hit-man comes out of retirement to track down the gangsters that killed his dog and took everything from him.',
Releasedate: DateTime(2014, 11, 14)
),
Infor(
image: '112.jpg',
id : 112,
Moviename:'The Fate of the Furious',
Cast:'Vin Diesel, Jason Statham, Dwayne Johnson',
Director:'F. Gary Gray',
Genre: 'action',
Slidervalue: 0,
Descrption: 'When a mysterious woman seduces Dominic Toretto into the world of terrorism and a betrayal of those closest to him, the crew face trials that will test them as never before.',
Releasedate: DateTime(2017, 04, 12)
),
Infor(
image: '113.jpg',
id : 113,
Moviename:'Mad Max: Fury Road',
Cast:' Tom Hardy, Charlize Theron, Nicholas Hoult',
Director:'George Miller ',
Genre: 'action',
Slidervalue: 0,
Descrption: 'In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search for her homeland with the aid of a group of female prisoners, a psychotic worshiper, and a drifter named Max.',
Releasedate: DateTime(2015, 05, 15)
),
Infor(
image: '114.jpg',
id : 114,
Moviename:'Avengers: Endgame',
Cast:'Robert Downey Jr., Chris Evans, Mark Ruffalo',
Director:' Joe Russo, Anthony Russo',
Genre: 'action',
Slidervalue: 0,
Descrption: 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.',
Releasedate: DateTime(2019, 04, 26)
),
Infor(
image: '115.jpg',
id : 115,
Moviename:'Extraction',
Cast:' Chris Hemsworth, Randepp huda, Ryder Lerum',
Director:' Sam Hargrave',
Genre: 'action',
Slidervalue: 0,
Descrption: 'Tyler Rake, a fearless black market mercenary, embarks on the most deadly extraction of his career when he\'s enlisted to rescue the kidnapped son of an imprisoned international crime lord.',
Releasedate: DateTime(2020, 04, 24)
),
Infor(
image: '116.jpg',
id : 116,
Moviename:'The King\'s Man',
Cast:' Gemma Arterton, Daniel Brühl, Aaron Taylor-Johnson',
Director:'Matthew Vaughn',
Genre: 'action',
Slidervalue: 0,
Descrption: 'In the early years of the 20th century, the Kingsman agency is formed to stand against a cabal plotting a war to wipe out millions.',
Releasedate: DateTime(2020, 12, 25)
),
Infor(
image: '117.jpg',
id : 117,
Moviename:'Tenet',
Cast:'John David Washington, Robert Pattinson, Elizabeth Debicki',
Director:'Christopher Nolan',
Genre: 'action',
Slidervalue: 0,
Descrption: 'Armed with only one word -- Tenet -- and fighting for the survival of the entire world, the Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.',
Releasedate: DateTime(2020, 07, 17)
),
Infor(
image: '118.jpg',
id : 118,
Moviename:'No Time to Die',
Cast:' Ana de Armas, Daniel Craig, Léa Seydoux',
Director:'Cary Joji Fukunaga',
Genre: 'action',
Slidervalue: 0,
Descrption: 'James Bond has left active service. His peace is short-lived when Felix Leiter, an old friend from the CIA, turns up asking for help, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.',
Releasedate: DateTime(2020, 11, 11)
),
Infor(
image: '119.jpg',
id : 119,
Moviename:'Wonder Woman 2',
Cast:' Connie Nielsen, Pedro Pascal, Gal Gadot',
Director:'Patty Jenkins',
Genre: 'action',
Slidervalue: 0,
Descrption: 'Fast forward to the 1980s as Wonder Woman\'s next big screen adventure finds her facing two all-new foes: Max Lord and The Cheetah.',
Releasedate: DateTime(2020, 08, 12)
),
Infor(
image: '120.jpg',
id : 120,
Moviename:'Top Gun: Maverick',
Cast:' Tom Cruise, Jennifer Connelly, Val Kilmer',
Director:' Joseph Kosinski',
Genre: 'action',
Slidervalue: 0,
Descrption: 'After more than thirty years of service as one of the Navy\'s top aviators, Pete Mitchell is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him.',
Releasedate: DateTime(2020, 12, 07)
),
Infor(
  image: '220.jpg',
  id : 220,
Moviename:"The Mask",

Cast:" Jim Carrey,Cameron Diaz",
Director:"Chuck Russell",
Genre:"comedy",
Slidervalue:0,
Descrption:"Stanley, an easy-going bank employee, "
"turns into an eccentric green-skinned "
"being who can bend reality after"
"wearing a wooden mask that is inhabited by Loki who is a Norse god",
Releasedate:DateTime(1994,7,28),
),
Infor(
  image: '221.jpg',
  id : 221,
Moviename:"Step Brothers",
Cast:" Will Ferell,John C Reilly",
Director:"Adam McKay",
Genre:"comedy",
Slidervalue:0,
Descrption:"Brennan and Dale, two middle-aged men who still live with their parents, are forced to live together when their parents get married.",
Releasedate:DateTime(2008,7,25),
),
Infor(
  image: '222.jpg',
  id : 222,
Moviename:"We're the Millers",
Cast:" Jennifer Aniston , Casey and Kenny Emma Roberts",
Director:"Rawson Marshall Thurber",
Genre:"comedy",
Slidervalue:0,
Descrption:"David, a drug dealer, is forced by his boss to smuggle drugs from Mexico. He hires a stripper, a petty thief and a teenage neighbour and forms a fake family to help him smuggle the drugs.",
Releasedate:DateTime(2013,8,30),
),
Infor(
  image: '223.jpg',
  id : 223,
Moviename:"Anchorman: The Legend of Ron Burgundy",
Cast:" Will Ferrell  "
"Christina Applegate ",
Director:"Adam McKay",
Genre:"comedy",
Slidervalue:0,
Descrption:"A chauvinistic host of a top-rated American news programme is threatened with the arrival of an ambitious female reporter which starts a bitter battle of the sexes",
Releasedate:DateTime(2004,6,28),
),
Infor(
  image: '224.jpg',
  id : 224,
Moviename:"Deadpool",
Cast:" Ryan Reynolds,Morena Baccarin",
Director:"Tim Miller",
Genre:"comedy",
Slidervalue:0,
Descrption:"Ajax, a twisted scientist, experiments on Wade Wilson, a mercenary, to cure him of cancer and give him healing powers. However, the experiment leaves Wade disfigured and he decides to exact revenge.",
Releasedate:DateTime(2016,2,12),
),
];