Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109690;
	b=BPNRo8lme3AcmmE8DB8PyiBsJmrxolSR7E2WEHk8vmoWYrniEXYjCpTTnKZ+7qWHQxBH
	 elUd4M2kwcJuURRJ+52tgeamSirPza04mHe6IIIboLKGUU/t9D5iPS0C6OS851+HUXMWL
	 QtA7vwNZy8eZGnFw/l49hIWkaxqVCjVFx4rcXBzUlL3MyUqcy8DWDPZz7zz+ObXKIDTa5
	 EyDxRt5oTObPZUzlrie+ENE36YyLLBIIWmFHnlOL1AxPte9g1NH1RR3h0MfrrBAAg0tF4
	 ZSyUuUGRz+yyZ6Q7ymHrP/pRe69BsH+8NEWRLO745kGLXTJzHv6NF6Mz9pXPAZb99Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109690;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Lma01/639xFFutG8mxAYAKPHHhaoj7/XQGEdFLhJRM4=;
	b=XAlTN3Mv4sNMcbMF2MZx8MLokIwl7Z7dgGfXnDRVkJ3tEAFrWyg+FkUVoss6UK447cyD
	 NmFBanriFfCi6omYQ5rUO1SCjFdL7R+RnZoujvw5FTMi8o+RhqJTZGuxa6nRMOe2rfpOY
	 MwbzVkRyv5JUfFItuot1KrZnbBQtJIxljvSSJp1UAXQ1Vl+9wAzAnhdPxVR8OCzOZV6YH
	 YgIcxLDYZw4o29tV7yBSEwEyG2rYHsPiBV3izmYuXiXWFbHM4RbH6weA7vzwcqveq1rja
	 cPT9TYipfEZjUfTX8AYFGrhAmOHVzJxFOPaFOzdPi0uycEq0hkfe3EiIt8fkbpCynLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=FpGlRiuc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.5
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE0606A326;
	Thu, 19 Nov 2026 17:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDE0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=FpGlRiuc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTnQyEb+Jb50U2w9D0tJF4GUSUgKbGqiA+PmvMREs1EC4Hh8PaqQFXtyqnrJE7UC+/5GThbhht8vkBpf4Kme6BGXRbGjcMdcl3nCbp1jd5uPYo4NQQ+mD43MxChffMrYJG57yq1El5qJkQhmdhfG1kYUgIdNBMTltqbawlRVuAH8qKfSu/UXZTHGuUBfwusHzNE+nnkW0V0dq2juDLI3H53dTXsVBbRGjpLAyLYjveuvLJKV/EjBRRu5IKgVW5oCOGGVNDQfgygHtKzvNV7ufhtk5TSlm+EyrYt2gEOqr7wyXvDN6zRVX9/ifWo/WDgWO2r9YuFIpJBM5n0+5Av3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lma01/639xFFutG8mxAYAKPHHhaoj7/XQGEdFLhJRM4=;
 b=aFXIQpAkEsTyFxlPsglSY2oTfYpdYph/hFTQ9pHJ/AUcuPdynPCekuNLRN4pQx2yDz4/ofDsr76e171ayQ3vHBPFn5dup33uINPDRR6vAzSMRfW1m6DqxaJbeVsYFKSDMkl7xqB1JkeMq32dxWf5IA2twmPL+Y8MJjGlAYAopCKAkiiy7SQivRR4k8dqvh5K0B0vmznne/2TBjitKlgqNAeirk/YSgl31aMROpEjsiMYx8VDufE/nOgdaWaVkxM0+Nqf2wwGGwvEh1SOfZs8hwUGQnBgOVtWzCJUpc9zQ2BEpJKg8nvGhbpS2QrZTDmPN9Z9UnJEBSfUZfZ+ytV9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lma01/639xFFutG8mxAYAKPHHhaoj7/XQGEdFLhJRM4=;
 b=FpGlRiuc+ucTTarxHoN+EtcX5W62KU/xOiIzib9s2CO73P4M2T52DR9zaymyTdh7KlhF67gUBL4xLmJJS+/FcQchjYk6isOJQWzN7Tu084BIwVLvsKm+UXOJhGGPJ1xzE6pjxaR9yfEXS+dLWymUNBiufUbQ0C+s0rEJjMylO6E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15) by OS3PR01MB10422.jpnprd01.prod.outlook.com
 (2603:1096:604:1fe::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 17:34:44 +0000
Received: from OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180]) by OSOPR01MB295138.jpnprd01.prod.outlook.com
 ([fe80::4f0e:fd0e:ff2b:b180%7]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 17:34:39 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: jacopo.mondi@ideasonboard.com,
	tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 00/10] media: rzg2l-cru: Add suspend/resume support
Date: Thu, 19 Nov 2026 18:34:03 +0100
Message-ID: <20261119173413.341658-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0126.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::10) To OSOPR01MB295138.jpnprd01.prod.outlook.com
 (2603:1096:604:521::15)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB295138:EE_|OS3PR01MB10422:EE_
