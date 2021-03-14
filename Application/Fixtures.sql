

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
INSERT INTO public.users (id, email, password_hash, locked_at, failed_login_attempts, user_role, firstname, lastname) VALUES ('117c0de6-dfbf-4ee4-a218-feb5200b2e8d', 'maximilian.sonnenberg@afg-halver.de', 'sha256|17|OWvtQIOfLOAtbOEZns/xmw==|Kb6SIEZyOdNXgf2CrExBYArYIabw9ljjvWz40jZGxaM=', NULL, 0, 'student', 'Max', 'Sonnenberg');


ALTER TABLE public.users ENABLE TRIGGER ALL;


ALTER TABLE public.courses DISABLE TRIGGER ALL;

INSERT INTO public.courses (id, name, teacher_id) VALUES ('273e8d75-ab85-43d8-9e77-ebb2827069b1', 'Deutsch G3', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('fbcf9c63-fdad-4975-a778-31663d8cf21b', 'Englisch L1', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('4f7d2c8c-e09e-4835-8275-ba6382f77168', 'Mathematik L1', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('bfc4f990-48da-4c38-b8ad-3c3e2b589bae', 'Erdkunde G2', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('b6879348-5039-4a1d-8d2b-c7ad8d027502', 'Geschichte ZG1', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('6048e1a1-18f4-4129-bd2a-da45e118f6c2', 'Sozialwissenschaften G2', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('5509a86b-69bc-4447-93ae-a1cdecf47030', 'EV Religion G1', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('0e58f5bf-abd6-428d-a760-489328125254', 'Sport G1', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('bae72130-4508-4558-a138-b099810cfb7d', 'Physik G1', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');
INSERT INTO public.courses (id, name, teacher_id) VALUES ('1fa9dfe9-0716-464f-9b2e-89899c03b11f', 'Informatik G2', 'fb91cdb2-ac39-4114-a935-a84552ab1c5e');


ALTER TABLE public.courses ENABLE TRIGGER ALL;


ALTER TABLE public.course_hours DISABLE TRIGGER ALL;

INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('136e14b2-4dc7-4bd9-89b5-ca228daa7c2a', 5, 2, '273e8d75-ab85-43d8-9e77-ebb2827069b1', 'R33');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('44e23399-3c08-43fe-9695-b67e9fe8ae4d', 2, 1, '273e8d75-ab85-43d8-9e77-ebb2827069b1', 'R33');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('5309fba4-c372-4d6c-aac0-ffaf3d2fa067', 1, 1, '273e8d75-ab85-43d8-9e77-ebb2827069b1', 'R33');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('1a9dc645-c870-495e-b84f-362c98b33648', 3, 1, 'fbcf9c63-fdad-4975-a778-31663d8cf21b', 'R35');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('bdb13f1e-6972-498f-b271-0e56267110b0', 1, 2, 'fbcf9c63-fdad-4975-a778-31663d8cf21b', 'R36');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('04dca065-a68a-4ebf-bae5-51aeb1ea934f', 2, 2, 'fbcf9c63-fdad-4975-a778-31663d8cf21b', 'R36');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('2ddea464-595d-4520-8679-584eba5e9a9a', 5, 5, 'fbcf9c63-fdad-4975-a778-31663d8cf21b', 'R36');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('0545d13e-20a0-41b3-94f1-3484a61b94d1', 6, 5, 'fbcf9c63-fdad-4975-a778-31663d8cf21b', 'R36');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('7f27db9d-4eff-44ab-842e-97acfdba4574', 4, 1, '4f7d2c8c-e09e-4835-8275-ba6382f77168', 'R36');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('aafd433e-96dd-4274-b173-ce494f91d1ef', 5, 3, '4f7d2c8c-e09e-4835-8275-ba6382f77168', 'R23');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('f87eb1f2-7707-443e-afb8-d19a87c2c3cd', 6, 3, '4f7d2c8c-e09e-4835-8275-ba6382f77168', 'R23');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('6d9c7bb9-3ed4-4468-bb48-9c69ed45a4d4', 5, 4, '4f7d2c8c-e09e-4835-8275-ba6382f77168', 'R34');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('bcc7c2b3-0cb0-4b7f-ad32-f9a328a8ffda', 6, 4, '4f7d2c8c-e09e-4835-8275-ba6382f77168', 'R34');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('b8fb0442-c11f-4061-bdab-85c8c3ab7699', 5, 1, 'bfc4f990-48da-4c38-b8ad-3c3e2b589bae', 'R23');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('eea66726-748a-4185-b607-30759d0135e6', 2, 5, 'bfc4f990-48da-4c38-b8ad-3c3e2b589bae', 'R23');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('1e66a0f3-7da5-4500-ab0e-0a966d60dd2a', 7, 1, 'b6879348-5039-4a1d-8d2b-c7ad8d027502', 'N10');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('c264bbfb-1b4f-432d-af59-5918b24d5a42', 8, 1, 'b6879348-5039-4a1d-8d2b-c7ad8d027502', 'N10');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('fa653b05-c2a0-4feb-a9c0-ecdca4fe2f32', 9, 1, 'b6879348-5039-4a1d-8d2b-c7ad8d027502', 'N10');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('89f01e6e-1df2-4ada-aa81-9d109dc644a7', 6, 1, 'bfc4f990-48da-4c38-b8ad-3c3e2b589bae', 'R23');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('f68112a0-bae1-42d6-8ca1-8d326448225e', 3, 2, '6048e1a1-18f4-4129-bd2a-da45e118f6c2', 'R12');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('b8d86f7f-798c-4b70-97bd-9a7e980d63ba', 4, 2, '6048e1a1-18f4-4129-bd2a-da45e118f6c2', 'R12');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('c9c19e5b-cb43-4307-8ebd-fa991a994d4d', 6, 2, '5509a86b-69bc-4447-93ae-a1cdecf47030', 'R14');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('466628e5-13d7-4b7f-be93-c0e69519a16c', 7, 2, '0e58f5bf-abd6-428d-a760-489328125254', 'Turnhalle');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('4e49cec2-0ba5-418f-9c92-9c4fdd7f29aa', 8, 2, '0e58f5bf-abd6-428d-a760-489328125254', 'Turnhalle');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('ca274e27-b232-4b28-b34b-71322467e9ee', 1, 3, 'bae72130-4508-4558-a138-b099810cfb7d', 'N03');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('978c748d-a3c2-4155-b852-22536a15d404', 2, 3, '1fa9dfe9-0716-464f-9b2e-89899c03b11f', 'R18');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('9325c8bf-5a0b-4420-be69-a08522bf9ac6', 1, 4, 'bae72130-4508-4558-a138-b099810cfb7d', 'N01');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('b4489921-e09d-43d7-a56b-8b5ed98f6f56', 2, 4, 'bae72130-4508-4558-a138-b099810cfb7d', 'N01');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('817407ab-5e95-4b39-927d-e975742e739f', 3, 4, '1fa9dfe9-0716-464f-9b2e-89899c03b11f', 'R18');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('61240b41-b81b-4826-b7bb-0f88a327e4f7', 4, 4, '1fa9dfe9-0716-464f-9b2e-89899c03b11f', 'R18');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('d898dd38-38dd-49b0-8444-975f0957b801', 1, 5, '6048e1a1-18f4-4129-bd2a-da45e118f6c2', 'R13');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('65fe3eea-68c4-455c-8404-df6725a7759d', 3, 5, '5509a86b-69bc-4447-93ae-a1cdecf47030', 'R24');
INSERT INTO public.course_hours (id, hour, day, course_id, room) VALUES ('567fd561-2d82-4ce8-8232-1eaf4d22cf87', 4, 5, '5509a86b-69bc-4447-93ae-a1cdecf47030', 'R24');


ALTER TABLE public.course_hours ENABLE TRIGGER ALL;


ALTER TABLE public.courses_relations DISABLE TRIGGER ALL;

INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('58656b96-7b36-482d-8865-743640630bf3', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', '7c4b0130-6a03-4c66-a129-354252a7901b');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('f1b4d3a3-663d-4ff4-b9ed-7b450e533e99', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', 'd89458a0-650f-499a-926b-733300e2cbe5');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('20c13e39-fd14-4413-8ee5-a722df1f62c2', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', '3b1f5913-f728-43d7-86ca-b7d1826df7ed');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('bc57c38e-da60-44aa-927a-591d5e537539', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', '273e8d75-ab85-43d8-9e77-ebb2827069b1');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('3db3540b-b61a-4498-8e89-1e9e1be950fb', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', '273e8d75-ab85-43d8-9e77-ebb2827069b1');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('56d30abd-cfdd-4080-8c27-f830d1952ea9', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', 'fbcf9c63-fdad-4975-a778-31663d8cf21b');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('70a4299a-ddd6-4222-87e2-a72ba179091b', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', 'fbcf9c63-fdad-4975-a778-31663d8cf21b');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('b1793bf4-eff1-4b4f-ab30-c6f29dd03c35', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', 'fbcf9c63-fdad-4975-a778-31663d8cf21b');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('9ec18564-4fd4-4e36-ac72-e6d3c0f091ea', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', '4f7d2c8c-e09e-4835-8275-ba6382f77168');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('a0973193-db35-483d-8a99-f95c494dee68', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', '4f7d2c8c-e09e-4835-8275-ba6382f77168');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('26f8d3fe-c835-43aa-bcf6-77dc43ed6216', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', 'bfc4f990-48da-4c38-b8ad-3c3e2b589bae');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('377b0d2a-081c-4feb-b774-df4e23565c4a', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', 'bfc4f990-48da-4c38-b8ad-3c3e2b589bae');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('e0900a79-ec67-4faa-99c8-89168003c531', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', 'b6879348-5039-4a1d-8d2b-c7ad8d027502');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('45aae435-8a63-45a9-a875-f606ed7070ec', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', 'b6879348-5039-4a1d-8d2b-c7ad8d027502');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('7ddc35f1-b86f-4d7a-8731-1e587ca81331', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', '6048e1a1-18f4-4129-bd2a-da45e118f6c2');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('1acbca69-2c00-4434-83c6-9454b45e6a37', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', '5509a86b-69bc-4447-93ae-a1cdecf47030');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('e67fd3e3-99bb-4c57-8381-04992d887eae', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', '5509a86b-69bc-4447-93ae-a1cdecf47030');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('b2c21221-d4a1-457c-a22b-6a55df6472b3', 'fb91cdb2-ac39-4114-a935-a84552ab1c5d', '0e58f5bf-abd6-428d-a760-489328125254');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('256d1829-b245-4e96-966e-ee5e8cfeaa3b', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', '0e58f5bf-abd6-428d-a760-489328125254');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('c4c26c59-8e51-408f-bbcb-cb2597510488', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', 'bae72130-4508-4558-a138-b099810cfb7d');
INSERT INTO public.courses_relations (id, user_id, course_id) VALUES ('9c98e0b5-6dae-4348-922b-049f5642d34f', '117c0de6-dfbf-4ee4-a218-feb5200b2e8d', '1fa9dfe9-0716-464f-9b2e-89899c03b11f');


ALTER TABLE public.courses_relations ENABLE TRIGGER ALL;


