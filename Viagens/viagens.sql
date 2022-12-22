CREATE DATABASE viagens;

\c viagens;

CREATE TABLE companies (
    id serial primary key,
    name text unique not null,
    code varchar(3) unique not null
);

CREATE TABLE airports (
    id serial primary key, 
    name text unique not null,
    code varchar(3) unique not null
);

CREATE TABLE flights (
    id serial primary key,
    "companyId" int references companies(id),
    code varchar(7) unique not null,
    "departureId" int references airports(id),
    "arrivalId" int references airports(id),
    "departureTime" time not null,
    "arrivalTime" time not null
);

CREATE TABLE tickets (
    id serial primary key,
    "flightId" int references flights(id),
    price numeric not null,
    seat text not null
);