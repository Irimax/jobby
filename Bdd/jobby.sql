-- Insersion d'un user sans sont userCode et userImage -- 

INSERT INTO jobbydb.user (userFirstName, userLastName, userPassword, userGender, userBirthDate, userPhone, userEmail)
VALUES ('lidian', 'manoha', '31101978', 'male', '31101978', '0619753092', 'lidianmanoha@gmail.com');

-- Insersion d'un user sans sont userCode et userImage -- 

INSERT INTO jobbydb.user (userFirstName, userLastName, userPassword, userGender, userBirthDate, userPhone, userEmail)
VALUES ('jean', 'valjean', 'pass0401', 'male', '0601700', '0645978936', 'jeanvaljean@gmail.com');

-- selection de tout les tuples de la table user par son userId --

SELECT * FROM  jobbydb.user;

-- Selection d'un user par son userId --

SELECT * FROM jobbydb.user WHERE userId=1;  


-- Selection d'un user par son userFirstName --

SELECT * FROM jobbydb.user WHERE userFirstName='lidian';  

-- Selection en fonction des c'est userId, userLastName, userFirstName par son userFirstName --

SELECT userId, userLastName, userFirstName FROM jobbydb.user WHERE userFirstName = 'lidian'; 

-- update user par son userFirstName --

UPDATE jobbydb.user 
SET userFirstName ='pierre'
WHERE userFirstName = 'jean'; 

-- update user par son userFirstName userLastName  --
UPDATE jobbydb.user 
SET userFirstName ='jean',
userLastName = 'valjean'
WHERE userFirstName = 'pierre';

-- Delete user par son userId  --

DELETE FROM jobbydb.user WHERE userId = 1; 


-- Creation des category avec userCode  --

INSERT INTO jobbydb.category (categoryLabel, categoryImage, categoryCode)
VALUES ('Reparation & Bricolage', 'https://i.imgur.com/1XrPTg8.jpg', concat('category_',uuid())),
('transport', 'https://i.imgur.com/BZedtDL.jpg', concat('category_',uuid())),
('apprentissage', 'https://i.imgur.com/GdSFShm.jpg', concat('category_',uuid())),
('multimédia', 'https://i.imgur.com/I6GSsT9.jpg', concat('category_',uuid()));

-- Select toute la table category --  

SELECT * FROM  jobbydb.category;


-- Creation des category enfants reparation & bricolage avec userCode et categoryParentId --

INSERT INTO jobbydb.category (categoryLabel, categoryCode, categoryParentId)
VALUES ('maison', concat('category_',uuid()),1),
('multimedia', concat('category_',uuid()),1),
('vehicules',  concat('category_',uuid()),1),
('jardin & exterieur',  concat('category_',uuid()),1);

-- Creation des category enfants transport avec userCode et categoryParentId --

INSERT INTO jobbydb.category (categoryLabel, categoryCode, categoryParentId)
VALUES ('voiture', concat('category_',uuid()),2),
('covoiturage', concat('category_',uuid()),2),
('demenagement',  concat('category_',uuid()),2),
('transport marchandise',  concat('category_',uuid()),2);

-- Creation des category enfants apprentissage avec userCode et categoryParentId --

INSERT INTO jobbydb.category (categoryLabel, categoryCode, categoryParentId)
VALUES ('web & design', concat('category_',uuid()),3),
('cours & conseil', concat('category_',uuid()),3),
('soin du corps',  concat('category_',uuid()),3),
('dessin',  concat('category_',uuid()),3);

-- Creation des category enfants multimédia avec userCode et categoryParentId --

INSERT INTO jobbydb.category (categoryLabel, categoryCode, categoryParentId)
VALUES ('jeux video', concat('category_',uuid()),4),
('tablet et smartphone', concat('category_',uuid()),4),
('ubuntu',  concat('category_',uuid()),4),
('desktop & laptop',  concat('category_',uuid()),4);


--  recuperer tous les champ de toute les categories enfant de la categories parent reparation et & bricolage depuis leur id -- 

SELECT * FROM jobbydb.category WHERE categoryParentId = 1;

--  recuperer tous les champ de toute les categories enfant de la categories parent transport depuis leur id -- 

SELECT * FROM jobbydb.category WHERE categoryParentId = 2;

