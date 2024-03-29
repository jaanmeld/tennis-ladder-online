CREATE TABLE "PUBLIC"."LADDER"
(
   ID bigint PRIMARY KEY NOT NULL,
   VERSION bigint NOT NULL,
   NAME varchar NOT NULL
)
;
CREATE TABLE "PUBLIC"."LEVEL"
(
   ID bigint PRIMARY KEY NOT NULL,
   VERSION bigint NOT NULL,
   LADDER_ID bigint NOT NULL,
   LEVEL integer NOT NULL
)
;
CREATE TABLE "PUBLIC"."LEVEL_POSITION"
(
   ID bigint PRIMARY KEY NOT NULL,
   VERSION bigint NOT NULL,
   LEVEL_ID bigint NOT NULL,
   POS integer NOT NULL,
   TEAM_ID bigint,
   LADDER_ID bigint
)
;
CREATE TABLE "PUBLIC"."MATCH_SCHEDULE"
(
   ID bigint PRIMARY KEY NOT NULL,
   VERSION bigint NOT NULL,
   CHALLEGER_SCORE integer NOT NULL,
   CHALLENGER_ID bigint,
   DEFENDER_ID bigint,
   DEFENDER_SCORE integer NOT NULL,
   IS_DEFAULT boolean NOT NULL,
   MATCH_DATE timestamp NOT NULL,
   PLAN_MATCH_DATE timestamp NOT NULL
)
;
CREATE TABLE "PUBLIC"."MESSAGE"
(
   ID bigint PRIMARY KEY NOT NULL,
   VERSION bigint NOT NULL,
   MESSAGE varchar NOT NULL
)
;
CREATE TABLE "PUBLIC"."PLAYER"
(
   ID bigint PRIMARY KEY NOT NULL,
   VERSION bigint NOT NULL,
   EMAIL varchar NOT NULL,
   FIRST_NAME varchar NOT NULL,
   LAST_NAME varchar NOT NULL,
   PHONE varchar NOT NULL
)
;
CREATE TABLE "PUBLIC"."PLAYER_LEVEL"
(
   PLAYER_LEVELS_ID bigint,
   LEVEL_ID bigint
)
;
CREATE TABLE "PUBLIC"."TEAM"
(
   ID bigint PRIMARY KEY NOT NULL,
   VERSION bigint NOT NULL,
   LADDER_ID bigint NOT NULL,
   LAST_MATCH_SCHEDULE_ID bigint,
   PLAYER1_ID bigint NOT NULL,
   PLAYER2_ID bigint,
   POSITION_ID bigint,
   STATUS varchar NOT NULL
)
;
CREATE UNIQUE INDEX SYS_IDX_215 ON LADDER(ID)
;
ALTER TABLE LEVEL
ADD CONSTRAINT FK6219B84CABF529A
FOREIGN KEY (LADDER_ID)
REFERENCES LADDER(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
CREATE INDEX SYS_IDX_225 ON LEVEL(LADDER_ID)
;
CREATE UNIQUE INDEX SYS_IDX_48 ON LEVEL(ID)
;
ALTER TABLE LEVEL_POSITION
ADD CONSTRAINT FKEE52E384CABF529A
FOREIGN KEY (LADDER_ID)
REFERENCES LADDER(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
ALTER TABLE LEVEL_POSITION
ADD CONSTRAINT FKEE52E384AA5DECBA
FOREIGN KEY (TEAM_ID)
REFERENCES TEAM(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
ALTER TABLE LEVEL_POSITION
ADD CONSTRAINT FKEE52E3848550A31A
FOREIGN KEY (LEVEL_ID)
REFERENCES LEVEL(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
CREATE INDEX SYS_IDX_245 ON LEVEL_POSITION(LADDER_ID)
;
CREATE INDEX SYS_IDX_229 ON LEVEL_POSITION(LEVEL_ID)
;
CREATE UNIQUE INDEX SYS_IDX_217 ON LEVEL_POSITION(ID)
;
CREATE INDEX SYS_IDX_227 ON LEVEL_POSITION(TEAM_ID)
;
ALTER TABLE MATCH_SCHEDULE
ADD CONSTRAINT FKB5A617D14E8B774
FOREIGN KEY (DEFENDER_ID)
REFERENCES TEAM(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
ALTER TABLE MATCH_SCHEDULE
ADD CONSTRAINT FKB5A617D1CFCC8D68
FOREIGN KEY (CHALLENGER_ID)
REFERENCES TEAM(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
CREATE INDEX SYS_IDX_233 ON MATCH_SCHEDULE(DEFENDER_ID)
;
CREATE UNIQUE INDEX SYS_IDX_219 ON MATCH_SCHEDULE(ID)
;
CREATE INDEX SYS_IDX_231 ON MATCH_SCHEDULE(CHALLENGER_ID)
;
CREATE UNIQUE INDEX SYS_IDX_221 ON MESSAGE(ID)
;
CREATE UNIQUE INDEX SYS_IDX_52 ON PLAYER(ID)
;
ALTER TABLE PLAYER_LEVEL
ADD CONSTRAINT FK4FB2CA68550A31A
FOREIGN KEY (LEVEL_ID)
REFERENCES LEVEL(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
ALTER TABLE PLAYER_LEVEL
ADD CONSTRAINT FK4FB2CA61381A90E
FOREIGN KEY (PLAYER_LEVELS_ID)
REFERENCES PLAYER(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
CREATE INDEX SYS_IDX_65 ON PLAYER_LEVEL(LEVEL_ID)
;
CREATE INDEX SYS_IDX_63 ON PLAYER_LEVEL(PLAYER_LEVELS_ID)
;
ALTER TABLE TEAM
ADD CONSTRAINT FK36425D8F7AE09E
FOREIGN KEY (POSITION_ID)
REFERENCES LEVEL_POSITION(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
ALTER TABLE TEAM
ADD CONSTRAINT FK36425DCABF529A
FOREIGN KEY (LADDER_ID)
REFERENCES LADDER(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
ALTER TABLE TEAM
ADD CONSTRAINT FK36425DB7F814B
FOREIGN KEY (PLAYER1_ID)
REFERENCES PLAYER(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
ALTER TABLE TEAM
ADD CONSTRAINT FK36425DB7FF5AA
FOREIGN KEY (PLAYER2_ID)
REFERENCES PLAYER(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
ALTER TABLE TEAM
ADD CONSTRAINT FK36425D10A7AA3C
FOREIGN KEY (LAST_MATCH_SCHEDULE_ID)
REFERENCES MATCH_SCHEDULE(ID) ON DELETE NO ACTION ON UPDATE NO ACTION

;
CREATE INDEX SYS_IDX_237 ON TEAM(POSITION_ID)
;
CREATE INDEX SYS_IDX_235 ON TEAM(LADDER_ID)
;
CREATE UNIQUE INDEX SYS_IDX_223 ON TEAM(ID)
;
CREATE INDEX SYS_IDX_243 ON TEAM(LAST_MATCH_SCHEDULE_ID)
;
CREATE INDEX SYS_IDX_241 ON TEAM(PLAYER1_ID)
;
CREATE INDEX SYS_IDX_239 ON TEAM(PLAYER2_ID)
;



INSERT INTO "PUBLIC"."LADDER" (ID,VERSION,NAME) VALUES (1,0,'single');
INSERT INTO "PUBLIC"."LADDER" (ID,VERSION,NAME) VALUES (2,0,'mix double');


INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (1,0,1,1);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (2,0,1,2);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (3,0,1,3);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (4,0,1,4);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (5,0,1,5);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (6,0,2,1);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (7,0,2,2);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (8,0,2,3);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (9,0,2,4);
INSERT INTO "PUBLIC"."LEVEL" (ID,VERSION,LADDER_ID,LEVEL) VALUES (10,0,1,6);


INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (1,0,1,1,1,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (2,0,2,1,2,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (3,0,2,2,3,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (4,0,3,1,4,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (5,0,3,2,5,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (6,0,3,3,6,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (7,0,4,1,7,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (8,0,4,2,8,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (9,0,4,3,9,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (10,0,4,4,10,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (11,0,5,1,13,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (12,0,5,2,11,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (13,0,5,3,12,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (14,0,5,4,14,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (15,0,5,5,15,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (16,0,10,1,16,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (17,0,10,2,17,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (18,0,10,3,18,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (19,0,10,4,19,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (20,0,10,5,20,1);
INSERT INTO "PUBLIC"."LEVEL_POSITION" (ID,VERSION,LEVEL_ID,POS,TEAM_ID,LADDER_ID) VALUES (21,0,10,6,21,1);






INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (1,0,'will.han@gmail.com','Will','Han','4163212524');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (2,0,'b.minamata@sympatico.ca','BILL','MINAMATA','4162842802');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (3,0,'KKCATCHER@CA.Ibm.com','KIM','CATCHER','4164785096');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (4,1,'t2rare@yahoo.com','Frederick','RARA','4169079554');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (5,0,'natsw@rogers.com','NATALIE','WONG','4165022714');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (6,0,'sunbo11@hotmail.com','BO','SUN','4168895988');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (7,0,'wilsonsoon@yahoo.com','WILSON','SOON','9054899921');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (8,0,'caminliu@yahoo.com','MIN','LIU','4169889886');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (9,1,'jrmyjgan@yahoo.com','JEREMY JAN','GAN','6472012238');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (10,1,'sintakfong@yahoo.com','SIN TAK','FONG','4164912965');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (11,0,'jamescai@hotmail.com','JAMES','CAI','6473398562');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (12,0,'zrlsy@hotmail.com','STAN','LIAO','4167254391');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (13,1,'ahdn75@hotmail.com','DAN','CORMIER','4167512654');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (14,1,'richardzhang214@gmail.com','RICHARD','ZHANG','4167543813');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (15,1,'antoniodelgra@yahoo.com.ph','TONY','DELGRA','6473405441');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (16,0,'samfrancella@rogers.com','SAM','FRANCELLA','4162624771');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (17,0,'kassgaac@gmail.com','PAUL','KASSGAACD','4162910055');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (18,0,'lch_pang@hotmail.com','ETHAN','LI','4144355467');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (19,0,'dong-gao2003@hotmail.com','DONG','GAO','2899995027');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (20,0,'marcpeng@yahoo.com','MARC','PENG','4165702764');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (21,0,'hchang9889@rogers.com','chang','hong','4164994093');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (22,0,'yedarren@yahoo.com','DARREN','YE','4169947610');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (23,0,'99clem@yahoo.com','CLEMENT','CHUNG','4165643308');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (24,0,'cajianbang@hotmail.com','JIAN','DO','6473885331');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (25,0,'jmartin10@rogers.com','JO','CLAYTON-MARTIN','4162937091');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (26,1,'rajubhayana@yahoo.com','RAJEEV','Bhayana','4168878635');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (27,0,'flpbest@yahoo.ca','SUZAN','ZHU','4162931406');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (28,0,'girdhar@sympatico.ca','RAVI','GIRDHAR','4164977849');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (29,0,'domwan@hotmail.com','DOMINIQUE','AU','6472721268');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (30,0,'gothom@rogers.com','GORD','THOMPSON','9059489412');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (31,0,'mariahscary@gmail.com','JOHN','RHEE','9054743660');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (32,0,'mariahscary@gmail.com','GLORIA','KYUNG','9054743660');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (33,0,'jenny4568@yahoo.com','JENNY','HUANG','4168738668');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (34,0,'aurora.drapiza@sympatico.ca','AURORA','Drapiza','4164316594');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (35,1,'edlum@rogers.com','Eddy','Lum','4165058826');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (36,0,'girl_toronto@yahoo.com','LILIT','KHACHATRYAN','4169123447');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (37,0,'grlee@rogers.com','GARRY','LEE','4162970281');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (38,0,'mmklee@rogers.com','MAGGIE','LEE','4162970281');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (39,0,'SAMMICAN@ROGERS.COM','LAURA','SOONDERAM','4162610166');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (40,0,'dsun@dineen.com','DAVID','SUN','4165206022');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (41,0,'shindeyas@yahoo.com','Michiko','Shinde','4164992102');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (42,0,'','kyle','Reynolds','4162916485');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (43,1,'rlee8788@gmail.com','RUBY','LEE','9055857315');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (44,0,'jhollins@sympatico.ca','JIM','Hollins','4164910697');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (45,0,'jhollins@sympatico.ca','Cheryl','Hollins','4164910697');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (46,0,'eric_lu_2006@yahoo.ca','Eric','Lu','4167929236');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (47,0,'ghagleitner@yahoo.ca','Georgina','Hagleitner','9058878992');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (48,0,'weipeizou@hotmail.com','Wei Pei','Zou','6474071868');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (49,0,'snow.hsiung@td.com','Snow','Hsiung','4162779226');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (50,0,'aurora.drapiza@sympatico.ca','Daniel','Drapiza','4162779226');
INSERT INTO "PUBLIC"."PLAYER" (ID,VERSION,EMAIL,FIRST_NAME,LAST_NAME,PHONE) VALUES (51,0,'ladder.stephen.leacock','ladder','stephen.leacock','');




INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (1,0,1,null,2,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (2,0,1,null,3,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (3,0,1,null,4,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (4,0,1,null,5,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (5,0,1,null,6,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (6,0,1,null,7,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (7,0,1,null,8,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (8,0,1,null,9,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (9,0,1,null,10,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (10,0,1,null,11,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (11,0,1,null,12,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (12,0,1,null,13,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (13,0,1,null,1,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (14,0,1,null,14,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (15,0,1,null,15,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (16,0,1,null,16,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (17,0,1,null,17,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (18,0,1,null,18,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (19,0,1,null,19,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (20,0,1,null,20,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (21,0,1,null,21,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (22,0,1,null,22,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (23,0,1,null,23,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (24,0,1,null,24,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (25,0,1,null,46,null,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (26,0,2,null,3,5,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (27,1,2,null,32,31,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (28,0,2,null,25,26,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (29,0,2,null,29,30,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (30,0,2,null,14,33,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (31,0,2,null,34,35,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (32,0,2,null,37,38,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (33,0,2,null,16,43,null,'DEFENDER');
INSERT INTO "PUBLIC"."TEAM" (ID,VERSION,LADDER_ID,LAST_MATCH_SCHEDULE_ID,PLAYER1_ID,PLAYER2_ID,POSITION_ID,STATUS) VALUES (34,0,2,null,44,45,null,'DEFENDER');
