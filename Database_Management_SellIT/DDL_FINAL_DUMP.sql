IF NOT EXISTS (SELECT * FROM SYS.databases WHERE name = 'MSIS-2603-PROJECT-TECHWIZARDS')
CREATE DATABASE [MSIS-2603-PROJECT-TECHWIZARDS]
GO

USE [MSIS-2603-PROJECT-TECHWIZARDS]
GO

If OBJECT_ID('EMPLOYEE', 'U') IS NOT NULL
Drop TABLE EMPLOYEE;

If  OBJECT_ID('SELLER', 'U') IS NOT NULL
DROP TABLE SELLER;

If  OBJECT_ID('BUYER', 'U') IS NOT NULL
DROP TABLE BUYER;

If  OBJECT_ID('CATEGORY', 'U') IS NOT NULL
DROP TABLE CATEGORY;

If  OBJECT_ID('SUBCATEGORY', 'U') IS NOT NULL
DROP TABLE SUBCATEGORY;

If  OBJECT_ID('LISTING', 'U') IS NOT NULL
DROP TABLE LISTING;

If  OBJECT_ID('RATING', 'U') IS NOT NULL
DROP TABLE RATING;

If  OBJECT_ID('BID', 'U') IS NOT NULL
DROP TABLE BID;

If  OBJECT_ID('PAYMENT', 'U') IS NOT NULL
DROP TABLE PAYMENT;

If  OBJECT_ID('PURCHASE', 'U') IS NOT NULL
DROP TABLE PURCHASE;
Go

If  OBJECT_ID('ADVERTISEMENT', 'U') IS NOT NULL
DROP TABLE ADVERTISEMENT;
Go

If  OBJECT_ID('SHIPPING', 'U') IS NOT NULL
DROP TABLE SHIPPING;
Go

---------------------------------------------------------------------------------------------------------
--CREATING EMPLOYEE TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE EMPLOYEE(
EMPLOYEE_ID        INT           NOT NULL IDENTITY(1001,1),
NAME               VARCHAR(50)   NOT NULL,
PHONE              VARCHAR(20)   NOT NULL,
STREET_NAME        VARCHAR(50)   NOT NULL,
CITY               VARCHAR(20)   NOT NULL,
STATE              VARCHAR(20)   NOT NULL,
ZIPCODE            CHAR(5)       NOT NULL,
EMAIL_ID           VARCHAR(50)   NOT NULL,
PASSWORD           VARCHAR(20)   NOT NULL,
EMPLOYEE_TYPE      VARCHAR(10)   NOT NULL, 
CHECK (EMPLOYEE_TYPE IN ('BU','ADMIN')),
ACCT_CREATION_DATE DATETIME      NOT NULL, 
CONSTRAINT PK_EMPLOYEE PRIMARY KEY CLUSTERED (EMPLOYEE_ID))

Go

INSERT INTO EMPLOYEE(NAME,PHONE,STREET_NAME,CITY,STATE,ZIPCODE,EMAIL_ID,PASSWORD,EMPLOYEE_TYPE,ACCT_CREATION_DATE) 
VALUES
('Robert Pattinson','669-889-2273','57 N. Shirley Road','Santa Clara'  ,'California',92703,'rpattinson@sellit.com','************','BU'   ,'2015-10-01 07:11:54'),
('Thomas Satchel'  ,'408-629-3612','551 Brook Ave.'    ,'San Jose'     ,'California',95127,'tsatchel@sellit.com'  ,'*********'   ,'BU'   ,'2015-10-17 13:12:53'),
('Amy Schumer'     ,'415-986-9273','16 N. York St.'    ,'San Jose'     ,'California',95112,'aschumer@sellit.com'  ,'******'      ,'Admin','2015-04-10 13:12:23'),
('Mitchell Archam' ,'717-980-3284','8652 Fairfield Ave.','Vacaville'   ,'California',95687,'marcham@sellit.com'   ,'*********'   ,'Admin','2016-04-17 13:12:53'),
('Rachel Green'    ,'669-364-1817','17638 Devon Ave'   ,'Saratoga'     ,'California',95070,'rgreen@sellit.com'    ,'*********'   ,'BU'   ,'2016-03-15 11:12:08'),
('Noel Glover'     ,'669-232-4221','381 El Dorado Lane','San Francisco','California',94080,'nglover@sellit.com'   ,'*********'   ,'Admin','2016-03-23 21:12:12')

Go
---------------------------------------------------------------------------------------------------------
--CREATING SELLER TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE SELLER(
SELLER_ID          INT           NOT NULL IDENTITY(2001,1),
NAME               VARCHAR(20)   NOT NULL,
PHONE              VARCHAR(20)   NOT NULL,
STREET_NAME        VARCHAR(50)   NOT NULL,
CITY               VARCHAR(20)   NOT NULL,
STATE              VARCHAR(20)   NOT NULL,
ZIPCODE            CHAR(5)       NOT NULL,
REGION             VARCHAR(12)   NOT NULL,
EMAIL_ID           VARCHAR(25)   NOT NULL,
PASSWORD           VARCHAR(20)   NOT NULL,
ACCOUNT_TYPE       VARCHAR(20)   NOT NULL, 
CHECK (ACCOUNT_TYPE IN ('PREMIUM','NORMAL')),
CREATION_DATE      DATETIME      NOT NULL,
EXPIRATION_DATE    DATETIME      NOT NULL,
MEMBERSHIP_FEE     INT           NOT NULL,
PAYMENT_MODE       VARCHAR(10)   DEFAULT 'CC''PAYPAL',    
BANK_ACCOUNT       INT           NOT NULL,
ROUTING_NUMBER     INT           NOT NULL,
BANK_NAME          VARCHAR(20)   NOT NULL,
PAYMENT_DATE       DATETIME,                             
CONSTRAINT PK_SELLER PRIMARY KEY CLUSTERED (SELLER_ID))

