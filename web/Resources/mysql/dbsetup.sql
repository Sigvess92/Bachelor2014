CREATE TABLE WorkHours (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    hoursTotal INT,
    percentExternal DOUBLE,    
    PRIMARY KEY (id)
);
CREATE TABLE Issues (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    issuetype VARCHAR(20),
    status VARCHAR(20),    
    PRIMARY KEY (id)
);

CREATE TABLE AchievementsGranted (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(20),
    description VARCHAR(100),
    image VARCHAR(60),
    treshold INT,
    reward INT,
    PRIMARY KEY (id)
);
CREATE TABLE AchievementsAvailable (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(20),
    description VARCHAR(100),
    image VARCHAR(60),
    treshold INT,
    reward INT,
    PRIMARY KEY (id)
);

INSERT INTO workhours (hoursTotal, percentExternal) VALUES (40,77.8);
INSERT INTO Issues (issuetype, status) VALUES ('Bug','Resolved');
INSERT INTO Issues (issuetype, status) VALUES ('Test case','Passed');
INSERT INTO Issues (issuetype, status) VALUES ('Bug','Open');
INSERT INTO AchievementsAvailable (title, description, image, treshold, reward) VALUES ('Completionist','All of you have registered timesheets on time this week!','ach1.jpg',18,5);
INSERT INTO AchievementsAvailable (title, description, image, treshold, reward) VALUES ('Perfectionist','All of you have registered timesheets on time for 2 weeks in a row!','ach2.jpg',36,5);
INSERT INTO AchievementsAvailable (title, description, image, treshold, reward) VALUES ('Savant','All of you have registered timesheets on time for 3 weeks in a row!!','ach3.jpg',54,5);
INSERT INTO AchievementsAvailable (title, description, image, treshold, reward) VALUES ('Ruler of time','All of you have registered timesheets on time this month!','ach4.jpg',72,5);

SELECT treshold FROM achievements WHERE 20>achievements.treshold;
