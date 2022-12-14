CREATE TABLE public.proteome_audit (
    oscode varchar(8) NULL,
    proteome_id int8 NULL,
    strain varchar(150) NULL,
    superregnum_name varchar(20) NULL,
    proteome_taxid int8 NULL,
    order_in int8 NULL,
    user_stamp varchar(60) NULL,
    "time_stamp" timestamp NULL,
    is_complete bool NULL,
    kw_added_uniprot_release_id varchar(8) NULL,
    is_reference bool NULL,
    proteome_map_type int2 NULL,
    protein_count int8 NULL,
    lineage varchar(4000) NULL,
    "scope" int8 NULL,
    ignore_cpd int8 NULL,
    file_name varchar(60) NULL,
    audit_user varchar(60) NULL,
    audit_time timestamp NULL,
    audit_event varchar(6) NULL,
    audit_remark varchar(50) NULL,
    gc_set_acc varchar(20) NULL,
    upid varchar(20) NULL,
    internal varchar(4000) NULL,
    swissprot_name varchar(255) NULL,
    orf_regexp varchar(360) NULL,
    publish bool NULL,
    is_representative bool NULL,
    is_redundant int8 NULL,
    redundancy_immunity bool NULL,
    curated_complete int8 NULL,
    ensembl_taxid int8 NULL,
    coverable_by_redundancy bool NULL,
    full_lineage varchar(4000) NULL,
    is_new bool NULL
);