X-MS-Office365-Filtering-Correlation-Id: e367cee0-7778-4f4c-3248-08df46636347
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|38350700014|56012099006|11063799006|261021121427099003|261009223027099003|10067099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G5jM8UnaPhJ8iYuZeYivi37/rKUsfR/oNBFsZB2YiI7VdkP8od5WDKIWuF895NpB/X9JeERdBvvdcgwVwveyoChYKgSwOHTPBOGYDP/7YVJRPHy5ee3P4qRZ6k7Fr9SfYzSm+bhsha7EglpGczoHjJoq5WSoZl5NBS377i6Dg22LC7tZ7jsIpJ/hJJX4vZ0rb8lwQLTcOlPlegWkq9ytlf3+69Fu8R9VunG8zfqUWL63nW4yhmuSKQXg0avZxM+I1ddaBsW0gyRremXIDnkO6TrX0thMWoDFeZtxqImflVO3r8MwLev6JF/WCubAKlHwwKh0MD6+cMPxSvB9iudAVbmovRuPBwUrE218rKFRPvwQd5kZmIpkZwSdxhOTazGDTqN70gMQUa0Rf/vezX1VFuECmaE1YFAvOzy6nxWrF8prDYmdJ8vwCAFt0wN3GXyh02zdpmrb5yqH/b/Wr6TGRXbcEhRSh1SVLPKE2Df3lOE82qOxBRAtESebLEcVxoN5CMJ0sLkt3Tt6JPRX+F9cYGuD6oItMvAFTv2DqW+XMMrIbHiP7BpA0E2MgBtzzPY7wCCbXcW95S/xJZZ+Jqwg6Oh91V/AgLVXUoeyqFbMnnBlvjokLfFKrS9fKBgzhcZ2VVx6YO2nlelARzIBLw3Rn6i9yGbvVCsvsgO929RN6pk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB295138.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(38350700014)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bImb6ueEp9Ih7z82qOiIK2eUPoSRzfoZnWATzY+bbo6bQpIvbbfx6ohxLvu+?=
 =?us-ascii?Q?ODc+7tMT36muekjGrJKXc71GYncCyrsQJncqui+I6adz2+seebswObZzDofw?=
 =?us-ascii?Q?BlSfIzGHHd4ACWmxKSpo6LVFD+L4fEVneCJYHV1zYZFIFbSXJsY2WvkIkFQ/?=
 =?us-ascii?Q?e+3rk0q/XelKh/cXuKk7p+92MIPCAZCPVrujTBQpw1TQQeiF4jR8CfVlIBZ9?=
 =?us-ascii?Q?Fhoiux3RZfT6IC6sLV5xrqPRANLvJkNeXgxiue8vDe70CkF9YJKCHJOze6kX?=
 =?us-ascii?Q?Qv3eq6yI/+psu7+0qTjb+g63hJxQ3fE42ujskm2AIV9nGUfOqIuk12VqvjEb?=
 =?us-ascii?Q?ncV4QpVColDQOuCX/ngrv7bwYV46CYVdZQV4U+zG6LkeBCFVWdwSQn5d1e0m?=
 =?us-ascii?Q?dxqJLy7gmz7/UHHdF1pX3OZd3ykvmraZT5/CRbGGsSbSrNZmTbAfkF0YLPTf?=
 =?us-ascii?Q?nMVTxQeaugSscpHW4eSUOz43cj0Sgdsx5McZGbhYgIDjn+PjR3/BPm9oi24r?=
 =?us-ascii?Q?7a5U/wW+mewEduntgXZjhGwMs0ng6ndS9cOei/kHFa+ccbj3ByMhAuDE/gX9?=
 =?us-ascii?Q?utncUI0BeAjJs3/gtZ284p3KWHgqD/GO+ljgXSCMX7ff87t2TI7tUAaxtCVo?=
 =?us-ascii?Q?loV1zVnRtCB2lS3qsT8UzOd+ac5p0hmHgEkSdWqGyv+bwGQnDtJ4jjEctJ/8?=
 =?us-ascii?Q?XaiZqH3/L2/sSl0elU7ixGGdi3ZrwOB2rM6EjYFWnFbQHRQ2r5uXcZQ0ptbS?=
 =?us-ascii?Q?/KHPCDAD8e0OYDVrw+qwq6FR+O4KqW0rTfMldnSRwGh8j7bA/aavjVVwJPua?=
 =?us-ascii?Q?AscsS2qeHtrS+cppPuRY48DlKHNYVB8yh2Df0jvBYRUf4+0S/C3Bp2wP1ElO?=
 =?us-ascii?Q?RpzFXA6UsDmrH7MPrHC0U3DwJtFH8PdBRV9ONq7rQdue/VeAAOLqUpZBtPJm?=
 =?us-ascii?Q?//0yoZdmOi0gjeDF7SurSJb9jXADL7wymXnW5ZJIa/eYcvTdASNBjKHiGnSk?=
 =?us-ascii?Q?6vgnqMY980FpI/uoBzHfD2JgzA3EPK4HcwSMUdFNGdiNs78391GkfIi2yKup?=
 =?us-ascii?Q?BmL75k8DiHoZaYtQnm2rUZ++RyUyGM2R7bFmOaKgLLy/b0BSubwy5GGF0eXi?=
 =?us-ascii?Q?8X/gcZcCOv7s9fBZN1ebRJp2Oe9Ymgjuosge7hgzlIR+x34+PTDvTHA+ZY67?=
 =?us-ascii?Q?B6ewX6htDduzU1qihtqWyyFDPVO/q0LwVPo/1z58T/TG3j9JzKeY6cRM/yqd?=
 =?us-ascii?Q?UeFX6OR26v03iOO6QOKxxEwRhwB7sWakGZ52ZpkKNYJokWJ0mxFoLaqQUhbZ?=
 =?us-ascii?Q?sf3o+ZZ21OG2P43gX/00JiEB/WiaCCpOxrXQ7+R8e03oglNOSlQ+siT3prax?=
 =?us-ascii?Q?E/sWZ+cpWJmKv9CaRqKPU3M4uzZGe9yNvLUHym7FDNjf3zZwkSMYfeiq0knU?=
 =?us-ascii?Q?qNedMe3yxGgZv4cfFTHWj98m2rmFBKzADN0rxL/gEwar9sg/1puSI4o5oADx?=
 =?us-ascii?Q?2bMhpqkjEsyydeOU4MjBJL3BQOYm6fmTBCKLZziXbfVe/4r0feHzvUjizksg?=
 =?us-ascii?Q?KuHiPkqkylRVNeSBkJuEU5L/+tknpgAw63UsHyWgFr/CeHpPQy3vuLUH3cw9?=
 =?us-ascii?Q?vq1BMN3BU5X43yqNL4MCK0G12M6TzNsQUlPufeaEJP5fGuLFqNRO/si3QgK1?=
 =?us-ascii?Q?0IcJSba43g8q608cXhpwjA0YXVGC36kBb8hbRPPIWSAwhbfmdM1l6La8wgm5?=
 =?us-ascii?Q?Ci2Ed88L6nw985Si++BL/qzrfFgV9M+mXmqfUPZRZbGFQ1zncCnE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e367cee0-7778-4f4c-3248-08df46636347
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB295138.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:34:39.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTDN+8CvmHW1Dz4eC7t3YBY418euMhVRFQ4lAO17A13VMXYQVLiJPjJcidHoW8NKbgk9fJdHJGFQIkbR+9uRuOCFA4NpisSHqywfQH6rkQDuu1avnyVcfZ+sQomv+FKt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10422

