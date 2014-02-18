
CREATE EVENT myevent
    ON SCHEDULE EVERY 5 SECOND
    DO  
    INSERT INTO workhours (hoursTotal, percentExternal) VALUES(50,70);