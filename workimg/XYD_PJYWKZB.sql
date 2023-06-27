
--我行及成员单位持有的票据当天发生的业务记录
--记录应收票据票据业务数据扩展数据，如背书、贴现、质押等
insert into XYD_PJYWKZB20230425
--背书、提示付款申请、应答
select 
    tti.id||'' AS EXT_TB_ID,--VARCHAR2(32),--,--,--内码
    tbi.id||'' AS BILL_ID,--VARCHAR2(32),--,--,--票据内码
    DECODE(tti.ONLINE_MARK,'ST01','SM00','ST02','SM01') AS CLEANR_METHOD,--VARCHAR2(4),--,--,--清算方式
    case 
		when tti.trans_no = 'NES.006.20.00P' then '01'
		else '02'
    end AS BZNS_TYPE,--VARCHAR2(32),--,--,--业务类型
	case 
		when tti.trans_no = 'NES.006.20.00P' then tti.id||''
		else ''
    end AS ENDSOR_ID,--VARCHAR2(32),--,--,--背书业务内码
	
	case 
		when tti.trans_no = 'NES.006.20.00P' then to_char(tti.trans_appl_dt)
		else ''
    end AS ENDSOR_SEND_DATE,--VARCHAR2(20),--,--,--背书发送日期
    case 
		when tti.trans_no = 'NES.006.20.00P' then to_char(tti.trans_sign_dt)
		else ''
    end AS ENDSOR_SIGN_DATE,--VARCHAR2(20),--,--,--背书签收日期
    case 
		when tti.trans_no = 'NES.006.20.00P' then tti.trans_to_cust_no
		else ''
    end AS OPP_CUST_CODE,--VARCHAR2(30),--,--,--背书对方单位编号
    case 
		when tti.trans_no = 'NES.006.20.00P' then tti.trans_to_name
		else ''
    end AS OPP_CUST_NAME,--VARCHAR2(60),--,--,--背书对方单位名称
    case 
		when tti.trans_no = 'NES.006.20.00P' then tti.trans_to_acct_no
		else ''
    end AS OPP_BANK_ACC,--VARCHAR2(40),--,--,--背书对方单位账户
    case 
		when tti.trans_no = 'NES.006.20.00P' then tti.trans_to_bank_no
		else ''
    end AS OPP_BANK_NO,--VARCHAR2(40),--,--,--背书对方单位开户行(行号)
    case 
		when tti.trans_no = 'NES.006.20.00P' then tti.trans_to_bank_name
		else ''
    end AS OPP_BANK_NAME,--VARCHAR2(200),--,--,--背书对方单位开户行名称
	
	CASE
		when tti.trans_no = 'NES.011.20.00P' or tti.trans_no = 'NES.011.20.01P' or tti.trans_no = 'NES.011.20.03P' then tti.TRANS_APPL_DT||''
		else ''
    end AS COLLECT_SEND_DATE,--VARCHAR2(8),--,--,--提示付款申请日期
	
	CASE
		when tti.trans_no = 'NES.011.20.00P' or tti.trans_no = 'NES.011.20.01P' or tti.trans_no = 'NES.011.20.03P' then tti.TRANS_END_DT||''
		else ''
    end AS REC_BZNS_DATE,--VARCHAR2(8),--,--,--提示付款到账日期
    CASE
		when tti.trans_no = 'NES.011.20.00P' or tti.trans_no = 'NES.011.20.01P' or tti.trans_no = 'NES.011.20.03P' then DECODE(tti.TRANS_NO,'NES.011.20.03P','21','20')
		else ''
    end AS PROMPT_TYPE,--VARCHAR2(2),--,--,--提示付款类型
    CASE
		when tti.trans_no = 'NES.011.20.00P' or tti.trans_no = 'NES.011.20.01P' or tti.trans_no = 'NES.011.20.03P' then tti.TRANS_TO_ACCT_NAME
		else ''
    end AS COLLECT_ACCNAME,--VARCHAR2(38),--,--,--提示付款银行账户名称
    CASE
		when tti.trans_no = 'NES.011.20.00P' or tti.trans_no = 'NES.011.20.01P' or tti.trans_no = 'NES.011.20.03P' then tti.TRANS_TO_ACCT_NO
		else ''
    end AS COLLECT_BANK_ACC,--VARCHAR2(38),--,--,--提示付款银行账户
    CASE
		when tti.trans_no = 'NES.011.20.00P' or tti.trans_no = 'NES.011.20.01P' or tti.trans_no = 'NES.011.20.03P' then tti.TRANS_TO_BANK_NAME
		else ''
    end AS COLLECT_BANK_NAME,--VARCHAR2(100),--,--,--提示付款银行名称
    CASE
		when tti.trans_no = 'NES.011.20.00P' or tti.trans_no = 'NES.011.20.01P' or tti.trans_no = 'NES.011.20.03P' then tti.TRANS_TO_BANK_NO
		else ''
    end AS COLLECT_BANK_LHH,--VARCHAR2(100),--,--,--提示付款银行联行号
    to_char(tti.create_time) AS CREATE_DATE,--VARCHAR2(20),--,--,--创建日期
    '' AS DISC_TYPE,--CHAR(1),--,--,--贴现类型
    null AS DISC_RATE,--NUMBER(16,6),--,--,--贴现利率
    null AS INST_DAYS,--INTEGER,--,--,--计息天数
    null AS DISC_INST_AMT,--NUMBER(16,2),--,--,--贴现利息
    '' AS PAY_INST_TYPE,--CHAR(1),--,--,--付息方式
    '' AS DISC_REC_ACC,--VARCHAR2(38),--,--,--贴现入账账户
    '' AS PAY_INST_ACC,--VARCHAR2(38),--,--,--付息账户
    '' AS REC_INST_ACC,--VARCHAR2(38),--,--,--收息账户
    '' AS DISC_SEND_DATE,--VARCHAR2(20),--,--,--贴现发送日期
    '' AS DISC_SIGN_DATE,--VARCHAR2(20),--,--,--贴现签收日期
    '' AS DISC_TRANC_ID,--VARCHAR2(32),--,--,--贴现交易号
    '' AS BUY_INST_ACC,--VARCHAR2(38),--,--,--买方付息账户
    null AS DISC_BUY_INST_AMT,--NUMBER(16,2),--,--,--买方付息金额
    '' AS INST_IN_SHARE_BUY_ID,--VARCHAR2(32),--,--,--利息摊销主表内码
    null AS INST_ALL_AMT,--NUMBER(16,2),--,--,--摊销总额
    null AS INST_AMT,--NUMBER(16,2),--,--,--已摊销金额
    '' AS DISC_CREDIT_CONT_ID,--VARCHAR2(32),--,--,--贴现专项授信合同号
    '' AS DISCOUNT_APP_ID,  --VARCHAR2(32),----,--贴现合同号
    '' DISC_BREED_ID	 --VARCHAR2(100)    --票号和贴现合同关联的唯一标识号         有数据
