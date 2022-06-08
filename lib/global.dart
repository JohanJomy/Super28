// library my_prj.globals;
int table = 0;

bool soundValue = true;
bool visible = false;
int? currentValue = 0;

int beginPlay = 3;
int trumpOpening = 3;
int endOfTrick = 3;

double height = 0;
double width = 0;

double multiplier = 0;

bool isTablet = false;
bool isPhone = true;

bool distributed = false;
bool show = true;
bool biding_visible = false;

String yourBid = '';
// table

double heightOfMainPart = height * (15 / 20);
double heightOfTable = heightOfMainPart * (18 / 20);

double heightOfBox = (heightOfMainPart - heightOfTable) / 2;
double widthOfBox = heightOfTable / 4;

double widthOfTable = (isPhone)? width - (heightOfBox * 2) : width * (14 / 20);

double distanceBetween = 7.1 * multiplier;

double heightForInnerPart = heightOfTable - distanceBetween;
double widthOfInnerPart = widthOfTable - distanceBetween;

// for the cards

double heightOfTheCard = 9.7 * multiplier;
double widthOfTheCard = 6.2 * multiplier;

double widthOfTheCards = widthOfTheCard + widthOfTheCard * (60/100);
double heightOfTheCards = heightOfTheCard;

double gapBtwBoxes = (((heightOfMainPart - heightOfBox*2) - widthOfBox*2)/3);

int i = 2;

double dealerIconSize = 54;

Map <int,double> vertical  = 
  {
    1: heightOfMainPart - heightOfTheCards,
    2: gapBtwBoxes * 2 + widthOfBox + heightOfBox + (widthOfBox - heightOfTheCard)/2,
    3: gapBtwBoxes + heightOfBox + (widthOfBox - heightOfTheCard)/2,
    4: 0,
    5: gapBtwBoxes   + heightOfBox + (widthOfBox - heightOfTheCard)/2,
    6: gapBtwBoxes*2 + widthOfBox + heightOfBox + (widthOfBox - heightOfTheCard)/2,
    };

  Map <int,double> horizontal  = 
  {
    1: width/2 - widthOfTheCards/2,
    2: width - widthOfTheCards,
    3: width - widthOfTheCards,
    4: width/2 - widthOfTheCards/2,
    5: 0,
    6: 0,
    };

Map <int,double> dealer_vertical  = 
  {
    // 1: heightOfMainPart - heightOfTheCards,
    1: heightOfMainPart - (heightOfBox + distanceBetween/2 + heightOfTheCard),
    2: gapBtwBoxes * 2 + widthOfBox + heightOfBox + (widthOfBox - heightOfTheCard)/2,
    3: gapBtwBoxes + heightOfBox + (widthOfBox - heightOfTheCard)/2,
    4: heightOfBox + distanceBetween/2,
    5: gapBtwBoxes   + heightOfBox + (widthOfBox - heightOfTheCard)/2,
    6: gapBtwBoxes*2 + widthOfBox + heightOfBox + (widthOfBox - heightOfTheCard)/2,
    };

  Map <int,double> dealer_horizontal  = 
  {
    1: width/2 - widthOfTheCards/2, //
    2: width - widthOfTheCards - distanceBetween/2 - heightOfBox,
    3: width - widthOfTheCards - distanceBetween/2 - heightOfBox,
    4: width/2 - widthOfTheCards/2, //
    5: heightOfBox + distanceBetween/2,
    6: heightOfBox + distanceBetween/2,
    };

List <String> cards = [
    'C6','C7','C8','C9','CT','CA','CJ','CK','CQ',
    'D6','D7','D8','D9','DT','DA','DJ','DK','DQ',
    'S6','S7','S8','S9','ST','SA','SJ','SK','SQ',
    'H6','H7','H8','H9','HT','HA','HJ','HK','HQ'
    ];

Map <String, int> card_values = {'J' : 3, '9' : 2, 'A' : 1, 'T' : 1, 'K' : 0, 'Q' : 0, '8' : 0, '7' : 0, '6' : 0};

Map <int, List> cards_of_players = {1:[], 2:[], 3:[], 4:[], 5:[], 6:[]};

double biddingBoxWidth = 180;
double biddingBoxHeight = 250;

Map <int, String> bidValues = {1: '', 2: '', 3: '', 4: '', 5: '', 6: ''};

Map<int, List> dealerIconStart = {
  1: [heightOfBox + heightOfTable - distanceBetween/2 - dealerIconSize, width/2 - dealerIconSize/2],
  2: [10, 20],
  3: [10, 20],
  4: [10, 20],
  5: [10, 20],
  6: [10, 20],
};

Map<int, List> dealerIconEnd = {
  1: [heightOfBox + heightOfTable - dealerIconSize/2 - distanceBetween/4, width/2 - distanceBetween/2],
  2: [10, 20],
  3: [10, 20],
  4: [10, 20],
  5: [10, 20],
  6: [10, 20],
};