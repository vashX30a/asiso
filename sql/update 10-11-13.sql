--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: datespace; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN datespace AS date;


ALTER DOMAIN public.datespace OWNER TO postgres;

--
-- Name: idnum; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN idnum AS character varying(9);


ALTER DOMAIN public.idnum OWNER TO postgres;

--
-- Name: initials; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN initials AS character varying(10);


ALTER DOMAIN public.initials OWNER TO postgres;

--
-- Name: namespace; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN namespace AS character varying(50);


ALTER DOMAIN public.namespace OWNER TO postgres;

--
-- Name: passwordspace; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN passwordspace AS character varying(20);


ALTER DOMAIN public.passwordspace OWNER TO postgres;

--
-- Name: timespace; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN timespace AS time without time zone;


ALTER DOMAIN public.timespace OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attends; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attends (
    stud_id idnum NOT NULL,
    event_id integer NOT NULL,
    signed_in timespace DEFAULT '00:00:00'::time without time zone,
    signed_out timespace DEFAULT '00:00:00'::time without time zone
);


ALTER TABLE public.attends OWNER TO postgres;

--
-- Name: belongs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE belongs (
    stud_id idnum NOT NULL,
    college initials NOT NULL,
    course initials NOT NULL
);


ALTER TABLE public.belongs OWNER TO postgres;

--
-- Name: college; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE college (
    college_initial initials NOT NULL,
    name namespace NOT NULL,
    governor_id idnum
);


ALTER TABLE public.college OWNER TO postgres;