from tb_bill_info tbi 
inner join tb_bill_info_ass tbia on tbi.id = tbia.BILL_ID
inner join tb_trans_info tti 
	on ((tti.bill_id = tbi.id and tti.BILL_ORIGIN in('CS01')) or (tti.BILL_ORIGIN in('CS02','CS03') and tti.BILL_ID = tbia.BILL_ID and tti.BILL_RANGE_START=tbia.BILL_RANGE_START and tti.BILL_RANGE_END=tbia.BILL_RANGE_END)) 
	and tti.STATUS_CODE = '2'
	and trans_no in('NES.006.20.00P','NES.011.20.00P','NES.011.20.01P','NES.011.20.03P')	
	and ((tti.TRANS_TYPE = '1' and tti.trans_to_bank_no not in('907100000476')) or tti.TRANS_TYPE = '2')
union all

--贴入
select 
    tti.id||'' AS EXT_TB_ID,--VARCHAR2(32),--,--,--内码
    tbi.id||'' AS BILL_ID,--VARCHAR2(32),--,--,--票据内码
    DECODE(tti.ONLINE_MARK,'ST01','SM00','ST02','SM01') AS CLEANR_METHOD,--VARCHAR2(4),--,--,--清算方式
    '04' AS BZNS_TYPE,--VARCHAR2(32),--,--,--业务类型
    '' AS ENDSOR_ID,--VARCHAR2(32),--,--,--背书业务内码
    '' AS ENDSOR_SEND_DATE,--VARCHAR2(20),--,--,--背书发送日期
    '' AS ENDSOR_SIGN_DATE,--VARCHAR2(20),--,--,--背书签收日期
    '' AS OPP_CUST_CODE,--VARCHAR2(30),--,--,--背书对方单位编号
    '' AS OPP_CUST_NAME,--VARCHAR2(60),--,--,--背书对方单位名称
    '' AS OPP_BANK_ACC,--VARCHAR2(40),--,--,--背书对方单位账户
    '' AS OPP_BANK_NO,--VARCHAR2(40),--,--,--背书对方单位开户行(行号)
    '' AS OPP_BANK_NAME,--VARCHAR2(200),--,--,--背书对方单位开户行名称
    '' AS COLLECT_SEND_DATE,--VARCHAR2(8),--,--,--提示付款申请日期
    '' AS REC_BZNS_DATE,--VARCHAR2(8),--,--,--提示付款到账日期
    '' AS PROMPT_TYPE,--VARCHAR2(2),--,--,--提示付款类型
    '' AS COLLECT_ACCNAME,--VARCHAR2(38),--,--,--提示付款银行账户名称
    '' AS COLLECT_BANK_ACC,--VARCHAR2(38),--,--,--提示付款银行账户
    '' AS COLLECT_BANK_NAME,--VARCHAR2(100),--,--,--提示付款银行名称
    '' AS COLLECT_BANK_LHH,--VARCHAR2(100),--,--,--提示付款银行联行号
    to_char(tti.create_time) AS CREATE_DATE,--VARCHAR2(20),--,--,--创建日期
    '0' AS DISC_TYPE,--CHAR(1),--,--,--贴现类型
    tcdb.rate AS DISC_RATE,--NUMBER(16,6),--,--,--贴现利率
    tcdb.interest_cal_days AS INST_DAYS,--INTEGER,--,--,--计息天数
    tcdb.interest AS DISC_INST_AMT,--NUMBER(16,2),--,--,--贴现利息
    case tcdbh.pay_type    --1:买方付息 2:卖方付息 3:协议付息 4:第三方付息
        when '1' then '1'
        when '2' then '0'
        when '3' then '2'
        else ''
    end AS PAY_INST_TYPE,--CHAR(1),--,--,--付息方式
    tcdbh.ao_acct_no AS DISC_REC_ACC,--VARCHAR2(38),--,--,--贴现入账账户
    case tcdbh.pay_type    --1:买方付息 2:卖方付息 3:协议付息 4:第三方付息
        when '1' then tcdbh.pay_acct_no
        when '2' then tbi.pyee_acct_no
        when '3' then tcdbh.pay_acct_no
        when '4' then tcdbh.third_acct_no
        else ''
    end AS PAY_INST_ACC,--VARCHAR2(38),--,--,--付息账户
    '0' AS REC_INST_ACC,--VARCHAR2(38),--,--,--收息账户
    to_char(tti.trans_appl_dt) AS DISC_SEND_DATE,--VARCHAR2(20),--,--,--贴现发送日期
    to_char(tti.trans_sign_dt) AS DISC_SIGN_DATE,--VARCHAR2(20),--,--,--贴现签收日期
    tcdb.trans_to_msg_id||'' AS DISC_TRANC_ID,--VARCHAR2(32),--,--,--贴现交易号
    tcdbh.pay_acct_no AS BUY_INST_ACC,--VARCHAR2(38),--,--,--买方付息账户
    tp.interest AS DISC_BUY_INST_AMT,--NUMBER(16,2),--,--,--买方付息金额
    tp.id||'' AS INST_IN_SHARE_BUY_ID,--VARCHAR2(32),--,--,--利息摊销主表内码
    tp.interest AS INST_ALL_AMT,--NUMBER(16,2),--,--,--摊销总额
    tp.prov_interest AS INST_AMT,--NUMBER(16,2),--,--,--已摊销金额
    '' AS DISC_CREDIT_CONT_ID,--VARCHAR2(32),--,--,--贴现专项授信合同号
    tcdbh.trans_ctrct_no AS DISCOUNT_APP_ID,  --VARCHAR2(32),----,--贴现合同号
    case 
      when tcdbh.trans_ctrct_no is not null then tcdbh.trans_ctrct_no||tcdb.id 
      else ''
    end  as DISC_CONT_CODE	 --VARCHAR2(100)    --票号和贴现合同关联的唯一标识号         有数据
