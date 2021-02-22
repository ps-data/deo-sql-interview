-- DE Interview script - sample data

-- URL for online editor
-- https://sqliteonline.com/
-- choose Postgres engine and connect

-- set up script ----------------------------------------------------
---------------------------------------------------------------------

--  User (dim)
DROP TABLE IF EXISTS dim_User;
CREATE TABLE dim_User
(
	User_ID INTEGER
  ,User_Handle varchar(255)
  ,User_Name VARCHAR(255)
  ,Create_Date TIMESTAMP
  ,Country varchar(255)
);

-- Clip (dim) (hierarchy - Course / Module / Clip)
DROP TABLE IF EXISTS dim_Clip;
create table dim_Clip(
Clip_ID BIGINT
,Clip_name varchar(255)
,Course_ID BIGINT
,Course_name varchar(255)
,Module_ID BIGINT
,Module_name varchar(255)
,Subject_area varchar(255)
,Release_date TIMESTAMP
,Duration_seconds INTEGER
);

-- Date (dim)
DROP TABLE IF EXISTS dim_Date;
create table dim_Date(
Date_ID INTEGER
,Date_timestamp timestamp
,Day_number INTEGER
,Month_number INTEGER
,Year_number INTEGER
,Date_sequence INTEGER
);

-- ClipView (fact)
DROP TABLE IF EXISTS fact_View;
create table fact_View (
  View_ID INTEGER
  ,User_ID INTEGER
  ,Clip_ID INTEGER
  ,Start_Time TIMESTAMP
  ,Start_Date_ID INTEGER
  ,End_Time TIMESTAMP
  ,End_Date_ID INTEGER
  ,Watch_Seconds INTEGER
);

-- populate scripts
INSERT INTO dim_User
SELECT 0, 'Undefined', 'Undefined',CAST('1/1/2050' as timestamp),'Undefined' UNION ALL
SELECT 1, 'user1', 'John Wall',CAST('1/1/2010' as timestamp),'USA' UNION ALL
SELECT 2, 'user2', 'Lebron James',CAST('1/1/2010' as timestamp),'USA' UNION ALL
SELECT 3, 'user3', 'Steve Nash',CAST('1/1/2011' as timestamp),'CAN' UNION ALL
SELECT 4, 'user4', 'Bradley Wiggins',CAST('1/1/2012' as timestamp),'UK' UNION ALL
SELECT 5, 'user5', 'Kevin Durant',CAST('1/1/2013' as timestamp),'USA' UNION ALL
SELECT 6, 'user6', 'Felix Auger-Aliassime',CAST('1/1/2014' as timestamp),'CAN' 
;

INSERT INTO dim_Clip
SELECT 0, 'Undefined',0, 'Undefined', 0, 'Undefined' ,'Undefined', CAST('1/1/2050' as timestamp),0 UNION ALL
SELECT 1, 'Intro',1, 'Docker Fundamentals', 1, 'Basics' ,'DevOps', CAST('12/1/2015' as timestamp),247 UNION ALL
SELECT 2, 'Concepts',1, 'Docker Fundamentals', 1, 'Basics' ,'DevOps', CAST('12/1/2015' as timestamp),344 UNION ALL
SELECT 3, 'Windows',1, 'Docker Fundamentals', 2, 'Setting Up Your Environment' ,'DevOps', CAST('12/1/2015' as timestamp), 199 UNION ALL
SELECT 4, 'Mac',1, 'Docker Fundamentals', 2, 'Setting Up Your Environment' ,'DevOps', CAST('12/1/2015' as timestamp),222 UNION ALL
SELECT 5, 'Linux',1, 'Docker Fundamentals', 2, 'Setting Up Your Environment' ,'DevOps', CAST('12/1/2015' as timestamp),333 UNION ALL
SELECT 6, 'Intro',2, 'SQL Fundamentals', 3, 'Getting Started' ,'Databases', CAST('5/1/2019' as timestamp),144 UNION ALL
SELECT 7, 'Uses',2, 'SQL Fundamentals', 3, 'Getting Started' ,'Databases', CAST('5/1/2019' as timestamp),204 UNION ALL
SELECT 8, 'SELECTs',2, 'SQL Fundamentals', 4, 'Anatomy of a Query' ,'Databases', CAST('12/1/2019' as timestamp),333 UNION ALL
SELECT 9, 'FROM clause',2, 'SQL Fundamentals', 4, 'Anatomy of a Query' ,'Databases', CAST('12/1/2019' as timestamp),444  UNION ALL
SELECT 10, 'Intro',3, 'Python Fundamentals', 5, 'Basics' ,'Programming', CAST('10/1/2019' as timestamp),222  UNION ALL
SELECT 11, 'Concepts',3, 'Python Fundamentals', 5, 'Basics' ,'Programming', CAST('10/1/2019' as timestamp),243  UNION ALL
SELECT 12, 'Local Env',3, 'Python Fundamentals', 6, 'Getting Started' ,'Programming', CAST('10/1/2019' as timestamp),199  UNION ALL
SELECT 13, 'Syntax',3, 'Python Fundamentals', 6, 'Getting Started' ,'Programming', CAST('10/1/2019' as timestamp),232
;

