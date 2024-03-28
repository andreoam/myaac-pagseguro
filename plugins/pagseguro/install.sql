CREATE TABLE IF NOT EXISTS `pagseguro_transactions` (
   `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `transaction_code` VARCHAR(50) NOT NULL,
   `account_id` int(11) UNSIGNED NOT NULL,
   `payment_method` VARCHAR(50) NOT NULL,
   `payment_status` VARCHAR(50) NOT NULL,
   `code` VARCHAR(10) NOT NULL,
   `coins_amount` INT(11) NOT NULL,
   `bought` INT(11) DEFAULT NULL,
   `delivered` CHAR(1) NOT NULL DEFAULT '0',
   `in_double` CHAR(1) NOT NULL DEFAULT '0',
   `request` LONGTEXT DEFAULT NULL,
   `created_at` DATETIME NOT NULL,
   `updated_at` DATETIME DEFAULT NULL,
   UNIQUE KEY `transaction_code` (`transaction_code`, `payment_status`),
   CONSTRAINT `pagseguro_transactions_account_fk`
   FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
   ON DELETE CASCADE,
   INDEX `payment_method` (`payment_method`),
   INDEX `payment_status` (`payment_status`),
   INDEX `coins_amount` (`coins_amount`),
   INDEX `delivered` (`delivered`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

CREATE TABLE IF NOT EXISTS `myaac_send_items` (
   `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
   `transaction_code` VARCHAR(50) NOT NULL,
   `item_id` VARCHAR(20) NOT NULL,
   `item_name` VARCHAR(50) NOT NULL,
   `item_count` int(11) UNSIGNED NOT NULL DEFAULT 1,
   `account_id` int(11) UNSIGNED NOT NULL,
   `payment_method` VARCHAR(50) NOT NULL,
   `payment_status` VARCHAR(50) NOT NULL,
   `status` CHAR(1) NOT NULL DEFAULT '0' COMMENT '0 = pending | 1 = approved | 2 = delivered | 3 = canceled',
   `request` LONGTEXT DEFAULT NULL,
   `created_at` DATETIME NOT NULL,
   `updated_at` DATETIME DEFAULT NULL,
   UNIQUE KEY `transaction_code` (`transaction_code`, `payment_status`),
   CONSTRAINT `myaac_send_items_account_fk`
   FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
   ON DELETE CASCADE,
   INDEX `status` (`status`),
   INDEX `payment_method` (`payment_method`),
   INDEX `payment_status` (`payment_status`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;

CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
	`id` INT(11) NOT NULL auto_increment,
	`name` VARCHAR(255) NOT NULL DEFAULT '',
	`type` VARCHAR(255) NOT NULL DEFAULT '',
	`action` VARCHAR(255) NOT NULL DEFAULT '',
	`param1` VARCHAR(255) NOT NULL DEFAULT '',
	`param2` VARCHAR(255) NOT NULL DEFAULT '',
	`param3` VARCHAR(255) NOT NULL DEFAULT '',
	`param4` VARCHAR(255) NOT NULL DEFAULT '',
	`param5` VARCHAR(255) NOT NULL DEFAULT '',
	`param6` VARCHAR(255) NOT NULL DEFAULT '',
	`param7` VARCHAR(255) NOT NULL DEFAULT '',
	`delete_it` INT(2) NOT NULL DEFAULT '1',
	PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `z_shop_categories` (
	`id` INT(11) NOT NULL,
	`name` VARCHAR(32) NOT NULL,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `z_shop_history` (
	`id` INT(11) NOT NULL auto_increment,
	`comunication_id` INT(11) NOT NULL DEFAULT 0,
	`to_name` VARCHAR(255) NOT NULL DEFAULT 0,
	`to_account` INT(11) NOT NULL DEFAULT 0,
	`from_nick` VARCHAR(255) NOT NULL DEFAULT '',
	`from_account` INT(11) NOT NULL DEFAULT 0,
	`price` INT(11) NOT NULL DEFAULT 0,
	`offer_id` INT(11) NOT NULL DEFAULT 0,
	`trans_state` VARCHAR(255) NOT NULL,
	`trans_start` INT(11) NOT NULL DEFAULT 0,
	`trans_real` INT(11) NOT NULL DEFAULT 0,
	`is_pacc` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY  (`id`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS `z_shop_offer` (
	`id` INT(11) NOT NULL auto_increment,
	`points` INT(11) NOT NULL DEFAULT 0,
	`itemid1` INT(11) NOT NULL DEFAULT 0,
	`count1` INT(11) NOT NULL DEFAULT 0,
	`itemid2` INT(11) NOT NULL DEFAULT 0,
	`count2` INT(11) NOT NULL DEFAULT 0,
	`category_id` TINYINT(1) NOT NULL DEFAULT 0,
	`offer_type` VARCHAR(255) DEFAULT NULL,
	`offer_description` text NOT NULL,
	`offer_name` VARCHAR(255) NOT NULL DEFAULT '',
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	`ordering` INT(11) NOT NULL DEFAULT 0,
	PRIMARY KEY  (`id`)
) ENGINE=MyISAM;
