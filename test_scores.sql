-- ACT Composite Score
with cte_act_comp as (select spriden_pidm,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 5)) act_comp
                      from saturn.spriden@proddb
                      where spriden_change_ind is null
                        and spriden_entity_ind = 'P')
select a.dsc_pidm, b.act_comp
from students03 a,
     cte_act_comp b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and b.act_comp is not null
order by act_comp, dsc_pidm;

-- ACT Composite Range
with cte_act_comp as (select spriden_pidm,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 5)) act_comp
                      from saturn.spriden@proddb
                      where spriden_change_ind is null
                        and spriden_entity_ind = 'P')

select case
           when act_comp between 30 and 36 then 1
           when act_comp between 24 and 29 then 2
           when act_comp between 18 and 23 then 3
           when act_comp between 12 and 17 then 4
           when act_comp between 6 and 11 then 5
           when act_comp < 6 then 6
       end as order_by,
       case
           when act_comp between 30 and 36 then '30-36'
           when act_comp between 24 and 29 then '24-29'
           when act_comp between 18 and 23 then '18-23'
           when act_comp between 12 and 17 then '12-17'
           when act_comp between 6 and 11 then '6-11'
           when act_comp < 6 then '6 and below'
       end as act_math_range,
       count(distinct a.dsc_pidm) as student_count
from students03 a,
     cte_act_comp b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and act_comp is not null
group by case
             when act_comp between 30 and 36 then '30-36'
             when act_comp between 24 and 29 then '24-29'
             when act_comp between 18 and 23 then '18-23'
             when act_comp between 12 and 17 then '12-17'
             when act_comp between 6 and 11 then '6-11'
             when act_comp < 6 then '6 and below'
         end,
         case
             when act_comp between 30 and 36 then 1
             when act_comp between 24 and 29 then 2
             when act_comp between 18 and 23 then 3
             when act_comp between 12 and 17 then 4
             when act_comp between 6 and 11 then 5
             when act_comp < 6 then 6
         end
order by order_by;

-- ACT English Score
with cte_act_engl as (select spriden_pidm,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 1)) act_engl
                      from saturn.spriden@proddb
                      where spriden_change_ind is null
                        and spriden_entity_ind = 'P')
select a.dsc_pidm, b.act_engl
from students03 a,
     cte_act_engl b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and b.act_engl is not null
order by act_engl, dsc_pidm;

-- ACT English Range
with cte_act_engl as (select spriden_pidm,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 1)) act_engl
                      from saturn.spriden@proddb
                      where spriden_change_ind is null
                        and spriden_entity_ind = 'P')

select case
           when act_engl between 30 and 36 then 1
           when act_engl between 24 and 29 then 2
           when act_engl between 18 and 23 then 3
           when act_engl between 12 and 17 then 4
           when act_engl between 6 and 11 then 5
           when act_engl < 6 then 6
       end as order_by,
       case
           when act_engl between 30 and 36 then '30-36'
           when act_engl between 24 and 29 then '24-29'
           when act_engl between 18 and 23 then '18-23'
           when act_engl between 12 and 17 then '12-17'
           when act_engl between 6 and 11 then '6-11'
           when act_engl < 6 then '6 and below'
       end as act_math_range,
       count(distinct a.dsc_pidm) as student_count
from students03 a,
     cte_act_engl b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and act_engl is not null
group by case
             when act_engl between 30 and 36 then '30-36'
             when act_engl between 24 and 29 then '24-29'
             when act_engl between 18 and 23 then '18-23'
             when act_engl between 12 and 17 then '12-17'
             when act_engl between 6 and 11 then '6-11'
             when act_engl < 6 then '6 and below'
         end,
         case
             when act_engl between 30 and 36 then 1
             when act_engl between 24 and 29 then 2
             when act_engl between 18 and 23 then 3
             when act_engl between 12 and 17 then 4
             when act_engl between 6 and 11 then 5
             when act_engl < 6 then 6
         end