INSERT INTO dim_Date
select 0, CAST('2050-12-31' as timestamp),0,0,0,0 UNION ALL
select 20190101, CAST('2019-01-01' as timestamp),1,1,2019,1 UNION ALL
select 20190102, CAST('2019-01-02' as timestamp),2,1,2019,2 UNION ALL
select 20190103, CAST('2019-01-03' as timestamp),3,1,2019,3 UNION ALL
select 20190104, CAST('2019-01-04' as timestamp),4,1,2019,4 UNION ALL
select 20190105, CAST('2019-01-05' as timestamp),5,1,2019,5 UNION ALL
select 20190106, CAST('2019-01-06' as timestamp),6,1,2019,6 UNION ALL
select 20190107, CAST('2019-01-07' as timestamp),7,1,2019,7 UNION ALL
select 20190108, CAST('2019-01-08' as timestamp),8,1,2019,8 UNION ALL
select 20190109, CAST('2019-01-09' as timestamp),9,1,2019,9 UNION ALL
select 20190110, CAST('2019-01-10' as timestamp),10,1,2019,10 UNION ALL
select 20190111, CAST('2019-01-11' as timestamp),11,1,2019,11 UNION ALL
select 20190112, CAST('2019-01-12' as timestamp),12,1,2019,12 UNION ALL
select 20190113, CAST('2019-01-13' as timestamp),13,1,2019,13 UNION ALL
select 20190114, CAST('2019-01-14' as timestamp),14,1,2019,14 UNION ALL
select 20190115, CAST('2019-01-15' as timestamp),15,1,2019,15 UNION ALL
select 20190116, CAST('2019-01-16' as timestamp),16,1,2019,16 UNION ALL
select 20190117, CAST('2019-01-17' as timestamp),17,1,2019,17 UNION ALL
select 20190118, CAST('2019-01-18' as timestamp),18,1,2019,18 UNION ALL
select 20190119, CAST('2019-01-19' as timestamp),19,1,2019,19 UNION ALL
select 20190120, CAST('2019-01-20' as timestamp),20,1,2019,20 UNION ALL
select 20190121, CAST('2019-01-21' as timestamp),21,1,2019,21 UNION ALL
select 20190122, CAST('2019-01-22' as timestamp),22,1,2019,22 UNION ALL
select 20190123, CAST('2019-01-23' as timestamp),23,1,2019,23 UNION ALL
select 20190124, CAST('2019-01-24' as timestamp),24,1,2019,24 UNION ALL
select 20190125, CAST('2019-01-25' as timestamp),25,1,2019,25 UNION ALL
select 20190126, CAST('2019-01-26' as timestamp),26,1,2019,26 UNION ALL
select 20190127, CAST('2019-01-27' as timestamp),27,1,2019,27 UNION ALL
select 20190128, CAST('2019-01-28' as timestamp),28,1,2019,28 UNION ALL
select 20190129, CAST('2019-01-29' as timestamp),29,1,2019,29 UNION ALL
select 20190130, CAST('2019-01-30' as timestamp),30,1,2019,30 UNION ALL
select 20190131, CAST('2019-01-31' as timestamp),31,1,2019,31 UNION ALL
select 20190201, CAST('2019-02-01' as timestamp),1,2,2019,32 UNION ALL
select 20190202, CAST('2019-02-02' as timestamp),2,2,2019,33 UNION ALL
select 20190203, CAST('2019-02-03' as timestamp),3,2,2019,34 UNION ALL
select 20190204, CAST('2019-02-04' as timestamp),4,2,2019,35 UNION ALL
select 20190205, CAST('2019-02-05' as timestamp),5,2,2019,36 UNION ALL
select 20190206, CAST('2019-02-06' as timestamp),6,2,2019,37 UNION ALL
select 20190207, CAST('2019-02-07' as timestamp),7,2,2019,38 UNION ALL
select 20190208, CAST('2019-02-08' as timestamp),8,2,2019,39 UNION ALL
select 20190209, CAST('2019-02-09' as timestamp),9,2,2019,40 UNION ALL
select 20190210, CAST('2019-02-10' as timestamp),10,2,2019,41 UNION ALL
select 20190211, CAST('2019-02-11' as timestamp),11,2,2019,42 UNION ALL
select 20190212, CAST('2019-02-12' as timestamp),12,2,2019,43 UNION ALL
select 20190213, CAST('2019-02-13' as timestamp),13,2,2019,44 UNION ALL
select 20190214, CAST('2019-02-14' as timestamp),14,2,2019,45 UNION ALL
select 20190215, CAST('2019-02-15' as timestamp),15,2,2019,46 UNION ALL
select 20190216, CAST('2019-02-16' as timestamp),16,2,2019,47 UNION ALL
select 20190217, CAST('2019-02-17' as timestamp),17,2,2019,48 UNION ALL
select 20190218, CAST('2019-02-18' as timestamp),18,2,2019,49 UNION ALL
select 20190219, CAST('2019-02-19' as timestamp),19,2,2019,50 UNION ALL
select 20190220, CAST('2019-02-20' as timestamp),20,2,2019,51 UNION ALL
select 20190221, CAST('2019-02-21' as timestamp),21,2,2019,52 UNION ALL
select 20190222, CAST('2019-02-22' as timestamp),22,2,2019,53 UNION ALL
select 20190223, CAST('2019-02-23' as timestamp),23,2,2019,54 UNION ALL
select 20190224, CAST('2019-02-24' as timestamp),24,2,2019,55 UNION ALL
select 20190225, CAST('2019-02-25' as timestamp),25,2,2019,56 UNION ALL
select 20190226, CAST('2019-02-26' as timestamp),26,2,2019,57 UNION ALL
select 20190227, CAST('2019-02-27' as timestamp),27,2,2019,58 UNION ALL
select 20190228, CAST('2019-02-28' as timestamp),28,2,2019,59 UNION ALL
select 20190301, CAST('2019-03-01' as timestamp),1,3,2019,60 UNION ALL
select 20190302, CAST('2019-03-02' as timestamp),2,3,2019,61 UNION ALL
select 20190303, CAST('2019-03-03' as timestamp),3,3,2019,62 UNION ALL
select 20190304, CAST('2019-03-04' as timestamp),4,3,2019,63 UNION ALL
select 20190305, CAST('2019-03-05' as timestamp),5,3,2019,64 UNION ALL
select 20190306, CAST('2019-03-06' as timestamp),6,3,2019,65 UNION ALL
select 20190307, CAST('2019-03-07' as timestamp),7,3,2019,66 UNION ALL
select 20190308, CAST('2019-03-08' as timestamp),8,3,2019,67 UNION ALL
select 20190309, CAST('2019-03-09' as timestamp),9,3,2019,68 UNION ALL
select 20190310, CAST('2019-03-10' as timestamp),10,3,2019,69 UNION ALL
select 20190311, CAST('2019-03-11' as timestamp),11,3,2019,70 UNION ALL
select 20190312, CAST('2019-03-12' as timestamp),12,3,2019,71 UNION ALL
select 20190313, CAST('2019-03-13' as timestamp),13,3,2019,72 UNION ALL
select 20190314, CAST('2019-03-14' as timestamp),14,3,2019,73 UNION ALL
select 20190315, CAST('2019-03-15' as timestamp),15,3,2019,74 UNION ALL
select 20190316, CAST('2019-03-16' as timestamp),16,3,2019,75 UNION ALL
select 20190317, CAST('2019-03-17' as timestamp),17,3,2019,76 UNION ALL
select 20190318, CAST('2019-03-18' as timestamp),18,3,2019,77 UNION ALL
select 20190319, CAST('2019-03-19' as timestamp),19,3,2019,78 UNION ALL
select 20190320, CAST('2019-03-20' as timestamp),20,3,2019,79 UNION ALL
select 20190321, CAST('2019-03-21' as timestamp),21,3,2019,80 UNION ALL
select 20190322, CAST('2019-03-22' as timestamp),22,3,2019,81 UNION ALL
select 20190323, CAST('2019-03-23' as timestamp),23,3,2019,82 UNION ALL
select 20190324, CAST('2019-03-24' as timestamp),24,3,2019,83 UNION ALL
select 20190325, CAST('2019-03-25' as timestamp),25,3,2019,84 UNION ALL
select 20190326, CAST('2019-03-26' as timestamp),26,3,2019,85 UNION ALL
select 20190327, CAST('2019-03-27' as timestamp),27,3,2019,86 UNION ALL
select 20190328, CAST('2019-03-28' as timestamp),28,3,2019,87 UNION ALL
select 20190329, CAST('2019-03-29' as timestamp),29,3,2019,88 UNION ALL
select 20190330, CAST('2019-03-30' as timestamp),30,3,2019,89 UNION ALL
select 20190331, CAST('2019-03-31' as timestamp),31,3,2019,90 UNION ALL
select 20190401, CAST('2019-04-01' as timestamp),1,4,2019,91 UNION ALL
select 20190402, CAST('2019-04-02' as timestamp),2,4,2019,92 UNION ALL
select 20190403, CAST('2019-04-03' as timestamp),3,4,2019,93 UNION ALL
select 20190404, CAST('2019-04-04' as timestamp),4,4,2019,94 UNION ALL
select 20190405, CAST('2019-04-05' as timestamp),5,4,2019,95 UNION ALL
select 20190406, CAST('2019-04-06' as timestamp),6,4,2019,96 UNION ALL
select 20190407, CAST('2019-04-07' as timestamp),7,4,2019,97 UNION ALL
select 20190408, CAST('2019-04-08' as timestamp),8,4,2019,98 UNION ALL
select 20190409, CAST('2019-04-09' as timestamp),9,4,2019,99 UNION ALL
select 20190410, CAST('2019-04-10' as timestamp),10,4,2019,100 UNION ALL
select 20190411, CAST('2019-04-11' as timestamp),11,4,2019,101 UNION ALL
select 20190412, CAST('2019-04-12' as timestamp),12,4,2019,102 UNION ALL
select 20190413, CAST('2019-04-13' as timestamp),13,4,2019,103 UNION ALL
select 20190414, CAST('2019-04-14' as timestamp),14,4,2019,104 UNION ALL
select 20190415, CAST('2019-04-15' as timestamp),15,4,2019,105 UNION ALL
select 20190416, CAST('2019-04-16' as timestamp),16,4,2019,106 UNION ALL
select 20190417, CAST('2019-04-17' as timestamp),17,4,2019,107 UNION ALL
select 20190418, CAST('2019-04-18' as timestamp),18,4,2019,108 UNION ALL
select 20190419, CAST('2019-04-19' as timestamp),19,4,2019,109 UNION ALL
select 20190420, CAST('2019-04-20' as timestamp),20,4,2019,110 UNION ALL
select 20190421, CAST('2019-04-21' as timestamp),21,4,2019,111 UNION ALL
select 20190422, CAST('2019-04-22' as timestamp),22,4,2019,112 UNION ALL
select 20190423, CAST('2019-04-23' as timestamp),23,4,2019,113 UNION ALL
select 20190424, CAST('2019-04-24' as timestamp),24,4,2019,114 UNION ALL
select 20190425, CAST('2019-04-25' as timestamp),25,4,2019,115 UNION ALL
select 20190426, CAST('2019-04-26' as timestamp),26,4,2019,116 UNION ALL
select 20190427, CAST('2019-04-27' as timestamp),27,4,2019,117 UNION ALL
select 20190428, CAST('2019-04-28' as timestamp),28,4,2019,118 UNION ALL
select 20190429, CAST('2019-04-29' as timestamp),29,4,2019,119 UNION ALL
select 20190430, CAST('2019-04-30' as timestamp),30,4,2019,120 UNION ALL
select 20190501, CAST('2019-05-01' as timestamp),1,5,2019,121 UNION ALL
select 20190502, CAST('2019-05-02' as timestamp),2,5,2019,122 UNION ALL
select 20190503, CAST('2019-05-03' as timestamp),3,5,2019,123 UNION ALL
select 20190504, CAST('2019-05-04' as timestamp),4,5,2019,124 UNION ALL
select 20190505, CAST('2019-05-05' as timestamp),5,5,2019,125 UNION ALL
select 20190506, CAST('2019-05-06' as timestamp),6,5,2019,126 UNION ALL
select 20190507, CAST('2019-05-07' as timestamp),7,5,2019,127 UNION ALL
select 20190508, CAST('2019-05-08' as timestamp),8,5,2019,128 UNION ALL
select 20190509, CAST('2019-05-09' as timestamp),9,5,2019,129 UNION ALL
select 20190510, CAST('2019-05-10' as timestamp),10,5,2019,130 UNION ALL
select 20190511, CAST('2019-05-11' as timestamp),11,5,2019,131 UNION ALL
select 20190512, CAST('2019-05-12' as timestamp),12,5,2019,132 UNION ALL
select 20190513, CAST('2019-05-13' as timestamp),13,5,2019,133 UNION ALL
select 20190514, CAST('2019-05-14' as timestamp),14,5,2019,134 UNION ALL
select 20190515, CAST('2019-05-15' as timestamp),15,5,2019,135 UNION ALL
select 20190516, CAST('2019-05-16' as timestamp),16,5,2019,136 UNION ALL
select 20190517, CAST('2019-05-17' as timestamp),17,5,2019,137 UNION ALL
select 20190518, CAST('2019-05-18' as timestamp),18,5,2019,138 UNION ALL
select 20190519, CAST('2019-05-19' as timestamp),19,5,2019,139 UNION ALL
select 20190520, CAST('2019-05-20' as timestamp),20,5,2019,140 UNION ALL
select 20190521, CAST('2019-05-21' as timestamp),21,5,2019,141 UNION ALL
select 20190522, CAST('2019-05-22' as timestamp),22,5,2019,142 UNION ALL
select 20190523, CAST('2019-05-23' as timestamp),23,5,2019,143 UNION ALL
select 20190524, CAST('2019-05-24' as timestamp),24,5,2019,144 UNION ALL
select 20190525, CAST('2019-05-25' as timestamp),25,5,2019,145 UNION ALL
select 20190526, CAST('2019-05-26' as timestamp),26,5,2019,146 UNION ALL
select 20190527, CAST('2019-05-27' as timestamp),27,5,2019,147 UNION ALL
select 20190528, CAST('2019-05-28' as timestamp),28,5,2019,148 UNION ALL
select 20190529, CAST('2019-05-29' as timestamp),29,5,2019,149 UNION ALL
select 20190530, CAST('2019-05-30' as timestamp),30,5,2019,150 UNION ALL
select 20190531, CAST('2019-05-31' as timestamp),31,5,2019,151 UNION ALL
select 20190601, CAST('2019-06-01' as timestamp),1,6,2019,152 UNION ALL
select 20190602, CAST('2019-06-02' as timestamp),2,6,2019,153 UNION ALL
select 20190603, CAST('2019-06-03' as timestamp),3,6,2019,154 UNION ALL
select 20190604, CAST('2019-06-04' as timestamp),4,6,2019,155 UNION ALL
select 20190605, CAST('2019-06-05' as timestamp),5,6,2019,156 UNION ALL
select 20190606, CAST('2019-06-06' as timestamp),6,6,2019,157 UNION ALL
select 20190607, CAST('2019-06-07' as timestamp),7,6,2019,158 UNION ALL
select 20190608, CAST('2019-06-08' as timestamp),8,6,2019,159 UNION ALL
select 20190609, CAST('2019-06-09' as timestamp),9,6,2019,160 UNION ALL
select 20190610, CAST('2019-06-10' as timestamp),10,6,2019,161 UNION ALL
select 20190611, CAST('2019-06-11' as timestamp),11,6,2019,162 UNION ALL
select 20190612, CAST('2019-06-12' as timestamp),12,6,2019,163 UNION ALL
select 20190613, CAST('2019-06-13' as timestamp),13,6,2019,164 UNION ALL
select 20190614, CAST('2019-06-14' as timestamp),14,6,2019,165 UNION ALL
select 20190615, CAST('2019-06-15' as timestamp),15,6,2019,166 UNION ALL
select 20190616, CAST('2019-06-16' as timestamp),16,6,2019,167 UNION ALL
select 20190617, CAST('2019-06-17' as timestamp),17,6,2019,168 UNION ALL
select 20190618, CAST('2019-06-18' as timestamp),18,6,2019,169 UNION ALL
select 20190619, CAST('2019-06-19' as timestamp),19,6,2019,170 UNION ALL
select 20190620, CAST('2019-06-20' as timestamp),20,6,2019,171 UNION ALL
select 20190621, CAST('2019-06-21' as timestamp),21,6,2019,172 UNION ALL
select 20190622, CAST('2019-06-22' as timestamp),22,6,2019,173 UNION ALL
select 20190623, CAST('2019-06-23' as timestamp),23,6,2019,174 UNION ALL
select 20190624, CAST('2019-06-24' as timestamp),24,6,2019,175 UNION ALL
select 20190625, CAST('2019-06-25' as timestamp),25,6,2019,176 UNION ALL
select 20190626, CAST('2019-06-26' as timestamp),26,6,2019,177 UNION ALL
select 20190627, CAST('2019-06-27' as timestamp),27,6,2019,178 UNION ALL
select 20190628, CAST('2019-06-28' as timestamp),28,6,2019,179 UNION ALL
select 20190629, CAST('2019-06-29' as timestamp),29,6,2019,180 UNION ALL
select 20190630, CAST('2019-06-30' as timestamp),30,6,2019,181 UNION ALL
select 20190701, CAST('2019-07-01' as timestamp),1,7,2019,182 UNION ALL
select 20190702, CAST('2019-07-02' as timestamp),2,7,2019,183 UNION ALL
select 20190703, CAST('2019-07-03' as timestamp),3,7,2019,184 UNION ALL
select 20190704, CAST('2019-07-04' as timestamp),4,7,2019,185 UNION ALL
select 20190705, CAST('2019-07-05' as timestamp),5,7,2019,186 UNION ALL
select 20190706, CAST('2019-07-06' as timestamp),6,7,2019,187 UNION ALL
select 20190707, CAST('2019-07-07' as timestamp),7,7,2019,188 UNION ALL
select 20190708, CAST('2019-07-08' as timestamp),8,7,2019,189 UNION ALL
select 20190709, CAST('2019-07-09' as timestamp),9,7,2019,190 UNION ALL
select 20190710, CAST('2019-07-10' as timestamp),10,7,2019,191 UNION ALL
select 20190711, CAST('2019-07-11' as timestamp),11,7,2019,192 UNION ALL
select 20190712, CAST('2019-07-12' as timestamp),12,7,2019,193 UNION ALL
select 20190713, CAST('2019-07-13' as timestamp),13,7,2019,194 UNION ALL
select 20190714, CAST('2019-07-14' as timestamp),14,7,2019,195 UNION ALL
select 20190715, CAST('2019-07-15' as timestamp),15,7,2019,196 UNION ALL
select 20190716, CAST('2019-07-16' as timestamp),16,7,2019,197 UNION ALL
select 20190717, CAST('2019-07-17' as timestamp),17,7,2019,198 UNION ALL
select 20190718, CAST('2019-07-18' as timestamp),18,7,2019,199 UNION ALL
select 20190719, CAST('2019-07-19' as timestamp),19,7,2019,200 UNION ALL
select 20190720, CAST('2019-07-20' as timestamp),20,7,2019,201 UNION ALL
select 20190721, CAST('2019-07-21' as timestamp),21,7,2019,202 UNION ALL
select 20190722, CAST('2019-07-22' as timestamp),22,7,2019,203 UNION ALL
select 20190723, CAST('2019-07-23' as timestamp),23,7,2019,204 UNION ALL
select 20190724, CAST('2019-07-24' as timestamp),24,7,2019,205 UNION ALL
select 20190725, CAST('2019-07-25' as timestamp),25,7,2019,206 UNION ALL
select 20190726, CAST('2019-07-26' as timestamp),26,7,2019,207 UNION ALL
select 20190727, CAST('2019-07-27' as timestamp),27,7,2019,208 UNION ALL
select 20190728, CAST('2019-07-28' as timestamp),28,7,2019,209 UNION ALL
select 20190729, CAST('2019-07-29' as timestamp),29,7,2019,210 UNION ALL
select 20190730, CAST('2019-07-30' as timestamp),30,7,2019,211 UNION ALL
select 20190731, CAST('2019-07-31' as timestamp),31,7,2019,212 UNION ALL
select 20190801, CAST('2019-08-01' as timestamp),1,8,2019,213 UNION ALL
select 20190802, CAST('2019-08-02' as timestamp),2,8,2019,214 UNION ALL
select 20190803, CAST('2019-08-03' as timestamp),3,8,2019,215 UNION ALL
select 20190804, CAST('2019-08-04' as timestamp),4,8,2019,216 UNION ALL
select 20190805, CAST('2019-08-05' as timestamp),5,8,2019,217 UNION ALL
select 20190806, CAST('2019-08-06' as timestamp),6,8,2019,218 UNION ALL
select 20190807, CAST('2019-08-07' as timestamp),7,8,2019,219 UNION ALL
select 20190808, CAST('2019-08-08' as timestamp),8,8,2019,220 UNION ALL
select 20190809, CAST('2019-08-09' as timestamp),9,8,2019,221 UNION ALL
select 20190810, CAST('2019-08-10' as timestamp),10,8,2019,222 UNION ALL
select 20190811, CAST('2019-08-11' as timestamp),11,8,2019,223 UNION ALL
select 20190812, CAST('2019-08-12' as timestamp),12,8,2019,224 UNION ALL
select 20190813, CAST('2019-08-13' as timestamp),13,8,2019,225 UNION ALL
select 20190814, CAST('2019-08-14' as timestamp),14,8,2019,226 UNION ALL
select 20190815, CAST('2019-08-15' as timestamp),15,8,2019,227 UNION ALL
select 20190816, CAST('2019-08-16' as timestamp),16,8,2019,228 UNION ALL
select 20190817, CAST('2019-08-17' as timestamp),17,8,2019,229 UNION ALL
select 20190818, CAST('2019-08-18' as timestamp),18,8,2019,230 UNION ALL
select 20190819, CAST('2019-08-19' as timestamp),19,8,2019,231 UNION ALL
select 20190820, CAST('2019-08-20' as timestamp),20,8,2019,232 UNION ALL
select 20190821, CAST('2019-08-21' as timestamp),21,8,2019,233 UNION ALL
select 20190822, CAST('2019-08-22' as timestamp),22,8,2019,234 UNION ALL
select 20190823, CAST('2019-08-23' as timestamp),23,8,2019,235 UNION ALL
select 20190824, CAST('2019-08-24' as timestamp),24,8,2019,236 UNION ALL
select 20190825, CAST('2019-08-25' as timestamp),25,8,2019,237 UNION ALL
select 20190826, CAST('2019-08-26' as timestamp),26,8,2019,238 UNION ALL
select 20190827, CAST('2019-08-27' as timestamp),27,8,2019,239 UNION ALL
select 20190828, CAST('2019-08-28' as timestamp),28,8,2019,240 UNION ALL
select 20190829, CAST('2019-08-29' as timestamp),29,8,2019,241 UNION ALL
select 20190830, CAST('2019-08-30' as timestamp),30,8,2019,242 UNION ALL
select 20190831, CAST('2019-08-31' as timestamp),31,8,2019,243 UNION ALL
select 20190901, CAST('2019-09-01' as timestamp),1,9,2019,244 UNION ALL
select 20190902, CAST('2019-09-02' as timestamp),2,9,2019,245 UNION ALL
select 20190903, CAST('2019-09-03' as timestamp),3,9,2019,246 UNION ALL
select 20190904, CAST('2019-09-04' as timestamp),4,9,2019,247 UNION ALL
select 20190905, CAST('2019-09-05' as timestamp),5,9,2019,248 UNION ALL
select 20190906, CAST('2019-09-06' as timestamp),6,9,2019,249 UNION ALL
select 20190907, CAST('2019-09-07' as timestamp),7,9,2019,250 UNION ALL
select 20190908, CAST('2019-09-08' as timestamp),8,9,2019,251 UNION ALL
select 20190909, CAST('2019-09-09' as timestamp),9,9,2019,252 UNION ALL
select 20190910, CAST('2019-09-10' as timestamp),10,9,2019,253 UNION ALL
select 20190911, CAST('2019-09-11' as timestamp),11,9,2019,254 UNION ALL
select 20190912, CAST('2019-09-12' as timestamp),12,9,2019,255 UNION ALL
select 20190913, CAST('2019-09-13' as timestamp),13,9,2019,256 UNION ALL
select 20190914, CAST('2019-09-14' as timestamp),14,9,2019,257 UNION ALL
select 20190915, CAST('2019-09-15' as timestamp),15,9,2019,258 UNION ALL
select 20190916, CAST('2019-09-16' as timestamp),16,9,2019,259 UNION ALL
select 20190917, CAST('2019-09-17' as timestamp),17,9,2019,260 UNION ALL
select 20190918, CAST('2019-09-18' as timestamp),18,9,2019,261 UNION ALL
select 20190919, CAST('2019-09-19' as timestamp),19,9,2019,262 UNION ALL
select 20190920, CAST('2019-09-20' as timestamp),20,9,2019,263 UNION ALL
select 20190921, CAST('2019-09-21' as timestamp),21,9,2019,264 UNION ALL
select 20190922, CAST('2019-09-22' as timestamp),22,9,2019,265 UNION ALL
select 20190923, CAST('2019-09-23' as timestamp),23,9,2019,266 UNION ALL
select 20190924, CAST('2019-09-24' as timestamp),24,9,2019,267 UNION ALL
select 20190925, CAST('2019-09-25' as timestamp),25,9,2019,268 UNION ALL
select 20190926, CAST('2019-09-26' as timestamp),26,9,2019,269 UNION ALL
select 20190927, CAST('2019-09-27' as timestamp),27,9,2019,270 UNION ALL
select 20190928, CAST('2019-09-28' as timestamp),28,9,2019,271 UNION ALL
select 20190929, CAST('2019-09-29' as timestamp),29,9,2019,272 UNION ALL
select 20190930, CAST('2019-09-30' as timestamp),30,9,2019,273 UNION ALL
select 20191001, CAST('2019-10-01' as timestamp),1,10,2019,274 UNION ALL
select 20191002, CAST('2019-10-02' as timestamp),2,10,2019,275 UNION ALL
select 20191003, CAST('2019-10-03' as timestamp),3,10,2019,276 UNION ALL
select 20191004, CAST('2019-10-04' as timestamp),4,10,2019,277 UNION ALL
select 20191005, CAST('2019-10-05' as timestamp),5,10,2019,278 UNION ALL
select 20191006, CAST('2019-10-06' as timestamp),6,10,2019,279 UNION ALL
select 20191007, CAST('2019-10-07' as timestamp),7,10,2019,280 UNION ALL
select 20191008, CAST('2019-10-08' as timestamp),8,10,2019,281 UNION ALL
select 20191009, CAST('2019-10-09' as timestamp),9,10,2019,282 UNION ALL
select 20191010, CAST('2019-10-10' as timestamp),10,10,2019,283 UNION ALL
select 20191011, CAST('2019-10-11' as timestamp),11,10,2019,284 UNION ALL
select 20191012, CAST('2019-10-12' as timestamp),12,10,2019,285 UNION ALL
select 20191013, CAST('2019-10-13' as timestamp),13,10,2019,286 UNION ALL
select 20191014, CAST('2019-10-14' as timestamp),14,10,2019,287 UNION ALL
select 20191015, CAST('2019-10-15' as timestamp),15,10,2019,288 UNION ALL
select 20191016, CAST('2019-10-16' as timestamp),16,10,2019,289 UNION ALL
select 20191017, CAST('2019-10-17' as timestamp),17,10,2019,290 UNION ALL
select 20191018, CAST('2019-10-18' as timestamp),18,10,2019,291 UNION ALL
select 20191019, CAST('2019-10-19' as timestamp),19,10,2019,292 UNION ALL
select 20191020, CAST('2019-10-20' as timestamp),20,10,2019,293 UNION ALL
select 20191021, CAST('2019-10-21' as timestamp),21,10,2019,294 UNION ALL
select 20191022, CAST('2019-10-22' as timestamp),22,10,2019,295 UNION ALL
select 20191023, CAST('2019-10-23' as timestamp),23,10,2019,296 UNION ALL
select 20191024, CAST('2019-10-24' as timestamp),24,10,2019,297 UNION ALL
select 20191025, CAST('2019-10-25' as timestamp),25,10,2019,298 UNION ALL
select 20191026, CAST('2019-10-26' as timestamp),26,10,2019,299 UNION ALL
select 20191027, CAST('2019-10-27' as timestamp),27,10,2019,300 UNION ALL
select 20191028, CAST('2019-10-28' as timestamp),28,10,2019,301 UNION ALL
select 20191029, CAST('2019-10-29' as timestamp),29,10,2019,302 UNION ALL
select 20191030, CAST('2019-10-30' as timestamp),30,10,2019,303 UNION ALL
select 20191031, CAST('2019-10-31' as timestamp),31,10,2019,304 UNION ALL
select 20191101, CAST('2019-11-01' as timestamp),1,11,2019,305 UNION ALL
select 20191102, CAST('2019-11-02' as timestamp),2,11,2019,306 UNION ALL
select 20191103, CAST('2019-11-03' as timestamp),3,11,2019,307 UNION ALL
select 20191104, CAST('2019-11-04' as timestamp),4,11,2019,308 UNION ALL
select 20191105, CAST('2019-11-05' as timestamp),5,11,2019,309 UNION ALL
select 20191106, CAST('2019-11-06' as timestamp),6,11,2019,310 UNION ALL
select 20191107, CAST('2019-11-07' as timestamp),7,11,2019,311 UNION ALL
select 20191108, CAST('2019-11-08' as timestamp),8,11,2019,312 UNION ALL
select 20191109, CAST('2019-11-09' as timestamp),9,11,2019,313 UNION ALL
select 20191110, CAST('2019-11-10' as timestamp),10,11,2019,314 UNION ALL
select 20191111, CAST('2019-11-11' as timestamp),11,11,2019,315 UNION ALL
select 20191112, CAST('2019-11-12' as timestamp),12,11,2019,316 UNION ALL
select 20191113, CAST('2019-11-13' as timestamp),13,11,2019,317 UNION ALL
select 20191114, CAST('2019-11-14' as timestamp),14,11,2019,318 UNION ALL
select 20191115, CAST('2019-11-15' as timestamp),15,11,2019,319 UNION ALL
select 20191116, CAST('2019-11-16' as timestamp),16,11,2019,320 UNION ALL
select 20191117, CAST('2019-11-17' as timestamp),17,11,2019,321 UNION ALL
select 20191118, CAST('2019-11-18' as timestamp),18,11,2019,322 UNION ALL
select 20191119, CAST('2019-11-19' as timestamp),19,11,2019,323 UNION ALL
select 20191120, CAST('2019-11-20' as timestamp),20,11,2019,324 UNION ALL
select 20191121, CAST('2019-11-21' as timestamp),21,11,2019,325 UNION ALL
select 20191122, CAST('2019-11-22' as timestamp),22,11,2019,326 UNION ALL
select 20191123, CAST('2019-11-23' as timestamp),23,11,2019,327 UNION ALL
select 20191124, CAST('2019-11-24' as timestamp),24,11,2019,328 UNION ALL
select 20191125, CAST('2019-11-25' as timestamp),25,11,2019,329 UNION ALL
select 20191126, CAST('2019-11-26' as timestamp),26,11,2019,330 UNION ALL
select 20191127, CAST('2019-11-27' as timestamp),27,11,2019,331 UNION ALL
select 20191128, CAST('2019-11-28' as timestamp),28,11,2019,332 UNION ALL
select 20191129, CAST('2019-11-29' as timestamp),29,11,2019,333 UNION ALL
select 20191130, CAST('2019-11-30' as timestamp),30,11,2019,334 UNION ALL
select 20191201, CAST('2019-12-01' as timestamp),1,12,2019,335 UNION ALL
select 20191202, CAST('2019-12-02' as timestamp),2,12,2019,336 UNION ALL
select 20191203, CAST('2019-12-03' as timestamp),3,12,2019,337 UNION ALL
select 20191204, CAST('2019-12-04' as timestamp),4,12,2019,338 UNION ALL
select 20191205, CAST('2019-12-05' as timestamp),5,12,2019,339 UNION ALL
select 20191206, CAST('2019-12-06' as timestamp),6,12,2019,340 UNION ALL
select 20191207, CAST('2019-12-07' as timestamp),7,12,2019,341 UNION ALL
select 20191208, CAST('2019-12-08' as timestamp),8,12,2019,342 UNION ALL
select 20191209, CAST('2019-12-09' as timestamp),9,12,2019,343 UNION ALL
select 20191210, CAST('2019-12-10' as timestamp),10,12,2019,344 UNION ALL
select 20191211, CAST('2019-12-11' as timestamp),11,12,2019,345 UNION ALL
select 20191212, CAST('2019-12-12' as timestamp),12,12,2019,346 UNION ALL
select 20191213, CAST('2019-12-13' as timestamp),13,12,2019,347 UNION ALL
select 20191214, CAST('2019-12-14' as timestamp),14,12,2019,348 UNION ALL
select 20191215, CAST('2019-12-15' as timestamp),15,12,2019,349 UNION ALL
select 20191216, CAST('2019-12-16' as timestamp),16,12,2019,350 UNION ALL
select 20191217, CAST('2019-12-17' as timestamp),17,12,2019,351 UNION ALL
select 20191218, CAST('2019-12-18' as timestamp),18,12,2019,352 UNION ALL
select 20191219, CAST('2019-12-19' as timestamp),19,12,2019,353 UNION ALL
select 20191220, CAST('2019-12-20' as timestamp),20,12,2019,354 UNION ALL
select 20191221, CAST('2019-12-21' as timestamp),21,12,2019,355 UNION ALL
select 20191222, CAST('2019-12-22' as timestamp),22,12,2019,356 UNION ALL
select 20191223, CAST('2019-12-23' as timestamp),23,12,2019,357 UNION ALL
select 20191224, CAST('2019-12-24' as timestamp),24,12,2019,358 UNION ALL
select 20191225, CAST('2019-12-25' as timestamp),25,12,2019,359 UNION ALL
select 20191226, CAST('2019-12-26' as timestamp),26,12,2019,360 UNION ALL
select 20191227, CAST('2019-12-27' as timestamp),27,12,2019,361 UNION ALL
select 20191228, CAST('2019-12-28' as timestamp),28,12,2019,362 UNION ALL
select 20191229, CAST('2019-12-29' as timestamp),29,12,2019,363 UNION ALL
select 20191230, CAST('2019-12-30' as timestamp),30,12,2019,364 UNION ALL
select 20191231, CAST('2019-12-31' as timestamp),31,12,2019,365 UNION ALL
select 20200101, CAST('2020-01-01' as timestamp),1,1,2020,366 UNION ALL
select 20200102, CAST('2020-01-02' as timestamp),2,1,2020,367 UNION ALL
select 20200103, CAST('2020-01-03' as timestamp),3,1,2020,368 UNION ALL
select 20200104, CAST('2020-01-04' as timestamp),4,1,2020,369 UNION ALL
select 20200105, CAST('2020-01-05' as timestamp),5,1,2020,370 UNION ALL
select 20200106, CAST('2020-01-06' as timestamp),6,1,2020,371 UNION ALL
select 20200107, CAST('2020-01-07' as timestamp),7,1,2020,372 UNION ALL
select 20200108, CAST('2020-01-08' as timestamp),8,1,2020,373 UNION ALL
select 20200109, CAST('2020-01-09' as timestamp),9,1,2020,374 UNION ALL
select 20200110, CAST('2020-01-10' as timestamp),10,1,2020,375 UNION ALL
select 20200111, CAST('2020-01-11' as timestamp),11,1,2020,376 UNION ALL
select 20200112, CAST('2020-01-12' as timestamp),12,1,2020,377 UNION ALL
select 20200113, CAST('2020-01-13' as timestamp),13,1,2020,378 UNION ALL
select 20200114, CAST('2020-01-14' as timestamp),14,1,2020,379 UNION ALL
select 20200115, CAST('2020-01-15' as timestamp),15,1,2020,380 UNION ALL
select 20200116, CAST('2020-01-16' as timestamp),16,1,2020,381 UNION ALL
select 20200117, CAST('2020-01-17' as timestamp),17,1,2020,382 UNION ALL
select 20200118, CAST('2020-01-18' as timestamp),18,1,2020,383 UNION ALL
select 20200119, CAST('2020-01-19' as timestamp),19,1,2020,384 UNION ALL
select 20200120, CAST('2020-01-20' as timestamp),20,1,2020,385 UNION ALL
select 20200121, CAST('2020-01-21' as timestamp),21,1,2020,386 UNION ALL
select 20200122, CAST('2020-01-22' as timestamp),22,1,2020,387 UNION ALL
select 20200123, CAST('2020-01-23' as timestamp),23,1,2020,388 UNION ALL
select 20200124, CAST('2020-01-24' as timestamp),24,1,2020,389 UNION ALL
select 20200125, CAST('2020-01-25' as timestamp),25,1,2020,390 UNION ALL
select 20200126, CAST('2020-01-26' as timestamp),26,1,2020,391 UNION ALL
select 20200127, CAST('2020-01-27' as timestamp),27,1,2020,392 UNION ALL
select 20200128, CAST('2020-01-28' as timestamp),28,1,2020,393 UNION ALL
select 20200129, CAST('2020-01-29' as timestamp),29,1,2020,394 UNION ALL
select 20200130, CAST('2020-01-30' as timestamp),30,1,2020,395 UNION ALL
select 20200131, CAST('2020-01-31' as timestamp),31,1,2020,396 UNION ALL
select 20200201, CAST('2020-02-01' as timestamp),1,2,2020,397 UNION ALL
select 20200202, CAST('2020-02-02' as timestamp),2,2,2020,398 UNION ALL
select 20200203, CAST('2020-02-03' as timestamp),3,2,2020,399 UNION ALL
select 20200204, CAST('2020-02-04' as timestamp),4,2,2020,400 UNION ALL
select 20200205, CAST('2020-02-05' as timestamp),5,2,2020,401 UNION ALL
select 20200206, CAST('2020-02-06' as timestamp),6,2,2020,402 UNION ALL
select 20200207, CAST('2020-02-07' as timestamp),7,2,2020,403 UNION ALL
select 20200208, CAST('2020-02-08' as timestamp),8,2,2020,404 UNION ALL
select 20200209, CAST('2020-02-09' as timestamp),9,2,2020,405 UNION ALL
select 20200210, CAST('2020-02-10' as timestamp),10,2,2020,406 UNION ALL
select 20200211, CAST('2020-02-11' as timestamp),11,2,2020,407 UNION ALL
select 20200212, CAST('2020-02-12' as timestamp),12,2,2020,408 UNION ALL
select 20200213, CAST('2020-02-13' as timestamp),13,2,2020,409 UNION ALL
select 20200214, CAST('2020-02-14' as timestamp),14,2,2020,410 UNION ALL
select 20200215, CAST('2020-02-15' as timestamp),15,2,2020,411 UNION ALL
select 20200216, CAST('2020-02-16' as timestamp),16,2,2020,412 UNION ALL
select 20200217, CAST('2020-02-17' as timestamp),17,2,2020,413 UNION ALL
select 20200218, CAST('2020-02-18' as timestamp),18,2,2020,414 UNION ALL
select 20200219, CAST('2020-02-19' as timestamp),19,2,2020,415 UNION ALL
select 20200220, CAST('2020-02-20' as timestamp),20,2,2020,416 UNION ALL
select 20200221, CAST('2020-02-21' as timestamp),21,2,2020,417 UNION ALL
select 20200222, CAST('2020-02-22' as timestamp),22,2,2020,418 UNION ALL
select 20200223, CAST('2020-02-23' as timestamp),23,2,2020,419 UNION ALL
select 20200224, CAST('2020-02-24' as timestamp),24,2,2020,420 UNION ALL
select 20200225, CAST('2020-02-25' as timestamp),25,2,2020,421 UNION ALL
select 20200226, CAST('2020-02-26' as timestamp),26,2,2020,422 UNION ALL
select 20200227, CAST('2020-02-27' as timestamp),27,2,2020,423 UNION ALL
select 20200228, CAST('2020-02-28' as timestamp),28,2,2020,424 UNION ALL
select 20200229, CAST('2020-02-29' as timestamp),29,2,2020,425 UNION ALL
select 20200301, CAST('2020-03-01' as timestamp),1,3,2020,426 UNION ALL
select 20200302, CAST('2020-03-02' as timestamp),2,3,2020,427 UNION ALL
select 20200303, CAST('2020-03-03' as timestamp),3,3,2020,428 UNION ALL
select 20200304, CAST('2020-03-04' as timestamp),4,3,2020,429 UNION ALL
select 20200305, CAST('2020-03-05' as timestamp),5,3,2020,430 UNION ALL
select 20200306, CAST('2020-03-06' as timestamp),6,3,2020,431 UNION ALL
select 20200307, CAST('2020-03-07' as timestamp),7,3,2020,432 UNION ALL
select 20200308, CAST('2020-03-08' as timestamp),8,3,2020,433 UNION ALL
select 20200309, CAST('2020-03-09' as timestamp),9,3,2020,434 UNION ALL
select 20200310, CAST('2020-03-10' as timestamp),10,3,2020,435 UNION ALL
select 20200311, CAST('2020-03-11' as timestamp),11,3,2020,436 UNION ALL
select 20200312, CAST('2020-03-12' as timestamp),12,3,2020,437 UNION ALL
select 20200313, CAST('2020-03-13' as timestamp),13,3,2020,438 UNION ALL
select 20200314, CAST('2020-03-14' as timestamp),14,3,2020,439 UNION ALL
select 20200315, CAST('2020-03-15' as timestamp),15,3,2020,440 UNION ALL
select 20200316, CAST('2020-03-16' as timestamp),16,3,2020,441 UNION ALL
select 20200317, CAST('2020-03-17' as timestamp),17,3,2020,442 UNION ALL
select 20200318, CAST('2020-03-18' as timestamp),18,3,2020,443 UNION ALL
select 20200319, CAST('2020-03-19' as timestamp),19,3,2020,444 UNION ALL
select 20200320, CAST('2020-03-20' as timestamp),20,3,2020,445 UNION ALL
select 20200321, CAST('2020-03-21' as timestamp),21,3,2020,446 UNION ALL
select 20200322, CAST('2020-03-22' as timestamp),22,3,2020,447 UNION ALL
select 20200323, CAST('2020-03-23' as timestamp),23,3,2020,448 UNION ALL
select 20200324, CAST('2020-03-24' as timestamp),24,3,2020,449 UNION ALL
select 20200325, CAST('2020-03-25' as timestamp),25,3,2020,450 UNION ALL
select 20200326, CAST('2020-03-26' as timestamp),26,3,2020,451 UNION ALL
select 20200327, CAST('2020-03-27' as timestamp),27,3,2020,452 UNION ALL
select 20200328, CAST('2020-03-28' as timestamp),28,3,2020,453 UNION ALL
select 20200329, CAST('2020-03-29' as timestamp),29,3,2020,454 UNION ALL
select 20200330, CAST('2020-03-30' as timestamp),30,3,2020,455 UNION ALL
select 20200331, CAST('2020-03-31' as timestamp),31,3,2020,456 UNION ALL
select 20200401, CAST('2020-04-01' as timestamp),1,4,2020,457 UNION ALL
select 20200402, CAST('2020-04-02' as timestamp),2,4,2020,458 UNION ALL
select 20200403, CAST('2020-04-03' as timestamp),3,4,2020,459 UNION ALL
select 20200404, CAST('2020-04-04' as timestamp),4,4,2020,460 UNION ALL
select 20200405, CAST('2020-04-05' as timestamp),5,4,2020,461 UNION ALL
select 20200406, CAST('2020-04-06' as timestamp),6,4,2020,462 UNION ALL
select 20200407, CAST('2020-04-07' as timestamp),7,4,2020,463 UNION ALL
select 20200408, CAST('2020-04-08' as timestamp),8,4,2020,464 UNION ALL
select 20200409, CAST('2020-04-09' as timestamp),9,4,2020,465 UNION ALL
select 20200410, CAST('2020-04-10' as timestamp),10,4,2020,466 UNION ALL
select 20200411, CAST('2020-04-11' as timestamp),11,4,2020,467 UNION ALL
select 20200412, CAST('2020-04-12' as timestamp),12,4,2020,468 UNION ALL
select 20200413, CAST('2020-04-13' as timestamp),13,4,2020,469 UNION ALL
select 20200414, CAST('2020-04-14' as timestamp),14,4,2020,470 UNION ALL
select 20200415, CAST('2020-04-15' as timestamp),15,4,2020,471 UNION ALL
select 20200416, CAST('2020-04-16' as timestamp),16,4,2020,472 UNION ALL
select 20200417, CAST('2020-04-17' as timestamp),17,4,2020,473 UNION ALL
select 20200418, CAST('2020-04-18' as timestamp),18,4,2020,474 UNION ALL
select 20200419, CAST('2020-04-19' as timestamp),19,4,2020,475 UNION ALL
select 20200420, CAST('2020-04-20' as timestamp),20,4,2020,476 UNION ALL
select 20200421, CAST('2020-04-21' as timestamp),21,4,2020,477 UNION ALL
select 20200422, CAST('2020-04-22' as timestamp),22,4,2020,478 UNION ALL
select 20200423, CAST('2020-04-23' as timestamp),23,4,2020,479 UNION ALL
select 20200424, CAST('2020-04-24' as timestamp),24,4,2020,480 UNION ALL
select 20200425, CAST('2020-04-25' as timestamp),25,4,2020,481 UNION ALL
select 20200426, CAST('2020-04-26' as timestamp),26,4,2020,482 UNION ALL
select 20200427, CAST('2020-04-27' as timestamp),27,4,2020,483 UNION ALL
select 20200428, CAST('2020-04-28' as timestamp),28,4,2020,484 UNION ALL
select 20200429, CAST('2020-04-29' as timestamp),29,4,2020,485 UNION ALL
select 20200430, CAST('2020-04-30' as timestamp),30,4,2020,486 UNION ALL
select 20200501, CAST('2020-05-01' as timestamp),1,5,2020,487 UNION ALL
select 20200502, CAST('2020-05-02' as timestamp),2,5,2020,488 UNION ALL
select 20200503, CAST('2020-05-03' as timestamp),3,5,2020,489 UNION ALL
select 20200504, CAST('2020-05-04' as timestamp),4,5,2020,490 UNION ALL
select 20200505, CAST('2020-05-05' as timestamp),5,5,2020,491 UNION ALL
select 20200506, CAST('2020-05-06' as timestamp),6,5,2020,492 UNION ALL
select 20200507, CAST('2020-05-07' as timestamp),7,5,2020,493 UNION ALL
select 20200508, CAST('2020-05-08' as timestamp),8,5,2020,494 UNION ALL
select 20200509, CAST('2020-05-09' as timestamp),9,5,2020,495 UNION ALL
select 20200510, CAST('2020-05-10' as timestamp),10,5,2020,496 UNION ALL
select 20200511, CAST('2020-05-11' as timestamp),11,5,2020,497 UNION ALL
select 20200512, CAST('2020-05-12' as timestamp),12,5,2020,498 UNION ALL
select 20200513, CAST('2020-05-13' as timestamp),13,5,2020,499 UNION ALL
select 20200514, CAST('2020-05-14' as timestamp),14,5,2020,500 UNION ALL
select 20200515, CAST('2020-05-15' as timestamp),15,5,2020,501 UNION ALL
select 20200516, CAST('2020-05-16' as timestamp),16,5,2020,502 UNION ALL
select 20200517, CAST('2020-05-17' as timestamp),17,5,2020,503 UNION ALL
select 20200518, CAST('2020-05-18' as timestamp),18,5,2020,504 UNION ALL
select 20200519, CAST('2020-05-19' as timestamp),19,5,2020,505 UNION ALL
select 20200520, CAST('2020-05-20' as timestamp),20,5,2020,506 UNION ALL
select 20200521, CAST('2020-05-21' as timestamp),21,5,2020,507 UNION ALL
select 20200522, CAST('2020-05-22' as timestamp),22,5,2020,508 UNION ALL
select 20200523, CAST('2020-05-23' as timestamp),23,5,2020,509 UNION ALL
select 20200524, CAST('2020-05-24' as timestamp),24,5,2020,510 UNION ALL
select 20200525, CAST('2020-05-25' as timestamp),25,5,2020,511 UNION ALL
select 20200526, CAST('2020-05-26' as timestamp),26,5,2020,512 UNION ALL
select 20200527, CAST('2020-05-27' as timestamp),27,5,2020,513 UNION ALL
select 20200528, CAST('2020-05-28' as timestamp),28,5,2020,514 UNION ALL
select 20200529, CAST('2020-05-29' as timestamp),29,5,2020,515 UNION ALL
select 20200530, CAST('2020-05-30' as timestamp),30,5,2020,516 UNION ALL
select 20200531, CAST('2020-05-31' as timestamp),31,5,2020,517 UNION ALL
select 20200601, CAST('2020-06-01' as timestamp),1,6,2020,518 UNION ALL
select 20200602, CAST('2020-06-02' as timestamp),2,6,2020,519 UNION ALL
select 20200603, CAST('2020-06-03' as timestamp),3,6,2020,520 UNION ALL
select 20200604, CAST('2020-06-04' as timestamp),4,6,2020,521 UNION ALL
select 20200605, CAST('2020-06-05' as timestamp),5,6,2020,522 UNION ALL
select 20200606, CAST('2020-06-06' as timestamp),6,6,2020,523 UNION ALL
select 20200607, CAST('2020-06-07' as timestamp),7,6,2020,524 UNION ALL
select 20200608, CAST('2020-06-08' as timestamp),8,6,2020,525 UNION ALL
select 20200609, CAST('2020-06-09' as timestamp),9,6,2020,526 UNION ALL
select 20200610, CAST('2020-06-10' as timestamp),10,6,2020,527 UNION ALL
select 20200611, CAST('2020-06-11' as timestamp),11,6,2020,528 UNION ALL
select 20200612, CAST('2020-06-12' as timestamp),12,6,2020,529 UNION ALL
select 20200613, CAST('2020-06-13' as timestamp),13,6,2020,530 UNION ALL
select 20200614, CAST('2020-06-14' as timestamp),14,6,2020,531 UNION ALL
select 20200615, CAST('2020-06-15' as timestamp),15,6,2020,532 UNION ALL
select 20200616, CAST('2020-06-16' as timestamp),16,6,2020,533 UNION ALL
select 20200617, CAST('2020-06-17' as timestamp),17,6,2020,534 UNION ALL
select 20200618, CAST('2020-06-18' as timestamp),18,6,2020,535 UNION ALL
select 20200619, CAST('2020-06-19' as timestamp),19,6,2020,536 UNION ALL
select 20200620, CAST('2020-06-20' as timestamp),20,6,2020,537 UNION ALL
select 20200621, CAST('2020-06-21' as timestamp),21,6,2020,538 UNION ALL
select 20200622, CAST('2020-06-22' as timestamp),22,6,2020,539 UNION ALL
select 20200623, CAST('2020-06-23' as timestamp),23,6,2020,540 UNION ALL
select 20200624, CAST('2020-06-24' as timestamp),24,6,2020,541 UNION ALL
select 20200625, CAST('2020-06-25' as timestamp),25,6,2020,542 UNION ALL
select 20200626, CAST('2020-06-26' as timestamp),26,6,2020,543 UNION ALL
select 20200627, CAST('2020-06-27' as timestamp),27,6,2020,544 UNION ALL
select 20200628, CAST('2020-06-28' as timestamp),28,6,2020,545 UNION ALL
select 20200629, CAST('2020-06-29' as timestamp),29,6,2020,546 UNION ALL
select 20200630, CAST('2020-06-30' as timestamp),30,6,2020,547 UNION ALL
select 20200701, CAST('2020-07-01' as timestamp),1,7,2020,548 UNION ALL
select 20200702, CAST('2020-07-02' as timestamp),2,7,2020,549 UNION ALL
select 20200703, CAST('2020-07-03' as timestamp),3,7,2020,550 UNION ALL
select 20200704, CAST('2020-07-04' as timestamp),4,7,2020,551 UNION ALL
select 20200705, CAST('2020-07-05' as timestamp),5,7,2020,552 UNION ALL
select 20200706, CAST('2020-07-06' as timestamp),6,7,2020,553 UNION ALL
select 20200707, CAST('2020-07-07' as timestamp),7,7,2020,554 UNION ALL
select 20200708, CAST('2020-07-08' as timestamp),8,7,2020,555 UNION ALL
select 20200709, CAST('2020-07-09' as timestamp),9,7,2020,556 UNION ALL
select 20200710, CAST('2020-07-10' as timestamp),10,7,2020,557 UNION ALL
select 20200711, CAST('2020-07-11' as timestamp),11,7,2020,558 UNION ALL
select 20200712, CAST('2020-07-12' as timestamp),12,7,2020,559 UNION ALL
select 20200713, CAST('2020-07-13' as timestamp),13,7,2020,560 UNION ALL
select 20200714, CAST('2020-07-14' as timestamp),14,7,2020,561 UNION ALL
select 20200715, CAST('2020-07-15' as timestamp),15,7,2020,562 UNION ALL
select 20200716, CAST('2020-07-16' as timestamp),16,7,2020,563 UNION ALL
select 20200717, CAST('2020-07-17' as timestamp),17,7,2020,564 UNION ALL
select 20200718, CAST('2020-07-18' as timestamp),18,7,2020,565 UNION ALL
select 20200719, CAST('2020-07-19' as timestamp),19,7,2020,566 UNION ALL
select 20200720, CAST('2020-07-20' as timestamp),20,7,2020,567 UNION ALL
select 20200721, CAST('2020-07-21' as timestamp),21,7,2020,568 UNION ALL
select 20200722, CAST('2020-07-22' as timestamp),22,7,2020,569 UNION ALL
select 20200723, CAST('2020-07-23' as timestamp),23,7,2020,570 UNION ALL
select 20200724, CAST('2020-07-24' as timestamp),24,7,2020,571 UNION ALL
select 20200725, CAST('2020-07-25' as timestamp),25,7,2020,572 UNION ALL
select 20200726, CAST('2020-07-26' as timestamp),26,7,2020,573 UNION ALL
select 20200727, CAST('2020-07-27' as timestamp),27,7,2020,574 UNION ALL
select 20200728, CAST('2020-07-28' as timestamp),28,7,2020,575 UNION ALL
select 20200729, CAST('2020-07-29' as timestamp),29,7,2020,576 UNION ALL
select 20200730, CAST('2020-07-30' as timestamp),30,7,2020,577 UNION ALL
select 20200731, CAST('2020-07-31' as timestamp),31,7,2020,578 UNION ALL
select 20200801, CAST('2020-08-01' as timestamp),1,8,2020,579 UNION ALL
select 20200802, CAST('2020-08-02' as timestamp),2,8,2020,580 UNION ALL
select 20200803, CAST('2020-08-03' as timestamp),3,8,2020,581 UNION ALL
select 20200804, CAST('2020-08-04' as timestamp),4,8,2020,582 UNION ALL
select 20200805, CAST('2020-08-05' as timestamp),5,8,2020,583 UNION ALL
select 20200806, CAST('2020-08-06' as timestamp),6,8,2020,584 UNION ALL
select 20200807, CAST('2020-08-07' as timestamp),7,8,2020,585 UNION ALL
select 20200808, CAST('2020-08-08' as timestamp),8,8,2020,586 UNION ALL
select 20200809, CAST('2020-08-09' as timestamp),9,8,2020,587 UNION ALL
select 20200810, CAST('2020-08-10' as timestamp),10,8,2020,588 UNION ALL
select 20200811, CAST('2020-08-11' as timestamp),11,8,2020,589 UNION ALL
select 20200812, CAST('2020-08-12' as timestamp),12,8,2020,590 UNION ALL
select 20200813, CAST('2020-08-13' as timestamp),13,8,2020,591 UNION ALL
select 20200814, CAST('2020-08-14' as timestamp),14,8,2020,592 UNION ALL
select 20200815, CAST('2020-08-15' as timestamp),15,8,2020,593 UNION ALL
select 20200816, CAST('2020-08-16' as timestamp),16,8,2020,594 UNION ALL
select 20200817, CAST('2020-08-17' as timestamp),17,8,2020,595 UNION ALL
select 20200818, CAST('2020-08-18' as timestamp),18,8,2020,596 UNION ALL
select 20200819, CAST('2020-08-19' as timestamp),19,8,2020,597 UNION ALL
select 20200820, CAST('2020-08-20' as timestamp),20,8,2020,598 UNION ALL
select 20200821, CAST('2020-08-21' as timestamp),21,8,2020,599 UNION ALL
select 20200822, CAST('2020-08-22' as timestamp),22,8,2020,600 UNION ALL
select 20200823, CAST('2020-08-23' as timestamp),23,8,2020,601 UNION ALL
select 20200824, CAST('2020-08-24' as timestamp),24,8,2020,602 UNION ALL
select 20200825, CAST('2020-08-25' as timestamp),25,8,2020,603 UNION ALL
select 20200826, CAST('2020-08-26' as timestamp),26,8,2020,604 UNION ALL
select 20200827, CAST('2020-08-27' as timestamp),27,8,2020,605 UNION ALL
select 20200828, CAST('2020-08-28' as timestamp),28,8,2020,606 UNION ALL
select 20200829, CAST('2020-08-29' as timestamp),29,8,2020,607 UNION ALL
select 20200830, CAST('2020-08-30' as timestamp),30,8,2020,608 UNION ALL
select 20200831, CAST('2020-08-31' as timestamp),31,8,2020,609 UNION ALL
select 20200901, CAST('2020-09-01' as timestamp),1,9,2020,610 UNION ALL
select 20200902, CAST('2020-09-02' as timestamp),2,9,2020,611 UNION ALL
select 20200903, CAST('2020-09-03' as timestamp),3,9,2020,612 UNION ALL
select 20200904, CAST('2020-09-04' as timestamp),4,9,2020,613 UNION ALL
select 20200905, CAST('2020-09-05' as timestamp),5,9,2020,614 UNION ALL
select 20200906, CAST('2020-09-06' as timestamp),6,9,2020,615 UNION ALL
select 20200907, CAST('2020-09-07' as timestamp),7,9,2020,616 UNION ALL
select 20200908, CAST('2020-09-08' as timestamp),8,9,2020,617 UNION ALL
select 20200909, CAST('2020-09-09' as timestamp),9,9,2020,618 UNION ALL
select 20200910, CAST('2020-09-10' as timestamp),10,9,2020,619 UNION ALL
select 20200911, CAST('2020-09-11' as timestamp),11,9,2020,620 UNION ALL
select 20200912, CAST('2020-09-12' as timestamp),12,9,2020,621 UNION ALL
select 20200913, CAST('2020-09-13' as timestamp),13,9,2020,622 UNION ALL
select 20200914, CAST('2020-09-14' as timestamp),14,9,2020,623 UNION ALL
select 20200915, CAST('2020-09-15' as timestamp),15,9,2020,624 UNION ALL
select 20200916, CAST('2020-09-16' as timestamp),16,9,2020,625 UNION ALL
select 20200917, CAST('2020-09-17' as timestamp),17,9,2020,626 UNION ALL
select 20200918, CAST('2020-09-18' as timestamp),18,9,2020,627 UNION ALL
select 20200919, CAST('2020-09-19' as timestamp),19,9,2020,628 UNION ALL
select 20200920, CAST('2020-09-20' as timestamp),20,9,2020,629 UNION ALL
select 20200921, CAST('2020-09-21' as timestamp),21,9,2020,630 UNION ALL
select 20200922, CAST('2020-09-22' as timestamp),22,9,2020,631 UNION ALL
select 20200923, CAST('2020-09-23' as timestamp),23,9,2020,632 UNION ALL
select 20200924, CAST('2020-09-24' as timestamp),24,9,2020,633 UNION ALL
select 20200925, CAST('2020-09-25' as timestamp),25,9,2020,634 UNION ALL
select 20200926, CAST('2020-09-26' as timestamp),26,9,2020,635 UNION ALL
select 20200927, CAST('2020-09-27' as timestamp),27,9,2020,636 UNION ALL
select 20200928, CAST('2020-09-28' as timestamp),28,9,2020,637 UNION ALL
select 20200929, CAST('2020-09-29' as timestamp),29,9,2020,638 UNION ALL
select 20200930, CAST('2020-09-30' as timestamp),30,9,2020,639 UNION ALL
select 20201001, CAST('2020-10-01' as timestamp),1,10,2020,640 UNION ALL
select 20201002, CAST('2020-10-02' as timestamp),2,10,2020,641 UNION ALL
select 20201003, CAST('2020-10-03' as timestamp),3,10,2020,642 UNION ALL
select 20201004, CAST('2020-10-04' as timestamp),4,10,2020,643 UNION ALL
select 20201005, CAST('2020-10-05' as timestamp),5,10,2020,644 UNION ALL
select 20201006, CAST('2020-10-06' as timestamp),6,10,2020,645 UNION ALL
select 20201007, CAST('2020-10-07' as timestamp),7,10,2020,646 UNION ALL
select 20201008, CAST('2020-10-08' as timestamp),8,10,2020,647 UNION ALL
select 20201009, CAST('2020-10-09' as timestamp),9,10,2020,648 UNION ALL
select 20201010, CAST('2020-10-10' as timestamp),10,10,2020,649 UNION ALL
select 20201011, CAST('2020-10-11' as timestamp),11,10,2020,650 UNION ALL
select 20201012, CAST('2020-10-12' as timestamp),12,10,2020,651 UNION ALL
select 20201013, CAST('2020-10-13' as timestamp),13,10,2020,652 UNION ALL
select 20201014, CAST('2020-10-14' as timestamp),14,10,2020,653 UNION ALL
select 20201015, CAST('2020-10-15' as timestamp),15,10,2020,654 UNION ALL
select 20201016, CAST('2020-10-16' as timestamp),16,10,2020,655 UNION ALL
select 20201017, CAST('2020-10-17' as timestamp),17,10,2020,656 UNION ALL
select 20201018, CAST('2020-10-18' as timestamp),18,10,2020,657 UNION ALL
select 20201019, CAST('2020-10-19' as timestamp),19,10,2020,658 UNION ALL
select 20201020, CAST('2020-10-20' as timestamp),20,10,2020,659 UNION ALL
select 20201021, CAST('2020-10-21' as timestamp),21,10,2020,660 UNION ALL
select 20201022, CAST('2020-10-22' as timestamp),22,10,2020,661 UNION ALL
select 20201023, CAST('2020-10-23' as timestamp),23,10,2020,662 UNION ALL
select 20201024, CAST('2020-10-24' as timestamp),24,10,2020,663 UNION ALL
select 20201025, CAST('2020-10-25' as timestamp),25,10,2020,664 UNION ALL
select 20201026, CAST('2020-10-26' as timestamp),26,10,2020,665 UNION ALL
select 20201027, CAST('2020-10-27' as timestamp),27,10,2020,666 UNION ALL
select 20201028, CAST('2020-10-28' as timestamp),28,10,2020,667 UNION ALL
select 20201029, CAST('2020-10-29' as timestamp),29,10,2020,668 UNION ALL
select 20201030, CAST('2020-10-30' as timestamp),30,10,2020,669 UNION ALL
select 20201031, CAST('2020-10-31' as timestamp),31,10,2020,670 UNION ALL
select 20201101, CAST('2020-11-01' as timestamp),1,11,2020,671 UNION ALL
select 20201102, CAST('2020-11-02' as timestamp),2,11,2020,672 UNION ALL
select 20201103, CAST('2020-11-03' as timestamp),3,11,2020,673 UNION ALL
select 20201104, CAST('2020-11-04' as timestamp),4,11,2020,674 UNION ALL
select 20201105, CAST('2020-11-05' as timestamp),5,11,2020,675 UNION ALL
select 20201106, CAST('2020-11-06' as timestamp),6,11,2020,676 UNION ALL
select 20201107, CAST('2020-11-07' as timestamp),7,11,2020,677 UNION ALL
select 20201108, CAST('2020-11-08' as timestamp),8,11,2020,678 UNION ALL
select 20201109, CAST('2020-11-09' as timestamp),9,11,2020,679 UNION ALL
select 20201110, CAST('2020-11-10' as timestamp),10,11,2020,680 UNION ALL
select 20201111, CAST('2020-11-11' as timestamp),11,11,2020,681 UNION ALL
select 20201112, CAST('2020-11-12' as timestamp),12,11,2020,682 UNION ALL
select 20201113, CAST('2020-11-13' as timestamp),13,11,2020,683 UNION ALL
select 20201114, CAST('2020-11-14' as timestamp),14,11,2020,684 UNION ALL
select 20201115, CAST('2020-11-15' as timestamp),15,11,2020,685 UNION ALL
select 20201116, CAST('2020-11-16' as timestamp),16,11,2020,686 UNION ALL
select 20201117, CAST('2020-11-17' as timestamp),17,11,2020,687 UNION ALL
select 20201118, CAST('2020-11-18' as timestamp),18,11,2020,688 UNION ALL
select 20201119, CAST('2020-11-19' as timestamp),19,11,2020,689 UNION ALL
select 20201120, CAST('2020-11-20' as timestamp),20,11,2020,690 UNION ALL
select 20201121, CAST('2020-11-21' as timestamp),21,11,2020,691 UNION ALL
select 20201122, CAST('2020-11-22' as timestamp),22,11,2020,692 UNION ALL
select 20201123, CAST('2020-11-23' as timestamp),23,11,2020,693 UNION ALL
select 20201124, CAST('2020-11-24' as timestamp),24,11,2020,694 UNION ALL
select 20201125, CAST('2020-11-25' as timestamp),25,11,2020,695 UNION ALL
select 20201126, CAST('2020-11-26' as timestamp),26,11,2020,696 UNION ALL
select 20201127, CAST('2020-11-27' as timestamp),27,11,2020,697 UNION ALL
select 20201128, CAST('2020-11-28' as timestamp),28,11,2020,698 UNION ALL
select 20201129, CAST('2020-11-29' as timestamp),29,11,2020,699 UNION ALL
select 20201130, CAST('2020-11-30' as timestamp),30,11,2020,700 UNION ALL
select 20201201, CAST('2020-12-01' as timestamp),1,12,2020,701 UNION ALL
select 20201202, CAST('2020-12-02' as timestamp),2,12,2020,702 UNION ALL
select 20201203, CAST('2020-12-03' as timestamp),3,12,2020,703 UNION ALL
select 20201204, CAST('2020-12-04' as timestamp),4,12,2020,704 UNION ALL
select 20201205, CAST('2020-12-05' as timestamp),5,12,2020,705 UNION ALL
select 20201206, CAST('2020-12-06' as timestamp),6,12,2020,706 UNION ALL
select 20201207, CAST('2020-12-07' as timestamp),7,12,2020,707 UNION ALL
select 20201208, CAST('2020-12-08' as timestamp),8,12,2020,708 UNION ALL
select 20201209, CAST('2020-12-09' as timestamp),9,12,2020,709 UNION ALL
select 20201210, CAST('2020-12-10' as timestamp),10,12,2020,710 UNION ALL
select 20201211, CAST('2020-12-11' as timestamp),11,12,2020,711 UNION ALL
select 20201212, CAST('2020-12-12' as timestamp),12,12,2020,712 UNION ALL
select 20201213, CAST('2020-12-13' as timestamp),13,12,2020,713 UNION ALL
select 20201214, CAST('2020-12-14' as timestamp),14,12,2020,714 UNION ALL
select 20201215, CAST('2020-12-15' as timestamp),15,12,2020,715 UNION ALL
select 20201216, CAST('2020-12-16' as timestamp),16,12,2020,716 UNION ALL
select 20201217, CAST('2020-12-17' as timestamp),17,12,2020,717 UNION ALL
select 20201218, CAST('2020-12-18' as timestamp),18,12,2020,718 UNION ALL
select 20201219, CAST('2020-12-19' as timestamp),19,12,2020,719 UNION ALL
select 20201220, CAST('2020-12-20' as timestamp),20,12,2020,720 UNION ALL
select 20201221, CAST('2020-12-21' as timestamp),21,12,2020,721 UNION ALL
select 20201222, CAST('2020-12-22' as timestamp),22,12,2020,722 UNION ALL
select 20201223, CAST('2020-12-23' as timestamp),23,12,2020,723 UNION ALL
select 20201224, CAST('2020-12-24' as timestamp),24,12,2020,724 UNION ALL
select 20201225, CAST('2020-12-25' as timestamp),25,12,2020,725 UNION ALL
select 20201226, CAST('2020-12-26' as timestamp),26,12,2020,726 UNION ALL
select 20201227, CAST('2020-12-27' as timestamp),27,12,2020,727 UNION ALL
select 20201228, CAST('2020-12-28' as timestamp),28,12,2020,728 UNION ALL
select 20201229, CAST('2020-12-29' as timestamp),29,12,2020,729 UNION ALL
select 20201230, CAST('2020-12-30' as timestamp),30,12,2020,730 UNION ALL
select 20201231, CAST('2020-12-31' as timestamp),31,12,2020,731
;