from tb_bill_info tbi 
inner join tb_bill_info_ass tbia on tbi.id = tbia.BILL_ID
inner join tb_trans_info tti on ((tti.bill_id = tbi.id and tti.BILL_ORIGIN in('CS01')) or (tti.BILL_ORIGIN in('CS02','CS03') and tti.BILL_ID = tbia.BILL_ID and tti.BILL_RANGE_START=tbia.BILL_RANGE_START and tti.BILL_RANGE_END=tbia.BILL_RANGE_END)) and tti.TRANS_TYPE = '2' and tti.STATUS_CODE = '2'  and trans_no in('NES.007.20.00P','NES.007.20.10P')
inner join te_ce_disc_bill tcdb on ((tcdb.BILL_ORIGIN in('CS01') and tbi.id = tcdb.BILL_ID) or (tcdb.BILL_ORIGIN in('CS02','CS03') and tbia.bill_id=tcdb.bill_id and tcdb.BILL_RANGE_START=tbia.BILL_RANGE_START and tcdb.BILL_RANGE_END=tbia.BILL_RANGE_END)) and tcdb.acct_status = '1'
inner join te_ce_disc_batch tcdbh on tcdbh.id = tcdb.batch_id
left join tb_provision tp on tcdb.id = tp.list_id and tp.provision_type = '1'