Go

---------------------------------------------------------------------------------------------------------
--CREATING INDEX ON SELLER_ID SELLER TABLE
---------------------------------------------------------------------------------------------------------
CREATE UNIQUE INDEX i_SELLER_ID on SELLER(SELLER_ID)
GO

INSERT INTO SELLER(NAME,PHONE,STREET_NAME,CITY,STATE,ZIPCODE,REGION,EMAIL_ID,PASSWORD,ACCOUNT_TYPE,CREATION_DATE,EXPIRATION_DATE,MEMBERSHIP_FEE,PAYMENT_MODE,BANK_ACCOUNT,ROUTING_NUMBER,BANK_NAME,PAYMENT_DATE) 
VALUES
('Garrett D. Green','313-372-4572','408 Windsor Drive'  ,'South El Monte','California'    ,91733,'West'     ,'ggreen@gmail.com'      ,'********'     ,'Premium','2015-10-24 07:00:00','2016-10-24 00:00:00',200 ,'CC'   ,191234678,23467,'Wells Fargo'    ,'2015-10-24 07:00:00'),
('Joe E'           ,'408-306-6832','46 Old Chapel Road' ,'Sunnyvale'     ,'California'    ,94086,'West'     ,'Joe1@gmail.com'        ,'************' ,'Normal' ,'2015-10-25 09:15:20','9999-12-31 00:00:00',0   ,NULL   ,101987651,98765,'Bank Of America',NULL),
('Bruce Jhonson'   ,'408-997-6320','2735 Star Route'    ,'Chicago'       ,'Illinois'      ,60601,'MidWest'  ,'jhonsonbruce@gmail.com','*******'      ,'Premium','2015-10-26 08:15:20','2016-10-26 08:15:20',200,'Paypal',110543217,54321,'Chase'          ,'2016-01-26 08:15:20'),
('Sara Cowell'     ,'669-600-9854','2308 Poco Mas Drive','Dallas'        ,'Texas'         ,75212,'South'    ,'Sara123@gmail.com'     ,'******'       ,'Normal' ,'2016-01-27 08:15:20','9999-12-31 12:59:59',0   ,NULL   ,110986754,98675,'Wells Fargo'    ,NULL),
('Anita R. Linden' ,'256-996-8335','4338 New Creek Road','Anniston'      ,'Alabama'       ,36201,'South'    ,'anita@gmail.com'       ,'*********'    ,'Premium','2016-02-12 23:15:20','2017-02-12 23:15:20',200,'Paypal',986574123,65741,'Wells Fargo'    ,'2016-02-12 23:15:20'),
('Rodolfo Horgan'  ,'914-346-9584','651 Pallet Street'  ,'West Nyack'    ,'New York'      ,10994,'NorthEast','morgan@apple.com'      ,'*********'    ,'Premium','2016-02-15 08:15:20','2017-02-15 18:15:20',200,'CC'    ,854675932,54675,'Chase'          ,'2016-02-15 08:15:20'),
('Chelsea Sumner'  ,'337-531-2110','510 Sarah Drive'    ,'Leesville'     ,'Louisiana'     ,71446,'South'    ,'sumner@gmail.com'      ,'*******'      ,'Normal' ,'2016-03-30 06:15:45','9999-12-31 12:59:59',0   ,NULL   ,236974586,97458,'Chase'          ,NULL),
('Cindy C. Ross'   ,'254-522-7262','2939 Sussex Court'  ,'Breckenridge'  ,'Texas'         ,76024,'South'    ,'cindyross@gmail.com'   ,'*********'    ,'Normal' ,'2016-04-15 08:25:25','9999-12-31 12:59:59',0   ,NULL   ,121248967,24897,'Bank Of America',NULL),
('Steven Bratton'  ,'239-999-5361','2679 Village View Drive','Fort Myers','Florida'       ,33901,'South'    ,'bratton@yahoo.com'     ,'******'       ,'Premium','2016-04-25 21:25:25','2017-04-25 21:25:25',200,'Paypal',157915492,79154,'Bank Of America','2016-04-25 21:25:25'),
('Leon M. Vick'    ,'513-989-1109','3976 Jenna Lane'    ,'Cincinnati'    ,'Ohio'          ,52175,'Midwest'  ,'vick@yahoo.com'        ,'*******'      ,'Premium','2016-04-27 21:25:25','2017-04-27 21:25:25',200 ,'CC'   ,665486416,48641,'Bank Of America','2016-04-27 21:25:25'),
('Cody Swift'      ,'908-597-3592','96 Bridgeton Drive' ,'Piedmont'      ,'South Carolina',29673,'South'    ,'Codyswift@gmail.com'   ,'*********'    ,'Premium','2016-07-27 21:25:25','2017-07-27 21:25:25',200,'Paypal',168276491,43256,'Chase'          ,'2016-07-27 21:25:25'),
('Drew Montgomery' ,'969-191-4436','9586 Lake Road'     ,'Santa Monica'  ,'California'    ,90403,'West'     ,'DrewM348@gmail.com'    ,'**********'   ,'Normal' ,'2016-08-27 21:25:25','9999-12-31 12:59:59',0  ,NULL    ,782731761,73256,'Wells Fargo'    ,NULL),
('Lisa Tate'       ,'206-139-9024','57 Jockey Hollow Ave.','Norristown'  ,'Pennsylvania'  ,19401,'NorthEast','Lisa@gmail.com'        ,'********'     ,'Premium','2016-09-27 21:25:25','2017-09-27 21:25:25',200,'CC'    ,871564927,98297,'Chase'          ,'2016-09-27 21:25:25'),
('Liam Rowe'       ,'523-156-7211','17 Ann St.'         ,'Antioch'       ,'Texas'         ,37013,'South'    ,'Liam.Rowe@gmail.com'   ,'**********'   ,'Normal' ,'2016-10-27 21:25:25','9999-12-31 12:59:59',0  ,NULL    ,178782769,19089,'Wells Fargo'    ,NULL),
('Kyle Hale'       ,'878-499-2231','7475 Charles Ave.'  ,'Mahopac'       ,'New York'      ,10541,'NorthEast','Kyle.Hale@gmail.com'   ,'***********'  ,'Normal' ,'2016-10-27 21:25:25','9999-12-31 12:59:59',0  ,NULL    ,273684659,87167,'Bank Of America',NULL)

