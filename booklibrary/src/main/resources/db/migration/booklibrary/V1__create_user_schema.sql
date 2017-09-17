--  ************** to maintain user details **************
CREATE TABLE usersinfo(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  firstname varchar(150) NOT NULL,
  middlename varchar(150),
  lastname varchar(150) NOT NULL,
  gender varchar(45) NOT NULL,
  contactnumber1 varchar(45) NOT NULL,
  contactnumber2 varchar(45),
  email varchar(45) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO usersinfo(firstname,middlename,lastname,gender,contactnumber1,contactnumber2,email)
				VALUES("Bhaskar",null,"Manga","male","9550630880","9550401807","bhaskar@omniwyse.com");
--  *************** to maintain the user addresses details *****************
CREATE TABLE addresstable(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  doornumber varchar(45) NOT NULL,
  line1 varchar(150) NOT NULL,
  line2 varchar(150) NOT NULL,
  city varchar(150) NOT NULL,
  state varchar(150) NOT NULL,
  country varchar(150) NOT NULL,
  pin bigint(8) NOT NULL,
  userid bigint(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userid) REFERENCES usersinfo(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- **************** predefined table for Locations *********************************
CREATE TABLE locations(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  name varchar(150) NOT NULL,
  latitude decimal(10,8) NOT NULL,
  longitude decimal(10,8) NOT NULL,
  landmark varchar(150) NOT NULL,
  city varchar(150) NOT NULL,
  state varchar(150) NOT NULL,
  country varchar(150) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- *********************** to maintain the libraries ************************
CREATE TABLE librarytable(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  libraryname varchar(150) NOT NULL,
  locationid bigint(8) NOT NULL,
  latitude decimal(10,8) NOT NULL,
  longitude decimal(10,8) NOT NULL,
  addressid bigint(8) NOT NULL,
  adminid bigint(8) NOT NULL,
  agentid bigint(8) NOT NULL,
  startdate datetime NOT NULL,
  numberofbooks bigint(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (locationid) REFERENCES locations(id),
  FOREIGN KEY (addressid) REFERENCES addresstable(id),
  FOREIGN KEY (adminid) REFERENCES usersinfo(id),
  FOREIGN KEY (agentid) REFERENCES usersinfo(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;



-- **************** table for library agents maintain *********************************
CREATE TABLE libraryagentstable(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  libraryid bigint(8) NOT NULL,
  agentid bigint(8) NOT NULL,
  locationid bigint(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (libraryid) REFERENCES librarytable(id),
  FOREIGN KEY (agentid) REFERENCES usersinfo(id),
  FOREIGN KEY (locationid) REFERENCES locations(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


-- ************* to maintain registered users ***********************************
CREATE TABLE registeredusertable(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  userid bigint(8) NOT NULL,
  registeredDate datetime NOT NULL,
  amountPaid decimal(10,4),
  dueAmount decimal(10,4),
  product_group_id bigint(8) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (userid) REFERENCES usersinfo(id)
--  FOREIGN KEY (product_group_id) REFERENCES library_product_groups(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


