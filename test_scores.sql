-- ACT Math
with cte_act1 as (select spriden_pidm,
                         (select sortest_test_score
                          from saturn.sortest@proddb
                          where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 2)) act_math,
                         (select sortest_test_score
                          from saturn.sortest@proddb
                          where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 3)) act_math_new
                  from saturn.spriden@proddb
                  where spriden_change_ind is null
                    and spriden_entity_ind = 'P')
select a.dsc_pidm,
       b.act_math,
       b.act_math_new,
       greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) as act_max_math_score
from students03 a,
     cte_act1 b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) is not null;

-- ACT Math Range
with cte_act1 as (select spriden_pidm,
                         (select sortest_test_score
                          from saturn.sortest@proddb
                          where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 2)) act_math,
                         (select sortest_test_score
                          from saturn.sortest@proddb
                          where sortest.rowid = f_get_sortest_rowid@proddb(spriden_pidm, 'ADMSTEST', 3)) act_math_new
                  from saturn.spriden@proddb
                  where spriden_change_ind is null
                    and spriden_entity_ind = 'P')
select count(distinct a.dsc_pidm),
       case
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '30' and '36' then '30-36'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '24' and '29' then '24-29'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '18' and '23' then '18-23'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '12' and '17' then '12-17'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '6' and '11' then '6-11'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  < '6' then '6 and below'
        end as act_math_range,
       case
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '30' and '36' then 1
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '24' and '29' then 2
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '18' and '23' then 3
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '12' and '17' then 4
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '6' and '11' then 5
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  < '6' then 6
        end as order_by_id
from students03 a,
     cte_act1 b
where a.dsc_pidm = spriden_pidm
  and a.dsc_term_code = '201943'
  and a.s_level <> 'GG'
  and a.s_deg_intent <> '0'
  and a.s_entry_action in ('FF', 'FH')
  and greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math)) is not null
  group by
         case
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '30' and '36' then '30-36'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '24' and '29' then '24-29'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '18' and '23' then '18-23'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '12' and '17' then '12-17'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '6' and '11' then '6-11'
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  < '6' then '6 and below'
        end,
           case
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '30' and '36' then 1
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '24' and '29' then 2
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '18' and '23' then 3
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '12' and '17' then 4
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  between '6' and '11' then 5
           when greatest(coalesce(act_math, act_math_new), coalesce(act_math_new, act_math))  < '6' then 6
        end order by order_by_id;