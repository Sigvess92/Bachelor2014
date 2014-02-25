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

INSERT INTO workhours (hoursTotal, percentExternal) VALUES (40,77.8);
INSERT INTO Issues (issuetype, status) VALUES ('Bug','Resolved');
INSERT INTO Issues (issuetype, status) VALUES ('Test case','Passed');
INSERT INTO Issues (issuetype, status) VALUES ('Bug','Open');

