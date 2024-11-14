create database  centre_formation;
use centre_formation;
# -----------------------------------------------------------------------------
#       table : etudiant
# -----------------------------------------------------------------------------

create table  etudiant
 (
   numcinetu varchar(128)   ,
   numetu varchar(128)   ,
   prenometu varchar(128)   ,
   datenaissance date   ,
   adresseetu varchar(128)   ,
   villeetu varchar(128)   ,
   niveauetu varchar(128)   ,
   primary key (numcinetu) 
 ) 


# -----------------------------------------------------------------------------
#       table : session
# -----------------------------------------------------------------------------

create table  session
 (
   codesess varchar(128)   ,
   codeform varchar(128)   ,
   nomsess varchar(128)   ,
   datedebut date   ,
   datefin date ,
   primary key (codesess) 
 ) 


# -----------------------------------------------------------------------------
#       table : specialite
# -----------------------------------------------------------------------------

create table  specialite
 (
   codespec varchar(128)   ,
   nomspec varchar(128)   ,
   descspec varchar(128)   ,
   primary key (codespec) 
 )


# -----------------------------------------------------------------------------
#       table : formation
# -----------------------------------------------------------------------------

create table  formation
 (
   codeform varchar(128)   ,
   titreform varchar(128)   ,
   dureeform date   ,
   prixform integer(2) , 
   primary key (codeform) 
 ) 


# -----------------------------------------------------------------------------
#       table : est_inscrit
# -----------------------------------------------------------------------------

create table  est_inscrit
 (
   numcinetu varchar(128)   ,
   codesess varchar(128)   ,
   typecours varchar(128)  ,
   primary key (numcinetu,codesess) 
 ) 


# -----------------------------------------------------------------------------
#       table : appartient
# -----------------------------------------------------------------------------

create table  appartient
 (
   codespec varchar(128)   ,
   codeform varchar(128)   , 
   primary key (codespec,codeform) 
 ) 



# -----------------------------------------------------------------------------
#       creation des references de table
# -----------------------------------------------------------------------------


alter table session 
  add foreign key fk_session_formation (codeform)
      references formation (codeform) ;


alter table est_inscrit 
  add foreign key fk_est_inscrit_etudiant (numcinetu)
      references etudiant (numcinetu) ;
    


alter table est_inscrit 
  add foreign key fk_est_inscrit_session (codesess)
      references session (codesess) ;


alter table appartient 
  add foreign key fk_appartient_specialite (codespec)
      references specialite (codespec) ;


alter table appartient 
  add foreign key fk_appartient_formation (codeform)
      references formation (codeform) ;



# -----------------------------------------------------------------------------
#       modification des tables
# -----------------------------------------------------------------------------

alter table est_inscrit
    modify typecours varchar(128) not null;

alter table session
    add constraint check_date check (datefin > datedebut);

alter table specialite
    add column active int(1) default 1;
