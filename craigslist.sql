-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Users" (
    "id" serial   NOT NULL,
    "username" varchar(15)   NOT NULL,
    "preferred_region" string   NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_Users_username" UNIQUE (
        "username"
    )
);

CREATE TABLE "Posts" (
    "title" string   NOT NULL,
    "text" string   NULL,
    "user_id" int   NOT NULL,
    "location" string   NULL,
    "current_region" string   NOT NULL,
    "category_id" int   NOT NULL,

    CONSTRAINT "uc_Posts_title" UNIQUE (
        "title"
    )
);

CREATE TABLE "Categories" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    "description" string   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_Categories_name" UNIQUE (
        "name"
    )
);

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("id");

