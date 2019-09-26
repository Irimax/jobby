 -- selectionner la categoryLABEL
 
 USE jobbydb;
 SELECT categoryLabel FROM category;
 
  USE jobbydb;
  SELECT * FROM question WHERE questionId > 5
  AND questionId < 20;
  
   USE jobbydb;
	SELECT * FROM possibleResponse 
    WHERE possibleResponseId BETWEEN   5 AND   20;
    
     USE jobbydb;
     SELECT * FROM question IN ( 
     SELECT  question_categoryId
     FROM category 
     WHERE questionLabel = 'maison');
     
	USE jobbydb;
     SELECT *
	FROM question WHERE question_categoryId IN (
    SELECT categoryId
		FROM category
    WHERE  categoryLabel = 'maison');
    
    USE jobbydb;
    SELECT * FROM possibleResponse WHERE possibleResponse_questionId IN 
    ( SELECT questionId FROM question WHERE question_categoryId IN
    ( SELECT categoryId FROM category 
    WHERE categoryLabel = 'maison'));
    
    
    USE jobbydb;
    SELECT * FROM possibleResponse WHERE possibleResponse_questionId IN 
    ( SELECT questionId  FROM question WHERE question_categoryId IN
    ( SELECT categoryId FROM category WHERE categoryId IN 
    ( SELECT demand_categoryId FROM demand WHERE demand_userId IN
    ( SELECT userId FROM user WHERE userFirstName = 'jean' ))));
    
    
    -- update categorylabel des category qui sont present dans la demande de jean
    
    
    USE jobbydb;
    UPDATE category SET categoryLabel = 'maison' WHERE categoryId IN
	( SELECT demand_categoryId FROM demand WHERE demand_userId IN
    ( SELECT userId FROM user WHERE userFirstName = 'jean' ));
    
    -- recupere les cat et les question
    USE jobbydb;
    SELECT * FROM category AS c
    INNER JOIN question  AS q ON c.categoryId = q.question_categoryId;
    
    -- category lier question et pas question category
    
     USE jobbydb;
    SELECT * FROM question AS q
    LEFT JOIN category  AS c ON c.categoryId = q.question_categoryId;
    
    -- recupere les category lier question et les reponses
    
    USE jobbydb;
    SELECT * FROM category AS c
    INNER JOIN question  AS q ON c.categoryId = q.question_categoryId
    INNER JOIN possibleResponse AS p ON p.possibleResponse_questionId = q.questionId;
    
 --    recuperer  
 USE jobbydb;
 SELECT * FROM category AS c
 LEFT JOIN question AS q ON c.categoryId = q.question_categoryId
 WHERE q.question_categoryId IS NULL;
 
  USE jobbydb;
    SELECT * FROM category AS c
    INNER JOIN question  AS q ON c.categoryId = q.question_categoryId
    LEFT JOIN possibleResponse AS p ON p.possibleResponse_questionId = q.questionId;
    
    
      USE jobbydb;
    SELECT * FROM category AS c
    RIGHT JOIN question  AS q ON c.categoryId = q.question_categoryId
	LEFT JOIN possibleResponse AS p ON p.possibleResponse_questionId = q.questionId;
    
    