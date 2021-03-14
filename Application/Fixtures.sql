

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.users DISABLE TRIGGER ALL;

INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, user_role, firstname, lastname) VALUES ('fb91cdb2-ac39-4114-a935-a84552ab1c5e', 'carsten.turck@afg-halver.de', 'sha256|17|0RIsH00DYLBC3fDPeuSQZw==|To+vBd5LIKMgYZJmPvvioXZXmkPJ6fzzq90+DMAk1Cg=', NULL, 0, 'teacher', 'Carsten', 'Turck');
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, user_role, firstname, lastname) VALUES ('fb91cdb2-ac39-4114-a935-a84552ab1c5d', 'daniel@digitallyinduced.com', 'sha256|17|0RIsH00DYLBC3fDPeuSQZw==|To+vBd5LIKMgYZJmPvvioXZXmkPJ6fzzq90+DMAk1Cg=', NULL, 0, 'student', 'Daniel', 'Sonnenberg');


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.courses DISABLE TRIGGER ALL;

INSERT INTO public.courses (id, name, teacher_id) VALUES ('273e8d75-ab85-43d8-9e77-ebb2827069b1', 'Mathematik', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');


ALTER TABLE public.courses ENABLE TRIGGER ALL;


ALTER TABLE public.course_hours DISABLE TRIGGER ALL;



ALTER TABLE public.course_hours ENABLE TRIGGER ALL;


ALTER TABLE public.courses_relations DISABLE TRIGGER ALL;

INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('58656b96-7b36-482d-8865-743640630bf3', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', '7c4b0130-6a03-4c66-a129-354252a7901b');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('f1b4d3a3-663d-4ff4-b9ed-7b450e533e99', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', 'd89458a0-650f-499a-926b-733300e2cbe5');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('20c13e39-fd14-4413-8ee5-a722df1f62c2', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', '3b1f5913-f728-43d7-86ca-b7d1826df7ed');


ALTER TABLE public.courses_relations ENABLE TRIGGER ALL;