Go
---------------------------------------------------------------------------------------------------------
--CREATING BUYER TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE BUYER(     
BUYER_ID           INT           NOT NULL IDENTITY(3001,1),
NAME               VARCHAR(50)   NOT NULL,
PHONE              VARCHAR(20)   NOT NULL,
STREET_NAME        VARCHAR(50)   NOT NULL,
CITY               VARCHAR(20)   NOT NULL,
STATE              VARCHAR(20)   NOT NULL,
ZIPCODE            CHAR(5)       NOT NULL,
REGION             VARCHAR(12)   NOT NULL,
EMAIL_ID           VARCHAR(50)   NOT NULL,
PASSWORD           VARCHAR(20)   NOT NULL,
ACCT_CREATION_DATE DATETIME      NOT NULL, 
CONSTRAINT PK_BUYER PRIMARY KEY CLUSTERED (BUYER_ID))

Go

---------------------------------------------------------------------------------------------------------
--CREATING INDEX ON BUYER_ID BUYER TABLE
---------------------------------------------------------------------------------------------------------
CREATE UNIQUE INDEX i_BUYER_ID on BUYER(BUYER_ID)
GO

INSERT INTO BUYER(NAME,PHONE,STREET_NAME,CITY,STATE,ZIPCODE,REGION,EMAIL_ID,PASSWORD,ACCT_CREATION_DATE)
VALUES
 ('Oscar A. Drake'    ,'314-694-7894','1524 Hawks Nest Lane','San Francisco','California'   ,97852,'West'     ,'oscardrake@yahoo.com'   ,'*******'   ,'2015-10-24 15:00:00'),
 ('Angie T. Kettle'   ,'612-863-6549','2321 Rocket Drive'   ,'Minneapolis'  ,'Minnesota'    ,55402,'MidWest'  ,'angiekettle@hotmail.com','********'  ,'2015-10-25 07:00:00'),
 ( 'Elizabeth N. Posey','205-671-5256','4294 Strother Street','Birmingham'   ,'Alabama'      ,35203,'South'    ,'elizaP@gmail.com'       ,'**********','2015-11-14 12:00:00'),
 ('Joann J. Cook'     ,'303-316-8332','3614 Logan Lane'     ,'Denver'       ,'Colorado'     ,80220,'West'     ,'joanncook@apple.com'    ,'******'    ,'2016-02-27 06:08:00'),
 ('Lyle R. Sakai'     ,'931-743-7933','2234 Glory Road'     ,'Nashville'    ,'Tenesse'      ,37210,'South'    ,'sakai@icloud.com'       ,'*******'   ,'2016-08-28 07:00:00'),
 ('Alma Milano'       ,'252-403-0099','7900 East Saxton Street','Mesa'      ,'Arizona'      ,85203,'West'     ,'milano@gmail.com'       ,'********'  ,'2016-09-29 19:00:00'),
 ('Sara Cowell'       ,'669-600-9854','2308 Poco Mas Drive' ,'Dallas'       ,'Texas'        ,75212,'South'    ,'Sara123@gmail.com'      ,'******'    ,'2016-09-30 07:15:00'),
 ('Yaroslav Zuev'     ,'484-480-9540','2897 Horseshoe Lane' ,'Philadelphia' ,'Pennsylvania' ,19108,'NorthEast','yaroslav@me.com'        ,'*******'   ,'2016-10-31 09:25:00'),
 ('Rodolfo M. Horgan' ,'914-346-9584','651 Pallet Street'   ,'West Nyack'   ,'New York'     ,10994,'NorthEast','morgan@apple.com'       ,'********'  ,'2016-10-12 17:00:00'),
 ('Victor Ribeiro Dias','715-643-9635','725 Mercer Street'  ,'Boyceville'   ,'Wisconsin'    ,54725,'MidWest'  ,'victor@gmail.com'       ,'******'    ,'2016-11-02 07:00:00'),
 ('Toby Morgan'       ,'408-642-1243','8938 E. High Noon St.','Bethpage'    ,'New York'     ,11714,'NorthEast','Tobymorgan@gmail.com'   ,'**********','2016-11-12 14:06:32'),
 ('Virgil Moss'       ,'232-874-6325','30 West White St.'   ,'Euless'       ,'Texas'        ,76039,'South'    ,'VirgilM123@gmail.com'   ,'********'  ,'2016-11-13 17:02:00'),
 ('Bob Erickson'      ,'643-214-7565','9622 Hudson Road'    ,'Anaheim'      ,'California'   ,92806,'West'     ,'Boberickson@gmail.com'  ,'*********' ,'2016-11-14 18:01:02'),
 ('Rhonda Collier'    ,'408-532-8642','38 State Street'     ,'Sarasota'     ,'Florida'      ,34231,'South'    ,'RhondaC@gmail.com'      ,'*******'   ,'2016-11-19 22:11:28'),
 ('Gustavo Bailey'    ,'764-232-6567','7150 West Summer Ave.','ApexNorth'   ,'Carolina'     ,27502,'South'    ,'GustavoB@gmail.com'     ,'*********' ,'2016-11-20 17:45:42')