--  recuperer tous les champ de toute les categories enfant de la categories parent apprentissage depuis leur id -- 

SELECT * FROM jobbydb.category WHERE categoryParentId = 3;

--  recuperer tous les champ de toute les categories enfant de la categories parent multimedia depuis leur id -- 

SELECT * FROM jobbydb.category WHERE categoryParentId = 4;


--  recuperer tous les champ de toute les categories enfant qui ont un categoryParentId-- 

SELECT * FROM jobbydb.category WHERE categoryParentId;

--  Update categoryIsService avec les categoryParentId existante -- 

UPDATE jobbydb.category set categoryIsService = 1 WHERE categoryParentId;

SELECT * FROM jobbydb.category WHERE categoryIsService;

-- Insertion des question dans la table question --

INSERT INTO jobbydb.question (questionCode,questionLabel,questionOrder,question_categoryId)
VALUES (concat('question_',uuid()),'quel type de materiel avez-vous besoin de reparer ?',1000,5),
(concat('question_',uuid()),'dans quel etat ce trouve le materiel ?',2000,5),
(concat('question_',uuid()),'quel jour seriez-vous disponible pour recevoir un jobbeur ?',3000,5),
(concat('question_',uuid()),'dans quel creneau horaire ?',4000,5),
(concat('question_',uuid()),'votre domicile possede t\'il un ascenseur ?',5000,5),
(concat('question_',uuid()),'avez-vous une remarque suplementaire a faire ?',6000,5);

INSERT INTO jobbydb.question (questionCode,questionLabel,questionOrder,question_categoryId)
VALUES (concat('question_',uuid()),'quel type de materiel avez-vous besoin de reparer ?',1000,6),
(concat('question_',uuid()),'dans quel etat ce trouve le materiel ?',2000,6),
(concat('question_',uuid()),'quel jour seriez-vous disponible pour recevoir un jobbeur ?',3000,6),
(concat('question_',uuid()),'dans quel creneau horaire ?',4000,6),
(concat('question_',uuid()),'votre domicile possede t\'il un ascenseur ?',5000,6),
(concat('question_',uuid()),'avez-vous une remarque suplementaire a faire ?',6000,6);

INSERT INTO jobbydb.question (questionCode,questionLabel,questionOrder,question_categoryId)
VALUES (concat('question_',uuid()),'quel type de vehicule avez-vous besoin de reparer ?',1000,7),
(concat('question_',uuid()),'dans quel etat ce trouve le vehicule ?',2000,7),
(concat('question_',uuid()),'quel jour seriez-vous disponible pour recevoir un jobbeur ?',3000,7),
(concat('question_',uuid()),'dans quel creneau horaire ?',4000,7),
(concat('question_',uuid()),'votre domicile possede t\'il un ascenseur ?',5000,7),
(concat('question_',uuid()),'avez-vous une remarque suplementaire a faire ?',6000,7);


INSERT INTO jobbydb.question (questionCode,questionLabel,questionOrder,question_categoryId)
VALUES (concat('question_',uuid()),'quel type de vehicule avez-vous besoin de reparer ?',1000,8),
(concat('question_',uuid()),'dans quel etat ce trouve le vehicule ?',2000,8),
(concat('question_',uuid()),'quel jour seriez-vous disponible pour recevoir un jobbeur ?',3000,7),
(concat('question_',uuid()),'dans quel creneau horaire ?',4000,8),
(concat('question_',uuid()),'votre domicile possede t\'il un ascenseur ?',5000,8),
(concat('question_',uuid()),'avez-vous une remarque suplementaire a faire ?',6000,8);

-- recuperation de toutes les questions --  

SELECT * FROM jobbydb.question WHERE question_categoryId;


-- recuperation de toutes les questions par leur question_categoryId -- 

SELECT * FROM jobbydb.question WHERE question_categoryId = 5;


-- selectionner toutes questions a partir de cle primaire de la categorie -- 

SELECT * FROM jobbydb.question WHERE question_categoryId IN 
( SELECT categoryId FROM jobbydb.category WHERE categoryLabel = 'maison');

