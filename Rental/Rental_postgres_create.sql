CREATE TABLE "public.disks" (
	"number" int NOT NULL UNIQUE,
	"id" serial NOT NULL UNIQUE,
	"barcode" TEXT NOT NULL UNIQUE,
	"movieId" bigint NOT NULL,
	CONSTRAINT "disks_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.movies" (
	"id" serial NOT NULL,
	"title" TEXT NOT NULL UNIQUE,
	"categoryId" bigint NOT NULL,
	CONSTRAINT "movies_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.actors" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"countryId" bigint NOT NULL,
	"birthday" DATE NOT NULL,
	CONSTRAINT "actors_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"addressId" bigint NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.rentals" (
	"id" serial NOT NULL,
	"diskId" bigint NOT NULL,
	"rentalDate" DATE NOT NULL,
	"returnDate" DATE,
	"customerId" bigint NOT NULL,
	CONSTRAINT "rentals_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.surveys" (
	"id" serial NOT NULL,
	"customerId" bigint NOT NULL,
	"movieRating" bigint NOT NULL,
	"serviceRating" bigint NOT NULL,
	"rentalId" bigint NOT NULL,
	CONSTRAINT "surveys_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.roles" (
	"id" serial NOT NULL,
	"actorId" bigint NOT NULL,
	"movieId" bigint NOT NULL,
	CONSTRAINT "roles_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.countries" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "countries_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customerAdresses" (
	"id" serial NOT NULL,
	"phone" numeric NOT NULL UNIQUE,
	"street" TEXT NOT NULL,
	"streetNumber" bigint NOT NULL,
	"complement" TEXT,
	"district" TEXT NOT NULL,
	"cityId" bigint NOT NULL,
	CONSTRAINT "customerAdresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"stateId" bigint NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "disks" ADD CONSTRAINT "disks_fk0" FOREIGN KEY ("movieId") REFERENCES "movies"("id");

ALTER TABLE "movies" ADD CONSTRAINT "movies_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");


ALTER TABLE "actors" ADD CONSTRAINT "actors_fk0" FOREIGN KEY ("countryId") REFERENCES "countries"("id");

ALTER TABLE "customers" ADD CONSTRAINT "customers_fk0" FOREIGN KEY ("addressId") REFERENCES "customerAdresses"("id");

ALTER TABLE "rentals" ADD CONSTRAINT "rentals_fk0" FOREIGN KEY ("diskId") REFERENCES "disks"("id");
ALTER TABLE "rentals" ADD CONSTRAINT "rentals_fk1" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "surveys" ADD CONSTRAINT "surveys_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "surveys" ADD CONSTRAINT "surveys_fk1" FOREIGN KEY ("rentalId") REFERENCES "rentals"("id");

ALTER TABLE "roles" ADD CONSTRAINT "roles_fk0" FOREIGN KEY ("actorId") REFERENCES "actors"("id");
ALTER TABLE "roles" ADD CONSTRAINT "roles_fk1" FOREIGN KEY ("movieId") REFERENCES "movies"("id");


ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");














