select p_no, p_name, substr(p_birth, 1, 4), substr(p_birth, 5, 2), substr(p_birth, 7, 2),  p_gender, p_tel1, p_tel2, p_tel3, p_city
from TBL_PATIENT_202004;