--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE course (
    course_initial initials NOT NULL,
    name namespace NOT NULL,
    college_in initials
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event (
    eventid integer NOT NULL,
    name namespace NOT NULL,
    date datespace NOT NULL,
    location character varying(20),
    in_time timespace NOT NULL,
    out_time timespace NOT NULL,
    college_owner initials
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: event_eventid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE event_eventid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_eventid_seq OWNER TO postgres;

--
-- Name: event_eventid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE event_eventid_seq OWNED BY event.eventid;


--
-- Name: participant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE participant (
    eventid integer NOT NULL,
    participant_course initials NOT NULL
);


ALTER TABLE public.participant OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE student (
    idnumber idnum NOT NULL,
    fname namespace NOT NULL,
    minit character(1) NOT NULL,
    lname namespace NOT NULL,
    year integer NOT NULL,
    password passwordspace NOT NULL,
    username namespace NOT NULL,
    isadmin boolean DEFAULT false,
    isenrolled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: eventid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event ALTER COLUMN eventid SET DEFAULT nextval('event_eventid_seq'::regclass);


--
-- Data for Name: attends; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO attends VALUES ('2010-1730', 1, '00:00:00', '00:00:00');
INSERT INTO attends VALUES ('2010-6855', 2, '00:00:00', '00:00:00');


--
-- Data for Name: belongs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO belongs VALUES ('2010-1730', 'SCS', 'BSCS');
INSERT INTO belongs VALUES ('2010-6894', 'SCS', 'BSCS');
INSERT INTO belongs VALUES ('2006-1555', 'SCS', 'BSCS');
INSERT INTO belongs VALUES ('2011-0061', 'SCS', 'BSCS');
INSERT INTO belongs VALUES ('2009-8068', 'SCS', 'BSIT');
INSERT INTO belongs VALUES ('2009-1431', 'SCS', 'BSCS');
INSERT INTO belongs VALUES ('2011-5363', 'SCS', 'BSIT');
INSERT INTO belongs VALUES ('2011-3443', 'CASS', 'AB-PS');
INSERT INTO belongs VALUES ('2007-0030', 'CASS', 'AB-E');
INSERT INTO belongs VALUES ('2013-0038', 'SCS', 'BSCS');
INSERT INTO belongs VALUES ('2010-1431', 'CBAA', 'BSBA-E');
INSERT INTO belongs VALUES ('2010-1500', 'CBAA', 'BSBA-E');
INSERT INTO belongs VALUES ('2010-1821', 'CBAA', 'BSBA-E');
INSERT INTO belongs VALUES ('2010-1921', 'CBAA', 'BSBA-E');
INSERT INTO belongs VALUES ('2007-4485', 'COE', 'BSEE');
INSERT INTO belongs VALUES ('2008-2334', 'COE', 'BSECE');
INSERT INTO belongs VALUES ('2010-6855', 'COE', 'BSECE');
INSERT INTO belongs VALUES ('2009-4941', 'CED', 'BSED-TL');
INSERT INTO belongs VALUES ('2010-4555', 'SET', 'MET');
INSERT INTO belongs VALUES ('2010-2353', 'SET', 'MET');
INSERT INTO belongs VALUES ('2007-0010', 'CASS', 'AB-E');
INSERT INTO belongs VALUES ('2008-0620', 'COE', 'BSECE');
INSERT INTO belongs VALUES ('2009-3644', 'CED', 'BEED-SH');
INSERT INTO belongs VALUES ('2010-3644', 'CON', 'BSN');
INSERT INTO belongs VALUES ('2009-3644', 'SCS', 'BSCS');


--
-- Data for Name: college; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO college VALUES ('CSM', 'College of Science and Mathematics', '2007-4485');
INSERT INTO college VALUES ('CBAA', 'Collge of Business Administration and Accountancy', '2010-1821');
INSERT INTO college VALUES ('SET', 'School of Engineering Technology', '2010-2353');
INSERT INTO college VALUES ('CASS', 'College of Arts and Social Sciences', '2007-0010');
INSERT INTO college VALUES ('SCS', 'School of Computer Studies', '2009-3644');
INSERT INTO college VALUES ('COE', 'College of Engineering', '2008-0620');
INSERT INTO college VALUES ('CED', 'College of Education', '2009-4663');
INSERT INTO college VALUES ('CON', 'College of Nursing', '2010-3644');


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO course VALUES ('BSA', 'Accountancy', 'CBAA');
INSERT INTO course VALUES ('BSBA-E', 'Economics', 'CBAA');
INSERT INTO course VALUES ('BSBA-M', 'Entrepreneurial Marketing', 'CBAA');
INSERT INTO course VALUES ('BSCS', 'Computer Science', 'SCS');
INSERT INTO course VALUES ('BSIT', 'Information Technology', 'SCS');
INSERT INTO course VALUES ('BSIS', 'Information System', 'SCS');
INSERT INTO course VALUES ('BSN', 'Nursing', 'CON');
INSERT INTO course VALUES ('AB-E', 'English', 'CASS');
INSERT INTO course VALUES ('AB-F', 'Filipino', 'CASS');
INSERT INTO course VALUES ('AB-H', 'History', 'CASS');
INSERT INTO course VALUES ('AB-PS', 'Political Science', 'CASS');
INSERT INTO course VALUES ('AB-S', 'Sociology', 'CASS');
INSERT INTO course VALUES ('AB-P', 'Psychology', 'CASS');
INSERT INTO course VALUES ('GEN-ED', 'General Education', 'CASS');
INSERT INTO course VALUES ('BSMATH', 'Mathematics', 'CSM');
INSERT INTO course VALUES ('BSSTAT', 'Statistics', 'CSM');
INSERT INTO course VALUES ('BSBIO-GEN', 'General Biology', 'CSM');
INSERT INTO course VALUES ('BSBIO-BOT', 'Botany', 'CSM');
INSERT INTO course VALUES ('BSBIO-MAR', 'Marine Biology', 'CSM');
INSERT INTO course VALUES ('BSBIO-ZOO', 'Zoology', 'CSM');
INSERT INTO course VALUES ('BSCHEM', 'Chemestry', 'CSM');
INSERT INTO course VALUES ('BSPHYSICS', 'Physics', 'CSM');
INSERT INTO course VALUES ('BSME', 'Mechanical Engineering', 'COE');
INSERT INTO course VALUES ('BSCerE', 'Ceramics Engineering', 'COE');
INSERT INTO course VALUES ('BSCHE', 'Chemical Engineering', 'COE');
INSERT INTO course VALUES ('BSMETE', 'Metallurgical Engineering', 'COE');
INSERT INTO course VALUES ('BSCE', 'Civil Engineering', 'COE');
INSERT INTO course VALUES ('BSEE', 'Electrical Engineering', 'COE');
INSERT INTO course VALUES ('BSECE', 'Electronics and Communications Engineering', 'COE');
INSERT INTO course VALUES ('BSEC', 'Computer Engineering', 'COE');
INSERT INTO course VALUES ('BSED-BCPM', 'Secondary Educ(Bio, Chem, Phys, Math, GenSci', 'CED');
INSERT INTO course VALUES ('BEED-SH', 'Elementary Educ(Science and Health)', 'CED');
INSERT INTO course VALUES ('BEED-E', 'Elementary Educ(English)', 'CED');
INSERT INTO course VALUES ('BSMAPEH', 'Secondary Educ(MAPEH)', 'CED');
INSERT INTO course VALUES ('BETTE', 'Drafting', 'CED');
INSERT INTO course VALUES ('BEED', 'Elementary Educ(Science and Health)', 'CED');
INSERT INTO course VALUES ('BSED-TL', 'Secondary Educ(Technology and Livelihood)', 'CED');
INSERT INTO course VALUES ('BSHRM', 'Hotel and Restaurant Management', 'CED');
INSERT INTO course VALUES ('ECET', 'Electronics and Computer Technology', 'SCS');
INSERT INTO course VALUES ('DEST', 'Diploma in Electronics Technology', 'SCS');
INSERT INTO course VALUES ('MET', 'Mechanical Engineering Technology', 'SET');
INSERT INTO course VALUES ('AUET', 'Automotive Engineering Technology', 'SET');
INSERT INTO course VALUES ('CET', 'Civil Engineering Technology', 'SET');
INSERT INTO course VALUES ('MSET', 'Metallurgical Engineering Technology', 'SET');
INSERT INTO course VALUES ('CHET', 'Chemical Engineering Technology', 'COE');
INSERT INTO course VALUES ('ELET', 'Electrical Engineering Technology', 'SET');
INSERT INTO course VALUES ('IACET', 'Indl, Auto, and Control Engineering Technology', 'SET');
INSERT INTO course VALUES ('HVACR', 'Heat, Vent, Aircon, Ref Engineering Technology', 'SET');


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO event VALUES (1, 'Palakasan Day 1(AM)', '2013-11-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'SCS');
INSERT INTO event VALUES (2, 'Palakasan Day 1(AM)', '2013-11-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'COE');
INSERT INTO event VALUES (3, 'Palakasan Day 1(AM)', '2013-11-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'SET');
INSERT INTO event VALUES (4, 'Palakasan Day 1(AM)', '2013-11-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'CBAA');
INSERT INTO event VALUES (5, 'Palakasan Day 1(AM)', '2013-11-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'CASS');
INSERT INTO event VALUES (6, 'Palakasan Day 1(AM)', '2013-11-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'CSM');
INSERT INTO event VALUES (7, 'Palakasan Day 1(AM)', '2013-11-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'CED');
INSERT INTO event VALUES (8, 'Palakasan Day 1(AM)', '2013-11-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'CON');
INSERT INTO event VALUES (9, 'Palakasan Day 1(PM)', '2013-11-06', 'GYMNASIUM', '13:00:00', '17:00:00', 'SCS');
INSERT INTO event VALUES (10, 'Palakasan Day 1(PM)', '2013-11-06', 'GYMNASIUM', '13:00:00', '17:00:00', 'COE');
INSERT INTO event VALUES (11, 'Palakasan Day 1(PM)', '2013-11-06', 'GYMNASIUM', '13:00:00', '17:00:00', 'SET');
INSERT INTO event VALUES (12, 'Palakasan Day 1(PM)', '2013-11-06', 'GYMNASIUM', '13:00:00', '17:00:00', 'CBAA');
INSERT INTO event VALUES (13, 'Palakasan Day 1(PM)', '2013-11-06', 'GYMNASIUM', '13:00:00', '17:00:00', 'CASS');
INSERT INTO event VALUES (14, 'Palakasan Day 1(PM)', '2013-11-06', 'GYMNASIUM', '13:00:00', '17:00:00', 'CSM');
INSERT INTO event VALUES (15, 'Palakasan Day 1(PM)', '2013-11-06', 'GYMNASIUM', '13:00:00', '17:00:00', 'CED');
INSERT INTO event VALUES (16, 'Palakasan Day 1(PM)', '2013-11-06', 'GYMNASIUM', '13:00:00', '17:00:00', 'CON');
INSERT INTO event VALUES (17, 'Charter Week Day 1 (AM)', '2013-08-06', 'GYMNASIUM', '08:00:00', '11:00:00', 'SCS');


--
-- Name: event_eventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('event_eventid_seq', 17, true);


--
-- Data for Name: participant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO student VALUES ('2010-1730', 'Louie Kert', 'S', 'Basay', 3, 'bscs123', 'louiekert.basay', false, true);
INSERT INTO student VALUES ('2010-6894', 'Sherwin', 'A', 'Cabili', 3, '123', 'sherwin.cabili', true, true);
INSERT INTO student VALUES ('2006-1555', 'Abdul Jalil', 'C', 'Laguindab', 3, '456', 'abduljalil.laguindab', true, true);
INSERT INTO student VALUES ('2011-0061', 'Karen', 'L', 'Moso', 3, 'kmoso', 'karen.moso', true, true);
INSERT INTO student VALUES ('2009-8068', 'Mel Kristofferson', 'E', 'Redoble', 3, 'mkeredoble', 'melkristofferson.redoble', false, true);
INSERT INTO student VALUES ('2009-1431', 'Michael June', 'C', 'Arañas', 3, 'mjcarañas', 'michaeljune.arañas', true, true);
INSERT INTO student VALUES ('2011-5363', 'May Ann', 'L', 'Superada', 3, 'malsuperada', 'mayann.superada', false, true);
INSERT INTO student VALUES ('2011-3443', 'Alvina Mary', 'G', 'Go', 2, 'amgo', 'alvinamary.go', true, true);
INSERT INTO student VALUES ('2007-0030', 'Lewey Jee', 'L', 'Jimoya', 4, 'ljjimoya', 'leweyjee.jimoya', true, true);
INSERT INTO student VALUES ('2013-0038', 'Roselle', 'M', 'Ebarle', 1, 'rebarle', 'roselle.ebarle', true, true);
INSERT INTO student VALUES ('2010-1431', 'Hanna Hardy', 'M', 'Balolong', 4, 'hhbalolong', 'hannahardy.balolong', false, true);
INSERT INTO student VALUES ('2010-1500', 'Ladylee', 'M', 'Liwagon', 3, 'lliwagon', 'ladylee.liwagon', false, true);
INSERT INTO student VALUES ('2010-1821', 'Kasteen', 'L', 'Lim', 4, 'klim', 'kasteen.lim', true, true);
INSERT INTO student VALUES ('2010-1921', 'Samantha Isabel', 'A', 'Geraldino', 4, 'sigeraldino', 'samanthaisabel.geraldino', true, true);
INSERT INTO student VALUES ('2007-4485', 'John Anthony', 'C', 'Capili', 5, 'jacapili', 'johnanthony.capili', true, true);
INSERT INTO student VALUES ('2008-2334', 'Carmille Angeli', 'M', 'Calo', 5, 'cacalo', 'carmilleangeli.calo', true, true);
INSERT INTO student VALUES ('2010-2353', 'Dennis Rey', 'M', 'Atis', 3, 'dratis', 'dennisrey.atis', true, true);
INSERT INTO student VALUES ('2010-4555', 'Maylene', 'G', 'Morales', 3, 'mmorales', 'maylene.morales', false, true);
INSERT INTO student VALUES ('2010-6855', 'Michelle Ann', 'C', 'Bation', 3, 'bsece123', 'michelleann.bation', true, true);
INSERT INTO student VALUES ('2009-4941', 'Bonavie', 'M', 'Castillon', 4, 'bmcastillon', 'bonavie.castillon', true, true);
INSERT INTO student VALUES ('2007-0010', 'Lewey', 'J', 'Jimoya', 4, 'cassgovernor', 'lewey.jimoya', true, true);
INSERT INTO student VALUES ('2009-3644', 'Arven Jade', 'G', 'Aguilar', 4, 'scsgovernor', 'arvenjade.aguilar', true, true);
INSERT INTO student VALUES ('2008-0620', 'Ben', 'A', 'Barrientos', 5, 'coegovernor', 'ben.barrientos', true, true);
INSERT INTO student VALUES ('2009-4663', 'Jikka', 'D', 'Dapasucat', 4, 'cedgovernor', 'jikka.dapasucat', true, true);
INSERT INTO student VALUES ('2010-3644', 'Delvin', 'A', 'Marquez', 4, 'congovernor', 'delvin.marquez', true, true);


--
-- Name: attends_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attends
    ADD CONSTRAINT attends_pkey PRIMARY KEY (stud_id, event_id);


--
-- Name: belongs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY belongs
    ADD CONSTRAINT belongs_pkey PRIMARY KEY (stud_id, college, course);


--
-- Name: college_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY college
    ADD CONSTRAINT college_pkey PRIMARY KEY (college_initial);


--
-- Name: course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_initial);


--
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (eventid);


--
-- Name: participant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_pkey PRIMARY KEY (eventid, participant_course);


--
-- Name: student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_pkey PRIMARY KEY (idnumber);


--
-- Name: student_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY student
    ADD CONSTRAINT student_username_key UNIQUE (username);


--
-- Name: attends_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attends
    ADD CONSTRAINT attends_event_id_fkey FOREIGN KEY (event_id) REFERENCES event(eventid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: attends_stud_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attends
    ADD CONSTRAINT attends_stud_id_fkey FOREIGN KEY (stud_id) REFERENCES student(idnumber) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: belongs_college_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY belongs
    ADD CONSTRAINT belongs_college_fkey FOREIGN KEY (college) REFERENCES college(college_initial) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: belongs_course_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY belongs
    ADD CONSTRAINT belongs_course_fkey FOREIGN KEY (course) REFERENCES course(course_initial) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: belongs_stud_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY belongs
    ADD CONSTRAINT belongs_stud_id_fkey FOREIGN KEY (stud_id) REFERENCES student(idnumber) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: college_governor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY college
    ADD CONSTRAINT college_governor_id_fkey FOREIGN KEY (governor_id) REFERENCES student(idnumber) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: course_college_in_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_college_in_fkey FOREIGN KEY (college_in) REFERENCES college(college_initial) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: event_college_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_college_owner_fkey FOREIGN KEY (college_owner) REFERENCES college(college_initial) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: participant_eventid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_eventid_fkey FOREIGN KEY (eventid) REFERENCES event(eventid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: participant_participant_course_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participant
    ADD CONSTRAINT participant_participant_course_fkey FOREIGN KEY (participant_course) REFERENCES course(course_initial) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

