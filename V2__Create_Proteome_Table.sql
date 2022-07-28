CREATE TABLE public.proteome (
    oscode varchar(8) NULL,
    proteome_id int8 NOT NULL,
    proteome_name1 varchar(200) NULL,
    strain varchar(150) NULL,
    superregnum_name varchar(20) NOT NULL,
    proteome_taxid int8 NOT NULL,
    order_in int8 NULL,
    user_stamp varchar(60) NULL,
    "time_stamp" timestamp NULL,
    is_complete bool NOT NULL DEFAULT true,
    kw_added_uniprot_release_id varchar(8) NULL,
    is_reference bool NOT NULL DEFAULT false,
    proteome_map_type int2 NOT NULL DEFAULT 0,
    protein_count int8 NOT NULL DEFAULT 0,
    lineage varchar(4000) NULL,
    ignore_cpd int8 NULL DEFAULT 0,
    file_name varchar(60) NULL,
    gc_set_acc varchar(20) NULL,
    upid varchar(20) NULL,
    publish bool NOT NULL DEFAULT false,
    orf_regexp varchar(360) NULL,
    swissprot_name varchar(255) NULL,
    internal varchar(4000) NULL,
    isolate varchar(225) NULL,
    assembly_id varchar(100) NULL,
    process_redundancy int8 NOT NULL DEFAULT 1,
    is_representative bool NOT NULL DEFAULT false,
    is_redundant int4 NOT NULL DEFAULT '-1'::integer,
    redundancy_immunity bool NOT NULL DEFAULT false,
    curated_complete int8 NOT NULL DEFAULT 0,
    source_taxid int8 NULL,
    coverable_by_redundancy bool NOT NULL DEFAULT false,
    full_lineage varchar(4000) NULL,
    is_new bool NOT NULL DEFAULT true,
    annotation_source_url varchar(255) NULL,
    assembly_source_url varchar(255) NULL,
    tax_id_lock bool NULL DEFAULT false,
    genus_taxid int8 NULL,
    is_metagenome bool NULL,
    process_busco bool NOT NULL DEFAULT true,
    for_proteomics bool NOT NULL DEFAULT false,
    last_dna_cached timestamp NULL,
    is_excluded bool NOT NULL DEFAULT false,
    exclusion_immunity bool NOT NULL DEFAULT false,
    assembly_level varchar(20) NULL,
    CONSTRAINT proteome_pkey PRIMARY KEY (proteome_id),
    CONSTRAINT proteome_un UNIQUE (gc_set_acc),
    CONSTRAINT proteome_upid_key UNIQUE (upid)
);
CREATE INDEX proteome_map_type_index ON public.proteome USING btree (proteome_map_type);
CREATE INDEX proteome_oscode_idx ON public.proteome USING btree (oscode);
CREATE INDEX proteome_proteome_taxid_idx ON public.proteome USING btree (proteome_taxid);
CREATE INDEX proteome_sregnum_name_index ON public.proteome USING btree (superregnum_name);