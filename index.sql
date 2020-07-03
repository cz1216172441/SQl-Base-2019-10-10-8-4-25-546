CREATE TABLE student (
    id VARCHAR2(10) NOT NULL PRIMARY KEY,
    name NVARCHAR2(10) NOT NULL,
    age NUMBER(4) NOT NULL,
    sex CHAR(3) CHECK(sex IN ('男', '女')) NOT NULL
);

CREATE TABLE subject (
    id NUMBER(10) NOT NULL PRIMARY KEY,
    subject NVARCHAR2(10) NOT NULL,
    teacher NVARCHAR2(10) NOT NULL,
    description NVARCHAR2(100)
);

-- subject id自增序列
CREATE SEQUENCE SUBJECT_SEQUENCE
    INCREMENT BY 1
    START WITH 1001
    NOMAXVALUE
    NOCYCLE
    NOCACHE;

-- subject id自增触发器
CREATE OR REPLACE TRIGGER SUBJECT_TRIGGER
    BEFORE INSERT ON subject
    FOR EACH ROW
BEGIN
    :NEW.ID := SUBJECT_SEQUENCE.nextval;
end;

CREATE TABLE score (
    id NUMBER(10) NOT NULL PRIMARY KEY,
    student_id VARCHAR2(10) NOT NULL,
    subject_id NUMBER(10) NOT NULL,
    score NUMBER(5, 2) NOT NULL
);

-- score id自增序列
CREATE SEQUENCE SCORE_SEQUENCE
    INCREMENT BY 1
    START WITH 1
    NOMAXVALUE
    NOCYCLE
    NOCACHE;

-- score id自增触发器
CREATE OR REPLACE TRIGGER SCORE_TRIGGER
    BEFORE INSERT ON score
    FOR EACH ROW
BEGIN
    :NEW.ID := SCORE_SEQUENCE.nextval;
end;

insert into student values ('001', '张三', 18, '男');
insert into student values ('002', '李四', 20, '女');

insert into subject (subject, teacher, description)
    values ('语文', '王老师', '本次考试比较简单');
insert into subject (subject, teacher, description)
    values ('数学', '刘老师', '本次考试比较难');

insert into score (student_id, subject_id, score)
    values ('001', '1001', 80);
insert into score (student_id, subject_id, score)
    values ('002', '1002', 60);
insert into score (student_id, subject_id, score)
    values ('001', '1001', 70);
insert into score (student_id, subject_id, score)
    values ('002', '1002', 60.5);