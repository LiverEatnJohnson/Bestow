
CREATE SEQUENCE public.organization_id_seq;

CREATE TABLE public.organization (
                id INTEGER DEFAULT nextval('organization_id_seq'::regclass) NOT NULL DEFAULT nextval('public.organization_id_seq'),
                title VARCHAR(255),
                CONSTRAINT organization_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.organization_id_seq OWNED BY public.organization.id;

CREATE SEQUENCE public.donor_id_seq;

CREATE TABLE public.donor (
                id INTEGER DEFAULT nextval('donor_id_seq'::regclass) NOT NULL DEFAULT nextval('public.donor_id_seq'),
                address VARCHAR(255),
                city VARCHAR(255),
                email VARCHAR(255),
                first_name VARCHAR(255),
                last_name VARCHAR(255),
                phone VARCHAR(255),
                state VARCHAR(255),
                zip VARCHAR(255),
                CONSTRAINT donor_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.donor_id_seq OWNED BY public.donor.id;

CREATE SEQUENCE public.department_id_seq;

CREATE TABLE public.department (
                id INTEGER DEFAULT nextval('department_id_seq'::regclass) NOT NULL DEFAULT nextval('public.department_id_seq'),
                title VARCHAR(255),
                organization_id INTEGER NOT NULL,
                CONSTRAINT department_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.department_id_seq OWNED BY public.department.id;

CREATE SEQUENCE public.employee_id_seq;

CREATE TABLE public.employee (
                id INTEGER DEFAULT nextval('employee_id_seq'::regclass) NOT NULL DEFAULT nextval('public.employee_id_seq'),
                first_name VARCHAR(255),
                last_name VARCHAR(255),
                department_id INTEGER,
                CONSTRAINT employee_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;

CREATE SEQUENCE public.donation_id_seq;

CREATE TABLE public.donation (
                id INTEGER DEFAULT nextval('donation_id_seq'::regclass) NOT NULL DEFAULT nextval('public.donation_id_seq'),
                code VARCHAR(255),
                date DATE,
                total DOUBLE PRECISION,
                type VARCHAR(255),
                department_id INTEGER,
                donor_id INTEGER NOT NULL,
                employee_id INTEGER NOT NULL,
                CONSTRAINT donation_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.donation_id_seq OWNED BY public.donation.id;

CREATE SEQUENCE public.item_id_seq;

CREATE TABLE public.item (
                id INTEGER DEFAULT nextval('item_id_seq'::regclass) NOT NULL DEFAULT nextval('public.item_id_seq'),
                hours DOUBLE PRECISION,
                item VARCHAR(255),
                value DOUBLE PRECISION,
                donation_id INTEGER,
                CONSTRAINT item_pkey PRIMARY KEY (id)
);


ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;

ALTER TABLE public.department ADD CONSTRAINT fk_department_organization_id
FOREIGN KEY (organization_id)
REFERENCES public.organization (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.donation ADD CONSTRAINT fk_donation_donor_id
FOREIGN KEY (donor_id)
REFERENCES public.donor (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.donation ADD CONSTRAINT fk_donation_department_id
FOREIGN KEY (department_id)
REFERENCES public.department (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employee ADD CONSTRAINT fk_employee_department_id
FOREIGN KEY (department_id)
REFERENCES public.department (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.donation ADD CONSTRAINT fk_donation_employee_id
FOREIGN KEY (employee_id)
REFERENCES public.employee (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.item ADD CONSTRAINT fk_item_donation_id
FOREIGN KEY (donation_id)
REFERENCES public.donation (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