-- insersion de toute les reponses possible a toute les question de la categorie maison -- 

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES (concat('possibleResponse_',uuid()),'',1000,1);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES (concat('possibleResponse_',uuid()),'UN PEU DEFECTUEUX',1000,2),
(concat('possibleResponse_',uuid()),'TRES DEFECTUEUX',2000,2),
(concat('possibleResponse_',uuid()),'HORS D\'USAGE',3000,2);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'',1000,3);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'matin',1000,4),
(concat('possibleResponse_',uuid()),'midi',2000,4),
(concat('possibleResponse_',uuid()),'apres midi',3000,4),
(concat('possibleResponse_',uuid()),'soir',4000,4);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'oui',1000,5),
(concat('possibleResponse_',uuid()),'non',2000,5);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'',1000,6);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES (concat('possibleResponse_',uuid()),'',1000,7);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES (concat('possibleResponse_',uuid()),'UN PEU DEFECTUEUX',1000,8),
(concat('possibleResponse_',uuid()),'TRES DEFECTUEUX',2000,8),
(concat('possibleResponse_',uuid()),'HORS D\'USAGE',3000,8);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'',1000,9);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'matin',1000,10),
(concat('possibleResponse_',uuid()),'midi',2000,10),
(concat('possibleResponse_',uuid()),'apres midi',3000,10),
(concat('possibleResponse_',uuid()),'soir',4000,10);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'oui',1000,11),
(concat('possibleResponse_',uuid()),'non',2000,11);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES (concat('possibleResponse_',uuid()),'',1000,12);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES (concat('possibleResponse_',uuid()),'UN PEU DEFECTUEUX',1000,13),
(concat('possibleResponse_',uuid()),'TRES DEFECTUEUX',2000,13),
(concat('possibleResponse_',uuid()),'HORS D\'USAGE',3000,13);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'',1000,14);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'matin',1000,15),
(concat('possibleResponse_',uuid()),'midi',2000,15),
(concat('possibleResponse_',uuid()),'apres midi',3000,15),
(concat('possibleResponse_',uuid()),'soir',4000,15);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'oui',1000,16),
(concat('possibleResponse_',uuid()),'non',2000,16);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'',1000,17);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'',1000,18);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES (concat('possibleResponse_',uuid()),'',1000,19);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES (concat('possibleResponse_',uuid()),'UN PEU DEFECTUEUX',1000,20),
(concat('possibleResponse_',uuid()),'TRES DEFECTUEUX',2000,20),
(concat('possibleResponse_',uuid()),'HORS D\'USAGE',3000,20);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'',1000,21);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'matin',1000,22),
(concat('possibleResponse_',uuid()),'midi',2000,22),
(concat('possibleResponse_',uuid()),'apres midi',3000,22),
(concat('possibleResponse_',uuid()),'soir',4000,22);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'oui',1000,23),
(concat('possibleResponse_',uuid()),'non',2000,23);

INSERT INTO jobbydb.possibleResponse (possibleResponseCode,possibleResponseLabel,possibleResponseOrder,possibleResponse_questionId)
VALUES(concat('possibleResponse_',uuid()),'',1000,24);

SELECT * FROM jobbydb.possibleResponse WHERE possibleResponse_questionId;

-- selectionner toutes les questions possible de la sous categorie Maison --  

SELECT * FROM jobbydb.possibleResponse WHERE possibleResponse_questionId IN 
( SELECT questionId FROM jobbydb.question WHERE question_categoryId  IN
( SELECT categoryId FROM jobbydb.category WHERE categoryLabel = 'maison'));


-- pour chaque question u type lui est assigner --

INSERT INTO jobbydb.questionType (questionTypeCode,questionTypeLabel)
VALUES (concat('questionType_',uuid()),'text'),
(concat('questionType_',uuid()),'radio'),
(concat('questionType_',uuid()),'date'),
(concat('questionType_',uuid()),'checkbox'),
(concat('questionType_',uuid()),'textarea');

SELECT * FROM jobbydb.questionType WHERE questionTypeLabel;

-- selectionner toute les questions dont l'ordre est entre 2 et 4 --  

SELECT questionLabel FROM jobbydb.question WHERE questionOrder BETWEEN 2000 AND 4000;

-- recuperer chaque label de toutes les reponses possible dont les question ont un ordre entre 2000 et 4000 --

 SELECT possibleResponseLabel FROM jobbydb.possibleResponse WHERE possibleResponse_questionId IN 
