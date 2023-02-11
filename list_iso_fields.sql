select rf.rdb$relation_name as relation_name,
             rf.rdb$field_name as field_name,
             f.rdb$character_set_id as character_set_id,
             rf.rdb$collation_id as collation_id,
             f.rdb$field_type as field_type,
             f.rdb$field_sub_type as field_sub_type


from RDB$RELATION_FIELDS rf

inner join RDB$FIELDS f on rf.rdb$field_source=f.rdb$field_name
where 
    rf.rdb$system_flag=0 and 
  --f.rdb$character_set_id=51 and 
    f.rdb$field_type=37 and

    rf.rdb$relation_name not in
    (select rdb$relation_name from rdb$relations
    where rdb$view_blr is not null
    and (rdb$system_flag is null or rdb$system_flag = 0))
