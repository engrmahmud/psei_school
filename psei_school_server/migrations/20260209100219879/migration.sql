BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "course" (
    "id" bigserial PRIMARY KEY,
    "courseName" text NOT NULL,
    "subjectCode" text NOT NULL,
    "description" text,
    "classLevel" bigint NOT NULL,
    "teacherId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "student_course" (
    "id" bigserial PRIMARY KEY,
    "studentId" bigint NOT NULL,
    "courseId" bigint NOT NULL,
    "marks" double precision,
    "enrollmentDate" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "teacher" (
    "id" bigserial PRIMARY KEY,
    "teacherName" text NOT NULL,
    "department" text NOT NULL,
    "designation" text NOT NULL,
    "qualification" text NOT NULL,
    "joiningDate" timestamp without time zone NOT NULL,
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
    "permanentAddress" text NOT NULL,
    "registration" text NOT NULL,
    "password" text NOT NULL,
    "experience" bigint NOT NULL,
    "profileImage" text,
    "maritalStatus" text NOT NULL,
    "salary" double precision NOT NULL
);


--
-- MIGRATION VERSION FOR psei_school
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('psei_school', '20260209100219879', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260209100219879', "timestamp" = now();

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
