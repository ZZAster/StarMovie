create database final;

use final;


create TABLE user (userId int unsigned primary key auto_increment,
				   userName VARCHAR(20) not null,
                   userPassword VARCHAR(45) not null,
                   userEmail VARCHAR(45) not null);

create TABLE movie (movieID int primary key,
					movieTitle VARCHAR(50) not null,
                    movieType VARCHAR(45) not null,
                    movieActor VARCHAR(45) not null,
                    movieDirector VARCHAR(45) not null);
                    
create TABLE type (typeId int primary key,
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
alter TABLE movie add column movieComment text;


create TABLE comment (commentId int not null,
					  comment_userId int not null,
                      comment_movieId int not null,
                      primary key(commentId, comment_userId, comment_movieId));
                      
alter TABLE comment add foreign key(comment_userId) references user(userId);
drop table comment;

create TABLE comment (commentId int not null,
					  comment_userId int unsigned not null,
                      comment_movieId int not null,
                      primary key(commentId),
                      constraint foreign key(comment_userId) references user(userId),
                      constraint foreign key(comment_movieId) references movie(movieID));
                      
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
                                 

create TABLE list (listId int not null,
				   list_userId int unsigned not null,
                   listName VARCHAR(45) not null,
                   primary key(listId),
                   constraint foreign key(list_userId) references user(userId));   
                   
create TABLE list_has_movie (list_listId int not null,
							 list_movieId int not null,
                             primary key(list_listId, list_movieId),
                             constraint foreign key(list_listId) references list(listId),
                             constraint foreign key(list_movieId) references movie(movieId));

                      


