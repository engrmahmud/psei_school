BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "admin" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "name" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "student" (
    "id" bigserial PRIMARY KEY,
    "academicYear" text NOT NULL,
    "admissionDate" timestamp without time zone NOT NULL,
    "studentName" text NOT NULL,
    "dateOfBirth" timestamp without time zone NOT NULL,
    "gender" text NOT NULL,
    "religion" text NOT NULL,
    "bloodGroup" text NOT NULL,
    "nationality" text NOT NULL,
    "fatherName" text NOT NULL,
    "motherName" text NOT NULL,
    "email" text NOT NULL,
    "phone" text NOT NULL,
    "address" text NOT NULL,
    "studentClass" text NOT NULL,
    "section" text NOT NULL,
    "roll" text NOT NULL,
    "registration" text NOT NULL,
    "password" text NOT NULL
);


--
-- MIGRATION VERSION FOR psei_school
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('psei_school', '20260207060904033', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260207060904033', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