INSERT INTO fact_View
SELECT 1000,1, 1,CAST('2020-01-15 12:22:47' as timestamp),20200115,CAST('2020-01-15 12:26:54' as timestamp), 20200115,24 UNION ALL
SELECT 1001,1, 2,CAST('2020-01-15 12:27:03' as timestamp),20200115,CAST('2020-01-15 12:32:47' as timestamp), 20200115,344 UNION ALL
SELECT 1002,1, 3,CAST('2020-01-15 12:32:55' as timestamp),20200115,CAST('2020-01-15 12:36:14' as timestamp), 20200115,199 UNION ALL
SELECT 1003,1, 4,CAST('2020-01-15 12:36:23' as timestamp),20200115,CAST('2020-01-15 12:40:05' as timestamp), 20200115,222 UNION ALL
SELECT 1004,1, 5,CAST('2020-01-15 12:40:14' as timestamp),20200115,CAST('2020-01-15 12:45:47' as timestamp), 20200115,333 UNION ALL
SELECT 1005,2, 1,CAST('2020-02-03 10:01:12' as timestamp),20200203,CAST('2020-02-03 10:05:19' as timestamp), 20200203,247 UNION ALL
SELECT 1006,2, 2,CAST('2020-02-03 10:05:28' as timestamp),20200203,CAST('2020-02-03 10:11:12' as timestamp), 20200203,344 UNION ALL
SELECT 1007,2, 3,CAST('2020-02-03 10:11:20' as timestamp),20200203,CAST('2020-02-03 10:14:39' as timestamp), 20200203,199 UNION ALL
SELECT 1008,2, 4,CAST('2020-02-03 10:14:48' as timestamp),20200203,CAST('2020-02-03 10:18:30' as timestamp), 20200203,222 UNION ALL
SELECT 1009,2, 5,CAST('2020-02-03 10:18:39' as timestamp),20200203,CAST('2020-02-03 10:24:12' as timestamp), 20200203,333 UNION ALL
SELECT 1010,3, 1,CAST('2020-02-22 16:11:55' as timestamp),20200222,CAST('2020-02-22 16:16:02' as timestamp), 20200222,247 UNION ALL
SELECT 1011,3, 2,CAST('2020-02-22 16:16:11' as timestamp),20200222,CAST('2020-02-22 16:21:55' as timestamp), 20200222,344 UNION ALL
SELECT 1012,3, 3,CAST('2020-02-22 16:22:03' as timestamp),20200222,CAST('2020-02-22 16:25:22' as timestamp), 20200222,19 UNION ALL
SELECT 1013,3, 4,CAST('2020-02-22 16:25:31' as timestamp),20200222,CAST('2020-02-22 16:29:13' as timestamp), 20200222,222 UNION ALL
SELECT 1014,3, 5,CAST('2020-02-22 16:29:22' as timestamp),20200222,CAST('2020-02-22 16:34:55' as timestamp), 20200222,333 UNION ALL
SELECT 1015,4, 1,CAST('2020-04-11 10:11:55' as timestamp),20200411,CAST('2020-04-11 10:16:02' as timestamp), 20200411,247 UNION ALL
SELECT 1016,4, 2,CAST('2020-04-11 10:16:11' as timestamp),20200411,CAST('2020-04-11 10:21:55' as timestamp), 20200411,344 UNION ALL
SELECT 1017,4, 3,CAST('2020-04-11 10:22:03' as timestamp),20200411,CAST('2020-04-11 10:25:22' as timestamp), 20200411,199 UNION ALL
SELECT 1018,4, 4,CAST('2020-04-11 10:25:31' as timestamp),20200411,CAST('2020-04-11 10:29:13' as timestamp), 20200411,222 UNION ALL
SELECT 1019,4, 5,CAST('2020-04-11 10:29:22' as timestamp),20200411,CAST('2020-04-11 10:34:55' as timestamp), 20200411,333 UNION ALL
SELECT 1020,5, 1,CAST('2020-04-01 10:11:55' as timestamp),20200401,CAST('2020-04-01 10:16:02' as timestamp), 20200401,247 UNION ALL
SELECT 1021,5, 2,CAST('2020-04-01 10:16:11' as timestamp),20200401,CAST('2020-04-01 10:21:55' as timestamp), 20200401,344 UNION ALL
SELECT 1022,5, 3,CAST('2020-04-01 10:22:03' as timestamp),20200401,CAST('2020-04-01 10:25:22' as timestamp), 20200401,199 UNION ALL
SELECT 1023,5, 4,CAST('2020-04-01 10:25:31' as timestamp),20200401,CAST('2020-04-01 10:29:13' as timestamp), 20200401,222 UNION ALL
SELECT 1024,5, 5,CAST('2020-04-01 10:29:22' as timestamp),20200401,CAST('2020-04-01 10:34:55' as timestamp), 20200401,333 UNION ALL
SELECT 1025,6, 1,CAST('2020-01-03 16:11:55' as timestamp),20200103,CAST('2020-01-03 16:16:02' as timestamp), 20200103,247 UNION ALL
SELECT 1026,6, 2,CAST('2020-01-03 16:16:11' as timestamp),20200103,CAST('2020-01-03 16:21:55' as timestamp), 20200103,344 UNION ALL
SELECT 1027,6, 3,CAST('2020-01-03 16:22:03' as timestamp),20200103,CAST('2020-01-03 16:25:22' as timestamp), 20200103,199 UNION ALL
SELECT 1028,6, 4,CAST('2020-01-03 16:25:31' as timestamp),20200103,CAST('2020-01-03 16:29:13' as timestamp), 20200103,222 UNION ALL
SELECT 1029,6, 5,CAST('2020-01-03 16:29:22' as timestamp),20200103,CAST('2020-01-03 16:34:55' as timestamp), 20200103,333 UNION ALL
SELECT 1030,1, 6,CAST('2020-01-15 13:01:47' as timestamp),20200115,CAST('2020-01-15 13:04:11' as timestamp), 20200115,144 UNION ALL
SELECT 1031,1, 7,CAST('2020-01-15 13:04:20' as timestamp),20200115,CAST('2020-01-15 13:07:44' as timestamp), 20200115,204 UNION ALL
SELECT 1032,1, 8,CAST('2020-01-15 13:07:52' as timestamp),20200115,CAST('2020-01-15 13:13:25' as timestamp), 20200115,333 UNION ALL
SELECT 1033,1, 9,CAST('2020-01-15 13:13:34' as timestamp),20200115,CAST('2020-01-15 13:20:58' as timestamp), 20200115,444 UNION ALL
SELECT 1034,4, 6,CAST('2020-02-15 01:01:47' as timestamp),20200215,CAST('2020-02-15 01:04:11' as timestamp), 20200215,144 UNION ALL
SELECT 1035,4, 7,CAST('2020-02-15 01:04:20' as timestamp),20200215,CAST('2020-02-15 01:07:44' as timestamp), 20200215,204 UNION ALL
SELECT 1036,4, 8,CAST('2020-02-15 01:07:52' as timestamp),20200215,CAST('2020-02-15 01:13:25' as timestamp), 20200215,33 UNION ALL
SELECT 1037,4, 9,CAST('2020-02-15 01:13:34' as timestamp),20200215,CAST('2020-02-15 01:20:58' as timestamp), 20200215,444 UNION ALL
SELECT 1038,5, 6,CAST('2020-03-23 14:01:47' as timestamp),20200323,CAST('2020-03-23 14:04:11' as timestamp), 20200323,144 UNION ALL
SELECT 1039,5, 7,CAST('2020-03-23 14:04:20' as timestamp),20200323,CAST('2020-03-23 14:07:44' as timestamp), 20200323,204 UNION ALL
SELECT 1040,5, 8,CAST('2020-03-23 14:07:52' as timestamp),20200323,CAST('2020-03-23 14:13:25' as timestamp), 20200323,333 UNION ALL
SELECT 1041,5, 9,CAST('2020-03-23 14:13:34' as timestamp),20200323,CAST('2020-03-23 14:20:58' as timestamp), 20200323,444 UNION ALL
SELECT 1042,6, 6,CAST('2020-04-01 15:01:47' as timestamp),20200401,CAST('2020-04-01 15:04:11' as timestamp), 20200401,144 UNION ALL
SELECT 1043,6, 7,CAST('2020-04-01 15:04:20' as timestamp),20200401,CAST('2020-04-01 15:07:44' as timestamp), 20200401,204 UNION ALL
SELECT 1044,6, 8,CAST('2020-04-01 15:07:52' as timestamp),20200401,CAST('2020-04-01 15:13:25' as timestamp), 20200401,333 UNION ALL
SELECT 1045,6, 9,CAST('2020-04-01 15:13:34' as timestamp),20200401,CAST('2020-04-01 15:20:58' as timestamp), 20200401,444 UNION ALL
SELECT 1046,2, 6,CAST('2020-04-15 13:01:47' as timestamp),20200415,CAST('2020-04-15 13:04:11' as timestamp), 20200415,144 UNION ALL
SELECT 1047,2, 7,CAST('2020-04-15 13:04:20' as timestamp),20200415,CAST('2020-04-15 13:07:44' as timestamp), 20200415,204 UNION ALL
SELECT 1048,2, 8,CAST('2020-04-15 13:07:52' as timestamp),20200415,CAST('2020-04-15 13:13:25' as timestamp), 20200415,333 UNION ALL
SELECT 1049,2, 9,CAST('2020-04-15 13:13:34' as timestamp),20200415,CAST('2020-04-15 13:20:58' as timestamp), 20200415,444 UNION ALL
SELECT 1050,1, 10,CAST('2020-01-02 04:01:47' as timestamp),20200102,CAST('2020-01-02 04:05:29' as timestamp), 20200102,222 UNION ALL
SELECT 1051,1, 11,CAST('2020-01-02 04:05:38' as timestamp),20200102,CAST('2020-01-02 04:09:41' as timestamp), 20200102,243 UNION ALL
SELECT 1052,1, 12,CAST('2020-01-02 04:09:49' as timestamp),20200102,CAST('2020-01-02 04:13:08' as timestamp), 20200102,199 UNION ALL
SELECT 1053,1, 13,CAST('2020-01-02 04:13:17' as timestamp),20200102,CAST('2020-01-02 04:17:09' as timestamp), 20200102,23 UNION ALL
SELECT 1054,2, 10,CAST('2020-01-22 14:01:47' as timestamp),20200122,CAST('2020-01-22 14:05:29' as timestamp), 20200122,222 UNION ALL
SELECT 1055,2, 11,CAST('2020-01-22 14:05:38' as timestamp),20200122,CAST('2020-01-22 14:09:41' as timestamp), 20200122,243 UNION ALL
SELECT 1056,2, 12,CAST('2020-01-22 14:09:49' as timestamp),20200122,CAST('2020-01-22 14:13:08' as timestamp), 20200122,199 UNION ALL
SELECT 1057,2, 13,CAST('2020-01-22 14:13:17' as timestamp),20200122,CAST('2020-01-22 14:17:09' as timestamp), 20200122,232 UNION ALL
SELECT 1058,3, 10,CAST('2020-01-23 14:01:47' as timestamp),20200123,CAST('2020-01-23 14:05:29' as timestamp), 20200123,222 UNION ALL
SELECT 1059,3, 11,CAST('2020-01-23 14:05:38' as timestamp),20200123,CAST('2020-01-23 14:09:41' as timestamp), 20200123,243 UNION ALL
SELECT 1060,3, 12,CAST('2020-01-23 14:09:49' as timestamp),20200123,CAST('2020-01-23 14:13:08' as timestamp), 20200123,199 UNION ALL
SELECT 1061,3, 13,CAST('2020-01-23 14:13:17' as timestamp),20200123,CAST('2020-01-23 14:17:09' as timestamp), 20200123,232 UNION ALL
SELECT 1062,4, 10,CAST('2020-01-26 11:01:47' as timestamp),20200126,CAST('2020-01-26 11:05:29' as timestamp), 20200126,22 UNION ALL
SELECT 1063,4, 11,CAST('2020-01-26 11:05:38' as timestamp),20200126,CAST('2020-01-26 11:09:41' as timestamp), 20200126,24 UNION ALL
SELECT 1064,4, 12,CAST('2020-01-26 11:09:49' as timestamp),20200126,CAST('2020-01-26 11:13:08' as timestamp), 20200126,199 UNION ALL
SELECT 1065,4, 13,CAST('2020-01-26 11:13:17' as timestamp),20200126,CAST('2020-01-26 11:17:09' as timestamp), 20200126,232 UNION ALL
SELECT 1066,5, 10,CAST('2020-01-31 04:01:47' as timestamp),20200131,CAST('2020-01-31 04:05:29' as timestamp), 20200131,1 UNION ALL
SELECT 1067,5, 11,CAST('2020-01-31 04:05:38' as timestamp),20200131,CAST('2020-01-31 04:09:41' as timestamp), 20200131,1 UNION ALL
SELECT 1068,5, 12,CAST('2020-01-31 04:09:49' as timestamp),20200131,CAST('2020-01-31 04:13:08' as timestamp), 20200131,1 UNION ALL
SELECT 1069,5, 13,CAST('2020-01-31 04:13:17' as timestamp),20200131,CAST('2020-01-31 04:17:09' as timestamp), 20200131,1
;
