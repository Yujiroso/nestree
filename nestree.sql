CREATE DATABASE IF NOT EXISTS 'nestree';
　
--Table  'nestree'.'emp' // ユーザー
CREATE TABLE IF NOT EXISTS 'nestree'.'emp'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ユーザー';

--Table  'nestree'.'emp_details' // ユーザー詳細
CREATE TABLE IF NOT EXISTS 'nestree'.'emp_details'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ユーザー詳細';

--Table  'nestree'.'bank' // 口座情報
CREATE TABLE IF NOT EXISTS 'nestree'.'bank'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='口座情報';

--Table  'nestree'.'emp_info' // 社内情報
CREATE TABLE IF NOT EXISTS 'nestree'.'emp_info'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='社内情報';

--Table  'nestree'.'news' // ニュース
CREATE TABLE IF NOT EXISTS 'nestree'.'news'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ニュース';

--Table  'nestree'.'news_details' // ニュース詳細
CREATE TABLE IF NOT EXISTS 'nestree'.'news_details'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ニュース詳細';

--Table  'nestree'.'daily_report' // 日報
CREATE TABLE IF NOT EXISTS 'nestree'.'daily_report'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='日報';

--Table  'nestree'.'monthly_report' // 月報
CREATE TABLE IF NOT EXISTS 'nestree'.'monthly_report'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='月報';

--Table  'nestree'.'expense_report' // 経費申請
CREATE TABLE IF NOT EXISTS 'nestree'.'expense_report'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='経費申請';

--Table  'nestree'.'skillup' // スキルアップ
CREATE TABLE IF NOT EXISTS 'nestree'.'skillup'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='スキルアップ';

--Table  'nestree'.'timesheet' // 勤怠
CREATE TABLE IF NOT EXISTS 'nestree'.'timesheet'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='勤怠';

--Table  'nestree'.'share_info' // 資料共有
CREATE TABLE IF NOT EXISTS 'nestree'.'share_info'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='資料共有';

--Table  'nestree'.'salary' // 給与明細
CREATE TABLE IF NOT EXISTS 'nestree'.'salary'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='給与明細';

--Table  'nestree'.'safety_check' // 安全確認
CREATE TABLE IF NOT EXISTS 'nestree'.'safety_check'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='安全確認';

