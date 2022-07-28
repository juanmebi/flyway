ALTER TABLE public.proteome_audit
    ADD COLUMN proteome_name1 character varying(200),
    ADD COLUMN isolate character varying(225) ,
    ADD COLUMN assembly_id character varying(100),
    ADD COLUMN process_redundancy bigint DEFAULT 1 NOT null,
    ADD COLUMN source_taxid bigint,
    ADD COLUMN annotation_source_url character varying(255),
    ADD COLUMN assembly_source_url character varying(255),
    ADD COLUMN tax_id_lock boolean default false,
    ADD COLUMN genus_taxid bigint,
    ADD COLUMN is_metagenome boolean,
    ADD COLUMN process_busco boolean DEFAULT true NOT null,
    ADD COLUMN for_proteomics boolean DEFAULT false NOT null,
    ADD COLUMN last_dna_cached timestamp without time zone,
    ADD COLUMN is_excluded boolean DEFAULT false NOT null,
    ADD COLUMN exclusion_immunity boolean DEFAULT false NOT null,
    ADD COLUMN assembly_level character varying(20);