GO
---------------------------------------------------------------------------------------------------------
--CREATING CATEGORY TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE CATEGORY(
CATEGORY_ID       INT          NOT NULL IDENTITY(7001,1),
DESCRIPTION       VARCHAR(50)  NOT NULL, 
CONSTRAINT PK_CATEGORY PRIMARY KEY CLUSTERED (CATEGORY_ID))

GO

INSERT INTO CATEGORY(DESCRIPTION) VALUES
('Electronics'),
('Books'),
('Furniture'),
('Vehicles')

GO
---------------------------------------------------------------------------------------------------------
--CREATING SUBCATEGORY TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE SUBCATEGORY(
SUBCATEGORY_ID    INT          NOT NULL IDENTITY(8001,1),
DESCRIPTION       VARCHAR(50)  NOT NULL,
CATEGORY_ID       INT          NOT NULL FOREIGN KEY REFERENCES CATEGORY(CATEGORY_ID),
CUTOFF            INT          NOT NULL,
AVG_PRICE	      INT          NOT NULL,
DEPRECIATION      INT          NOT NULL,
CONSTRAINT PK_SUBCATEGORY PRIMARY KEY CLUSTERED (SUBCATEGORY_ID))

GO

INSERT INTO SUBCATEGORY(DESCRIPTION,CATEGORY_ID,CUTOFF,AVG_PRICE,DEPRECIATION) VALUES
('Mobile Phone'   ,7001,20,554.5,15),
('Camera'         ,7001,20,700  ,15),
('Television'     ,7001,15,0    ,10),
('Microwave'      ,7001,20,0    ,15),
('Tablet'         ,7001,25,1080 ,13),
('Course textbook',7002,14,140   ,7),
('Fiction'        ,7002,8 ,0     ,7),
('Couch'          ,7003,25,1408  ,8),
('Chair'          ,7003,21,0    ,19),
('Table'          ,7003,21,0     ,5),
('Bed'            ,7003,21,0    ,19),
('Dining Table'   ,7003,18,0    ,13),
('Cabinet'        ,7003,25,0    ,10),
('SUV'            ,7004,30,25000,25),
('Sedan'          ,7004,30,27000,30),
('Bike'           ,7004,30,10500,24)

GO
---------------------------------------------------------------------------------------------------------
--CREATING LISTING TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE LISTING(
LISTING_ID         INT           NOT NULL IDENTITY(4001,1),
SELLER_ID          INT           NOT NULL REFERENCES SELLER(SELLER_ID),
DESCRIPTION        VARCHAR(150)  NOT NULL,
CATEGORY_ID        INT           NOT NULL FOREIGN KEY REFERENCES CATEGORY(CATEGORY_ID),
SUBCATEGORY_ID     INT           NOT NULL FOREIGN KEY REFERENCES SUBCATEGORY(SUBCATEGORY_ID),
LISTING_DATE_CREATED DATETIME    NOT NULL,
ORIGINAL_PRICE     DECIMAL(10,2) NOT NULL,
PURCHASE_DATE      DATETIME      NOT NULL,
SELLING_ZIPCODE    CHAR(5)       NOT NULL,
LISTING_STATUS     VARCHAR(10)   NOT NULL,
CHECK (LISTING_STATUS IN ('ADDED','OPEN','CLOSED')),
PLATFORM           VARCHAR(10)   NOT NULL,
CHECK (PLATFORM IN ('FACEBOOK','TWITTER','BOTH')),
PRICE_OFFERED      DECIMAL(10,2) NOT NULL,
AMOUNT_PAID_TO_SELLER DECIMAL(10,2) NOT NULL,
HANDLED_BY         INT           NOT NULL FOREIGN KEY REFERENCES EMPLOYEE(EMPLOYEE_ID),
CONSTRAINT PK_LISTING PRIMARY KEY CLUSTERED (LISTING_ID))

GO

---------------------------------------------------------------------------------------------------------
--CREATING INDEX ON LISTING_ID LISTING TABLE
---------------------------------------------------------------------------------------------------------
CREATE UNIQUE INDEX i_LISTING_ID on LISTING(LISTING_ID)
GO

