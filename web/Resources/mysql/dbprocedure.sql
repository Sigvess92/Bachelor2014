DELIMITER //

DROP PROCEDURE insert_range IF EXISTS//
CREATE PROCEDURE insert_range()
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE j INT DEFAULT 20;
  IF i <= 80 && j <=100
    THEN
    INSERT INTO workhours (hoursTotal, percentExternal) VALUES(i,j);
    SET i = i + 1;
    SET j = j + 1;
  END IF;
END//

DELIMITER; 