Dear All,

This patch series adds suspend/resume support to the CRU/CSI-2 driver.
The series has been tested using ov5645 camera sensor connected to
the RZ/G3E via CSI-2 connector of the RZ SMARC Carrier II board.

Thanks & Regards,
Tommaso

v1->v2:
 - Rebased on top of next-20261118.
 - PATCH 1/10: New patch.
 - PATCH 2/10: Dropped mdev_lock usage, now removed by PATCH 1/10.
               Set cru->csi.subdev only after the device link has been
               created.
 - PATCH 3/10: Added DL_FLAG_PM_RUNTIME, as CSI-2 supports runtime PM.
 - PATCH 4/10: New patch, replacing the bulk reset API patch.
 - PATCH 5/10: Collected tag.
 - PATCH 6/10: Added an empty line after the active_slot reset.
               Collected tag.
 - PATCH 7/10: Reworked on top of runtime PM, added locking and
               preserved the buffer order on resume.
 - PATCH 8/10: Fixed typo in commit message.
 - PATCH 9/10: No changes.
 - PATCH 10/10: No changes.
 - v1: https://lore.kernel.org/all/20260616170542.447804-1-tommaso.merciai.xr@bp.renesas.com/

Tommaso Merciai (10):
  media: rzg2l-cru: Drop mdev_lock from async notifier bound/unbind
  media: rzg2l-cru: Add device_link from CRU to CSI-2
  media: rzg2l-cru: csi2: Add device_link from CSI-2 to sensor
  media: rzg2l-cru: Add runtime PM callbacks
  media: rzg2l-cru: Drop stop streaming function
  media: rzg2l-cru: Move active_slot reset into rzg2l_cru_set_stream()
  media: rzg2l-cru: Add suspend/resume support
  media: rzg2l-cru: csi2: Add system sleep PM support
  media: i2c: ov5645: Switch to RUNTIME_PM_OPS() and pm_ptr()
  media: i2c: ov5645: Add suspend/resume support

 drivers/media/i2c/ov5645.c                    |   5 +-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 100 ++++++++++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |   9 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  26 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  59 ++++++-----
 5 files changed, 154 insertions(+), 45 deletions(-)

-- 
2.54.0

