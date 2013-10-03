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

COPY student (idnumber, fname, minit, lname, year, password, username, isadmin, isenrolled) FROM stdin;
2010-1730	Louie Kert	S	Basay	3	bscs123	louiekert.basay	f	t
2010-6894	Sherwin	A	Cabili	3	123	sherwin.cabili	t	t
2006-1555	Abdul Jalil	C	Laguindab	3	456	abduljalil.laguindab	t	t
2011-0061	Karen	L	Moso	3	kmoso	karen.moso	t	t
2009-8068	Mel Kristofferson	E	Redoble	3	mkeredoble	melkristofferson.redoble	f	t
2009-1431	Michael June	C	Arañas	3	mjcarañas	michaeljune.arañas	t	t
2011-5363	May Ann	L	Superada	3	malsuperada	mayann.superada	f	t
2011-3443	Alvina Mary	G	Go	2	amgo	alvinamary.go	t	t
2007-0030	Lewey Jee	L	Jimoya	4	ljjimoya	leweyjee.jimoya	t	t
2013-0038	Roselle	M	Ebarle	1	rebarle	roselle.ebarle	t	t
2010-1431	Hanna Hardy	M	Balolong	4	hhbalolong	hannahardy.balolong	f	t
2010-1500	Ladylee	M	Liwagon	3	lliwagon	ladylee.liwagon	f	t
2010-1821	Kasteen	L	Lim	4	klim	kasteen.lim	t	t
2010-1921	Samantha Isabel	A	Geraldino	4	sigeraldino	samanthaisabel.geraldino	t	t
2007-4485	John Anthony	C	Capili	5	jacapili	johnanthony.capili	t	t
2008-2334	Carmille Angeli	M	Calo	5	cacalo	carmilleangeli.calo	t	t
2010-2353	Dennis Rey	M	Atis	3	dratis	dennisrey.atis	t	t
2010-4555	Maylene	G	Morales	3	mmorales	maylene.morales	f	t
2010-6855	Michelle Ann	C	Bation	3	bsece123	michelleann.bation	t	t
2009-4941	Bonavie	M	Castillon	4	bmcastillon	bonavie.castillon	t	t
\.


--
-- Data for Name: college; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY college (college_initial, name, governor_id) FROM stdin;
SCS	School of Computer Studies	2006-1555
COE	College of Engineering	2010-6855
CSM	College of Science and Mathematics	2007-4485
CBAA	Collge of Business Administration and Accountancy	2010-1821
SET	School of Engineering Technology	2010-2353
CASS	College of Arts and Social Sciences	2007-0030
CED	College of Education	2009-4941
CON	College of Nursing	2011-3443
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY event (eventid, name, date, location, in_time, out_time, college_owner) FROM stdin;
1	Palakasan Day 1(AM)	2013-11-06	\N	08:00:00	11:00:00	SCS
2	Palakasan Day 1(AM)	2013-11-06	\N	08:00:00	11:00:00	COE
3	Palakasan Day 1(AM)	2013-11-06	\N	08:00:00	11:00:00	SET
4	Palakasan Day 1(AM)	2013-11-06	\N	08:00:00	11:00:00	CBAA
5	Palakasan Day 1(AM)	2013-11-06	\N	08:00:00	11:00:00	CASS
6	Palakasan Day 1(AM)	2013-11-06	\N	08:00:00	11:00:00	CSM
7	Palakasan Day 1(AM)	2013-11-06	\N	08:00:00	11:00:00	CED
8	Palakasan Day 1(AM)	2013-11-06	\N	08:00:00	11:00:00	CON
9	Palakasan Day 1(PM)	2013-11-06	\N	13:00:00	17:00:00	SCS
10	Palakasan Day 1(PM)	2013-11-06	\N	13:00:00	17:00:00	COE
11	Palakasan Day 1(PM)	2013-11-06	\N	13:00:00	17:00:00	SET
12	Palakasan Day 1(PM)	2013-11-06	\N	13:00:00	17:00:00	CBAA
13	Palakasan Day 1(PM)	2013-11-06	\N	13:00:00	17:00:00	CASS
14	Palakasan Day 1(PM)	2013-11-06	\N	13:00:00	17:00:00	CSM
15	Palakasan Day 1(PM)	2013-11-06	\N	13:00:00	17:00:00	CED
16	Palakasan Day 1(PM)	2013-11-06	\N	13:00:00	17:00:00	CON
17	Charter Week Day 1 (AM)	2013-08-06	\N	08:00:00	11:00:00	SCS
\.


--
-- Data for Name: attends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attends (stud_id, event_id, signed_in, signed_out) FROM stdin;
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY course (course_initial, name, college_in) FROM stdin;
BSA	Accountancy	CBAA
BSBA-E	Economics	CBAA
BSBA-M	Entrepreneurial Marketing	CBAA
BSCS	Computer Science	SCS
BSIT	Information Technology	SCS
BSIS	Information System	SCS
BSN	Nursing	CON
AB-E	English	CASS
AB-F	Filipino	CASS
AB-H	History	CASS
AB-PS	Political Science	CASS
AB-S	Sociology	CASS
AB-P	Psychology	CASS
GEN-ED	General Education	CASS
BSMATH	Mathematics	CSM
BSSTAT	Statistics	CSM
BSBIO-GEN	General Biology	CSM
BSBIO-BOT	Botany	CSM
BSBIO-MAR	Marine Biology	CSM
BSBIO-ZOO	Zoology	CSM
BSCHEM	Chemestry	CSM
BSPHYSICS	Physics	CSM
BSME	Mechanical Engineering	COE
BSCerE	Ceramics Engineering	COE
BSCHE	Chemical Engineering	COE
BSMETE	Metallurgical Engineering	COE
BSCE	Civil Engineering	COE
BSEE	Electrical Engineering	COE
BSECE	Electronics and Communications Engineering	COE
BSEC	Computer Engineering	COE
BSED-BCPM	Secondary Educ(Bio, Chem, Phys, Math, GenSci	CED
BEED-SH	Elementary Educ(Science and Health)	CED
BEED-E	Elementary Educ(English)	CED
BSMAPEH	Secondary Educ(MAPEH)	CED
BETTE	Drafting	CED
BEED	Elementary Educ(Science and Health)	CED
BSED-TL	Secondary Educ(Technology and Livelihood)	CED
BSHRM	Hotel and Restaurant Management	CED
ECET	Electronics and Computer Technology	SCS
DEST	Diploma in Electronics Technology	SCS
\.


--
-- Data for Name: belongs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY belongs (stud_id, college, course) FROM stdin;
2010-1730	SCS	BSCS
\.


--
-- Name: event_eventid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('event_eventid_seq', 17, true);


--
-- Data for Name: participant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY participant (eventid, participant_course) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

