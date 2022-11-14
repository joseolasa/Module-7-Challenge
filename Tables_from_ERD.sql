-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.card_holder
(
    id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pk_Card_Holder" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.credit_card
(
    card character varying(255) COLLATE pg_catalog."default" NOT NULL,
    cardholder_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pk_Credit_Card" PRIMARY KEY (card)
);

CREATE TABLE IF NOT EXISTS public.merchant
(
    id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_merchant_category integer NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.merchant_category
(
    id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pk_Merchant_Category" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.transaction
(
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    amount double precision NOT NULL,
    card character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_merchant integer NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.merchant
    ADD CONSTRAINT merchant_id_merchant_category_fkey FOREIGN KEY (id_merchant_category)
    REFERENCES public.merchant_category (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.transaction
    ADD CONSTRAINT transaction_card_fkey FOREIGN KEY (card)
    REFERENCES public.credit_card (card) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.transaction
    ADD CONSTRAINT transaction_id_merchant_fkey FOREIGN KEY (id_merchant)
    REFERENCES public.merchant (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;