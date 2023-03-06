drop database if exists voyager;
create database voyager charset utf8mb4;
use voyager;

create table operator
(
    operator_id   int         not null primary key auto_increment,
    firstName     varchar(50) not null,
    lastName varchar(50) not null,
    email   varchar(50) not null,
    password char(61)    not null,
    role varchar(20) not null
);

create table department
(
    department_id  int         not null auto_increment primary key,
    name     varchar(50) not null,
    number_of_rooms int
);

create table patient
(
    patient_id int not null auto_increment primary key,
    firstName         varchar(50),
    lastName     varchar(50),
    address      varchar(255),
    oib         char(11),
    doctor_id   int
);

create table doctor
(
    doctor_id       int not null auto_increment primary key,
    firstName             varchar(50),
    lastName         varchar(50),
    specialization varchar(50),
    oib             char(11),
    department_id        int
);

create table medical_record
(
    medical_records_id int not null auto_increment primary key,
    date       datetime,
    diagnosis            varchar(255),
    patient_id          int
);

create table patient_visitor
(
    patient_visitor_id          int not null auto_increment primary key,
    date               datetime,
    patient_id         int,
    visitor_id      int,
    max_duration_min int
);

create table visitor
(
    visitor_id  int not null auto_increment primary key,
    firstName             varchar(50),
    lastName         varchar(50),
    address          varchar(50),
    telephone_number int
);

alter table patient
    add foreign key (doctor_id) references doctor (doctor_id);

alter table patient_visitor
    add foreign key (patient_id) references patient (patient_id);
alter table patient_visitor
    add foreign key (visitor_id) references visitor (visitor_id);

alter table medical_record
    add foreign key (patient_id) references patient (patient_id);

alter table doctor
    add foreign key (department_id) references department (department_id);


insert into operator (firstName, lastName, email, password, role)
values ('Luka', 'Operator', 'luka@gmail.com',
        '$2y$10$vlnbKWhdDvVDIkR1R8PAseVYQK8ZwbrcwUCTChjFp6zsR3vLKkCoe', 'oper');

insert into operator (firstName, lastName, email, password, role)
values ('Ministar', 'Admin', 'admin@gmail.com',
        '$2y$10$vlnbKWhdDvVDIkR1R8PAseVYQK8ZwbrcwUCTChjFp6zsR3vLKkCoe', 'admin');

insert into department (name, number_of_rooms)
values ('Kardiologija', 15);
insert into department (name, number_of_rooms)
values ('Psihijatrija', 1);
insert into department (name, number_of_rooms)
values ('Neurologija', 5);



insert into doctor (firstName, lastName, specialization, oib, department_id)
values ('Imzo', 'Prezimic', 'Kardiologija', 45798462514, 1);
insert into doctor (firstName, lastName, specialization, oib, department_id)
values ('Hrvoje', 'Samic', 'Psihijatrija', 45798212514, 2);
insert into doctor (firstName, lastName, specialization, oib, department_id)
values ('Gojka', 'Prezimic', 'Neurologija', 45298462514, 3);

insert into patient (firstName, lastName, address, oib, doctor_id)
values ('Marko', 'Marulic', 'Trosinska 21, Silas 31011', 15487569851, 1);
insert into patient (firstName, lastName, address, oib, doctor_id)
values ('Jovica', 'Jovic', 'B.B. Billmayera 41, Osijek 31000', 15487569851, 3);
insert into patient (firstName, lastName, address, oib, doctor_id)
values ('Sinan', 'Sakic', ' 21, Ernestinovo 31456', 15487239851, 2);

insert into medical_record (date, diagnosis, patient_id)
values ('2022-09-09',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
        1);
insert into medical_record (date, diagnosis, patient_id)
values ('2022-08-08',
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",
        2);
insert into medical_record (date, diagnosis, patient_id)
values ('2022-12-12',
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
        3);

insert into visitor (firstName, lastName, address, telephone_number)
values ('Posjet', 'Kasnic', 'Ul. Inatise 76, Zupanja 32260', '098784652');
insert into visitor (firstName, lastName, address, telephone_number)
values ('Lakomisl', 'Trazic', 'Idarisa Sadrisa 2, Osijek 31000', '098782352');
insert into visitor (firstName, lastName, address, telephone_number)
values ('Butro', 'Rasnic', 'Trg Slobode 1, Zupanja 32260', '098784642');

insert into patient_visitor (date, patient_id, visitor_id, max_duration_min)
values ('2022-12-09', 1, 1, 15);
insert into patient_visitor (date, patient_id, visitor_id, max_duration_min)
values ('2022-12-08', 2, 2, 15);
insert into patient_visitor (date, patient_id, visitor_id, max_duration_min)
values ('2022-12-07', 3, 3, 15);