INSERT INTO LISTING(SELLER_ID,DESCRIPTION,CATEGORY_ID,SUBCATEGORY_ID,LISTING_DATE_CREATED,ORIGINAL_PRICE,PURCHASE_DATE,SELLING_ZIPCODE,LISTING_STATUS,PLATFORM,PRICE_OFFERED,AMOUNT_PAID_TO_SELLER,HANDLED_BY) 
VALUES
(2001,'Excellent condition. No cracks. Works perfectly. Originally Verizon but can go onto any carrier.',7001,8001,'2015-09-21 15:54:08',600  ,'2015-11-06 07:34:12',91733,'CLOSED','BOTH'    ,435  ,351.8,1003),
(2004,'Selling Couch. Used but in very good condition'                                                  ,7003,8008,'2015-10-21 12:32:53',2000 ,'2012-02-19 06:14:23',94086,'CLOSED','FACEBOOK',1450 ,1156 ,1004),
(2001,'Very clean and well maintained Volkswagen Jetta. Only 2 years old and in excellent condition.'   ,7004,8015,'2016-03-06 11:32:45',30000,'2013-11-15 22:43:43',91733,'CLOSED','BOTH'    ,28000,19200,1003),
(2002,'Selling Samsung Galaxy 7. Very good condition'                                                   ,7001,8001,'2016-05-12 11:32:15',750  ,'2015-09-18 18:23:45',94086,'CLOSED','FACEBOOK',555  ,532  ,1003),
(2003,'Nikon camera, latest technology. Excellent condition'                                            ,7001,8002,'2016-05-05 12:23:34',900  ,'2014-05-15 12:45:46',60601,'CLOSED','TWITTER' ,790  ,610  ,1004),
(2010,'Selling Database management textbook for MS in Information Systems. Edition 2014'                ,7002,8006,'2016-05-15 18:53:21',200  ,'2015-10-12 17:12:56',52175,'CLOSED','FACEBOOK',150  ,130.4,1003),
(2010,'Selling IPAD mini. Excellent condition. Price negotiable'                                        ,7001,8005,'2016-09-20 15:32:57',1200 ,'2016-01-30 15:21:13',52175,'CLOSED','FACEBOOK',1100 ,930  ,1003),
(2008,'Selling iphone 6S. Very good condition. Contact ASAP'                                            ,7001,8001,'2016-09-30 11:32:15',962  ,'2015-04-18 02:32:06',76024,'CLOSED','FACEBOOK',900  ,730  ,1004),
(2008,'Selling Motorola MotoG. Please contact.'                                                         ,7001,8001,'2016-10-30 18:53:21',764  ,'2016-02-19 09:34:09',76024,'CLOSED','BOTH'    ,500  ,390  ,1004),
(2005,'Selling Yamaha 300. Newest Model.'                                                               ,7004,8016,'2016-10-31 11:32:15',15000,'2014-01-01 05:44:23',36201,'CLOSED','TWITTER' ,12000,7850 ,1003),
(2012,'Selling teak wood chair. As good as new'                                                         ,7003,8009,'2016-11-01 18:53:21',350  ,'2014-07-27 15:44:03',37013,'OPEN'  ,'FACEBOOK',250  ,0    ,1006),
(2010,'LG Microwave in good condition'                                                                  ,7001,8004,'2016-11-01 23:53:21',2800 ,'2011-05-19 01:12:26',52175,'OPEN'  ,'TWITTER' ,2350 ,0    ,1006),
(2011,'Selling Twilight series books. In perfect conditon. Please contact me'                           ,7002,8007,'2016-11-06 18:53:21',200  ,'2010-11-06 03:56:26',29673,'OPEN'  ,'BOTH'    ,150  ,0    ,1006),
(2014,'IPAD 3rd generation. 128 gb'                                                                     ,7001,8005,'2016-11-17 15:32:57',700  ,'2012-09-02 11:12:12',37013,'OPEN'  ,'TWITTER' ,567  ,0    ,1004),
(2014,'MDX 2013 model. Ran 12000 miles only'                                                            ,7004,8014,'2016-11-19 15:32:57',40000,'2013-08-21 21:42:26',37013,'CLOSED','FACEBOOK',27000,20500,1006)

GO
---------------------------------------------------------------------------------------------------------
--CREATING RATING TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE RATING(
SELLER_ID          INT           NOT NULL FOREIGN KEY REFERENCES SELLER(SELLER_ID),
AVG_RATING         DECIMAL(2,1)  NOT NULL,  
NO_OF_RATINGS      INT           NOT NULL, 
CONSTRAINT PK_RATING PRIMARY KEY CLUSTERED (SELLER_ID),
CONSTRAINT C_AVG_RATING CHECK (AVG_RATING >= 0 AND AVG_RATING <= 5))

GO

INSERT INTO RATING(SELLER_ID,AVG_RATING,NO_OF_RATINGS) VALUES
(2001,4.5,2),
(2002,5  ,1),
(2003,3  ,1),
(2004,4  ,1),
(2005,0  ,0),
(2006,0  ,0),
(2007,5  ,2),
(2008,0  ,0),
(2009,4.5,2),
(2010,0  ,0),
(2011,5  ,1),
(2012,0  ,0),
(2013,0  ,0),
(2014,0  ,0),
(2015,0  ,0)

