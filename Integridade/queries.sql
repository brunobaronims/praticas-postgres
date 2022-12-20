CREATE DATABASE integridade;

CREATE TABLE customers (
    id serial primary key,
    "fullName" text not null,
    cpf varchar(11) unique not null,
    email text unique not null,
    "password" text not null
);

CREATE TABLE "bankAccount" (
    id serial primary key,
    "customerId" int references customers(id),
    "accountNumber" varchar(255) unique not null,
    agency text not null,
    "openDate" date not null,
    "closeDate" date
);

CREATE TYPE "transactionType" AS ENUM ('deposit', 'withdraw');
CREATE TABLE transactions (
    id serial primary key,
    "bankAccountId" int references "bankAccount"(id),
    amount numeric not null CHECK (amount > 0),
    "type" "transactionType" not null,
    "time" time not null,
    "description" varchar(255) not null,
    cancelled boolean not null
);

CREATE TABLE "creditCards" (
    id serial primary key,
    "bankAccountId" int references "bankAccount"(id),
    "name" text not null,
    "number" numeric unique not null,
    "security code" varchar(3) not null,
    "expirationMonth" varchar (2) not null,
    "expirationYear" varchar (4) not null,
    "password" text not null,
    "limit" numeric not null
);

CREATE TABLE states (
    id serial primary key,
    "name" text unique not null
);

CREATE TABLE cities (
    id serial primary key,
    "name" text unique not null,
    "stateId" int references states(id)
);

CREATE TABLE "customerAdresses" (
    id serial primary key,
    "customerId" int unique references customers(id),
    street text not null,
    "number" numeric not null,
    "complement" varchar(255),
    "postalCode" numeric not null,
    "cityId" int references cities(id)
);

CREATE TYPE "phoneType" AS ENUM ('landline', 'mobile');
CREATE TABLE "customerPhones" (
    id serial primary key,
    "customerId" int references customers(id),
    "number" varchar(11) unique not null,
    "type" "phoneType" not null
);