select p_no, p_name, substr(p_birth, 1, 4), substr(p_birth, 5, 2), substr(p_birth, 7, 2), p_tel1, p_tel2, p_tel3, p_city
from tbl_practice_30306;

select 
from tbl_practice_30306 pr, tbl_practice_test_30306 te, tbl_p_result_30306 re
where