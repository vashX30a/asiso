--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

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


--
-- Data for Name: college; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO college VALUES ('SCS', 'School of Computer Studies', '2006-1555');
INSERT INTO college VALUES ('COE', 'College of Engineering', '2010-6855');
INSERT INTO college VALUES ('CSM', 'College of Science and Mathematics', '2007-4485');
INSERT INTO college VALUES ('CBAA', 'Collge of Business Administration and Accountancy', '2010-1821');
INSERT INTO college VALUES ('SET', 'School of Engineering Technology', '2010-2353');
INSERT INTO college VALUES ('CASS', 'College of Arts and Social Sciences', '2007-0030');
INSERT INTO college VALUES ('CED', 'College of Education', '2009-4941');
INSERT INTO college VALUES ('CON', 'College of Nursing', '2011-3443');


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO event VALUES (1, 'Palakasan Day 1(AM)', '2013-11-06', NULL, '08:00:00', '11:00:00', 'SCS');
INSERT INTO event VALUES (2, 'Palakasan Day 1(AM)', '2013-11-06', NULL, '08:00:00', '11:00:00', 'COE');
INSERT INTO event VALUES (3, 'Palakasan Day 1(AM)', '2013-11-06', NULL, '08:00:00', '11:00:00', 'SET');
INSERT INTO event VALUES (4, 'Palakasan Day 1(AM)', '2013-11-06', NULL, '08:00:00', '11:00:00', 'CBAA');
INSERT INTO event VALUES (5, 'Palakasan Day 1(AM)', '2013-11-06', NULL, '08:00:00', '11:00:00', 'CASS');
INSERT INTO event VALUES (6, 'Palakasan Day 1(AM)', '2013-11-06', NULL, '08:00:00', '11:00:00', 'CSM');
INSERT INTO event VALUES (7, 'Palakasan Day 1(AM)', '2013-11-06', NULL, '08:00:00', '11:00:00', 'CED');
INSERT INTO event VALUES (8, 'Palakasan Day 1(AM)', '2013-11-06', NULL, '08:00:00', '11:00:00', 'CON');
INSERT INTO event VALUES (9, 'Palakasan Day 1(PM)', '2013-11-06', NULL, '13:00:00', '17:00:00', 'SCS');
INSERT INTO event VALUES (10, 'Palakasan Day 1(PM)', '2013-11-06', NULL, '13:00:00', '17:00:00', 'COE');
INSERT INTO event VALUES (11, 'Palakasan Day 1(PM)', '2013-11-06', NULL, '13:00:00', '17:00:00', 'SET');
INSERT INTO event VALUES (12, 'Palakasan Day 1(PM)', '2013-11-06', NULL, '13:00:00', '17:00:00', 'CBAA');
INSERT INTO event VALUES (13, 'Palakasan Day 1(PM)', '2013-11-06', NULL, '13:00:00', '17:00:00', 'CASS');
INSERT INTO event VALUES (14, 'Palakasan Day 1(PM)', '2013-11-06', NULL, '13:00:00', '17:00:00', 'CSM');
INSERT INTO event VALUES (15, 'Palakasan Day 1(PM)', '2013-11-06', NULL, '13:00:00', '17:00:00', 'CED');
INSERT INTO event VALUES (16, 'Palakasan Day 1(PM)', '2013-11-06', NULL, '13:00:00', '17:00:00', 'CON');
INSERT INTO event VALUES (17, 'Charter Week Day 1 (AM)', '2013-08-06', NULL, '08:00:00', '11:00:00', 'SCS');


--
-- Data for Name: attends; Type: TABLE DATA; Schema: public; Owner: postgres
--



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


--
-- Data for Name: belongs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO belongs VALUES ('2010-1730', 'SCS', 'BSCS');


--
-- Name: event_eventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('event_eventid_seq', 17, true);


--
-- Data for Name: participant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- PostgreSQL database dump complete
--

