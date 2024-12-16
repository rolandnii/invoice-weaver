DROP TABLE IF EXISTS accounts;

CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_date` date NOT NULL,
  `account_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_balance` decimal(10,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accounts VALUES('1','Operational Account','2023-07-26','12343454545','100000.00','','2','2023-07-26 20:40:56','2023-07-26 20:40:56');



DROP TABLE IF EXISTS chart_of_accounts;

CREATE TABLE `chart_of_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO chart_of_accounts VALUES('1','Purchase Payments','expense','2','2023-07-26 20:40:14','2023-07-26 20:40:14');
INSERT INTO chart_of_accounts VALUES('2','Income for Sales','income','2','2023-07-31 16:28:39','2023-07-31 16:28:39');



DROP TABLE IF EXISTS company_email_template;

CREATE TABLE `company_email_template` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO company_email_template VALUES('1','Invoices','Incoice {invoice_no}','<p>==========================================================<br />INVOICE<br />==========================================================<br />Invoice #: {invoice_no}</p>
<p>Date: {invoice_date}</p>
<p>Bill To:</p>
<pre id=\"invoice-paremeter\" class=\"border border-info p-2\">{customer_name}<br /><br /></pre>
<p>==========================================================<br />DESCRIPTION | QUANTITY | AMOUNT<br />==========================================================<br />Item 1 | 2 | $50.00<br />Item 2 | 1 | $30.00<br />Item 3 | 3 | $25.00</p>
<p>----------------------------------------------------------<br />Subtotal: $155.00<br />Tax (5%): $7.75<br />----------------------------------------------------------<br />Total: $162.75<br />==========================================================</p>
<p>Thank you for your business!</p>
<p>Payment Due By: August 10, 2023<br />Please make checks payable to \"Your Company Name.\"<br />For any inquiries, contact us at:<br />Email: contact@yourcompany.com<br />Phone: +1 (800) 123-4567<br />Website: www.yourcompany.com</p>','invoice','2','2023-07-26 17:05:16','2023-07-26 17:05:16');



DROP TABLE IF EXISTS company_settings;

CREATE TABLE `company_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO company_settings VALUES('1','invoice_prefix','in','2','2023-07-26 17:56:28','2023-07-26 17:56:28');
INSERT INTO company_settings VALUES('2','invoice_starting','1003','2','2023-07-26 17:56:28','2023-07-31 16:17:52');
INSERT INTO company_settings VALUES('3','quotation_prefix','qt','2','2023-07-26 17:56:28','2023-07-26 17:56:28');
INSERT INTO company_settings VALUES('4','quotation_starting','100','2','2023-07-26 17:56:28','2023-07-26 17:56:28');
INSERT INTO company_settings VALUES('5','invoice_footer','','2','2023-07-26 17:56:28','2023-07-26 17:56:28');
INSERT INTO company_settings VALUES('6','quotation_footer','','2','2023-07-26 17:56:28','2023-07-26 17:56:28');
INSERT INTO company_settings VALUES('7','company_logo','company_logo1690815822.png','2','2023-07-31 15:03:42','2023-07-31 15:03:42');



DROP TABLE IF EXISTS contact_groups;

CREATE TABLE `contact_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO contact_groups VALUES('1','Buyer','','2','2023-07-26 17:41:29','2023-07-26 17:41:29');



DROP TABLE IF EXISTS contacts;

CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `profile_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `contact_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO contacts VALUES('1','Individual','','Mikel','mike@mail.com','0553340120','Ghana','','','','','','','','','avatar.png','1','','2','2023-07-26 17:41:41','2023-07-26 17:41:41');



DROP TABLE IF EXISTS current_stocks;

CREATE TABLE `current_stocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO current_stocks VALUES('1','5','98.00','2','2023-07-26 20:29:52','2023-07-31 16:17:52');



DROP TABLE IF EXISTS database_backups;

CREATE TABLE `database_backups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO database_backups VALUES('1','DB-BACKUP-1690366776.sql','1','2023-07-26 10:19:36','2023-07-26 10:19:36');
INSERT INTO database_backups VALUES('2','DB-BACKUP-1690818917.sql','1','2023-07-31 15:55:17','2023-07-31 15:55:17');



DROP TABLE IF EXISTS email_templates;

CREATE TABLE `email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO email_templates VALUES('1','registration','Registration Sucessfully','<h3 style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Registration Successful</h3><p style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><br></p><p style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Welcome&nbsp;{name},<br></p><p><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Your account is ready for use. Now you can login to your account using your email and password.<br><br>Thank You<br>Tricky Code<br></span></p>','','');
INSERT INTO email_templates VALUES('2','premium_membership','Premium Membership','<h3 style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Account Update Sucessfully</h3><p style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><br></p><div style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><div><div></div><div></div></div><div><div></div></div></div><p><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Hello {name},</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Your account has renewed successfully. Your account is valid until&nbsp;</span><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px;\">{valid_to}</span><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">.&nbsp;</span></p><p><br style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Thank You</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Tricky Code</span><br></p>','','');
INSERT INTO email_templates VALUES('3','alert_notification','Smart Cash Membership Extended','<h3 style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Account Renew Notification</h3><p style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><br></p><div style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><div><div></div><div></div></div><div><div></div></div></div><p><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Hello {name},</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Please renew your account before expired. You account will inactive after {</span><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px;\">valid_to</span><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">}. So please renew your account before {</span><span style=\"background-color: rgb(245, 245, 245); color: rgb(51, 51, 51); font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px;\">valid_to</span><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">}. You can contact with your customer support for more information.&nbsp;</span></p><p><br style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Thank You</span><br style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\"><span style=\"color: rgb(85, 85, 85); font-family: &quot;PT Sans&quot;, sans-serif;\">Tricky Code</span><br></p>','','');



DROP TABLE IF EXISTS failed_jobs;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS invoice_item_taxes;

CREATE TABLE `invoice_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `invoice_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoice_item_taxes VALUES('1','5','1','1','Vat @ 10.00%','100.00','2','2023-07-26 17:50:14','2023-07-26 17:50:14');
INSERT INTO invoice_item_taxes VALUES('2','6','2','1','Vat @ 10.00%','100.00','2','2023-07-26 17:50:51','2023-07-26 17:50:51');
INSERT INTO invoice_item_taxes VALUES('3','7','3','1','Vat @ 10.00%','11.10','2','2023-07-26 17:52:50','2023-07-26 17:52:50');
INSERT INTO invoice_item_taxes VALUES('4','8','4','1','Vat @ 10.00%','11.10','2','2023-07-26 17:57:59','2023-07-26 17:57:59');
INSERT INTO invoice_item_taxes VALUES('5','9','5','1','Vat @ 10.00%','11.10','2','2023-07-26 17:59:31','2023-07-26 17:59:31');
INSERT INTO invoice_item_taxes VALUES('6','11','8','1','Vat @ 10.00%','120.00','2','2023-07-31 16:17:52','2023-07-31 16:17:52');
INSERT INTO invoice_item_taxes VALUES('7','11','9','1','Vat @ 10.00%','100.00','2','2023-07-31 16:17:52','2023-07-31 16:17:52');



DROP TABLE IF EXISTS invoice_items;

CREATE TABLE `invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoice_items VALUES('1','5','3','Web Design','1.00','1000.00','0.00','','100.00','1000.00','2','2023-07-26 17:50:14','2023-07-26 17:50:14');
INSERT INTO invoice_items VALUES('2','6','3','Web Design','1.00','1000.00','0.00','','100.00','1000.00','2','2023-07-26 17:50:51','2023-07-26 17:50:51');
INSERT INTO invoice_items VALUES('3','7','2','','1.00','111.00','0.00','','11.10','111.00','2','2023-07-26 17:52:50','2023-07-26 17:52:50');
INSERT INTO invoice_items VALUES('4','8','2','','1.00','111.00','0.00','','11.10','111.00','2','2023-07-26 17:57:59','2023-07-26 17:57:59');
INSERT INTO invoice_items VALUES('5','9','2','','1.00','111.00','0.00','','11.10','111.00','2','2023-07-26 17:59:31','2023-07-26 17:59:31');
INSERT INTO invoice_items VALUES('6','10','5','','1.00','120.00','100.00','','0.00','20.00','2','2023-07-31 15:10:51','2023-07-31 15:10:51');
INSERT INTO invoice_items VALUES('7','10','3','Web Design','1.00','1500.00','0.00','','0.00','1500.00','2','2023-07-31 15:10:51','2023-07-31 15:10:51');
INSERT INTO invoice_items VALUES('8','11','5','','1.00','1200.00','0.00','','120.00','1200.00','2','2023-07-31 16:17:52','2023-07-31 16:17:52');
INSERT INTO invoice_items VALUES('9','11','3','Web Design','1.00','1000.00','0.00','','100.00','1000.00','2','2023-07-31 16:17:52','2023-07-31 16:17:52');



DROP TABLE IF EXISTS invoices;

CREATE TABLE `invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `tax_total` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO invoices VALUES('1','1234','1','2023-07-26','2023-07-26','1100.00','100.00','0.00','Unpaid','','2','2023-07-26 17:45:53','2023-07-26 17:45:53');
INSERT INTO invoices VALUES('2','1234','1','2023-07-26','2023-07-26','1100.00','100.00','0.00','Unpaid','','2','2023-07-26 17:48:36','2023-07-26 17:48:36');
INSERT INTO invoices VALUES('3','1234','1','2023-07-26','2023-07-26','1100.00','100.00','0.00','Unpaid','','2','2023-07-26 17:49:07','2023-07-26 17:49:07');
INSERT INTO invoices VALUES('4','1234','1','2023-07-26','2023-07-26','1100.00','100.00','0.00','Unpaid','','2','2023-07-26 17:49:25','2023-07-26 17:49:25');
INSERT INTO invoices VALUES('5','1234','1','2023-07-26','2023-07-26','1100.00','100.00','0.00','Unpaid','','2','2023-07-26 17:50:14','2023-07-26 17:50:14');
INSERT INTO invoices VALUES('6','1234','1','2023-07-26','2023-07-26','1100.00','100.00','0.00','Unpaid','','2','2023-07-26 17:50:51','2023-07-26 17:50:51');
INSERT INTO invoices VALUES('7','12333','1','2023-07-26','2023-07-26','122.10','11.10','0.00','Unpaid','','2','2023-07-26 17:52:50','2023-07-26 17:52:50');
INSERT INTO invoices VALUES('8','in1000','1','2023-07-26','2023-07-26','122.10','11.10','0.00','Unpaid','','2','2023-07-26 17:57:59','2023-07-26 17:57:59');
INSERT INTO invoices VALUES('9','in1000','1','2023-07-26','2023-07-26','122.10','11.10','0.00','Unpaid','','2','2023-07-26 17:59:31','2023-07-26 17:59:31');
INSERT INTO invoices VALUES('10','in1001','1','2023-07-31','2023-07-31','1520.00','0.00','0.00','Unpaid','','2','2023-07-31 15:10:51','2023-07-31 15:10:51');
INSERT INTO invoices VALUES('11','in1002536734','1','2023-07-31','2023-07-31','2420.00','220.00','0.00','Unpaid','','2','2023-07-31 16:17:52','2023-07-31 16:17:52');



DROP TABLE IF EXISTS items;

CREATE TABLE `items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO items VALUES('3','Web Design','service','2','2023-07-26 17:44:16','2023-07-26 17:44:16');
INSERT INTO items VALUES('2','graphic','service','2','2023-07-26 17:43:45','2023-07-26 17:43:45');
INSERT INTO items VALUES('5','rice','product','2','2023-07-26 20:29:52','2023-07-26 20:29:52');



DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('3','2018_06_01_080940_create_settings_table','1');
INSERT INTO migrations VALUES('4','2018_08_29_084110_create_permissions_table','1');
INSERT INTO migrations VALUES('5','2018_10_28_101819_create_contact_groups_table','1');
INSERT INTO migrations VALUES('6','2018_10_28_104344_create_contacts_table','1');
INSERT INTO migrations VALUES('7','2018_10_28_151911_create_taxs_table','1');
INSERT INTO migrations VALUES('8','2018_10_29_095644_create_items_table','1');
INSERT INTO migrations VALUES('9','2018_10_29_100449_create_products_table','1');
INSERT INTO migrations VALUES('10','2018_10_29_101301_create_services_table','1');
INSERT INTO migrations VALUES('11','2018_10_29_101756_create_suppliers_table','1');
INSERT INTO migrations VALUES('12','2018_11_12_152015_create_email_templates_table','1');
INSERT INTO migrations VALUES('13','2018_11_13_063551_create_accounts_table','1');
INSERT INTO migrations VALUES('14','2018_11_13_082226_create_chart_of_accounts_table','1');
INSERT INTO migrations VALUES('15','2018_11_13_082512_create_payment_methods_table','1');
INSERT INTO migrations VALUES('16','2018_11_13_141249_create_transactions_table','1');
INSERT INTO migrations VALUES('17','2018_11_14_134254_create_repeating_transactions_table','1');
INSERT INTO migrations VALUES('18','2018_11_17_142037_create_payment_histories_table','1');
INSERT INTO migrations VALUES('19','2019_03_07_084028_create_purchase_orders_table','1');
INSERT INTO migrations VALUES('20','2019_03_07_085537_create_purchase_order_items_table','1');
INSERT INTO migrations VALUES('21','2019_03_19_070903_create_current_stocks_table','1');
INSERT INTO migrations VALUES('22','2019_03_19_123527_create_company_settings_table','1');
INSERT INTO migrations VALUES('23','2019_03_19_133922_create_product_units_table','1');
INSERT INTO migrations VALUES('24','2019_03_20_113605_create_invoices_table','1');
INSERT INTO migrations VALUES('25','2019_03_20_113618_create_invoice_items_table','1');
INSERT INTO migrations VALUES('26','2019_05_11_080519_create_purchase_return_table','1');
INSERT INTO migrations VALUES('27','2019_05_11_080546_create_purchase_return_items_table','1');
INSERT INTO migrations VALUES('28','2019_05_27_153656_create_quotations_table','1');
INSERT INTO migrations VALUES('29','2019_05_27_153712_create_quotation_items_table','1');
INSERT INTO migrations VALUES('30','2019_06_22_062221_create_sales_return_table','1');
INSERT INTO migrations VALUES('31','2019_06_22_062233_create_sales_return_items_table','1');
INSERT INTO migrations VALUES('32','2019_06_23_055645_create_company_email_template_table','1');
INSERT INTO migrations VALUES('33','2019_08_19_000000_create_failed_jobs_table','1');
INSERT INTO migrations VALUES('34','2020_07_02_145857_create_database_backups_table','1');
INSERT INTO migrations VALUES('35','2020_08_21_063443_add_related_to_company_email_template','1');
INSERT INTO migrations VALUES('36','2020_10_19_082621_create_staff_roles_table','1');
INSERT INTO migrations VALUES('37','2020_10_20_080849_add_description_to_invoice_items','1');
INSERT INTO migrations VALUES('38','2020_12_13_150320_create_invoice_item_taxes_table','1');
INSERT INTO migrations VALUES('39','2020_12_15_055832_create_quotation_item_taxes_table','1');
INSERT INTO migrations VALUES('40','2020_12_15_102722_create_purchase_order_item_taxes_table','1');
INSERT INTO migrations VALUES('41','2020_12_16_070412_create_purchase_return_item_taxes_table','1');
INSERT INTO migrations VALUES('42','2020_12_17_065847_create_sales_return_item_taxes_table','1');
INSERT INTO migrations VALUES('43','2021_05_04_063645_add_email_verified_at_to_users_table','1');
INSERT INTO migrations VALUES('44','2021_05_07_061448_change_group_id_nullale_to_contacts_table','1');
INSERT INTO migrations VALUES('45','2021_05_07_075752_change_tax_method_nullale_to_products_table','1');
INSERT INTO migrations VALUES('46','2021_05_10_075635_add_company_id_to_quotation_items_table','1');



DROP TABLE IF EXISTS password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS payment_histories;

CREATE TABLE `payment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `extend_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extend` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS payment_methods;

CREATE TABLE `payment_methods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_methods VALUES('1','Cash','2','2023-07-26 20:33:58','2023-07-26 20:33:58');



DROP TABLE IF EXISTS permissions;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES('1','1','dashboard.current_day_income','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('2','1','dashboard.current_day_expense','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('3','1','dashboard.current_month_income','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('4','1','dashboard.current_month_expense','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('5','1','dashboard.yearly_income_vs_expense','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('6','1','dashboard.latest_income','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('7','1','dashboard.latest_expense','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('8','1','dashboard.monthly_income_vs_expense','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('9','1','dashboard.financial_account_balance','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('10','1','contact_groups.index','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('11','1','contact_groups.create','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('12','1','contact_groups.show','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('13','1','contacts.send_email','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('14','1','contacts.index','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('15','1','contacts.create','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('16','1','contacts.show','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('17','1','contacts.edit','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('18','1','accounts.index','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('19','1','accounts.create','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('20','1','accounts.show','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('21','1','income.income_calendar','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('22','1','income.index','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('23','1','income.create','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('24','1','income.show','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('25','1','expense.expense_calendar','2023-07-26 19:57:14','2023-07-26 19:57:14');
INSERT INTO permissions VALUES('26','1','expense.index','2023-07-26 19:57:14','2023-07-26 19:57:14');



DROP TABLE IF EXISTS product_units;

CREATE TABLE `product_units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO product_units VALUES('1','kg','2','2023-07-26 20:15:23','2023-07-26 20:15:23');
INSERT INTO product_units VALUES('2','Liters','2','2023-07-31 16:15:48','2023-07-31 16:15:48');



DROP TABLE IF EXISTS products;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `product_cost` decimal(10,2) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO products VALUES('1','5','1','100.00','120.00','kg','','','','2023-07-26 20:29:52','2023-07-26 20:29:52');



DROP TABLE IF EXISTS purchase_order_item_taxes;

CREATE TABLE `purchase_order_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint NOT NULL,
  `purchase_order_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchase_order_item_taxes VALUES('2','1','2','1','Vat @ 10.00%','1000.00','2','2023-07-26 21:03:53','2023-07-26 21:03:53');
INSERT INTO purchase_order_item_taxes VALUES('3','2','3','1','Vat @ 10.00%','10.00','2','2023-07-31 16:22:09','2023-07-31 16:22:09');



DROP TABLE IF EXISTS purchase_order_items;

CREATE TABLE `purchase_order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchase_order_items VALUES('2','1','5','','100.00','100.00','0.00','','1000.00','10000.00','2','2023-07-26 21:03:53','2023-07-26 21:03:53');
INSERT INTO purchase_order_items VALUES('3','2','5','','1.00','100.00','0.00','','10.00','100.00','2','2023-07-31 16:22:09','2023-07-31 16:22:09');



DROP TABLE IF EXISTS purchase_orders;

CREATE TABLE `purchase_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `supplier_id` bigint NOT NULL,
  `order_status` tinyint NOT NULL,
  `order_tax_id` bigint DEFAULT NULL,
  `order_tax` decimal(10,2) DEFAULT NULL,
  `order_discount` decimal(10,2) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL,
  `product_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `paid` decimal(10,2) NOT NULL,
  `payment_status` tinyint NOT NULL,
  `attachemnt` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO purchase_orders VALUES('1','2023-07-26','1','3','','1000.00','0.00','0.00','10000.00','11000.00','1100.00','0','','','2','2023-07-26 20:31:20','2023-07-26 21:03:53');
INSERT INTO purchase_orders VALUES('2','2023-07-31','1','2','','10.00','0.00','0.00','100.00','110.00','0.00','0','','','2','2023-07-31 16:22:09','2023-07-31 16:22:09');



DROP TABLE IF EXISTS purchase_return;

CREATE TABLE `purchase_return` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `return_date` date NOT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `payment_method_id` bigint NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `product_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `attachemnt` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS purchase_return_item_taxes;

CREATE TABLE `purchase_return_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint NOT NULL,
  `purchase_return_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS purchase_return_items;

CREATE TABLE `purchase_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS quotation_item_taxes;

CREATE TABLE `quotation_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint NOT NULL,
  `quotation_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS quotation_items;

CREATE TABLE `quotation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(8,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS quotations;

CREATE TABLE `quotations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `quotation_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint NOT NULL,
  `quotation_date` date NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `tax_total` decimal(10,2) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `invoice_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS repeating_transactions;

CREATE TABLE `repeating_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trans_date` date NOT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dr_cr` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payer_payee_id` bigint DEFAULT NULL,
  `payment_method_id` bigint NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `status` tinyint DEFAULT '0',
  `trans_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS sales_return;

CREATE TABLE `sales_return` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `return_date` date NOT NULL,
  `customer_id` bigint NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `product_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `attachemnt` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS sales_return_item_taxes;

CREATE TABLE `sales_return_item_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_return_id` bigint NOT NULL,
  `sales_return_item_id` bigint NOT NULL,
  `tax_id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS sales_return_items;

CREATE TABLE `sales_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sales_return_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `quantity` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `tax_id` bigint DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS services;

CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_id` bigint NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `tax_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO services VALUES('1','2','111.00','','','','2023-07-26 17:43:45','2023-07-26 17:43:45');
INSERT INTO services VALUES('2','3','1000.00','','','Web Design','2023-07-26 17:44:16','2023-07-26 17:44:16');



DROP TABLE IF EXISTS settings;

CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','mail_type','smtp','','2023-07-26 16:50:26');
INSERT INTO settings VALUES('2','backend_direction','ltr','','2023-07-31 13:49:11');
INSERT INTO settings VALUES('3','membership_system','enabled','','2023-07-26 10:21:02');
INSERT INTO settings VALUES('4','trial_period','7','','2023-07-26 10:21:02');
INSERT INTO settings VALUES('5','monthly_cost','10','','2023-07-26 10:21:02');
INSERT INTO settings VALUES('6','yearly_cost','99','','2023-07-26 10:21:02');
INSERT INTO settings VALUES('7','allow_singup','yes','','2023-07-31 13:49:11');
INSERT INTO settings VALUES('8','company_name','Keepo122','2023-07-26 10:17:29','2023-10-07 07:00:14');
INSERT INTO settings VALUES('9','site_title','Keepo','2023-07-26 10:17:29','2023-10-07 07:00:14');
INSERT INTO settings VALUES('10','phone','0553340120','2023-07-26 10:17:29','2023-10-07 07:00:14');
INSERT INTO settings VALUES('11','email','mabbey615@gmail.com','2023-07-26 10:17:29','2023-10-07 07:00:14');
INSERT INTO settings VALUES('12','timezone','Africa/Accra','2023-07-26 10:17:29','2023-10-07 07:00:14');
INSERT INTO settings VALUES('13','currency','GHS','2023-07-26 15:53:02','2023-07-31 13:49:11');
INSERT INTO settings VALUES('14','currency_position','left','2023-07-26 15:53:02','2023-07-31 13:49:11');
INSERT INTO settings VALUES('15','thousand_sep',',','2023-07-26 15:53:02','2023-07-31 13:49:11');
INSERT INTO settings VALUES('16','decimal_sep','.','2023-07-26 15:53:02','2023-07-31 13:49:11');
INSERT INTO settings VALUES('17','decimal_places','2','2023-07-26 15:53:02','2023-07-31 13:49:11');
INSERT INTO settings VALUES('18','date_format','Y-m-d','2023-07-26 15:53:02','2023-07-31 13:49:11');
INSERT INTO settings VALUES('19','time_format','24','2023-07-26 15:53:02','2023-07-31 13:49:11');
INSERT INTO settings VALUES('20','email_verification','enabled','2023-07-26 15:53:02','2023-07-31 13:49:11');
INSERT INTO settings VALUES('21','from_email','mike@mail.com','2023-07-26 16:50:26','2023-07-26 16:50:26');
INSERT INTO settings VALUES('22','from_name','peepo','2023-07-26 16:50:26','2023-07-26 16:50:26');
INSERT INTO settings VALUES('23','smtp_host','sandbox.smtp.mailtrap.io','2023-07-26 16:50:26','2023-07-26 16:50:26');
INSERT INTO settings VALUES('24','smtp_port','2525','2023-07-26 16:50:26','2023-07-26 16:50:26');
INSERT INTO settings VALUES('25','smtp_username','a7c7b1b525307b','2023-07-26 16:50:26','2023-07-26 16:50:26');
INSERT INTO settings VALUES('26','smtp_password','fe691dacb2b2e1','2023-07-26 16:50:26','2023-07-26 16:50:26');
INSERT INTO settings VALUES('27','smtp_encryption','tls','2023-07-26 16:50:26','2023-07-26 16:50:26');
INSERT INTO settings VALUES('28','language','English','2023-07-31 13:50:58','2023-10-07 07:00:14');
INSERT INTO settings VALUES('29','address','','2023-07-31 13:50:58','2023-10-07 07:00:14');
INSERT INTO settings VALUES('30','logo','logo.png','2023-07-31 15:05:14','2023-07-31 15:05:14');
INSERT INTO settings VALUES('31','_token','KLVlq7oabtjCy9lBoAkcgtJ7Hn59PSxUPePxr5s5','2023-10-07 06:58:07','2023-10-07 07:00:14');



DROP TABLE IF EXISTS staff_roles;

CREATE TABLE `staff_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO staff_roles VALUES('1','Sales','','2','2023-07-26 19:55:11','2023-07-26 19:55:11');
INSERT INTO staff_roles VALUES('2','Shop Attendants','','2','2023-07-31 16:25:54','2023-07-31 16:25:54');



DROP TABLE IF EXISTS suppliers;

CREATE TABLE `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO suppliers VALUES('1','uuuui','uiuyyuyu','iyiyiyyu','ojjjkj@jkjjkj.com','0224457845','','Afghanistan','','','','2','2023-07-26 20:11:32','2023-07-26 20:11:32');



DROP TABLE IF EXISTS taxs;

CREATE TABLE `taxs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO taxs VALUES('1','Vat','10.00','percent','2','2023-07-26 17:07:21','2023-07-26 17:07:21');



DROP TABLE IF EXISTS transactions;

CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `trans_date` date NOT NULL,
  `account_id` bigint NOT NULL,
  `chart_id` bigint NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dr_cr` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payer_payee_id` bigint DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  `purchase_id` bigint DEFAULT NULL,
  `purchase_return_id` bigint DEFAULT NULL,
  `payment_method_id` bigint NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `company_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transactions VALUES('1','2023-07-26','1','1','expense','dr','1100.00','','','1','','1','11wqw333','','','2','2023-07-26 20:41:09','2023-07-26 20:41:09');



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint DEFAULT NULL,
  `membership_type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `status` int NOT NULL,
  `company_id` bigint DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `last_email` date DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Michael Abbey','mabbey615@gmail.com','$2y$10$hCB3WQ5/GgunPZ4wDeiYou2B2lFDn8weuxRib49f96AyL5Hk84o0.','admin','','','profile_1690366747.jpg','2023-07-26 10:16:50','1','','','','','','','','2023-07-26 10:16:50','2023-07-26 10:19:07');
INSERT INTO users VALUES('2','sales','sales@sales.com','$2y$10$ya4U0QDwNHxRWR3atscIM.qIjJmymKMh2/Fo0zFg.Tr.1T/G2FnyG','user','','trial','default.png','2023-07-26 16:51:16','1','','','2023-08-02','','','','','2023-07-26 11:16:28','2023-07-26 16:51:16');



