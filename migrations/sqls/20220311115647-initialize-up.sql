/* Replace with your SQL commands */
-- Table: public.admin

-- DROP TABLE IF EXISTS public.admin;

CREATE TABLE IF NOT EXISTS public.admin
(
    user_id uuid NOT NULL DEFAULT uuid_generate_v4(),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT admin_pkey PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.admin
    OWNER to postgres;

-- Table: public.company

-- DROP TABLE IF EXISTS public.company;

CREATE TABLE IF NOT EXISTS public.company
(
    company_id uuid NOT NULL DEFAULT uuid_generate_v4(),
    admin_id uuid NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT company_pkey PRIMARY KEY (company_id),
    CONSTRAINT company_admin_id_fkey FOREIGN KEY (admin_id)
        REFERENCES public.admin (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.company
    OWNER to postgres;


-- Table: public.employee

-- DROP TABLE IF EXISTS public.employee;

CREATE TABLE IF NOT EXISTS public.employee
(
    employee_id uuid NOT NULL DEFAULT uuid_generate_v4(),
    company_id uuid NOT NULL,
    phone_no character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT employee_pkey PRIMARY KEY (employee_id),
    CONSTRAINT employee_email_key UNIQUE (email),
    CONSTRAINT employee_phone_no_key UNIQUE (phone_no),
    CONSTRAINT employee_company_id_fkey FOREIGN KEY (company_id)
        REFERENCES public.company (company_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.employee
    OWNER to postgres;

    

-- Table: public.attendance

-- DROP TABLE IF EXISTS public.attendance;

CREATE TABLE IF NOT EXISTS public.attendance
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    attendance_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    employee uuid NOT NULL,
    "timestamp" timestamp with time zone NOT NULL DEFAULT now(),
    CONSTRAINT attendance_pkey PRIMARY KEY (id),
    CONSTRAINT attendance_employee_fkey FOREIGN KEY (employee)
        REFERENCES public.employee (employee_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.attendance
    OWNER to postgres;