-- 贴现自动记账
UPDATE tm_business_parameter SET param_value = '1' where  param_key = 'ce.disc.elec_auto_acct_fop';
UPDATE tm_business_parameter SET param_value = '1' where  param_key = 'ce.disc.ce.disc.elec_auto_acct_dvp';

-- 转贴现买入自动记账
UPDATE tm_business_parameter SET param_value = '1' where  param_key = 'pc.acct.be_market_rebuy_fop';
UPDATE tm_business_parameter SET param_value = '1' where  param_key = 'pc.acct.be_market_rebuy_dvp';

-- 默认初始化自动记账

-- 扣款模式
UPDATE tm_business_parameter SET param_value = '1' where  param_key = 'ce.acpt.acpt_day_deduct_acct_mode';
-- 客户签约电票业务是否通知外围
UPDATE tm_business_parameter SET param_value = '1' where  param_key = 'bm.sign.is_notice_channel_elec_sign';
-- 扣款条数
INSERT INTO `tm_business_parameter` (`id`, `legal_no`, `param_title`, `param_key`, `param_name`, `param_value`, `param_type`, `param_remark`, `param_group_code`, `busi_type`, `is_row_show`, `operator`, `create_time`, `update_time`) VALUES (2006, '000000', '承兑ce.acpt', 'ce.acpt.deduct_batch_file_size', '批量扣款条数', '1', '1', '扣款条数', 'Yon', '1', '1', NULL, NULL, NULL);