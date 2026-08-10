Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0D7388862;
	Mon, 10 Aug 2026 07:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348333; cv=fail; b=l+4PZMcoIdnZUvNosvBu0R0F5nD7UYpeiQKqcud2JXOv9CmsQSLqFz18vYTfexauC4wYUFJb78pztyZsvLe0X0t0Hvbqos6rIS2xwqVbmHQRxBUClXDRJEjzC654+nDi7zc9LNpdpxmVt0KV2KSxc8IDiXcl/ViH5sA2F7HWidc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348333; c=relaxed/simple;
	bh=LLNYlY9IEyMjjetcamt3g2R1Ip7DFEd1djrraawhm6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b1lFfrxE7ZnDsQuXyxFUe/tqLT1YeOU4XiuAEfOktiIUdrM0ooGuGcAKNivWrITN/EV0pt9uC4qiChZ9kC7m6efu/zm6u4INFtLJJScuqq7I5nuhtcJZlNKECWwROJ9UqqJbqIzA24lgsTRDcrRxkFuF6HpP8wCUzghBEIWohek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jHK7nbxI; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jHK7nbxI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjG1j3x0X/miw8B0qIiBi5wmYVzkhPCwVeO7OUL+nwxczbVyrFncIl1TXH+7dbFa7LwYfHHzC76bIac1CoNHQk5uDuqUMlm4gbCkypesTGnmCA91bDOsbZJFBqHqeVtASROthLNrRRdCcuk23fKDEckJVccecmlJwG58k+h6FL7r/sJVYhPRFOQz4c+2mZK91ggkIWXRnfnjoPd2BAnW2OB8yMNaeQVz8ue9fFaSKYBDWm/MNJsOKR0weXr3WQfEo8+5a9JIYv5y+BcyLwVeQtzeS5AGwRGYosYoKhOcCyEkMbqJDqbenkspQuIPU3kX9M0+PGjO+ZnS+Mf/vevD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPIc1WlQdc6VEqj7GBcXQcHBhKpk/KPtazcwyqmKUKw=;
 b=gy6TG0cRQIZ8XBn+056yzPkoxZaq/X0syE3FAudGNSNKJsmvSDc7W3QNAvk8iX2PMFOfmphg4PjRJCdIDn4r+GlM8pQNdykIrmdf/TH/zMyGE71B5GnH9+RQdu2QxF8ZtU91W/4MdvWtybU1Af1Al3amkQ2uGYjxM5pP73QhsekBDfs3ZTJyS0q/dpMMrp3+wrXjWRv9HgqWNlZLBbcMXh0Yh9Rkz4FFSkv0kFueICQejRx1ty9JtMtjQWGyObQs/45KdUfaft+HMpgZx+dROsT0aGhtsPlICpfKTadgUjwjPMk7omZGxUPvCZEFLQmNvRlaYouv28FWYE3afKthPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPIc1WlQdc6VEqj7GBcXQcHBhKpk/KPtazcwyqmKUKw=;
 b=jHK7nbxIcHKG/32qlyhSeqX56HknBXY4lu6+9gD041PAofZ3BhtXbd9BfbMF9jU6IqC1c6mP4WGb9SLC5dNwyTznUGxRl/+TM15BdkV2fX0jNkmvBRYDmL+ObVIQjo3Ikpz5thdd3tSR175xBPJCcIrmjcOqNKS/GvZp+0kewRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB14721.jpnprd01.prod.outlook.com (2603:1096:405:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:52:09 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:52:09 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@lysator.liu.se,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	peda@axentia.se,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Ulf Hansson <ulfh@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Josua Mayer <josua@solid-run.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 1/1] mux: Add driver for Renesas RZ/V2H VBENCTL VBUS_SEL mux
