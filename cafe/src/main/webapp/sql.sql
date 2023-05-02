select sa.sale_ymd, sa.sale_no, st.store_nm, me.menu_nm, si.size_nm, sa.sale_cnt, sa.sale_cnt*(me.price+si.plus_price), sa.pay_type
from sale_tbl_003 sa, store_tbl_007 st, menu_tbl_007 me, size_tbl_007 si 
where me.menu_cd = sa.menu_cd and si.size_cd = sa.size_cd and st.store_cd = sa.store_cd;