GO
---------------------------------------------------------------------------------------------------------
--CREATING BID TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE BID(
BID_ID	           INT           NOT NULL IDENTITY(6001,1), 
LISTING_ID	       INT           NOT NULL FOREIGN KEY REFERENCES LISTING(LISTING_ID),
BUYER_ID	       INT           NOT NULL FOREIGN KEY REFERENCES BUYER(BUYER_ID),
BID_AMOUNT	       DECIMAL(10,2),
BID_STATUS         VARCHAR(20)   NOT NULL,
CHECK (BID_STATUS IN ('SELECTED','NOT SELECTED')),
CONSTRAINT PK_BID PRIMARY KEY CLUSTERED (BID_ID))

GO
---------------------------------------------------------------------------------------------------------
--CREATING INDEX ON BID_ID BID TABLE
---------------------------------------------------------------------------------------------------------
CREATE UNIQUE INDEX i_BID_ID on BID(BID_ID)
GO

INSERT INTO BID(LISTING_ID,BUYER_ID,BID_AMOUNT,BID_STATUS) VALUES 
 (4001,3001,400  ,'NOT SELECTED'),
 (4001,3001,414  ,'NOT SELECTED'),
 (4001,3002,418  ,'NOT SELECTED'),
 (4001,3003,390  ,'NOT SELECTED'),
 (4001,3003,419  ,'SELECTED'),
 (4002,3002,1360 ,'NOT SELECTED'),
 (4002,3002,1400 ,'NOT SELECTED'),
 (4002,3003,1360 ,'NOT SELECTED'),
 (4002,3003,1390 ,'NOT SELECTED'),
 (4002,3003,1408 ,'SELECTED'),
 (4003,3001,26000,'NOT SELECTED'),
 (4003,3002,26500,'NOT SELECTED'),
 (4003,3001,26854,'NOT SELECTED'),
 (4003,3002,26225,'NOT SELECTED'),
 (4003,3004,25000,'NOT SELECTED'),
 (4003,3004,25789,'NOT SELECTED'),
 (4003,3002,24678,'NOT SELECTED'),
 (4003,3001,27000,'SELECTED'),
 (4004,3001,510  ,'NOT SELECTED'),
 (4004,3002,500  ,'NOT SELECTED'),
 (4004,3003,540  ,'SELECTED'),
 (4005,3001,700  ,'NOT SELECTED'),
 (4005,3002,720  ,'NOT SELECTED'),
 (4005,3003,740  ,'NOT SELECTED'),
 (4005,3004,600  ,'NOT SELECTED'),
 (4005,3004,500  ,'NOT SELECTED'),
 (4005,3003,750  ,'SELECTED'),
 (4006,3001,110  ,'NOT SELECTED'),
 (4006,3005,138  ,'NOT SELECTED'),
 (4006,3010,140  ,'SELECTED'),
 (4007,3005,900  ,'NOT SELECTED'),
 (4007,3008,975  ,'NOT SELECTED'),
 (4007,3007,1010 ,'NOT SELECTED'),
 (4007,3008,1045 ,'NOT SELECTED'),
 (4007,3009,1039 ,'NOT SELECTED'),
 (4007,3001,1078 ,'NOT SELECTED'),
 (4007,3010,1080 ,'SELECTED'),
 (4008,3001,830  ,'NOT SELECTED'),
 (4008,3002,800  ,'NOT SELECTED'),
 (4008,3010,781  ,'NOT SELECTED'),
 (4008,3010,850  ,'SELECTED'),
 (4009,3009,410  ,'NOT SELECTED'),
 (4009,3007,408  ,'NOT SELECTED'),
 (4009,3002,350  ,'NOT SELECTED'),
 (4009,3008,445  ,'NOT SELECTED'),
 (4009,3006,426  ,'NOT SELECTED'),
 (4009,3004,410  ,'NOT SELECTED'),
 (4009,3005,450  ,'SELECTED'),
 (4010,3001,9000 ,'NOT SELECTED'),
 (4010,3004,8500 ,'NOT SELECTED'),
 (4010,3008,7805 ,'NOT SELECTED'),
 (4010,3007,9615 ,'NOT SELECTED'),
 (4010,3008,10000,'NOT SELECTED'),
 (4010,3007,10200,'NOT SELECTED'),
 (4010,3002,10500,'SELECTED'),
 (4011,3015,20000,'NOT SELECTED'),
 (4011,3001,18900,'NOT SELECTED'),
 (4011,3013,24000,'NOT SELECTED'),
 (4011,3012,24573,'NOT SELECTED'),
 (4011,3011,25000,'NOT SELECTED'),
 (4011,3001,23920,'NOT SELECTED'),
 (4011,3013,23922,'NOT SELECTED')

GO
---------------------------------------------------------------------------------------------------------
--CREATING PAYMENTS TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE PAYMENT(
TRANSACTION_ID     INT           NOT NULL IDENTITY(5001,1),
PAYMENT_STATUS     VARCHAR(20)   NOT NULL,
CHECK (PAYMENT_STATUS IN ('PAID','NOT PAID')),
AMOUNT_PAID_TO_SELLER DECIMAL(10,2) NOT NULL,
CONSTRAINT PK_PAYMENT PRIMARY KEY CLUSTERED (TRANSACTION_ID))

GO

INSERT INTO PAYMENT(PAYMENT_STATUS,AMOUNT_PAID_TO_SELLER) VALUES
  ('PAID' ,351.8),	
  ('PAID' ,1156),	
  ('PAID' ,19200),
  ('PAID' ,532),
  ('PAID' ,610),	
  ('PAID' ,130.4),	
  ('PAID' ,930),
  ('PAID' ,730),	
  ('PAID' ,390),
  ('PAID' ,7850),
  ('PAID' ,20500)

