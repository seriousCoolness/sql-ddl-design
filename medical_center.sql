-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "medicalcenter" (
    "id" int   NOT NULL,
    "doctor_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_medicalCenter" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "doctors" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "patients" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "diagnoses" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_diagnoses" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "doctors" ADD CONSTRAINT "fk_doctors_id" FOREIGN KEY("id")
REFERENCES "medicalcenter" ("doctor_id");

ALTER TABLE "patients" ADD CONSTRAINT "fk_patients_id" FOREIGN KEY("id")
REFERENCES "medicalcenter" ("patient_id");

ALTER TABLE "diagnoses" ADD CONSTRAINT "fk_diagnoses_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patients" ("id");

