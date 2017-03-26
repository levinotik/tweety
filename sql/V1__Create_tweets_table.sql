CREATE SEQUENCE tweets_id_seq INCREMENT BY 1 NO MINVALUE NO MAXVALUE START 1 CACHE 1;


create table tweets (
  id BIGINT PRIMARY KEY NOT NULL DEFAULT nextval('tweets_id_seq'::regclass),
  status text,
  username text
);