Date: Mon, 10 Aug 2026 09:51:41 +0200
Message-ID: <34bd85766a9ef4df844fd20208b503177776b589.1786347402.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786347402.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1786347402.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY7PR01MB14721:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c4e2b5-eef2-4274-3c06-08def6b447ba
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|52116014|56012099006|11063799006|22082099003|18002099003|6133799003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	38EI1SRf3jU/UEwKkMbIIc2rKHX+DbzEP99s+2MNdsceM9EgzEGePXRhY4qunLzuSUJdBAHdWx+WcwKOor2WNX6tlrENy9ePI0aROzOZfhm/rSAKWNIwJx6Ap5c/ZNh5Zr/I2z2y16imuXekZ37czEIs5g5SGUc6lP+8YDl2MWOJv4gMGiEi/s+yb48QlvX1N0HL92SeCtrkUJrAxuYA7lpeBKa/pqczdtk7APpqf1iasRa8JYvRWwV78y6RuStsR2xufFiQPs9dzL4xIFjoyoYh3Y/Br79/1H3gPurTc0NyxbgGWUQmfjGfEX871E9x5vGbZ03L7TTTt+sJI9WsyosiUV66/i2yBtuiYdgSUhaKeDGh8jJ8ny/TqoNEY2WoN6EpWhE9L1MLowOS70LLwzgkTEQ6f5uvf7AIukjZZCYC3Fjg7gb/RqIQnwZopX2C92N+5/MriK2l0SJNVu2jikvYOdx0ZlEivwxjSG4JzPCTR7qbaf7RTIjtrR89KFK4BPb1OTX5ibVshO43xSxuFEEjJeF78yLLgxEBJzUjSU6KlkLPGdziReMacBUJ8BqgbTV461DRL4LMJYy3aP5mUyv+WV3hU91mZua6/Bno4ecn7gxqOpLrnJFp2iqpYZKD66CURxhWAt0OJLdahX7A0puvfua8FLsWQVYhmUJvdcov5R9YC9C/3LBv0xFOikAa4xnDUu43oqekZirOSemr01JjtEpo23EYy+seQr3PANw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(52116014)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU9WdmIxZ2Q2NEI5WW05ek8wbEJHbG55Mng3WWdNSFJlSnhZeEZzSlJHOTFD?=
 =?utf-8?B?R0RHTEJRUTliV05HUlhtcGttTUxUR2lrZ3FISVNGKzExQ0Y2M3ZNZm85U0E3?=
 =?utf-8?B?M0hsZVkrekV0TjVpRXBRczVVc1o0NGJYaWw1KzR3VFZzNytYUm5XblNhN2or?=
 =?utf-8?B?UCs0SUNtREdKRnBaaVBuZ0h1MHBhSlN4UDRjZURxL2JaZUJXaE5DajVZeE1Y?=
 =?utf-8?B?SjNpenE5d3BLL29SYW1nVlh2aXpQc1A2cmcyck9WUjNQdE92b3ZFc3BONWlx?=
 =?utf-8?B?bHhnSWNKN25Fd1kzL09EMkVYdmk4cHRPWmdHUjRwRkdoa0hHMXZFWkp1anZo?=
 =?utf-8?B?ditaeEN0RVJwMkJjb1ZGZGtoR3M4NlU2SVI5Zkt1TXJoMTNSaGZzNUlnQmZY?=
 =?utf-8?B?S3J1eTBIMXVXL204T0tlbTZ1czRnNUR3RXlodlhyQTVjZUNmRWFtWGc3ZlpO?=
 =?utf-8?B?S2psc1BBRHlPL25abzlZNjl6TzZGaDBWQ3RWUW1MM0drWTRGaEF5TXJ0M3ZV?=
 =?utf-8?B?djlFaTA3YTJ0TStQUzBnWGFHNVlXUndEWWJPaVZIOVVCRVNSemhjM1RIWnI5?=
 =?utf-8?B?L1NSRTNPc3lYRGV3N1lDa0xwZ0FjT29ScVgwaGd5cDUrQVVlU1pvMnVRZ2lD?=
 =?utf-8?B?SW51M01vbjFXQk1GTE9lcHljcGVMd3M3R25oZ2kyTmJRaFgxT3FrOWJaZllP?=
 =?utf-8?B?WnFFaTNzU21NcndEUVZvcFltdDRSYTBLZURaRUFjbDJIT29qbERiREloUlAz?=
 =?utf-8?B?VXNpNG94QThzTXdwbUxOczFWdDRVdEJrOFlpYTlRSVJBYkdDQW1Hd0JDOFhv?=
 =?utf-8?B?QjlZa0NHNnVuVysvNXFNVU1vN1gxUXVGZWZxcy90cGlSR3Q3QkN6c1VlZENn?=
 =?utf-8?B?V2VxbGdLbWFmanJwSUhYRFFhWTcvSElqaU96YytzT0l3WkRvOXlkeHU2bFhz?=
 =?utf-8?B?RVRYdVYrZExWMFpZSTk5eUpjQjczdS9oY3hZMlJjWC9Lc1VKRkpHVEhaZFdP?=
 =?utf-8?B?SnlVMk5nMjg3Zzl3djVBRlFJTXF2K3l2aGlLdDAwUjR2b3pUZ2dxRWJjbXoz?=
 =?utf-8?B?bTA2aHFwOWUxeTgxakQyTzYyT2FzNzd3bGlEYUxmNnllM24vYTFqNUVBWmZC?=
 =?utf-8?B?MnNIM1JlU1E2YWVUeFlpdDd1MUl2T0NxVllFUkxkVjFNaS9oV0Q1Zk03SWFr?=
 =?utf-8?B?MUh2a0syQTJVSk5STFlSZndZMlpFTUVCSnV5bE92b05EajI5WjRGVFJPSEtQ?=
 =?utf-8?B?OUhmTkRpakplYWpSVSthZ3BaWnVBKzlSWFQwdWVRYVZXaWt6L0MxTVZkZit6?=
 =?utf-8?B?c0xOanhBN01IMTFMYzJQUUxya3FCQTcreWtxQzk4YnVZVDltK0U3em9ZVXR6?=
 =?utf-8?B?WFBkdE0xTzBxdVBRanlrTkMvUjB0RGMxZFFEd1dRamxpTDlna1d2RXdwZVVF?=
 =?utf-8?B?VWhZMkpsdFl6T2JjdDdLWllGV2hHb2JibFR4Y1NkdVdENit0d3dNakdSemk1?=
 =?utf-8?B?SE9RL0N1dTFZazBtTjRRcFl3eGEvZWtOZHhBdi9MNHBLbFVCdUJLdS8ya2NB?=
 =?utf-8?B?VjVRRHRxNkJnWHZLb3FTY25QMzlKbG5IL01la24wQ3VjMFRJYWttS2YzTWRI?=
 =?utf-8?B?T2tYclVPb05hTHJkcWgzZzZEUGlKb1IwWktEdkVURjBhWlN5ZDNTVlU0ekxY?=
 =?utf-8?B?bDYrZWd4MzFjSkRUZDNiTFJHU3JxWThndnVWUjZYVUlzdnZFc203WDFidHBV?=
 =?utf-8?B?Nk5ORThFZFFteTdPUHRHbUo0d3ZLSStOOEJ5eHd5aFVaVElFS1dJN3BaYzBt?=
 =?utf-8?B?UFJteTVtVmhyekdhUXpLWVhtTnJxQXlCNWp6MVNiU0xtbEczc2k3VDhjUlBp?=
 =?utf-8?B?Nml5ZEtXZm9nZXE1TnRjWHhRNkNqSDk3QTliR28yZXdXV0tuMVFjZzA3SHp4?=
 =?utf-8?B?QXpBd1RzNSszR3ZmYmI3VzRSemhMWUpMbWpKWlkxSEJFKzVuM245RGxjM0NN?=
 =?utf-8?B?ZnJ0WHJYVVBROGFzUFZkd0ZGdWlvTURzQ2grM3dCNFBVTUtGZVVkclYvT1p2?=
 =?utf-8?B?TWdLV0JWNzllOFp0TmNVZjJDOUxtMGZBYlZ5aWdwdDdQNk0rbjNFeWIrTUxh?=
 =?utf-8?B?RG9hZ0svZU4xcUJBZkFBWWgrTFYzbTVOcW1VMTNkRjF1QVg2eXo1T3M3VzdF?=
 =?utf-8?B?ci92RkJLb0hxdXVoK2FVa0hzL1EwSklKMFQ5VXRQK25rTlVvWHNFcSt1aUJR?=
 =?utf-8?B?bmhRTDA1YXhoWnJ0UWNhWVFqSElWc2pvMUdZYjRHbnVPb3N2UVZML284K2xr?=
 =?utf-8?B?Rjg3WmJTZmlYaytxMUlGODZWUFRCcTBVcExsb2xoZ2RsSFJEcDYzWVFyeGk5?=
 =?utf-8?Q?GPUb6RFfGf/Ur2uLpSQai1wUvF0ZvhQmJ89mX?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c4e2b5-eef2-4274-3c06-08def6b447ba
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:52:09.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MOmtH4bInQnnaaHkFG9btaOYRczqGB1BTQPeW16xtU0/oe+RdRF3pIkz3fNi6jTwMt6nXCxsG8wXqjP3dZawk1ZpVthzdkkdKMvaB8efmh6ELHXWQBpOshRkdbjtG3M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14721

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v12->v13
 - Renamed CONFIG_MUX_RZV2H_USB_VBENCTL to CONFIG_MUX_RZV2H_VBENCTL and
   propagated the rename to the source file and module name.
 - Dropped the unneeded "depends on OF".
 - Added the missing "To compile the driver as a module" paragraph to the
   Kconfig help text.
 - Used the REG_FIELD() macro instead of open-coding struct reg_field, and
   made it const to keep checkpatch --strict without warning.
 - Used dev->parent instead of adev->dev.parent in dev_get_regmap().
 - Collected Reviewed-by tags from Alvin and Prabhakar (the changes above are
   cosmetic, please let me know if you want them dropped).

