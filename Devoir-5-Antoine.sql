drop database if exists library2;
create database if not exists library2;
use library2;

-- table Authors
create table Authors (
    au_id TINYINT auto_increment primary key,
    au_lname varchar(50),
    au_fname varchar(50),
    phone varchar(20) unique check (phone like '+%' and length(phone) between 10 and 15),
    address varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50),
    zip varchar(6) check (zip regexp '^[A-Za-z][0-9][A-Za-z][0-9][A-Za-z][0-9]$'),
    contract text,
    email varchar(50) unique check (email like '%@%')
);

-- table Publishers
create table Publishers (
    pub_id tinyint auto_increment primary key,
    pub_name varchar(50),
    city varchar(50),
    state varchar(50),
    country varchar(50),
    email varchar(50) unique check (email like '%@%')
);

-- table Jobs
create table Jobs (
    job_id tinyint auto_increment primary key,
    job_desc varchar(50),
    min_lvl enum('Stagiaire', 'Junior', 'Intermediaire', 'Seinior'),
    max_lvl enum('Stagiaire', 'Junior', 'Intermediaire', 'Seinior')
);

-- table Employees
create table Employees (
    emp_id tinyint auto_increment primary key,
    emp_name varchar(50),
    salary smallint,
    fname varchar(50),
    lname varchar(50),
    job_id smallint references Jobs(job_id),
    pub_id smallint references Publishers(pub_id),
    pub_date date,
    email varchar(50) unique check (email like '%@%')
);