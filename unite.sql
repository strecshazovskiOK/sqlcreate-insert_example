DROP TABLE OrganizedEvents;
DROP TABLE SocietyMember;
DROP TABLE BoardMember;
DROP TABLE Event;
DROP TABLE Itenary;
DROP TABLE DisciplinaryCase;
DROP TABLE Society;
DROP TABLE Faculty;
DROP TABLE Student;
set pagesize 100;
column instructor_id format a10;
column name format a20;
column surname format a30;
column email format a10;
column department_code format  a6;
CREATE TABLE Faculty ( 
    instructor_id VARCHAR2(20) NOT NULL, 
    name VARCHAR(255) NOT NULL, 
    surname VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    department_code VARCHAR(255) NOT NULL, 
    PRIMARY KEY (instructor_id) 
);
column student_id format a10;
column name format a20;
column surname format a30;
column email format a10;
column dob format a10;
column department_code format  a6;
CREATE TABLE Student (
    student_id VARCHAR2(20) NOT NULL,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    department_code VARCHAR(255) NOT NULL,
    PRIMARY KEY (student_id)
);
column society_id format a10;
column name format a20;
column location format a30;
column established_date format a20;
column president format a10;
column supervisor format  a6;
column type format a10;
CREATE TABLE Society ( 
    society_id VARCHAR2(20) NOT NULL, 
    name VARCHAR(255) NOT NULL, 
    location VARCHAR(255) NOT NULL, 
    established_date DATE NOT NULL, 
    president VARCHAR2(20) NOT NULL, 
    supervisor VARCHAR2(20) NOT NULL, 
    type VARCHAR(255) NOT NULL, 
    PRIMARY KEY (society_id), 
 CONSTRAINT fk_president FOREIGN KEY (president) REFERENCES Student(student_id),        
 CONSTRAINT fk_supervisor FOREIGN KEY (supervisor) REFERENCES  Faculty(instructor_id) 
);
column student_id format a10;
column given_date format a20;
column description format a20;
column result format a10;
CREATE TABLE DisciplinaryCase ( 
    student_id VARCHAR2(20) NOT NULL, 
    given_date DATE NOT NULL, 
    description VARCHAR(300) NOT NULL, 
    result VARCHAR(255) NOT NULL, 
    supervisor VARCHAR2(20) NOT NULL, 
    CONSTRAINT fk_d_student_id FOREIGN KEY (student_id) REFERENCES Student(student_id), 
    CONSTRAINT fk_d_supervisor_id FOREIGN KEY (supervisor) REFERENCES Faculty(instructor_id) 
);
    column item_id format a10;
    column description format a20;
    column society_id format a30;
    column start_date format a10;
    column end_date format a10;
   CREATE TABLE Itenary ( 
    item_id VARCHAR2(20) NOT NULL, 
    description VARCHAR2(300), 
    society_id VARCHAR2(20) NOT NULL, 
    start_date DATE NOT NULL, 
    end_date DATE NOT NULL, 
    PRIMARY KEY (item_id), 
    CONSTRAINT fk_i_society_id FOREIGN KEY (society_id) REFERENCES Society(society_id) 
);
    column event_id format a10;
    column name format a20;
    column location format a10;
    column event_date format a10;
    column event_time format a10;
    column department_code format  a6;
CREATE TABLE Event (
    event_id VARCHAR2(20) NOT NULL,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    event_time TIMESTAMP NOT NULL,
    PRIMARY KEY (event_id)
);

column start date format a10;
CREATE TABLE BoardMember ( 
    student_id VARCHAR2(20) NOT NULL, 
    society_id VARCHAR2(20) NOT NULL, 
    start_date DATE NOT NULL, 
    PRIMARY KEY (student_id, society_id),
    CONSTRAINT fk_b_student_id FOREIGN KEY (student_id) REFERENCES Student(student_id), 
    CONSTRAINT fk_b_society_id FOREIGN KEY (society_id) REFERENCES Society(society_id) 
);
column register_date format a10;
CREATE TABLE SocietyMember ( 
    student_id VARCHAR2(20) NOT NULL, 
    society_id VARCHAR2(20) NOT NULL, 
    register_date DATE NOT NULL, 
    PRIMARY KEY (student_id,society_id),
    CONSTRAINT fk_s_student_id FOREIGN KEY (student_id) REFERENCES Student(student_id), 
    CONSTRAINT fk_s_society_id FOREIGN KEY (society_id) REFERENCES Society(society_id) 
);

    column budget format a10;
    column cost format a10;
    column sponsor format a10;
