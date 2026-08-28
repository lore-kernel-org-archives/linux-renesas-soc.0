Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686712F9984
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924164; cv=fail; b=gWTnfqmu58kuXFaJr8+44aP72GE+OcgjPkaNF9dzslaoDK62UnGBX2+RSpM2oF0iz2zyzgUo6BMQWB/dCqANQcyph0yRCdN+a4WxPuLNDlsNGqRZMxbyblHcH2iYMXQdrjEjSjcKkeDBznDbdrce/JWZeCZtU6OTUEGb5d1oNzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924164; c=relaxed/simple;
	bh=lR0mmMOOshrEHckm934MH+A0yMrjSbFg3LKhNwczAU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ji9f8IuVOj8TYahRoW3q0sZjtpNCOuB1WwkvL77tG3g/hnTnAa1vpix7ZAzu5AiM+QV/u/iJTtExQ5F88GCKcGKGsCVR0IvIzKMMtWjF9gZXOR2Nv0PGQHBTjk7whbsRAn2o8nT6/yWE0O4wJ64qt2yr1SUrRsxvMWwAgHW4068=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aljcK6qZ; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aljcK6qZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhMn9jqvrAHdOcjlrPFfL/uv4FKvOyaJqKxw3nd6kRtE4C3WX5d/+sbhEsQF/k1nWIHlC+tzRNjYQNaqIauYw7weg7Qd70hMrlJl2caexqD/5IvcpxE7UIBTNoj2VuTCZI/RfDuD7RqtA90lU2eAnsUHw9Bo8uNLT3eTDn0sGIXlCBbh5Gxn4XgncC5Ps9Xsm3b+Kcx8JtFXtzd3Enpgb0CbgssmC4yCA14+XL2/vsXDnKeKZ0D/RCqK+76y9Y2nWGOI+t5atH/8leHyBr7Ksg8iNT7PW21IbdKD6atLiMtyJv87c22PsGBhDD4EEDIUdcjf/uiq0Lq/iAeZLNWQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgMr3G8vfYfON1vgnxnrz9hynKjuGqCcaJGN7OT015g=;
 b=Hap2EiaiIpN1wofVYnkUeJsQwpSlpCnGj+8ARUbjQUDVcTKGOcCzpc2rxdyg5qwfyQqm3rnVgmd6YvX6RXzGI4bKxeZvB1pBEzZCdymb78gKfqfXgm+dKVcCkuZ6K53izIarf6QKmQJXzFRM5jp7fxH97lRGbKfrKgK3wJAH1ygbYdr+MugCHt3pwryYNRNWEVr2FqGzgVIHV2VNefoNxvuSRml2nB+2FgFXNjDEadhA19ifqj56omJ36CcHTob4vJOIm70YmA2Codu+r2H1uceBqZz8yP3ddy9QgERoo5YtFtdE2ZbVUvh/p1ZcfbvcVB27Vgkh1KDeMsQ9kPMKXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=bp.renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=bp.renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgMr3G8vfYfON1vgnxnrz9hynKjuGqCcaJGN7OT015g=;
 b=aljcK6qZclkhaRuBH1LWU3PbvcgmgZtx4PhFE+DFp189UYKQg45SXDQWjEdN83mNld/ZG4xU6V3wjpWn4phXn6gXWtTaaUbS58RWcTvse6SBepKqvmfXJF7feLbi3fRnte+BKoKKcxoE+rULvtbVMncQBz8MouKdeoslU+XQTNc=
Received: from TY4PR01CA0028.jpnprd01.prod.outlook.com (2603:1096:405:2bf::17)
 by TY4PR01MB13013.jpnprd01.prod.outlook.com (2603:1096:405:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 13:35:32 +0000
Received: from TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2bf:cafe::36) by TY4PR01CA0028.outlook.office365.com
 (2603:1096:405:2bf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 13:35:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=bp.renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bp.renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of bp.renesas.com
 designates 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD9.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 13:35:32 +0000
Received: from biju-VirtualBox.adwin.renesas.com (nld-5cg2232q0r.diasemi.com [10.24.0.28])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 7C10D3000242;
	Fri, 28 Aug 2026 22:35:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v9 0/5]  Add RZ/G3L USB2.0 support
