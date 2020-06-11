select spriden_id dixieid,
       spriden_first_name first_name,
       spriden_last_name last_name
        from saturn.sortest
        where sortest.rowid = F_GET_SORTEST_ROWID(spriden_pidm, 'ADMSTEST', 2)) act_math,
       (select sortest_test_score
        from saturn.sortest
        where sortest.rowid = F_GET_SORTEST_ROWID(spriden_pidm, 'ADMSTEST', 3)) act_math_old,
       (select sortest_test_score
        from saturn.sortest
        where sortest.rowid = F_GET_SORTEST_ROWID(spriden_pidm, 'ADMSTEST', 2)) as act_math_max,
       (select sortest_test_score
        from saturn.sortest
        where sortest.rowid = F_GET_SORTEST_ROWID(spriden_pidm, 'ADMSTEST', 4)) act_reading
from saturn.spriden@proddb
where spriden_pidm in ('88835',
                       '105747',
                       '153040',
                       '153169',
                       '157510',
                       '179806',
                       '191154',
                       '192738',
                       '194309',
                       '205619');


/*
        (select sortest_test_score
        from saturn.sortest
        where sortest.rowid = F_GET_SORTEST_ROWID(spriden_pidm, 'ADMSTEST', 5)) "Act_Composite",
       (select sortest_test_score
        from saturn.sortest
        where sortest.rowid = F_GET_SORTEST_ROWID(spriden_pidm, 'ADMSTEST', 1)) act_engl,
       (select sortest_test_score
 */