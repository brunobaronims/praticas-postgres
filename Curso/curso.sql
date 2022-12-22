CREATE DATABASE curso;

\c curso;

CREATE TABLE classes (
    id serial primary key,
    code text unique not null
);

CREATE TABLE students (
    id serial primary key,
    "classId" int references classes(id),
    name text not null,
    cpf varchar(11) unique not null,
    email text unique not null
);

CREATE TABLE entries (
    id serial primary key,
    "classId" int references classes(id),
    "studentId" int references students(id),
    date date not null
);

CREATE TABLE exits (
    id serial primary key,
    "classId" int references classes(id),
    "studentId" int references students(id),
    date date not null
);

CREATE TABLE modules (
    id serial primary key,
    name text unique not null,
    "startDate" date not null,
    "endDate" date not null
);

CREATE TABLE projects (
    id serial primary key,
    "moduleId" int references modules(id),
    name text not null
);

CREATE TYPE "projectScore" AS ENUM ('Abaixo das expectativas', 'Dentro das expectativas', 'Acima das expectativas');

CREATE TABLE submittals (
    id serial primary key,
    "projectId" int references projects(id),
    "studentId" int references students(id),
    "submitDate" timestamptz not null,
    score "projectScore" not null
);