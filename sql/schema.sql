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
    signed_in boolean DEFAULT false,
    signed_out boolean DEFAULT false
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