union all
--贴出
select 
    tti.id||'' AS EXT_TB_ID,--VARCHAR2(32),--,--,--内码
    tbi.id||'' AS BILL_ID,--VARCHAR2(32),--,--,--票据内码
    DECODE(tti.ONLINE_MARK,'ST01','SM00','ST02','SM01') AS CLEANR_METHOD,--VARCHAR2(4),--,--,--清算方式
    '04' AS BZNS_TYPE,--VARCHAR2(32),--,--,--业务类型
    '' AS ENDSOR_ID,--VARCHAR2(32),--,--,--背书业务内码
    '' AS ENDSOR_SEND_DATE,--VARCHAR2(20),--,--,--背书发送日期
    '' AS ENDSOR_SIGN_DATE,--VARCHAR2(20),--,--,--背书签收日期
    '' AS OPP_CUST_CODE,--VARCHAR2(30),--,--,--背书对方单位编号
    '' AS OPP_CUST_NAME,--VARCHAR2(60),--,--,--背书对方单位名称
    '' AS OPP_BANK_ACC,--VARCHAR2(40),--,--,--背书对方单位账户
    '' AS OPP_BANK_NO,--VARCHAR2(40),--,--,--背书对方单位开户行(行号)
    '' AS OPP_BANK_NAME,--VARCHAR2(200),--,--,--背书对方单位开户行名称
    '' AS COLLECT_SEND_DATE,--VARCHAR2(8),--,--,--提示付款申请日期
    '' AS REC_BZNS_DATE,--VARCHAR2(8),--,--,--提示付款到账日期
    '' AS PROMPT_TYPE,--VARCHAR2(2),--,--,--提示付款类型
    '' AS COLLECT_ACCNAME,--VARCHAR2(38),--,--,--提示付款银行账户名称
    '' AS COLLECT_BANK_ACC,--VARCHAR2(38),--,--,--提示付款银行账户
    '' AS COLLECT_BANK_NAME,--VARCHAR2(100),--,--,--提示付款银行名称
    '' AS COLLECT_BANK_LHH,--VARCHAR2(100),--,--,--提示付款银行联行号
    to_char(tti.create_time) AS CREATE_DATE,--VARCHAR2(20),--,--,--创建日期
    '0' AS DISC_TYPE,--CHAR(1),--,--,--贴现类型
    tcdb.rate AS DISC_RATE,--NUMBER(16,6),--,--,--贴现利率
    tcdb.interest_cal_days AS INST_DAYS,--INTEGER,--,--,--计息天数
    tcdb.interest AS DISC_INST_AMT,--NUMBER(16,2),--,--,--贴现利息
    case tcdbh.pay_type    --1:买方付息 2:卖方付息 3:协议付息 4:第三方付息
        when '1' then '1'
        when '2' then '0'
        when '3' then '2'
        else ''
    end AS PAY_INST_TYPE,--CHAR(1),--,--,--付息方式
    tcdbh.ao_acct_no AS DISC_REC_ACC,--VARCHAR2(38),--,--,--贴现入账账户
    case tcdbh.pay_type    --1:买方付息 2:卖方付息 3:协议付息 4:第三方付息
        when '1' then tcdbh.pay_acct_no
        when '2' then tbi.pyee_acct_no
        when '3' then tcdbh.pay_acct_no
        when '4' then tcdbh.third_acct_no
        else ''
    end AS PAY_INST_ACC,--VARCHAR2(38),--,--,--付息账户
    '0' AS REC_INST_ACC,--VARCHAR2(38),--,--,--收息账户
    to_char(tti.trans_appl_dt) AS DISC_SEND_DATE,--VARCHAR2(20),--,--,--贴现发送日期
    to_char(tti.trans_sign_dt) AS DISC_SIGN_DATE,--VARCHAR2(20),--,--,--贴现签收日期
    tcdb.trans_to_msg_id||'' AS DISC_TRANC_ID,--VARCHAR2(32),--,--,--贴现交易号
    tcdbh.pay_acct_no AS BUY_INST_ACC,--VARCHAR2(38),--,--,--买方付息账户
    tp.interest AS DISC_BUY_INST_AMT,--NUMBER(16,2),--,--,--买方付息金额
    tp.id||'' AS INST_IN_SHARE_BUY_ID,--VARCHAR2(32),--,--,--利息摊销主表内码
    tp.interest AS INST_ALL_AMT,--NUMBER(16,2),--,--,--摊销总额
    tp.prov_interest AS INST_AMT,--NUMBER(16,2),--,--,--已摊销金额
    '' AS DISC_CREDIT_CONT_ID,--VARCHAR2(32),--,--,--贴现专项授信合同号
    tcdbh.trans_ctrct_no AS DISCOUNT_APP_ID,  --VARCHAR2(32),----,--贴现合同号
    case 
      when tcdbh.trans_ctrct_no is not null then tcdbh.trans_ctrct_no||tcdb.id 
      else ''
    end as DISC_CONT_CODE	 --VARCHAR2(100)    --票号和贴现合同关联的唯一标识号         有数据