CREATE TABLE OrganizedEvents ( 
    event_id VARCHAR2(20) NOT NULL, 
    society_id VARCHAR2(20) NOT NULL, 
    budget VARCHAR(255) NOT NULL, 
    cost VARCHAR(255) NOT NULL, 
    sponsor VARCHAR(255) NOT NULL, 
    PRIMARY KEY (event_id, society_id),
    CONSTRAINT fk_o_event_id FOREIGN KEY (event_id) REFERENCES Event(event_id), 
    CONSTRAINT fk_o_society_id FOREIGN KEY (society_id) REFERENCES Society(society_id) 
);


INSERT INTO Faculty (instructor_id, name, surname, email, department_code)
VALUES ('952', 'Yeliz', 'Yesilada', 'yyeliz@metu.edu.tr', '355');
INSERT INTO Faculty (instructor_id, name, surname, email, department_code)
VALUES ('953', 'Enver', 'Ever', 'eever@metu.edu.tr', '355');
INSERT INTO Faculty (instructor_id, name, surname, email, department_code)
VALUES ('954', 'Sukru', 'Eraslan', 'seraslan@metu.edu.tr', '355');



INSERT INTO Student (student_id, name, surname, email, dob, department_code)
VALUES ('2857854', 'Kazim', 'Gozler', 'k.dozler@metu.edu.tr', TO_DATE('2000-01-01', 'YYYY-MM-DD'), '355');
INSERT INTO Student (student_id, name, surname, email, dob, department_code)
VALUES ('2864512', 'Mete', 'Koc', 'mete.koc@metu.edu.tr', TO_DATE('2001-09-30', 'YYYY-MM-DD'), '357');
INSERT INTO Student (student_id, name, surname, email, dob, department_code)
VALUES ('2861995', 'Samet', 'Yolcu', 'yolcu.samet@metu.edu.tr', TO_DATE('1999-12-23', 'YYYY-MM-DD'), '378');
INSERT INTO Student (student_id, name, surname, email, dob, department_code)
VALUES ('279135', 'Halil', 'Kaya', 'hkaya@metu.edu.tr', TO_DATE('2003-01-01', 'YYYY-MM-DD'), '362');
INSERT INTO Student (student_id, name, surname, email, dob, department_code)
VALUES ('2811362', 'Yagiz', 'Ozturk', 'yagiz.ozturk@metu.edu.tr', TO_DATE('2000-10-13', 'YYYY-MM-DD'), '371');
INSERT INTO Student (student_id, name, surname, email, dob, department_code)
VALUES ('2857855', 'Ayse', 'Dilar', 'a.dilar@metu.edu.tr', TO_DATE('2002-02-02', 'YYYY-MM-DD'), '355');
INSERT INTO Student (student_id, name, surname, email, dob, department_code)
VALUES ('2857856', 'Hasan', 'Sarp', 'h.sarp@metu.edu.tr', TO_DATE('2002-10-02', 'YYYY-MM-DD'), '355');


INSERT INTO Society (society_id, name, location, established_date, president, supervisor, type)
VALUES ('594', 'tiyatrODTU', 'R-5', TO_DATE('2007-12-11', 'YYYY-MM-DD'), '2857854', '953', 'art');
INSERT INTO Society (society_id, name, location, established_date, president, supervisor, type)
VALUES ('482', 'ACM', 'R-8', TO_DATE('2022-02-05', 'YYYY-MM-DD'), '2864512', '952', 'technical');
INSERT INTO Society (society_id, name, location, established_date, president, supervisor, type)
VALUES ('291', 'Fotodtu', 'R-9', TO_DATE('2014-10-24', 'YYYY-MM-DD'), '2861995', '954', 'art');
INSERT INTO Society (society_id, name, location, established_date, president, supervisor, type)
VALUES ('292', 'Women in Engineering', 'R-10', TO_DATE('2020-02-05', 'YYYY-MM-DD'), '2857855', '952', 'technical');


INSERT INTO DisciplinaryCase (student_id, supervisor, given_date, description, result)
VALUES ('2861995', '952', TO_DATE('2022-10-25', 'YYYY-MM-DD'), 'Violation of rule 3', '2 year ban');

