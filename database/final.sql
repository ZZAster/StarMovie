create database final;

use final;


create TABLE user (userId int primary key auto_increment,
				   userName VARCHAR(20) not null,
                   userPassword VARCHAR(45) not null,
                   userEmail VARCHAR(45) not null);

create TABLE movie (movieID int primary key auto_increment,
					movieTitle VARCHAR(50) not null,
                    movieType VARCHAR(45) not null,
                    movieActor VARCHAR(45) not null,
                    movieDirector VARCHAR(45) not null);
                    
create TABLE type (typeId int primary key auto_increment,
				   typeName VARCHAR(45) not null);
                   
create TABLE movie_has_type (movie_movieId int not null,
							 movie_typeId int not null,
                             primary key(movie_movieId, movie_typeId),
                             constraint foreign key(movie_movieId) references movie(movieId),
                             constraint foreign key(movie_typeID) references type(typeId));
                             
alter TABLE movie add column movieRate tinyint not null;
alter TABLE movie add column ratedTimes  int not null;
alter TABLE movie add column picPath varchar(200) not null;
alter TABLE movie add column movieSummary text;
alter TABLE movie modify movieSummary text not null;
alter TABLE movie add column movieDate date not null;



create TABLE rate (rateId int not null auto_increment,
					  rate_userId int not null,
                      rate_movieId int not null,
                      primary key(rateId, rate_userId, rate_movieId)
                      );
                      
alter TABLE rate add foreign key(rate_userId) references user(userId);

alter table rate add foreign key(rate_movieId) references movie(movieID);


create TABLE actor (actorId int not null,
					actorName VARCHAR(45) not null,
					actorNationality VARCHAR(45) not null,
                    primary key(actorId));
                    
create TABLE actor_has_movie (actor_actorId int not null,
							  actor_movieId int not null,
                              primary key(actor_actorId, actor_movieId),
                              constraint foreign key(actor_actorId) references actor(actorId),
                              constraint foreign key(actor_movieId) references movie(movieId));
                              
create TABLE director (directorId int not null,
					   directorName VARCHAR(45) not null,
					   directorNationality VARCHAR(45) not null,
                       primary key(directorId));
                    
create TABLE director_has_movie (director_directorId int not null,
								 director_movieId int not null,
								 primary key(director_directorId, director_movieId),
								 constraint foreign key(director_directorId) references director(directorId),
								 constraint foreign key(director_movieId) references movie(movieId));
                                 

create table user_like_movie(user_userId int not null,
							user_movieId int not null,
                            primary key(user_userId, user_movieId),
                             constraint foreign key(user_userId) references user(userId),
                             constraint foreign key(user_movieId) references movie(movieId));
