
CREATE TABLE roles(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  role varchar(255) NOT NULL, 
  description varchar(255) NOT NULL,
  createdOn timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  modifiedOn timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  UNIQUE KEY name_UNIQUE (role)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

 INSERT INTO roles(role,description)
 				 VALUES("SUPERADMIN","library application admin"),
 				 	   ("ADMIN","library admin"),
 				 	   ("AGENT","library teacher"),
 				 	   ("REGISTEREDUSER","library registered user");
 				 	   
 CREATE TABLE userstatus(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  status varchar(150) NOT NULL,
  createdOn timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  modifiedOn timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  UNIQUE KEY name_UNIQUE (status)
 )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO userstatus(status)
			VALUES("Active"),
				  ("InActive"),
			 	  ("Pending");

CREATE TABLE usercredentials(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  userid bigint(8) NOT NULL,
  mail varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  statusid bigint(8)NOT NULL,
  createdOn timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  modifiedOn timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  FOREIGN KEY (userid) REFERENCES usersinfo(id),
  FOREIGN KEY (statusid) REFERENCES userstatus(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO usercredentials(userid,mail,password,statusid) 
					 VALUES(1,"bhaskar@omniwyse.com","bhaskar",1);

 CREATE TABLE userrolemaintain(
  id bigint(8) NOT NULL AUTO_INCREMENT,
  userid bigint(8) NOT NULL,
  roleid bigint(8) NOT NULL,
  createdOn timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  modifiedOn timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (id),
  FOREIGN KEY (userid) REFERENCES usercredentials (id),
  FOREIGN KEY (roleid) REFERENCES roles (id)
 )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;
 
 INSERT INTO userrolemaintain(userid,roleid)
 					   VALUES((SELECT ID FROM usercredentials WHERE mail = "bhaskar@omniwyse.com"),(SELECT ID FROM roles WHERE role = "ADMIN"));
 					   
 					   