v11->v12
 - No changes, just rebased on top of next-20260714

v10->v11:
 - No changes.

v9->v10:
 - No changes.

v8->v9:
 - Fixed driver comment year (2025 -> 2026)
 - Switch from devm_regmap_init_mmio() to dev_get_regmap().
 - Drop unnecessasry include bitops.h, of.h, property.h and
   drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
 - Collected PZabel tag.

v7->v8:
 - No changes.

v6->v7:
 - No changes.

v5->v6:
 - No changes.

v4->v5:
 - Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
 - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
 - Updated commit msg.

v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig         | 13 ++++++
 drivers/mux/Makefile        |  2 +
 drivers/mux/rzv2h-vbenctl.c | 81 +++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 drivers/mux/rzv2h-vbenctl.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 6d17dfa25dad..eb34457beaab 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -70,6 +70,19 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_VBENCTL
+	tristate "Renesas RZ/V2H VBENCTL VBUS_SEL mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	select REGMAP
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for the VBENCTL VBUS_SEL mux implemented on Renesas
+	  RZ/V2H SoCs.
+
+	  To compile the driver as a module, choose M here: the module will
+	  be called mux-rzv2h-vbenctl.
+
 endmenu
 
 endif # MULTIPLEXER
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..0854c04613b9 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-vbenctl-objs		:= rzv2h-vbenctl.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_VBENCTL)	+= mux-rzv2h-vbenctl.o
diff --git a/drivers/mux/rzv2h-vbenctl.c b/drivers/mux/rzv2h-vbenctl.c
new file mode 100644
index 000000000000..2699458045f3
--- /dev/null
+++ b/drivers/mux/rzv2h-vbenctl.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) VBENCTL VBUS_SEL mux driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/regmap.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_vbenctl_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_vbenctl_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_vbenctl_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_vbenctl_ops = {
+	.set = mux_rzv2h_vbenctl_set,
+};
+
+static int mux_rzv2h_vbenctl_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	const struct reg_field reg_field = REG_FIELD(RZV2H_VBENCTL, 0, 0);
+	struct mux_rzv2h_vbenctl_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_vbenctl_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_vbenctl_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_vbenctl_ids);
+
+static struct auxiliary_driver mux_rzv2h_vbenctl_driver = {
+	.name		= "vbenctl",
+	.probe		= mux_rzv2h_vbenctl_probe,
+	.id_table	= mux_rzv2h_vbenctl_ids,
+};
+module_auxiliary_driver(mux_rzv2h_vbenctl_driver);
+
+MODULE_DESCRIPTION("RZ/V2H VBENCTL VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.54.0

