CREATE OR REPLACE FUNCTION public.trigger_fct_t_proteome_audit()
    RETURNS trigger
    LANGUAGE plpgsql
    SECURITY DEFINER
AS $function$
DECLARE
    l_audit_remark pg_stat_activity.application_name%type;
BEGIN

    select application_name into l_audit_remark
    from pg_stat_activity
    where pid = pg_backend_pid();

    IF TG_OP = 'INSERT' THEN

        NEW.user_stamp := l_audit_remark;
        NEW.time_stamp:= LOCALTIMESTAMP;
        INSERT INTO temp_track_new_proteomes
        (proteome_id)
        VALUES
            (NEW.proteome_id);

        INSERT INTO proteome_audit
        (
            oscode,
            proteome_id,
            strain,
            superregnum_name,
            proteome_taxid,
            order_in,
            user_stamp,
            time_stamp,
            is_complete,
            --     first_release_id,
            kw_added_uniprot_release_id,
            is_reference,
            proteome_map_type,
            protein_count,
            lineage,
            ignore_cpd,
            file_name,
            audit_user,
            audit_time,
            audit_event,
            audit_remark,
            internal,
            gc_set_acc,
            swissprot_name,
            publish,
            upid,
            orf_regexp,
            is_representative,
            is_redundant,
            redundancy_immunity,
            curated_complete,
            proteome_name1,
            isolate,
            assembly_id,
            process_redundancy,
            source_taxid,
            annotation_source_url,
            assembly_source_url,
            tax_id_lock,
            genus_taxid,
            is_metagenome,
            process_busco,
            for_proteomics,
            last_dna_cached,
            is_excluded,
            exclusion_immunity,
            assembly_level
        )
        VALUES
            (
                NEW.oscode,
                NEW.proteome_id,
                NEW.strain,
                NEW.superregnum_name,
                NEW.proteome_taxid,
                NEW.order_in,
                NEW.user_stamp,
                NEW.time_stamp,
                NEW.is_complete,
                --    NEW.first_release_id,
                NEW.kw_added_uniprot_release_id,
                NEW.is_reference,
                NEW.proteome_map_type,
                NEW.protein_count,
                NEW.lineage,
                NEW.ignore_cpd,
                NEW.file_name,
                NEW.user_stamp,
                NEW.time_stamp,
                'insert',
                l_audit_remark,
                NEW.internal,
                NEW.gc_set_acc,
                NEW.swissprot_name,
                NEW.publish,
                NEW.upid,
                NEW.orf_regexp,
                NEW.is_representative,
                NEW.is_redundant,
                NEW.redundancy_immunity,
                NEW.curated_complete,
                NEW.proteome_name1,
                NEW.isolate,
                NEW.assembly_id,
                NEW.process_redundancy,
                NEW.source_taxid,
                NEW.annotation_source_url,
                NEW.assembly_source_url,
                NEW.tax_id_lock,
                NEW.genus_taxid,
                NEW.is_metagenome,
                NEW.process_busco,
                NEW.for_proteomics,
                NEW.last_dna_cached,
                NEW.is_excluded,
                NEW.exclusion_immunity,
                NEW.assembly_level
            );

    ELSIF TG_OP = 'UPDATE' THEN

        if  (NEW.proteome_taxid != OLD.proteome_taxid)  then
            NEW.process_redundancy:=1;
        end if;
        NEW.user_stamp := l_audit_remark;
        NEW.time_stamp:= LOCALTIMESTAMP;

        INSERT INTO proteome_audit
        (
            oscode,
            proteome_id,
            strain,
            superregnum_name,
            proteome_taxid,
            order_in,
            user_stamp,
            time_stamp,
            is_complete,
            -- first_release_id,
            kw_added_uniprot_release_id,
            is_reference,
            proteome_map_type,
            protein_count,
            lineage,
            ignore_cpd,
            file_name,
            audit_user,
            audit_time,
            audit_event,
            audit_remark,
            internal,
            gc_set_acc,
            swissprot_name,
            publish,
            upid,
            orf_regexp,
            is_representative,
            is_redundant,
            redundancy_immunity,
            curated_complete,
            proteome_name1,
            isolate,
            assembly_id,
            process_redundancy,
            source_taxid,
            annotation_source_url,
            assembly_source_url,
            tax_id_lock,
            genus_taxid,
            is_metagenome,
            process_busco,
            for_proteomics,
            last_dna_cached,
            is_excluded,
            exclusion_immunity,
            assembly_level
        )
        VALUES
            (
                OLD.oscode,
                OLD.proteome_id,
                OLD.strain,
                OLD.superregnum_name,
                OLD.proteome_taxid,
                OLD.order_in,
                OLD.user_stamp,
                OLD.time_stamp,
                OLD.is_complete,
                --  OLD.first_release_id,
                OLD.kw_added_uniprot_release_id,
                OLD.is_reference,
                OLD.proteome_map_type,
                OLD.protein_count,
                OLD.lineage,
                OLD.ignore_cpd,
                OLD.file_name,
                NEW.user_stamp,
                NEW.time_stamp,
                'update',
                l_audit_remark,
                OLD.internal,
                OLD.gc_set_acc,
                OLD.swissprot_name,
                OLD.publish,
                OLD.upid,
                OLD.orf_regexp,
                OLD.is_representative,
                OLD.is_redundant,
                OLD.redundancy_immunity,
                OLD.curated_complete,
                OLD.proteome_name1,
                OLD.isolate,
                OLD.assembly_id,
                OLD.process_redundancy,
                OLD.source_taxid,
                OLD.annotation_source_url,
                OLD.assembly_source_url,
                OLD.tax_id_lock,
                OLD.genus_taxid,
                OLD.is_metagenome,
                OLD.process_busco,
                OLD.for_proteomics,
                OLD.last_dna_cached,
                OLD.is_excluded,
                OLD.exclusion_immunity,
                OLD.assembly_level
            );

    ELSE

        INSERT INTO proteome_audit
        (
            oscode,
            proteome_id,
            strain,
            superregnum_name,
            proteome_taxid,
            order_in,
            user_stamp,
            time_stamp,
            is_complete,
            --    first_release_id,
            kw_added_uniprot_release_id,
            is_reference,
            proteome_map_type,
            protein_count,
            lineage,
            ignore_cpd,
            file_name,
            audit_user,
            audit_time,
            audit_event,
            audit_remark,
            internal,
            gc_set_acc,
            swissprot_name,
            publish,
            upid,
            orf_regexp,
            is_representative,
            is_redundant,
            redundancy_immunity,
            curated_complete,
            proteome_name1,
            isolate,
            assembly_id,
            process_redundancy,
            source_taxid,
            annotation_source_url,
            assembly_source_url,
            tax_id_lock,
            genus_taxid,
            is_metagenome,
            process_busco,
            for_proteomics,
            last_dna_cached,
            is_excluded,
            exclusion_immunity,
            assembly_level
        )
        VALUES
            (
                OLD.oscode,
                OLD.proteome_id,
                OLD.strain,
                OLD.superregnum_name,
                OLD.proteome_taxid,
                OLD.order_in,
                OLD.user_stamp,
                OLD.time_stamp,
                OLD.is_complete,
                --   OLD.first_release_id,
                OLD.kw_added_uniprot_release_id,
                OLD.is_reference,
                OLD.proteome_map_type,
                OLD.protein_count,
                OLD.lineage,
                OLD.ignore_cpd,
                OLD.file_name,
                USER,
                LOCALTIMESTAMP,
                'delete',
                l_audit_remark,
                OLD.internal,
                OLD.gc_set_acc,
                OLD.swissprot_name,
                OLD.publish,
                OLD.upid,
                OLD.orf_regexp,
                OLD.is_representative,
                OLD.is_redundant,
                OLD.redundancy_immunity,
                OLD.curated_complete,
                OLD.proteome_name1,
                OLD.isolate,
                OLD.assembly_id,
                OLD.process_redundancy,
                OLD.source_taxid,
                OLD.annotation_source_url,
                OLD.assembly_source_url,
                OLD.tax_id_lock,
                OLD.genus_taxid,
                OLD.is_metagenome,
                OLD.process_busco,
                OLD.for_proteomics,
                OLD.last_dna_cached,
                OLD.is_excluded,
                OLD.exclusion_immunity,
                OLD.assembly_level
            );

    END IF;

    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    ELSE
        RETURN NEW;
    END IF;

END;
$function$
;
