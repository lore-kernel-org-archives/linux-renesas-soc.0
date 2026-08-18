Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C30A18FC97;
	Tue, 18 Aug 2026 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063372; cv=fail; b=ANPEBPHYEYn7tyDQjFMD4uTUoAxqks8mSJkt9RZa3c07sGqlnTJ1ktpgUkOyyCSJ5PaIPBpTzml3AJZXwc3A5HplSTN3cHUwfqq+pns97QNe70WTaUdUiIcDslooSmSDmq/gcUncb83nyTwT1BTCiBjoblLAEnIzZ02TQ70zuj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063372; c=relaxed/simple;
	bh=LcyonomwCEYJ+yHXNmbXE5rrVDZr+G7oeuVqK7TsEes=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NV1gi7bJZ3WAQBq44v2iNQOOC/f0JXKayhyspa6+iGglZjH+avd/0i51JdkSK3mGAmFnAY9qen3fIKM9k12KreTjMKAup+lMxMlhJHwalS7nTuMQIf9tWG/CgctPVye4YZDDakptIoK3u0MHzlayviZK8gmVppTVu6QfiFmVA3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NoxeeT2d; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NoxeeT2d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTdqw8AXSXhKm1WdOKbm6z4fl9W2LW2JNRY8N3XQUCiZ5LKfNzviGfEKWhC57wDM2/I1MTOUX9bQjp2I7KSM38XOQJE9ky9qlQnhETSlKvsWUEE5DQ4nSo+dUm+gD1dpYF7ADyz1b1IpH1iQFoxva0TiOiCcgTSv0OR0yuZnTs5k59n85FQfnpePP0w9XdYK477Lvs/X0ZDO5X/7YPKOGZ9JcSNHlIU5YS5l+HY2di+4om6iJaeY/ph4IBQHzu8kGdAklpCoQNqbH2icPWd1CqW0M1VooFWbVaPt1hFQkJ6wFJAvip9dHEMnLUzul+mYx281RJccjyQF8YfDbkYIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkRLu8q4P81kdQmZH7pb/NnRkIJuG3z2sBKCJu3nEu8=;
 b=FLHExFNLVB4+1bMJD6HzDa26eo+4dnnrHBG88uDuN+n56GIYLMwJZv2JuXcoavCEE0nqKfTRgBmblglXoe/yPu5e+dSA/jqSNjSsiZL6NkZcp87GUgWrf4nLNaiBggOT1c6c/QL6DaH5QyiMfu/KA1mWNK2osey/md1AqPxISDY6At8PHjYey1cjOYflhoPsVeGnblH+EXIH3rN8VaOykVbRH5i9aFrgW+sU5cBazuOMPzPfm3qT0M29/5SFUdCoMS5quQdQSpBLUWoxoZP+zg8h2aMhvOwWqBcyKA8FpFibKiHx5YSK2sR4b2hoZZ1fDc+PqdGo+JCL2QrwNVUClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkRLu8q4P81kdQmZH7pb/NnRkIJuG3z2sBKCJu3nEu8=;
 b=NoxeeT2dEWFTRXLQrXXMT0DbAeeJJuXGbKr2zhCeJyO6IPnFOYIsYrH5m8MKYsAZGwin2SF89Xy8oq5JqsdHWHgfJ2WECzbK5FFk37+a7u2XfTzmzs1QRvOE2gZl6IPKm9WMbeNhUYkmjgr+b++tGOiixScJK3t3PvZuJBYf4ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB17734.jpnprd01.prod.outlook.com (2603:1096:604:460::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 14:29:27 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 14:29:27 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add USB2.0 support for RZ/G3E
Date: Tue, 18 Aug 2026 16:28:58 +0200
Message-ID: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS7PR01MB17734:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dcd73cf-c407-41c3-1f1f-08defd351b5a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	rpREW7ph1gDUBcnqSkUvLkfZr4BG8OS0pDCTsZ0ToTi+u13HgsNTtrkJAaKYnN7DQ1IdCZNT3XFJSYc8ATtJlTV7K7lWIU2HhbRNrgas3ecLya30MSKKQnXq/JeAYxVX+Uf9AGEpiix6C0683JJjK/CmTJgRkCk2QazUGpCh2+MiquS//xQRVX8W0Y3CU+40E4A919pXgoqwzVlWNfFVa6xyM7zu9NuDGMoQt3GUo+/NlJ4LeRyfL1xpD6dVvvgr6XskyzeQ+Agy5byMRMUzczJJWG1ELWNFiTLp0j5XjDHvVRC0JmS2rKsXzy0dwk6RqtheXFQ3On7kZr3Q76A3TSj9P//6KsGmn08KQ2B5Oy4oX4L8AI9VPILLPMAX/Zt5iik9kzjuQUAsJ/Z3RAlnvPzUKILCz/0fFf3/ePkRtqsMME4nR+ByDDVc2aZj9BxnntLgMXlze16iE/ytlWVrt3jHy8W569Po+2KxluCzhbu3UdNLi/+omhVKlhLlJGd5qATbOBJFbqDYwNHl6mZUTJfFHbGIR1f9QGVRelj8S9LgZ6sOCiBCnvdlT2dN7njpDtzrc/W8A/Lh4tVfeoUMbU5DHzMedLR4k1w2QndG4RiL2Gxem7ueA+YTPSp9UMGVFekDOC7FLNAznE/p84RcLA8M03bK5KZjr0hfAsxe/reRRICK7IQTcK+F0aixnQYuWguTXWbW3Z1SVaalmvX+3tJCdaotY794Wf2k+39zOgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rLRzjsutxfNK7Ic2pgV4rZKVa53/D52IQd65uKGiKWas3AbQ35+T423xZA18?=
 =?us-ascii?Q?o2GX09d1BQHspM9BRjEearPmUDi1EAGTO93UsqC2v+SxNVkMQCeIVbTal72I?=
 =?us-ascii?Q?hHyp6z7PldDxRpR2vZqeRxdjeDJDyUZjmjEIEHmsCqINB5vc5TKjZ5CETpLm?=
 =?us-ascii?Q?OSbs3Y0dCnRVLKuOHYcgY7OK+p9vZ+vd/pklNpZiRttNwGRvCbkeMwhZvFX/?=
 =?us-ascii?Q?kgHCnLAkNSKYoxOpd8XnEbZFYoswoaDqs3pAS+zCR3oTnIH0Rvm0clHwyOhu?=
 =?us-ascii?Q?8TLXB5irdvK+O9SjAr6gX7BF5OQcFHwrEcICVY5qLRpzF6vKQvgJzA65Xx5r?=
 =?us-ascii?Q?06xH+8aY/dggq1viPDlhs5XXlgR4j5kivJY/T3XWggiqjZBBTi2cb1uE7mpi?=
 =?us-ascii?Q?NLbY5KB8GzFi2vhFVZ439gI5Zacvv1cStavNO5haWTc2AkEzF7va0veebQyb?=
 =?us-ascii?Q?gA2xex5qXa/piVTqnzwlbC9v/Qa0hVJYdhcUQEOeiJyvLgZKgWvoLrLVwFV9?=
 =?us-ascii?Q?8xrqEGveLRrW5p5NaDInhFau8wJ/afFf/3bRz9jATsE5kodE2rZPWv3vZPkx?=
 =?us-ascii?Q?Q5GSQJ+koG71hsg1oeKg4cgLYaVjQZGMoNd8PjUlDzcPzrjkfnPjVmX22Z0P?=
 =?us-ascii?Q?gEBGd/8Cr8soKPs2eCjl17q5DC9u/k+Sl7shb3UaDMSCC9lbcdqSKHzPBta2?=
 =?us-ascii?Q?EwKOrjuGln4RuA3wYq/oJrP/HXP/F/jh9KH9nm4PBKcpcHCqG/iPtJamp9e1?=
 =?us-ascii?Q?pASLh++Kjrz9NtCYWNIyAmGRtAVusWr/hrtqo1YBSK8h1nU/KxUJOk16thH/?=
 =?us-ascii?Q?uUTZ33f2e7eZUy+jwbAXT+D5NzpQZGut78olRa4kzXL/AJUClfz8mTshFuv5?=
 =?us-ascii?Q?X6PZ9C0sf94oszCHE+HHR2Jv8jJHe+IO2Pklj9nSP2eZOrpqoyCSFEqNzpX2?=
 =?us-ascii?Q?Ul4ALV4UALTGvne9CZ1Lkebep3tMN4OXXs0U/DZbJqiH13BHXvYK1zzrbB1/?=
 =?us-ascii?Q?OnsOqsYjT/xrkBmRwWpJEG78UVzmZCxgb+3H/DoqIw27/gdDDjG2iYx7C6qa?=
 =?us-ascii?Q?5mnSZyaizcbn/fm4Nne/yUMF6PFhf0SJn1eG6FLpRE9iAtury8vi8IK6kY8H?=
 =?us-ascii?Q?KL4ydlLp8DsZJQExw1wm1BnyB2RBlZDqeTs6USPImnke7pPh0rVCG5hxj3I7?=
 =?us-ascii?Q?igu+BPTq6VVDa5zw1ZOnNZh4KtLOexVcjwTZUPjOGKE9fgAydGDSy4dJo672?=
 =?us-ascii?Q?pLJB4B+cus9BtJTKiJNx5No96SzWA4tEhvhPEngZL80khGyhs2xC6DsbCXDC?=
 =?us-ascii?Q?nz6Fuj0a65oYrDZUD+ak2SZA6cBV2srzc43Xipm3TjjTaTlH2dQ/Xh7klwxk?=
 =?us-ascii?Q?R/TlUlP+Xkjrud8wsfM5KokpdT78mkbPCAG9jw/QGvApHcxtQ6hAXqJBMD5t?=
 =?us-ascii?Q?IAHnG+RHMPw0Rd/0xE45dJd+YL2f/jOcK6TF5CIbs9IQJ0UpoWYBinPH8BpX?=
 =?us-ascii?Q?wuagNsQTb3tc5dY+VBgYrS1ESEEEAseeUYVymnPYESpci47LuD0+bqPS4gGm?=
 =?us-ascii?Q?Nfhboon5QJhxS7WOyq3y+FET1oSiRqwlQEt2LfXJnTACx3LMxnJsugBSSWdQ?=
 =?us-ascii?Q?dKLxJx0fKydkP4u0e0c72Ps3VlrkP3IrDf0jSTxvG1zZkUQdyoq2zUBGCe9C?=
 =?us-ascii?Q?wqo4LuVj/wAtpJNRCu34dDHZKljti3oD+Ud57GdP2s+/XA1Aak7/Coz/gSI/?=
 =?us-ascii?Q?UYNqGWfS4e6Hni8TDKvBAKW6+h30VE7JnadETfiO5IEL/nrKloRn?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcd73cf-c407-41c3-1f1f-08defd351b5a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 14:29:27.1116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4Z4z47CYiLXhTDvyTUJloTzjrvt9PATG4brlnKwpZ9UxWW3IFpv5A3Cq60vsZa6njafs4jEzZzEnVjNa7J3jv6YME1ZvhvU+/ovKNrLdgAY3k96v1af3ys2aQvjv3V7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17734

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
enables it on the RZ/G3E SMARK II board.

Kind regards,
Tommaso

Tommaso Merciai (3):
  arm64: dts: renesas: r9a08g046: Add USB2.0 placeholder nodes
  arm64: dts: renesas: r9a09g047: Add USB2.0 support
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  25 ++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 124 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  45 +++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  25 ++++
 4 files changed, 219 insertions(+)

-- 
2.54.0

