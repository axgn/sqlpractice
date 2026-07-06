-- Active: 1744952858156@@127.0.0.1@13306@studentdb
CREATE TABLE student_info (
    学号 char(4) NOT NULL PRIMARY KEY,
    姓名 char(8) NOT NULL,
    性别 char(2),
    出生日期 date,
    家庭住址 varchar(50)
);

CREATE TABLE curriculum (
    课程编号 char(4) NOT NULL PRIMARY KEY,
    课程名称 varchar(50),
    学分 int
);

CREATE TABLE grade (
    学号 char(4) NOT NULL,
    课程编号 char(4) NOT NULL,
    分数 int,
    PRIMARY KEY (学号, 课程编号)
);

INSERT INTO
    student_info
VALUES (
        '0001',
        '张青平',
        '男',
        '2000-10-01',
        '衡阳市东 
风路 77 号'
    );

INSERT INTO
    student_info
VALUES (
        '0002',
        '刘东阳',
        '男',
        '1998-12-09',
        '东阳市八 
一北路 33 号'
    );

INSERT INTO
    student_info
VALUES (
        '0003',
        '马晓夏',
        '女',
        '1995-05-12',
        '长岭市五 
一路 763 号'
    );

INSERT INTO
    student_info
VALUES (
        '0004',
        '钱忠理',
        '男',
        '1994-09-23',
        '滨海市洞 
庭大道 279 号'
    );

INSERT INTO
    student_info
VALUES (
        '0005',
        '孙海洋',
        '男',
        '1995-04-03',
        '长岛市解 
放路 27 号'
    );

INSERT INTO
    student_info
VALUES (
        '0006',
        '郭小斌',
        '男',
        '1997-11-10',
        '南山市红 
旗路 113 号'
    );

INSERT INTO
    student_info
VALUES (
        '0007',
        '肖月玲',
        '女',
        '1996-12-07',
        '东方市南 
京路 11 号'
    );

INSERT INTO
    student_info
VALUES (
        '0008',
        '张玲珑',
        '女',
        '1997-12-24',
        '滨江市新 
建路 97 号'
    );

INSERT INTO curriculum VALUES ('0001', '计算机应用基础', 2);

INSERT INTO curriculum VALUES ('0002', 'C 语言程序设计', 2);

INSERT INTO curriculum VALUES ('0003', '数据库原理及应用', 2);

INSERT INTO curriculum VALUES ('0004', '英语', 4);

INSERT INTO curriculum VALUES ('0005', '高等数学', 4);

INSERT INTO grade VALUES ('0001', '0001', 80);

INSERT INTO grade VALUES ('0001', '0002', 91);

INSERT INTO grade VALUES ('0001', '0003', 88);

INSERT INTO grade VALUES ('0001', '0004', 85);

INSERT INTO grade VALUES ('0001', '0005', 77);

INSERT INTO grade VALUES ('0002', '0001', 73);

INSERT INTO grade VALUES ('0002', '0002', 68);

INSERT INTO grade VALUES ('0002', '0003', 80);

INSERT INTO grade VALUES ('0002', '0004', 79);

INSERT INTO grade VALUES ('0002', '0005', 73);

INSERT INTO grade VALUES ('0003', '0001', 84);

INSERT INTO grade VALUES ('0003', '0002', 92);

INSERT INTO grade VALUES ('0003', '0003', 81);

INSERT INTO grade VALUES ('0003', '0004', 82);

INSERT INTO grade VALUES ('0003', '0005', 75);

SELECT * FROM grade

ALTER TABLE student_info DROP PRIMARY KEY;

ALTER TABLE curriculum DROP PRIMARY KEY;

ALTER TABLE grade DROP PRIMARY KEY;

CREATE UNIQUE INDEX cno_idx ON curriculum (课程编号);

CREATE INDEX grade_idx ON grade (分数);

SELECT * FROM grade;

CREATE INDEX grade_sid_cid_idx ON grade (学号, 课程编号);

SHOW INDEX FROM grade;

DROP INDEX grade_idc ON grade;

CREATE VIEW v_stu_c AS
SELECT s.学号, s.姓名, g.课程编号
FROM student_info s, grade g
WHERE
    s.学号 = g.学号;

SELECT * FROM v_stu_c WHERE 学号 = '0003';