GO
---------------------------------------------------------------------------------------------------------
--CREATING PURCHASE TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE PURCHASE(        
BUYER_ID           INT           NOT NULL FOREIGN KEY REFERENCES BUYER(BUYER_ID), 
LISTING_ID         INT           NOT NULL FOREIGN KEY REFERENCES LISTING(LISTING_ID),
BID_ID	           INT           NOT NULL FOREIGN KEY REFERENCES BID(BID_ID), 
TRANSACTION_ID     INT           NOT NULL FOREIGN KEY REFERENCES PAYMENT(TRANSACTION_ID),
AMOUNT_PAID_BY_BUYER DECIMAL(10,2) NOT NULL,
PAYMENT_MODE       VARCHAR(10)            DEFAULT 'CC''PAYPAL',
PAYMENT_DATE       DATETIME,
RECEIVE_STATUS     VARCHAR(20)   NOT NULL,
CHECK (RECEIVE_STATUS IN ('RECEIVED','NOT RECEIVED')),
PLATFORM           VARCHAR(10)            DEFAULT 'FACEBOOK''TWITTER''WEB',
RATING_GIVEN_TO_SELLER INT       NOT NULL,
REVIEW_DESCRIPTION VARCHAR (150), 
RATING_DATE_CREATED DATETIME, 
QUARTER            CHAR(8)       NOT NULL,
CONSTRAINT PK_PURCHASE PRIMARY KEY(BUYER_ID,LISTING_ID))

GO

INSERT INTO PURCHASE(BUYER_ID,LISTING_ID,BID_ID,TRANSACTION_ID,AMOUNT_PAID_BY_BUYER,PAYMENT_MODE,PAYMENT_DATE,RECEIVE_STATUS,PLATFORM,
                     RATING_GIVEN_TO_SELLER,REVIEW_DESCRIPTION,RATING_DATE_CREATED,QUARTER) VALUES
 (3001,4001,6003,5001,436  ,'CC'    ,'2015-09-24 13:12:21','RECEIVED'    ,'FACEBOOK',4,'VERY GOOD SERVICE','2015-09-27 17:14:12','2015 Q3'),
 (3003,4002,6010,5002,1508 ,'PAYPAL','2015-11-22 13:23:24','RECEIVED'    ,'WEB'     ,5,'EXCELLENT'        ,'2015-11-30 03:34:15','2015 Q3'),
 (3001,4003,6018,5003,30000,'CC'    ,'2016-02-28 19:13:54','RECEIVED'    ,'TWITTER' ,5,'VERY GOOD'        ,'2016-03-15 23:54:45','2016 Q1'),
 (3004,4004,6021,5004,540  ,'PAYPAL','2016-05-21 23:32:15','RECEIVED'    ,'WEB'     ,5,'NICE'             ,'2016-05-27 11:32:15','2016 Q2'),
 (3002,4005,6027,5005,750  ,'PAYPAL','2016-05-15 17:32:53','RECEIVED'    ,'WEB'     ,3,'AVERAGE'          ,'2016-05-20 10:34:12','2016 Q2'),
 (3010,4006,6030,5006,150  ,'CC'    ,'2016-05-16 23:43:12','RECEIVED'    ,'FACEBOOK',4,'GOOD SERVICE'     ,'2016-05-21 15:33:12','2016 Q2'),
 (3010,4007,6037,5007,1200 ,'CC'    ,'2016-09-17 23:52:11','RECEIVED'    ,'FACEBOOK',5,'EXCELLENT'        ,'2016-09-28 09:22:33','2016 Q3'),
 (3005,4008,6041,5008,900  ,'CC'    ,'2016-09-18 16:21:21','RECEIVED'    ,'FACEBOOK',5,'EXCELLENT SERVICE','2016-09-30 04:15:22','2016 Q3'),
 (3005,4009,6048,5009,480  ,'PAYPAL','2016-10-19 22:21:41','RECEIVED'    ,'WEB'     ,5,'BEST SELLER'      ,'2016-10-30 12:58:43','2016 Q4'),
 (3002,4010,6055,5010,11000,'PAYPAL','2016-10-20 18:32:21','RECEIVED'    ,'TWITTER' ,4,'VERY GOOD'        ,'2016-10-31 21:21:21','2016 Q4'),
 (3011,4015,6060,5011,28000,'CC'    ,'2016-10-18 21:16:26','RECEIVED'    ,'FACEBOOK',5,'EXCELLENT SERVICE','2016-11-20 18:32:26','2016 Q4')

GO
---------------------------------------------------------------------------------------------------------
--CREATING ADVERTISEMENT TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE ADVERTISEMENT(
AD_ID	           INT           NOT NULL IDENTITY(9001,1),
SOURCE             VARCHAR(20)   NOT NULL DEFAULT 'GOOGLE''SKYPE''SELLIT',
AMOUNT	           DECIMAL(10,2) NOT NULL,
DATE_CREATED	   DATETIME      NOT NULL,
DATE_END	       DATETIME      NOT NULL,
AD_TYPE            VARCHAR(20)   NOT NULL,
CHECK (AD_TYPE IN ('GIVEN','OBTAINED')),
QUARTER            CHAR(8)       NOT NULL,
HANDLED_BY         INT           NOT NULL FOREIGN KEY REFERENCES EMPLOYEE(EMPLOYEE_ID)
CONSTRAINT PK_ADVERTISEMENT PRIMARY KEY(AD_ID))