order by order_by;

-- ACT Math Score
with cte_act_math as (select spriden_pidm,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 2)) act_math,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid =
                                    f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 3)) act_math_new
                      from saturn.spriden@proddb
                      where spriden_change_ind is null
                        and spriden_entity_ind = 'P')
select a.dsc_pidm,
       b.act_math,
       b.act_math_new,
       greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) as act_max_math_score
from students03 a,
     cte_act_math b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) is not null
order by act_max_math_score, dsc_pidm;

-- ACT Math Range
with cte_act_math as (select spriden_pidm,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 2)) act_math,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid =
                                    f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 3)) act_math_new
                      from saturn.spriden@proddb
                      where spriden_change_ind is null
                        and spriden_entity_ind = 'P')
select case
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '30' and '36'
               then 1
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '24' and '29'
               then 2
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '18' and '23'
               then 3
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between 12 and 17
               then 4
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between 6 and 11 then 5
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) < 6 then 6
       end as order_by,
       case
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '30' and '36'
               then '30-36'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '24' and '29'
               then '24-29'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '18' and '23'
               then '18-23'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between 12 and 17
               then '12-17'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between 6 and 11
               then '6-11'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) < 6 then '6 and below'
       end as act_math_range,
       count(distinct a.dsc_pidm) as student_count
from students03 a,
     cte_act_math b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) is not null
group by case
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '30' and '36'
                 then '30-36'
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '24' and '29'
                 then '24-29'
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '18' and '23'
                 then '18-23'
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between 12 and 17
                 then '12-17'
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between 6 and 11
                 then '6-11'
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) < 6 then '6 and below'
         end,
         case
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '30' and '36'
                 then 1
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '24' and '29'
                 then 2
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between '18' and '23'
                 then 3
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between 12 and 17
                 then 4
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) between 6 and 11
                 then 5
             when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) < 6 then 6
         end
order by order_by;

-- ACT Reading Score
with cte_act_read as (select spriden_pidm,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 4)) act_read
                      from saturn.spriden@proddb
                      where spriden_change_ind is null
                        and spriden_entity_ind = 'P')
select a.dsc_pidm, b.act_read
from students03 a,
     cte_act_read b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and b.act_read is not null
order by act_read, dsc_pidm;

-- ACT Reading Range
with cte_act_read as (select spriden_pidm,
                             (select sortest_test_score
                              from saturn.sortest@proddb
                              where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 4)) act_read
                      from saturn.spriden@proddb
                      where spriden_change_ind is null
                        and spriden_entity_ind = 'P')

select case
           when act_read between 30 and 36 then 1
           when act_read between 24 and 29 then 2
           when act_read between 18 and 23 then 3
           when act_read between 12 and 17 then 4
           when act_read between 6 and 11 then 5
           when act_read < 6 then 6
       end as order_by,
       case
           when act_read between 30 and 36 then '30-36'
           when act_read between 24 and 29 then '24-29'
           when act_read between 18 and 23 then '18-23'
           when act_read between 12 and 17 then '12-17'
           when act_read between 6 and 11 then '6-11'
           when act_read < 6 then '6 and below'
       end as act_read_range,
       count(distinct a.dsc_pidm) as student_count
from students03 a,
     cte_act_read b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and act_read is not null
group by case
           when act_read between 30 and 36 then 1
           when act_read between 24 and 29 then 2
           when act_read between 18 and 23 then 3
           when act_read between 12 and 17 then 4
           when act_read between 6 and 11 then 5
           when act_read < 6 then 6
       end,
       case
           when act_read between 30 and 36 then '30-36'
           when act_read between 24 and 29 then '24-29'
           when act_read between 18 and 23 then '18-23'
           when act_read between 12 and 17 then '12-17'
           when act_read between 6 and 11 then '6-11'
           when act_read < 6 then '6 and below'
       end
order by order_by;