--Table  'nestree'.'point_his' // ポイント履歴
CREATE TABLE IF NOT EXISTS 'nestree'.'point_his'(
    id INT NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    type INT NOT NULL,
    date_added DATETIME NOT NULL,
    datetime_update DATETIME NOT NULL,
    increased INT NOT NULL,
    decreased INT NOT NULL,
    del_flg TINYINT NOT NULL,
    PRIMARY KEY (id, date_added) USING BTREE,
    INDEX idx_emp_id (emp_id) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ポイント履歴';

--ポイント履歴テーブルパーティション化 //月ごと
ALTER TABLE `point_his`
    Partition BY RANGE (YEAR(date_added)*100 + MONTH(date_added))
    (
    Partition p202001 VALUES LESS THAN (202002),
    Partition p202002 VALUES LESS THAN (202003),
    Partition p202003 VALUES LESS THAN (202004),
    Partition p202004 VALUES LESS THAN (202005),
    Partition p202005 VALUES LESS THAN (202006),
    Partition p202006 VALUES LESS THAN (202007),
    Partition p202007 VALUES LESS THAN (202008),
    Partition p202008 VALUES LESS THAN (202009),
    Partition p202009 VALUES LESS THAN (202010),
    Partition p202010 VALUES LESS THAN (202011),
    Partition p202011 VALUES LESS THAN (202012),
    Partition p202012 VALUES LESS THAN (202101),
    Partition p202101 VALUES LESS THAN (202102),
    Partition p202102 VALUES LESS THAN (202103),
    Partition p202103 VALUES LESS THAN (202104),
    Partition p202104 VALUES LESS THAN (202105),
    Partition p202105 VALUES LESS THAN (202106),
    Partition p202106 VALUES LESS THAN (202107),
    Partition p202107 VALUES LESS THAN (202108),
    Partition p202108 VALUES LESS THAN (202109),
    Partition p202109 VALUES LESS THAN (202110),
    Partition p202110 VALUES LESS THAN (202111),
    Partition p202111 VALUES LESS THAN (202112),
    Partition p202112 VALUES LESS THAN (202201),
    Partition p202201 VALUES LESS THAN (202202),
    Partition p202202 VALUES LESS THAN (202203),
    Partition p202203 VALUES LESS THAN (202204),
    Partition p202204 VALUES LESS THAN (202205),
    Partition p202205 VALUES LESS THAN (202206),
    Partition p202206 VALUES LESS THAN (202207),
    Partition p202207 VALUES LESS THAN (202208),
    Partition p202208 VALUES LESS THAN (202209),
    Partition p202209 VALUES LESS THAN (202210),
    Partition p202210 VALUES LESS THAN (202211),
    Partition p202211 VALUES LESS THAN (202212),
    Partition p202212 VALUES LESS THAN (202301),
    Partition p202301 VALUES LESS THAN (202302),
    Partition p202302 VALUES LESS THAN (202303),
    Partition p202303 VALUES LESS THAN (202304),
    Partition p202304 VALUES LESS THAN (202305),
    Partition p202305 VALUES LESS THAN (202306),
    Partition p202306 VALUES LESS THAN (202307),
    Partition p202307 VALUES LESS THAN (202308),
    Partition p202308 VALUES LESS THAN (202309),
    Partition p202309 VALUES LESS THAN (202310),
    Partition p202310 VALUES LESS THAN (202311),
    Partition p202311 VALUES LESS THAN (202312),
    Partition p202312 VALUES LESS THAN (202401),
    Partition p999999 VALUES LESS THAN (MAXVALUE) -- デフォルト値設定
    );

--Table  'nestree'.'magnification_his' // 倍率変更履歴
CREATE TABLE IF NOT EXISTS 'nestree'.'magnification_his'(
    id INT NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    type INT NOT NULL,
    magnification FLOAT NOT NULL,
    date_added DATETIME NOT NULL,
    datetime_update DATETIME NOT NULL,
    del_flg TINYINT NOT NULL,
    PRIMARY KEY (id, date_added) USING BTREE,
    INDEX idx_emp_id (emp_id) USING BTREE
)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='倍率変更履歴';

--倍率変更履歴テーブルパーティション化 //年ごと
ALTER TABLE `magnification_his`
    Partition BY RANGE (YEAR(date_added)*100 + MONTH(date_added))
    (
    Partition p201701 VALUES LESS THAN (201801),
    Partition p201801 VALUES LESS THAN (201901),
    Partition p201901 VALUES LESS THAN (202001),
    Partition p202001 VALUES LESS THAN (202101),
    Partition p202101 VALUES LESS THAN (202201),
    Partition p202201 VALUES LESS THAN (202301),
    Partition p202301 VALUES LESS THAN (202401),
    Partition p202401 VALUES LESS THAN (202501),
    Partition p999999 VALUES LESS THAN (MAXVALUE) -- デフォルト値設定
    );

--Table  'nestree'.'session' // セッションID
CREATE TABLE IF NOT EXISTS 'nestree'.'session'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='セッションID';

--Table  'nestree'.'onetime' // ワンタイムキー認証
CREATE TABLE IF NOT EXISTS 'nestree'.'onetime'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='ワンタイムキー認証';

--Table  'nestree'.'admin' // 管理者ユーザー
CREATE TABLE IF NOT EXISTS 'nestree'.'admin'(

)ENGINE=InnoDB DEFAULT CHARSET=utf COLLATE=utf8_bin COMMENT='管理者ユーザー';