GO

INSERT INTO ADVERTISEMENT(SOURCE,AMOUNT,DATE_CREATED,DATE_END,AD_TYPE,QUARTER,HANDLED_BY) VALUES
 ('GOOGLE',13728,'2015-10-07 21:45:22','2016-01-07 21:45:22','GIVEN'   ,'2015 Q4',1001),
 ('SELLIT',17392,'2015-10-29 12:56:21','2016-01-29 12:56:21','OBTAINED','2015 Q4',1001),
 ('SKYPE' ,7839 ,'2016-01-12 17:00:06','2016-04-12 17:00:06','GIVEN'   ,'2016 Q1',1001),
 ('SELLIT',9873 ,'2016-02-21 18:27:29','2016-05-21 18:27:29','OBTAINED','2016 Q1',1002),
 ('SELLIT',5749 ,'2016-05-29 09:24:27','2016-08-29 09:24:27','OBTAINED','2016 Q2',1005),
 ('GOOGLE',1432 ,'2016-06-13 07:34:14','2016-09-13 07:34:14','GIVEN'   ,'2016 Q2',1002),
 ('SKYPE' ,874  ,'2016-07-29 02:59:12','2016-10-29 02:59:12','GIVEN'   ,'2016 Q2',1005),
 ('GOOGLE',2121 ,'2016-09-29 02:12:18','2016-12-29 02:12:18','GIVEN'   ,'2016 Q2',1005),
 ('SKYPE' ,1020 ,'2016-10-19 23:12:19','2016-12-19 23:12:19','GIVEN'   ,'2016 Q3',1005),
 ('SELLIT',4021 ,'2016-10-13 14:34:16','2017-01-13 14:34:16','OBTAINED','2016 Q4',1002),
 ('SELLIT',8983 ,'2016-10-31 08:14:56','2017-01-31 08:14:56','OBTAINED','2016 Q4',1005),
 ('GOOGLE',1939 ,'2016-11-06 00:37:12','2017-02-06 00:37:12','GIVEN'   ,'2016 Q4',1005),
 ('SELLIT',1288 ,'2016-11-09 18:21:31','2017-02-09 18:21:31','OBTAINED','2016 Q4',1005),
 ('SELLIT',6281 ,'2016-11-17 13:22:54','2017-02-17 13:22:54','OBTAINED','2016 Q4',1002),
 ('SELLIT',2810 ,'2016-11-21 19:43:12','2017-02-21 19:43:12','OBTAINED','2016 Q4',1002),
 ('SELLIT',4240 ,'2016-08-21 01:56:41','2017-08-21 12:11:21','OBTAINED','2016 Q3',1005)

GO
---------------------------------------------------------------------------------------------------------
--CREATING SHIPPING TABLE AND INSERTING DATA
---------------------------------------------------------------------------------------------------------
CREATE TABLE SHIPPING(
LISTING_ID	       INT           NOT NULL FOREIGN KEY REFERENCES LISTING(LISTING_ID),
CARRIER            VARCHAR(20)            DEFAULT 'FEDEX''USPS''DHL',
WEIGHT_KG	       DECIMAL(6,2),
ZIPCODE   	       CHAR(5),
STATUS             VARCHAR(20)            DEFAULT 'TRANSIT''DELIVERED',
SHIPPING_COST	   DECIMAL(10,2),
SHIPPING_DATE	   DATETIME,
TRACKING_ID	       INT           
CONSTRAINT PK_SHIPPING PRIMARY KEY(LISTING_ID))

GO

INSERT INTO SHIPPING(LISTING_ID,CARRIER,WEIGHT_KG,ZIPCODE,STATUS,SHIPPING_COST,SHIPPING_DATE,TRACKING_ID) VALUES
 (4001,'FEDEX',1.2 ,97852,'DELIVERED',15  ,'2015-09-01 14:20:12',1379573),
 (4002,'UPS'  ,15  ,35203,'TRANSIT'  ,100 ,'2016-01-20 23:44:44',1671549),
 (4003,'DHL'  ,10  ,97852,'DELIVERED',300 ,'2016-03-08 22:50:32',2157951),
 (4004,NULL   ,NULL,NULL ,NULL       ,NULL,NULL                 ,NULL),
 (4005,'UPS'  ,0.75,55402,'DELIVERED',50  ,'2016-05-11 04:04:21',7816452),
 (4006,'FEDEX',1.2 ,54725,'DELIVERED',10  ,'2016-05-12 01:30:04',5794647),
 (4007,'DHL'  ,2.4 ,54725,'DELIVERED',120 ,'2016-09-20 12:00:33',4479541),
 (4008,'FEDEX',3.5 ,37210,'DELIVERED',50  ,'2016-09-23 09:27:25',4165863),
 (4009,'FEDEX',1.25,37210,'DELIVERED',30  ,'2016-10-13 21:22:22',1248155),
 (4010,'FEDEX',165 ,55402,'TRANSIT'  ,500 ,'2016-10-15 17:34:17',5258453),
 (4011,'DHL'  ,1202,11714,'TRANSIT'  ,3000,'2016-11-20 19:37:13',2312323)

GO

