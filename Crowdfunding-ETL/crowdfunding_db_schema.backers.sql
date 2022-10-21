-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/uqLZAH
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "campaigns" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(100)   NOT NULL,
    "description" text   NOT NULL,
    "goal" numeric(10,2)   NOT NULL,
    "pledged" numeric(10,2)   NOT NULL,
    "outcome" varchar(50)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" int   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(10)   NOT NULL,
    CONSTRAINT "pk_campaigns" PRIMARY KEY (
        "cf_id"
     )
);

CREATE TABLE "category" (
    "category_id" int   NOT NULL,
    "category" varchar(50)   NOT NULL
);

CREATE TABLE "subcategory" (
    "subcategory_id" int   NOT NULL,
    "subcategory" varchar(50)   NOT NULL
);

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" int   NOT NULL,
    "last_name" int   NOT NULL,
    "email" int   NOT NULL
);

CREATE TABLE "backers" (
    "backer_id" varchar(10)   NOT NULL,
    "cf_id" int   NOT NULL,
    "name" varchar(100)   NOT NULL,
    "email" varchar(70)   NOT NULL,
    CONSTRAINT "pk_backers" PRIMARY KEY (
        "backer_id"
     )
);

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaigns" ADD CONSTRAINT "fk_campaigns_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

ALTER TABLE "backers" ADD CONSTRAINT "fk_backers_cf_id" FOREIGN KEY("cf_id")
REFERENCES "campaigns" ("cf_id");

