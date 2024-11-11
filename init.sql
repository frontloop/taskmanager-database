CREATE TABLE public.task
(
    id numeric,
    name character varying(200) COLLATE pg_catalog."default",
    done boolean,
    created timestamp(6) with time zone NOT NULL,
    priority character varying(30) COLLATE pg_catalog."default"
);

ALTER TABLE public.task OWNER TO postgres;

CREATE SEQUENCE public.task_id_generator
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_generator OWNER TO postgres;

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_generator'::regclass);

COPY public.task (id, name, done, created, priority) FROM stdin;
1	Task 1	false	2024-11-11 11:29:21.99998+00	NORMAL
2	Task 2	true	2024-11-11 11:30:21.99998+00	LOW
3	Task 3	false	2024-11-11 11:30:21.99998+00	LOW
4	Task 4	true	2024-11-11 11:30:21.99998+00	URGENT
5	Task 5	false	2024-11-11 11:30:21.99998+00	NORMAL
\.

SELECT pg_catalog.setval('public.task_id_generator', 5, true);


ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);
