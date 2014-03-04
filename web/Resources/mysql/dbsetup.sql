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
    description VARCHAR(60),
    treshold INT,
    reward INT,
    PRIMARY KEY (id)
);
CREATE TABLE AchievementsAvailable (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(20),
    description VARCHAR(60),
    treshold INT,
    reward INT,
    PRIMARY KEY (id)
);

INSERT INTO workhours (hoursTotal, percentExternal) VALUES (40,77.8);
INSERT INTO Issues (issuetype, status) VALUES ('Bug','Resolved');
INSERT INTO Issues (issuetype, status) VALUES ('Test case','Passed');
INSERT INTO Issues (issuetype, status) VALUES ('Bug','Open');
INSERT INTO AchievementsAvailable (title, description, treshold, reward) VALUES ('Completionist','All of you have registered timesheets on time this week!',18,5);

SELECT treshold FROM achievements WHERE 20>achievements.treshold;