( SELECT questionId FROM jobbydb.question WHERE questionOrder BETWEEN 2000 AND 4000);
 
 
-- recuperer Id des reponses possible ou le label est NULL --

SELECT possibleResponseId FROM jobbydb.possibleResponse WHERE possibleResponseLabel = ''; 

SELECT possibleResponseId FROM jobbydb.possibleResponse WHERE possibleResponseLabel IS NOT NULL; 

-- recherche avec la commande LIKE --  

SELECT * FROM jobbydb.category WHERE categoryLabel LIKE '%a%';

SELECT * FROM jobbydb.category WHERE categoryLabel LIKE 'r%';

SELECT * FROM jobbydb.category WHERE categoryLabel LIKE '%r';

SELECT * FROM jobbydb.category WHERE categoryLabel LIKE 'ja%ur';

-- Insertion adresse user -- 

INSERT INTO jobbydb.address (addressStreetType,addressStreetName,addressCity,addressZipCode,addressCountry,addressRegion)
VALUE ('rue', 'du colonel moutarde', 'cluedo', 666, 'le paradie','cloud');

SELECT * FROM jobbydb.address;

-- Update tous les champs des reponses possible qui sont vide par NULL -- 

UPDATE jobbydb.possibleResponse
SET possibleResponseLabel = NULL
WHERE possibleResponseLabel = '';

SELECT * FROM jobbydb.possibleResponse;

-- JOINT INNER  -- 

SELECT categoryLabel FROM jobbydb.category AS C
INNER JOIN jobbydb.question AS q
WHERE C.categoryId =   q.question_categoryId;

SELECT * FROM jobbydb.category AS c
INNER JOIN jobbydb.question AS q
ON c.categoryId = q.question_categoryId
INNER JOIN jobbydb.possibleResponse AS p
ON q.questionId = p.possibleResponse_questionId;

INSERT INTO jobbydb.category (categoryLabel)
VALUES ('bidon');

INSERT INTO jobbydb.category (categoryLabel)
VALUES ('bidon2');

INSERT INTO jobbydb.question (questionLabel)
VALUES ('bidon');

INSERT INTO jobbydb.question (questionLabel)
VALUES ('bidon2');

SELECT * FROM jobbydb.question;
SELECT * FROM jobbydb.category;


-- recuperer toutes les category et toutes leurs question  meme si les category n'on pas de question sans recuperer les questions qui n'on pas de category --   

USE jobbydb;
SELECT * FROM question AS q
LEFT JOIN category AS c ON c.categoryId = q.question_categoryId;

USE jobbydb;
SELECT * FROM question 
RIGHT JOIN category AS c ON c.categoryId = q.question_categoryId;

-- FULL OUTER JOIN --  
USE jobbydb;
SELECT * FROM question AS q
LEFT JOIN category AS c ON c.categoryId = q.question_categoryId

UNION ALL

SELECT * FROM question AS q
LEFT JOIN category AS c ON c.categoryId = q.question_categoryId
WHERE q.question_categoryId IS NULL OR c.categoryId;


USE jobbydb;
SELECT * FROM question AS q
RIGHT JOIN category AS c ON categoryId = question_categoryId;
SELECT * FROM question AS q
RIGHT JOIN category AS c ON categoryId = question_categoryId;

USE jobbydb;
SELECT * FROM question AS q
LEFT JOIN category AS c ON c.categoryId = q.question_categoryId
WHERE q.question_categoryId IS NULL;

USE jobbydb;
INSERT INTO possibleResponse (possibleResponseLabel, possibleResponse_questionId)
VALUE ('reponse',25);

INSERT INTO possibleResponse (possibleResponseLabel)
VALUE ('reponse2');

INSERT INTO question (questionLabel, question_categoryId)
VALUES ('reponse2',22);


USE jobbydb;
UPDATE question
SET questionLabel = 'question2'
WHERE questionLabel = 'reponse2';

