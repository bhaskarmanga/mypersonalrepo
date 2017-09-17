-- ********** to maintain the individual book information ***********
CREATE TABLE booksinfo(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  title varchar(15) NOT NULL ,
  author varchar(150) NOT NULL,
  isbncode varchar(150) NOT NULL,
  generes varchar(150) NOT NULL,
  edition varchar(150) NOT NULL,
  year datetime NOT NULL,
  bookcoverpage varchar(150) NOT NULL,
  samplepageurl varchar(150) NOT NULL,
  imagesUrl1 varchar(150) NOT NULL,
  imagesUrl2 varchar(150) NOT NULL,
  bookcondition varchar(150) NOT NULL,
  bookprice varchar(150) NOT NULL,
  baserentalvalue varchar(150) NOT NULL,
  bookdescription varchar(150) NOT NULL,
  demand varchar(150) NOT NULL,
  numberofpages int NOT NULL,
  productgroup varchar(150) NOT NULL,
  publicationdate datetime,
  publisher varchar(150) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ************ maintain the book availability,buy and rent status, book existnecy ****************
CREATE TABLE books_inventory(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  userid bigint(8) NOT NULL, -- customer... agent... delivered back then it is with the owner
  bookid bigint(8) NOT NULL,
  ownerid bigint(8) NOT NULL,
  locationid bigint(8) NOT NULL,
  available boolean NOT NULL,
  availableDate datetime NOT NULL,
  bookValue decimal(5,4),
  rentalValue decimal(3,2) NOT NULL,
  buyflg boolean,
  rentflag boolean,
  PRIMARY KEY (id),
  FOREIGN KEY (userid) REFERENCES usersinfo(id),
  FOREIGN KEY (bookid) REFERENCES booksinfo(id),
  FOREIGN KEY (ownerid) REFERENCES usersinfo(id),
  FOREIGN KEY (locationid) REFERENCES locations(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- **************** predefined table for weekdyas **********************				  
CREATE TABLE weekdays(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  day varchar(150) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO weekdays(day) VALUES('SUNDAY'),
							    ('MONDAY'),
							    ('TUESEDAY'),
							    ('WEDNESDAY'),
							    ('THURSEDAY'),
							    ('FRIDAY'),
							    ('SATERDAY');							


-- **************** predefined table for users **********************				  
CREATE TABLE usertypes(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  usertype varchar(150) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


INSERT INTO usertypes(usertype) VALUES('user'),
									  ('owner'),
									  ('agent');
							    

-- **************** to maintain book pickup timings from ower/user **********************				  
CREATE TABLE pickup_timings(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  userid bigint(8) NOT NULL,
  usertypeid bigint(8) NOT NULL,
  pickupdayid bigint(8) NOT NULL,
  pikcuptime time NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usertypeid) REFERENCES usertypes(id),
  FOREIGN KEY (pickupdayid) REFERENCES weekdays(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- *********** predefined table for books status ***********
CREATE TABLE statustable(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  statusid bigint(8) NOT NULL,
  status varchar(150) NOT NULL,
  description varchar(150) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

insert into statustable(statusid,status,description) 
				values(1,'AVAILABLE','available in library or releasing from customer'),
					  (2,'NOTAVAILABLE','that book is not in library'),
					  (3,'RENTED','in use'),
					  (4,'DELIVERED','delivered to booked customer'),
					  (5,'PENDINGTRANSACTION','not delivered to booked customer'),
					  (6,'PENDINGRETURN','not return back by customer'),
					  (7,'RECIEVED','back to library');
					  

-- **************** predefined to maintain product groups **********************				  
CREATE TABLE library_product_groups(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  productgroup varchar(150) NOT NULL,
  description varchar(150) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- **************** to maintain book groups **********************				  
CREATE TABLE bookscategorized(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  productgroupid bigint(8) NOT NULL,
  bookid bigint(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (productgroupid) REFERENCES library_product_groups(id),
  FOREIGN KEY (bookid) REFERENCES booksinfo(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
	


-- *************** to maintain the book reiews ***********************
CREATE TABLE bookreviews(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  bookid bigint(8) NOT NULL,
  userid bigint(8) NOT NULL,
  reviewtext varchar(150) NOT NULL,
  likes int,
  dislikes int,
  shares int,
  reviewDate datetime NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (bookid) REFERENCES booksinfo(id),
  FOREIGN KEY (userid) REFERENCES usersinfo(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


--  **************** table to maintain book orders *********************
CREATE TABLE book_orders(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  userid bigint(8) NOT NULL,
  orderdate datetime NOT NULL,
  totalamount decimal(3,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userid) REFERENCES usersinfo(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ************ to maintain the book bookings status **********S
CREATE TABLE book_order_lineitems(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  orderid bigint(8) NOT NULL,
  orderedate datetime NOT NULL,
  desireddate datetime NOT NULL,
  releasedate datetime NOT NULL,
  customerid bigint(8) NOT NULL,
  totalrentvalue decimal(10,4) NOT NULL,
  paid decimal(10,4),
  due decimal(10,4),
  currency varchar(10),
  statusid bigint(8) NOT NULL,
  sourceid bigint(8) NOT NULL,
  destinationid bigint(8) NOT NULL,
  preferredDeliveryTime time,
  PRIMARY KEY (id),
  FOREIGN KEY (orderid) REFERENCES book_orders(id),
  FOREIGN KEY (customerid) REFERENCES usersinfo(id),
  FOREIGN KEY (statusid) REFERENCES statustable(id),
  FOREIGN KEY (sourceid) REFERENCES addresstable(id),
  FOREIGN KEY (destinationid) REFERENCES addresstable(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ********* predefined table for deliverytypes *************
CREATE TABLE deliverytypes(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  delivertype varchar(150) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


INSERT INTO deliverytypes(delivertype) values('DELIVER'),('PICKUP');


-- ******************** Predefined table for bookflag ***************
CREATE TABLE bookflag(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  flag varchar(150) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO bookflag(flag) values('OWNER'),('USER'),('AGENT');


-- ************ to maintain book trNSctions **************************************
CREATE TABLE books_transaction_queue(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  lineitemid bigint(8) NOT NULL,
  bookid bigint(8) NOT NULL,
  agentid bigint(8) NOT NULL,
  ownerid bigint(8) NOT NULL,
  locationid bigint(8) NOT NULL,
  deliverytypeid bigint(8) NOT NULL,
  bookflagid bigint(8) NOT NULL,
  statusid bigint(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (lineitemid) REFERENCES book_order_lineitems(id),
  FOREIGN KEY (bookid) REFERENCES booksinfo(id),
  FOREIGN KEY (agentid) REFERENCES usersinfo(id),
  FOREIGN KEY (ownerid) REFERENCES usersinfo(id),
  FOREIGN KEY (locationid) REFERENCES locations(id),
  FOREIGN KEY (deliverytypeid) REFERENCES deliverytypes(id),
  FOREIGN KEY (statusid) REFERENCES statustable(id),
  FOREIGN KEY (bookflagid) REFERENCES bookflag(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



-- ************* maintain Recomonded classifiers **************************************
CREATE TABLE recoomended_classifiers(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  recommendcriteria varchar(150) NOT NULL,
  recommendtype varchar(150) NOT NULL,
  DisplayText varchar(150) NOT NULL,
  displayonweb boolean NOT NULL  DEFAULT FALSE,
  orderofdisplay bigint,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ****************** maintain book recommendations *************************
CREATE TABLE book_recoomendations(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  recommendclassfierid bigint(8) NOT NULL,
  bookid bigint(8) NOT NULL,
  rating int,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;