from tb_bill_info tbi 
inner join tb_bill_info_ass tbia on tbi.id = tbia.BILL_ID
inner join tb_trans_info tti on ((tti.bill_id = tbi.id and tti.BILL_ORIGIN in('CS01')) or (tti.BILL_ORIGIN in('CS02','CS03') and tti.BILL_ID = tbia.BILL_ID and tti.BILL_RANGE_START=tbia.BILL_RANGE_START and tti.BILL_RANGE_END=tbia.BILL_RANGE_END)) and tti.TRANS_TYPE = '1' and tti.STATUS_CODE = '2'  and trans_no in('NES.007.20.00P','NES.007.20.10P')  and tti.trans_to_bank_no not in('907100000476')
inner join te_ce_disc_bill tcdb on ((tcdb.BILL_ORIGIN in('CS01') and tbi.id = tcdb.BILL_ID) or (tcdb.BILL_ORIGIN in('CS02','CS03') and tbia.bill_id=tcdb.bill_id and tcdb.BILL_RANGE_START=tbia.BILL_RANGE_START and tcdb.BILL_RANGE_END=tbia.BILL_RANGE_END)) and tcdb.acct_status = '1'
inner join te_ce_disc_batch tcdbh on tcdbh.id = tcdb.batch_id
left join tb_provision tp on tbi.id = tp.bill_id and tp.provision_type = '1'


;