-- relier question bidon 2 a la category bidon 2
SELECT * FROM
    jobbydb.category AS c
   INNER JOIN
   jobbydb.question AS q
   ON
   c.categoryId = q.question_categoryId
   LEFT JOIN
    jobbydb.possibleResponse as p
    on
   q.questionId = p.possibleResponse_questionId;
   
   -- on creer un demande avec un user --
   USE jobbydb;
   INSERT INTO demand (demandCode,demand_userId,demand_categoryId)
   VALUES (concat('demand_',uuid()),2,5);
  
  SELECT * FROM demand;
  
  -- recuperer possibleReponseLabel a partir de la demande --  
  USE jobbydb;
  SELECT possibleResponseLabel FROM possibleResponse WHERE possibleResponse_questionId IN 
  ( SELECT questionid FROM question WHERE question_categoryId IN
  ( SELECT demand_categoryId FROM demand WHERE demandId));
  
  USE jobbydb;
  SELECT possibleResponseLabel FROM possibleResponse WHERE possibleResponse_questionId IN 
  ( SELECT questionid FROM question WHERE question_categoryId IN
  ( SELECT demand_categoryId FROM demand WHERE demandId IN
  ( SELECT userId FROM user WHERE demand_userId = 2)));
  
    USE jobbydb;
  SELECT possibleResponseLabel FROM possibleResponse WHERE possibleResponse_questionId IN 
  ( SELECT questionid FROM question WHERE question_categoryId IN
  ( SELECT demand_categoryId FROM demand WHERE demandId IN
  ( SELECT demand_userId FROM demand  WHERE demand_userId IN
  ( SELECT userid FROM user WHERE userLastName = 'valjean'))));
  
  -- integrite referencielle --
  
  ALTER TABLE `jobbydb`.`question` 
ADD INDEX `fk_question_1_idx` (`question_categoryId` ASC) VISIBLE;
;
ALTER TABLE `jobbydb`.`question` 
ADD CONSTRAINT `fk_question_1`
  FOREIGN KEY (`question_categoryId`)
  REFERENCES `jobbydb`.`category` (`categoryId`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


 -- COUNT --
 
 USE jobbydb;
 SELECT COUNT(*) FROM category;
-- LIMIT --  
USE jobbydb;
SELECT * FROM category LIMIT 10;


--   --   
USE jobbydb;
SELECT * FROM category WHERE categoryId > 5
AND categoryId < 10;

USE jobbydb;
SELECT * FROM category WHERE categoryId = 10;

-- OR --
USE jobbydb;
SELECT * FROM category WHERE categoryId = 5
or categoryId = 10;

USE jobbydb;
SELECT * FROM category WHERE categoryId = 2
AND (categoryLABEL = 'transport' or categoryLabel = 'voiture');

USE jobbydb;
SELECT * FROM category WHERE categoryId = 2
AND (categoryLABEL = 'multimedia' or categoryLabel = 'test');

--  ORDER BY --  
USE jobbydb;
SELECT * FROM question 
WHERE question_categoryId = 5
ORDER BY questionOrder DESC ;

    -- update categorylabel des category qui sont present dans la demande de jean
    
    
    USE jobbydb;
    UPDATE category SET categoryLabel = 'maison' WHERE categoryId IN
	( SELECT demand_categoryId FROM demand WHERE demand_userId IN
    ( SELECT userId FROM user WHERE userFirstName = 'jean' ));

USE jobbydb;
INSERT INTO menu (menuTitle,menuLink) 
value ('Inscription','/register'),
('Connexion','/connexion'),
('À propos','/about'),
('Contact','/contact');

SELECT menuTitle AS title, menuLink AS link FROM menu

USE jobbydb;
INSERT INTO footer (footerTitle,footerParentLinks)
VALUE ('links',null),
('locations',null);

USE jobbydb;
INSERT INTO footer (footerTitle,footerLink,footerIcon,footerParentLinks,footerParentLocations)
VALUE 
('Accueil','/home',null,1,null),
('Contact','/contact',null,1,null),
('Blog','/blog',null,1,null),
('facebook',null,'fab fa-facebook-square',1,null),
('twitter',null,'fab fa-twitter-square',1,null),
('Lille',null,null,null,2),
('Paris',null,null,null,2),
('Bordeaux',null,null,null,2),
('Lyon',null,null,null,2),
('Marseille',null,null,null,2);





SELECT 
        pr.possibleResponseId AS id,
        pr.possibleResponseLabel AS label,
        pr.possibleResponseCode AS code,
        qt.questionTypeLabel AS type
          FROM possibleResponse AS pr INNER JOIN questionType AS qt ON pr.possibleResponseType = qt.questionTypeId
             WHERE possibleResponse_questionId = 1