Date: Fri, 28 Aug 2026 14:35:00 +0100
Message-ID: <20260828133509.276281-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD9:EE_|TY4PR01MB13013:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 106eeb5d-88e2-40c3-eaa3-08df05093b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	hZ4+8neJDOmGWCdoecHlUVOJ9NzGS/0ZsKs8UcN560keTEEJOS7nKr8lKEy3k5zZ9uSvhhqkEN/KCm1Gx33Zd0p1OlrC6XfdlSzzJ4OonBpTfpl4bPIxUO0B2UNfdJ1vwh99St1rSqZ5JWh1yYHBSRLcLJzhAwKpLG9UNA/6gmhYmiEuRzFG8LatN/uuTU8nYa+lchuin0nAq3FXQi9cHUPugBCHt9eTV9SSdM3oR5WGBXk+reRIC40Z2A/+DVq61ElbR2IgSklpTfLEnEUGzgV/16Y4qa6aumzTkCxg6mFbdLO8HN4jkm5hdW7vReRpJ1Khvr1re9nEbHp9aRDJMVxv9wWdzJeLkE021yi0sL37p87XmcJJ0WdCAfg78bSaC0Qj2FyK32Q3S1ZHhWN42Wu0cg0+vl9N8ps3zowbjiPW6nEH/OX2hfAFGZsz6Arm7EEGYE1e9i33zYMA/qTSZ/EpCxNfDLuuSA+0N5jApdEKqOPvyu4fgY8gX6V+7/h0lePunwHONS1UBjLYuu7RE9iRdD6GoVPZFLzujvGM/nXnF1FKdz0pUlZwoEIr/y44erNOQ0IHdbOHZmnx4kCTjDEPmuwDefmWV8fpR+HvcgNQfJqZ4eIX9sKzH3rTFR9NiDahCQs0RQy4jR4WRR7J3J/O69CgE766XadYW5wF1ZA=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TIHj8zt5pO/EzxePv5/Nr1bWHgAHEFzU73EGOpLhK3kYv4HBY6U2Ww8R4hG3ruaCo6/2Gjadt1nf6CUU6ECgkcwdD9B2hBkIqPZvUp+9FzhwrB5dx293LAzOcuSCTcsLhTLmRkGrIJlL7tQpxm/zwWwh119fP0VWbOWRXkBgh37Twa8nLANQUAS8E15fus0dMhUMxGoGp2xlyXaOOV6GqBK5VRjEWZ2IPnycJ63SD4FHEFt6Av8fAgWWDyjVSk6oBI25dnDIAYePkEhMKDNMmSXDDsti4cB6o6my88mC1O4OOyTa8x2BaXf1mbVJBrhjxZm7XBOqDEbNrJANg9lv69RH4zPpUHcCGUvqC0fuHu4i/wAqmWCU/ZPo4TyoA+Rv3L6lkNvbygjjxSte/Pe/O9hiFjrMAUCkQSHQknJI/s39t7iKYHLqh2/NjymEsZJf
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 13:35:32.2184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 106eeb5d-88e2-40c3-eaa3-08df05093b99
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD9.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13013

Hi All,

This patch series aims to add USB2.0 support for the RZ/G3L SMARC
EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
port 1. This series migrates regulator driver to use id-table so there
is hard dependency between reset driver and regulator driver.

Merge strategy:
  An Ack/Rb tag from Regulator Maintainer for patch#1 and #5.
  All patches - Reset subsystem

This patch series has functional dependency on [1].
Patch#4 has build dependency on [2]
[1] https://lore.kernel.org/all/20260826122742.153643-1-biju.das.jz@bp.renesas.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=d51fc9d4cd6eb18ac82913d83ecf7bd8c85f71ee

v8->v9:
 * Replaced pwrseq_power_on() with pwrseq_enable()
 * Replaced pwrseq_power_off() with pwrseq_disable()
 * Dropped redundant devm_add_action_or_reset() for pwrseq.
v7->v8:
 * Dropped SoC dtsi patches and will post later.
 * Collected tags for regulator driver and binding.
 * Avoided code duplication by moving devm_add_action_or_reset() to
   rzg2l_usbphy_ctrl_pwrrdy_init().
v6->v7:
 * Dropped PHY subsystem patches as it is accepted.
 * Merged patch series [2] to here
 * Collected the tags.
 * Added additionalProperties: false in regulators node.
 * Updated commit header of patch#6
 * Moved the host enable patch.
 * dr_mode changed to 'host' as function is not enabled yet.
 * Updated commit description for patch#9
 * Updated dr_mode = "host" to "otg" in {e,o}hci0 device nodes.
 [2] https://lore.kernel.org/all/20260707145135.247565-1-biju.das.jz@bp.renesas.com/#t
v5->v6:
 * To avoid breaking bisectability, prepared a single patch that
   does the "rzg2l-usb-vbus-regulator" -> "rzg2l-vbus-regulator"
   rename in both regulator and reset drivers and that could be
   merged into both trees.
 * Replaced dev_err->dev_err_probe() in error path of
   rzg3l_usb_vbus_regulator_probe().
 * Retained the tag as the change is trivial.
v4->v5:
 * Collected Ack tag for regulator driver changes.
 * Dropped renesas,sysc-pwrrdy for RZ/G3L as pwrrdy signal is modelled as
   power sequence.
 * Dropped the tag from Conor due to above change .
 * Replaced the variable regulator_driver_name->regulator_name in struct
   rzg2l_usbphy_ctrl_info
 * Switched to power sequence consumer for controlling pwrrdy signal.
 * Updated commit description for patch#3.
v3->v4:
 * Updated cover letter with merge strategy
 * Reorder the phy binding patch for easy merging.
 * Updated the commit description for patch #2,#3, #4.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
 * Migrated to id_table match using driver_name and reduced the length
   < 24.
 * Dropped rzg3l specific platform driver.
 * Dropped the tag for regulator driver,
 * Added id_table handling by introducing a common probe().
 * Dropped renesas,sysc-pwrrdy property for usbphy-ctrl node.
v2->v3:
 * Replaced items->enum in reset controller bindings.
 * Collected the tag for reset binding patch.
 * Dropped clock patch as it is accepted.
v1->v2:
 * Dropped patch#6(Introduce helper for regulator registration)
 * Passing pointer to an array of regulators to make it scalable.
 * Dropped regulator1-vbus and added a regulators group node.
 * Updated commit description for patch#1,#4,#6,#7,#8,#9 and #10.
 * Added enum instead of const in the compatible section.
 * Updated schema check.
 * Collected tag for PHY binding patch.
   in the regulator driver.
 * Added regulators group node and its children in SoC dtsi.

Biju Das (5):
  regulator: renesas-usb-vbus-regulator: Rename platform device to
    rzg2l-vbus-regulator
  dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L support
  reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
  reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
  regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator
    support

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  41 ++++++-
 .../regulator/renesas-usb-vbus-regulator.c    |  75 ++++++++++++-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 100 ++++++++++++++----
 3 files changed, 191 insertions(+), 25 deletions(-)

-- 
2.43.0

