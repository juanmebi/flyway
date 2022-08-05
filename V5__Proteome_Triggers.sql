create trigger t_proteome_audit before
insert
    or
delete
    or
update
    on
    public.proteome for each row execute procedure trigger_fct_t_proteome_audit();
