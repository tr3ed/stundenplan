-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE ROLES AS ENUM ('student', 'teacher', 'admin');
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL,
    user_role ROLES DEFAULT 'student' NOT NULL,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL
);
CREATE TABLE courses (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    teacher_id UUID NOT NULL,
    "hour" INT NOT NULL,
    weekday INT NOT NULL
);
CREATE TABLE courses_relations (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    user_id UUID NOT NULL,
    course_id UUID NOT NULL
);
ALTER TABLE courses ADD CONSTRAINT courses_ref_teacher_id FOREIGN KEY (teacher_id) REFERENCES users (id) ON DELETE NO ACTION;
ALTER TABLE courses_relations ADD CONSTRAINT courses_relations_ref_course_id FOREIGN KEY (course_id) REFERENCES courses (id) ON DELETE NO ACTION;
ALTER TABLE courses_relations ADD CONSTRAINT courses_relations_ref_user_id FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION;