INSERT INTO Itenary (item_id, description, society_id, start_date, end_date)
VALUES ('51824', 'Projector', '482', TO_DATE('2023-02-08', 'YYYY-MM-DD'), TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO Itenary (item_id, description, society_id, start_date, end_date)
VALUES ('51825', 'Speaker', '482', TO_DATE('2022-02-08', 'YYYY-MM-DD'), TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO Itenary (item_id, description, society_id, start_date, end_date)
VALUES ('51826', 'Water dispenser', '292', TO_DATE('2022-03-08', 'YYYY-MM-DD'), TO_DATE('2022-03-01', 'YYYY-MM-DD'));



INSERT INTO Event (event_id, name, location, event_date, event_time)
VALUES ('491', 'Tiyatro Senligi', 'KKM', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_TIMESTAMP('20:00:00', 'HH24:MI:SS'));
INSERT INTO Event (event_id, name, location, event_date, event_time)
VALUES ('561', 'Halween Party', 'Artolye', TO_DATE('2023-10-28', 'YYYY-MM-DD'), TO_TIMESTAMP('22:00:00', 'HH24:MI:SS'));
INSERT INTO Event (event_id, name, location, event_date, event_time)
VALUES ('351', 'Robotic Contest', 'Artoyle', TO_DATE('2023-11-30', 'YYYY-MM-DD'), TO_TIMESTAMP('20:00:00', 'HH24:MI:SS'));
INSERT INTO Event (event_id, name, location, event_date, event_time)
VALUES ('550', 'Performing Arts', 'KKM', TO_DATE('2023-12-23', 'YYYY-MM-DD'), TO_TIMESTAMP('21:00:00', 'HH24:MI:SS'));
INSERT INTO Event (event_id, name, location, event_date, event_time)
VALUES ('492', 'Concert', 'KKM', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_TIMESTAMP('20:00:00', 'HH24:MI:SS'));
INSERT INTO Event (event_id, name, location, event_date, event_time)
VALUES ('493', 'Pop Concert', 'KKM', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_TIMESTAMP('20:00:00', 'HH24:MI:SS'));
INSERT INTO Event (event_id, name, location, event_date, event_time)
VALUES ('494', 'Pop Concert', 'KKM', TO_DATE('2013-03-01', 'YYYY-MM-DD'), TO_TIMESTAMP('20:00:00', 'HH24:MI:SS'));


INSERT INTO BoardMember (student_id, society_id, start_date)
VALUES ('2864512', '482', TO_DATE('2022-02-05', 'YYYY-MM-DD'));
INSERT INTO BoardMember (student_id, society_id, start_date)
VALUES ('2857854', '594', TO_DATE('2007-12-11', 'YYYY-MM-DD'));
INSERT INTO BoardMember (student_id, society_id, start_date)
VALUES ('2857855', '292', TO_DATE('2023-12-10', 'YYYY-MM-DD'));
INSERT INTO BoardMember (student_id, society_id, start_date)
VALUES ('279135', '292', TO_DATE('2023-10-10', 'YYYY-MM-DD'));
INSERT INTO BoardMember (student_id, society_id, start_date)
VALUES ('279135', '482', TO_DATE('2022-02-05', 'YYYY-MM-DD'));


INSERT INTO SocietyMember (student_id, society_id, register_date)
VALUES ('2864512', '482', TO_DATE('2022-02-05', 'YYYY-MM-DD'));
INSERT INTO SocietyMember (student_id, society_id, register_date)
VALUES ('2857854', '594', TO_DATE('2023-10-15', 'YYYY-MM-DD'));
INSERT INTO SocietyMember (student_id, society_id, register_date)
VALUES ('2857855', '482', TO_DATE('2023-09-10', 'YYYY-MM-DD'));
INSERT INTO SocietyMember (student_id, society_id, register_date)
VALUES ('2857856', '594', TO_DATE('2023-09-11', 'YYYY-MM-DD'));

INSERT INTO OrganizedEvents (event_id, society_id, budget, cost, sponsor)
VALUES ('493', '292', '60000', '2000', 'Vodafone');
INSERT INTO OrganizedEvents (event_id, society_id, budget, cost, sponsor)
VALUES ('494', '482', '50000', '2000', 'Turkcell');
INSERT INTO OrganizedEvents (event_id, society_id, budget, cost, sponsor)
VALUES ('491', '482', '30000', '25000', 'Gorila');
INSERT INTO OrganizedEvents (event_id, society_id, budget, cost, sponsor)
VALUES ('561', '594', '29999', '29999', 'Redbull');