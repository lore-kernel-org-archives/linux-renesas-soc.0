Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E09406805;
	Mon,  3 Aug 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763743; cv=fail; b=gtBWXikiMtViGlcFVEFx67tlNwrsGZxU0MSMUYUIqZ1gmxL8oxBgC86Fzf90U+GyCyzKq91xNX/W5faspF2lLAizLUdf1mjxFIgckyns8Vid9+Je9NFBYrZTjudXAi7VJrz+BjTidMm7Yer+Dege9N+VJDESrLgB7SWDUpGD9Lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763743; c=relaxed/simple;
	bh=oe4sFO/KTQdsXDwd6sljeN3ObhEqA86gdJrBSZ1bpsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Owelp9L/7KXxSOkryGYbeoqLtVTKitK2JFUGZ0NQ8kdUL7ivbEYoquaOukN+7Z4UxaWYTvw/B2NCU7Ll61B6J/Z3HlHAjNJWRfUSV4LYTQV5+BYU3wZLVUjBn9CrsxE6Jz94NTg02/iqeFPYdrd6wu+upiBxtg1C5HDyeiApV0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Zz5tOPNa; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Zz5tOPNa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLvQ3GZDRfKZf5nccxhRL+ggL+N3fD68Y52G7gOQXu/PM2aFQsXef+7tRTnfI+5m+iuFJfEtDg6CVkf58Mbqp39zKJll3tvxtCnyoXSsTgBIIggOnIY8eP845QPzOiReK5rH4nO/PEoNph8YbPg3rPp4sE2pJX4NWbFyKZDxdExwvR/bMAnLKcnS2f0h/jFlabqzEuegJIsKrXL2RyhzBgyafS33yux/GG9iP0tqZoQ40BPWydL4xuBSoBau1YXZXAtCJctUZhk+XCrPJ9Rxda6LbOhwQbSOUfDnyDnBZ//SzlXPvTER/CLwKJ1WkSfWJBv4ob5zS+IT7jmTF+HeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rrZs+WZ6b+4A3q4NeQnO7Sy2WXPNo4NVFI/JkuDKD4=;
 b=HZ088r5c/ivhs/k8qOD/987v9Q0BT45fpvBMjdpBUWFYe5TcawHrloDL7FJB2VmSQbKCljbZ1W1X8IsU0pnQih7V8Py7ML5YYO4CJV6QEVf2COx9m2nld2l3Tn2bXtwa3GIEWYw+0NuMVcEUzPUWCp4Xcq0T+sC666GXGxHnqbPCRBXhrfWpR5aEh6FMFhC6OuPFsq+WqwOxrHabPYHFP1wt0DwCFFP7wRuG5J8KCA4ASJ01meOvjy8GKexFbeITxgJE8CdvwrMx4+8NIttbUzvd0JXaSLAWv59ayP72DWBteOE5ERvqALtZBjcVxcG7ppeEQmu+ZqE1yOsvnR4ffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rrZs+WZ6b+4A3q4NeQnO7Sy2WXPNo4NVFI/JkuDKD4=;
 b=Zz5tOPNaBy0HV0PK7/s+mZ34xauQA+4ammCrR60iPupXLc3M+0FOwsFfV39mlRT6lVIzGKYsTC4JGWPW5OSH3D864gtesK71PhEzDDNUh+pFR/9L/grib0OjRHAQ6pBb6Y6uWZCF/30cx7VHbpUfk2u+ODl9lIWrLaUaj3wbyxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY4PR01MB17923.jpnprd01.prod.outlook.com (2603:1096:405:34a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 13:28:57 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 13:28:57 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: dt-bindings: renesas,r9a09g047-sound: Document audio_clkout clock-frequency
Date: Mon,  3 Aug 2026 15:28:24 +0200
Message-ID: <20260803132828.3249424-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY4PR01MB17923:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e293fa6-6a1a-49c8-a2c2-08def1632b2c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|38350700014|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GQ0xCmG1PSF+XspAgdzhxV/KefqbsRS786TEhXszOBDUfsyKD5ECZBo0lVPyvDyvl49+QuL2ZG/52kylEPmXmyOh5wRARX0qLIXCrzhsdEsNuXQMsKphAhB3p86chi2dzucK0NU6nLfdpQf10ez4Z3WECPgj3PckfRxoC4S/+LIiJs/J/TaKoMTsp9x3S9L8auiMnvEPLBtHgMII7nzdRu+qLgrm3xMXIQxnQmwoa0sGTpKdCWzsAdplrqiJFP3GbrMNgO84zF38halu7jOxxql2C/kLubUagQxmXkD+xBJMKWGf7mbZifbnCv7UeDth57JEC4JXhZVCBCzQFeSZHTHPmhh1FiY8tjVKgKI+5ZcUifaVY3hNpNtKS+RW4oO5eebL1dulvS8qnGFTQTfON4+K/eOZfEQAgjehHg6sTkYz1cCnXN7zm24EOb8wIMVX+OD4+sKsDuIWaSGF+LSl/n8Aphx86vjKzkntoaOvGPLtAZCtTiuvjy7Og//UkRRgafqY9awJLuoqiOb+EOAvPNv0Zy4pKuL08lUCB3D2UWBYXHw6TJ9+0sYmMRNUgGrdiZeCYLPaM0ln7pUbKZGp9lyf7qYi6Tzwx19TMkXoQimFYTyARI4ovTVePAbyaXS5AcG0jjLf5E6Wca4q9pYLkq/rEecNwFYJr6nGvlK7Ybx5yByg3GWhg7p/FGIumIzaDNpF0Q9WO8nnvcvzFGdvz6fqQkT+x5S14xo23Uu+YiU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38350700014)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hvnRUmCxShoEzmGAiRQAjRROrWeG/xj3yn2HCQ3BLASfBoVLij02k3f8MgAl?=
 =?us-ascii?Q?4ywW7Uh3IQ14AP6XFfdbEHNLHEdIGoyuQ1ydCdhlz0yalXE7Qq/5+FHO+QuZ?=
 =?us-ascii?Q?2fo5TovPhLPMJuHtQMym16nNBvJOtwE7A2h+DaY1/DugrpZ8bYWGbr4CjOYx?=
 =?us-ascii?Q?1VTskdY59pozGliPpbdbil/YGuAq/arCWmz8bFPOqSJzHPK+m8Pm81cJLgTX?=
 =?us-ascii?Q?ECLhpgEXS5pxWLnfmLNXf/ZkNm1xIVs+ivvc5UT+ZzJwU2FvOwwEzI51MzkL?=
 =?us-ascii?Q?VAtVjzxhxoUV1hKuKt1I3BzsDIFZXg+CXnhqbL06u1rg3kSO4zVBJ9QnEAvH?=
 =?us-ascii?Q?2ZuAxYZxqVxZucNdxAVV/QuMWjm8XGXdi5p96HNSeT/5h92KMciDC/cQZ1MN?=
 =?us-ascii?Q?TKx1v8bbVN1Ip2X3af1GkVLYVA5UuuNin2haFgTPYj11FsJSNrrvZLVIoXFC?=
 =?us-ascii?Q?kbD9nPVB1xorh66cEuTO81yX69KiBPa6k2OFcvx5vR/c9iKcIyjrOSLzsf4n?=
 =?us-ascii?Q?t4e3BqDq25186Cnmq4+1IPEnod+M5KXQKV/HFA98lYv4tyX9OdsLW39KBrbA?=
 =?us-ascii?Q?LAp5yqziqDJWWqFbj1LXOFvyMt4dpUDWTfBQBMiBUJWLS747XJdQQzhKtaHV?=
 =?us-ascii?Q?9n/+y170OAVq9nct64c8Jh2BomuNzdulbfWTaebI/4L6D//SehUExcmFdYnF?=
 =?us-ascii?Q?Vn5CSwNVvtOw/UVCPoISuNJ2bdB5b6KmziS+nS8Y2y6+Q+081sbQc8selb9H?=
 =?us-ascii?Q?yojty1Va8KGy5MB1WpSYzdc3uO7vbZUFjxpw0BP65xWYQtIODLy0ydqTFMw+?=
 =?us-ascii?Q?w/fVOHu/6JKgjMZv4EA3j44dsq8ZKuKm4VwThYbdb56OiuyDSovgNSK0UVaK?=
 =?us-ascii?Q?Z2GFDY+0Nh+zGDHRNZuktnh8OF4tk08hY1jV0gZje9aGPKd0+BFf/x0+fRYf?=
 =?us-ascii?Q?dxZ0mvmCvLCYsJLcixLyZPYVIOXhLdbGC7dLdV2lGPzbLBjdlGd/O11sIeWl?=
 =?us-ascii?Q?RN5cq2hAru8Y95Y0gzFSQ0wSkgxdBVTuYr2PJDjjaPNHH5tn0CHF5w4GpsHS?=
 =?us-ascii?Q?E2qyAuFObE8iowx5JDcAeGLGhUCTbl7Gbtt7C9ATJ0/3uQcx3FTOwDQCaxgO?=
 =?us-ascii?Q?9y5LcGOvCCB4SRilOhIhMblq09RMKeTbiDBHCY8JMzruqdFHSeZSjiCpoLNI?=
 =?us-ascii?Q?QfBzuUUaTozsLZDELy8EACntJV31WTyHxGja6g1z0WBbgAbThn2jH6EL5rPr?=
 =?us-ascii?Q?D4sOskhBwDB7DgOe5oszQ+HH/+yx7s1N9CwYYBRWBNXg5lfoRhsIObPn3wiA?=
 =?us-ascii?Q?8mf8ZCT9aUfNnEGRiZAajp5XKlhM7SgNUfDG75IFuhFamF56UOq7+sXUU028?=
 =?us-ascii?Q?+RHP/qkZZI/tlA1i24ADVCcBOSXh/z4giIyy2sEirzK55NzMtcLOYLdFFmc9?=
 =?us-ascii?Q?C9HZ6ohiYdj/r7rPW7BRWMfvWBTXfWZy/FxChkr7D+0g5zB6aLHLiCqOUzTS?=
 =?us-ascii?Q?9pQ2kSbAWGDcyEpaPiWDd4u1fd0Z897/44HkbfaCJtF9UUBUpB+sAKQQ9kLZ?=
 =?us-ascii?Q?T+p+aFE1UjPzHI3z+tQVUsFRzjUYBcKaHODclhHJ3MOcC382tQdh6nfhtbdI?=
 =?us-ascii?Q?28bEJr/vl7ppk+tOGIzCfK815bI5G4BN0XXbPP/k8ejL3rxhqWCWmUQv7RXx?=
 =?us-ascii?Q?k0gLOPQF8LSMvec+nO1ko4DL3eEecC3N67V+BTz/ZLI/Z1iq+MjACsiKi2s0?=
 =?us-ascii?Q?IqXvWz59/4f/4XFVy7ESIMvdgHYxZr+UN0y5t/mlpOaKRVs15TZQ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e293fa6-6a1a-49c8-a2c2-08def1632b2c
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:28:56.5191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4Ri/25vf41ajOGzG5NuhPGT3UwifkQ65GChTex9XCKz/sH7nqtKVFNAWOcOxULSZjqkCUHy0Y7TpBb+pqxVFA7lWtk/7ULHM9RYH9kOxStVPh0cOUXxN4PtWsTROkWe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17923

r9a09g047e57-smarc.dts set clock-frequency for the audio_clkout output,
but the binding never declared it, so dtbs_check fails:

  sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
  are not allowed ('clock-frequency' was unexpected)

clock-cells is fixed to 0, so only a single audio_clkout applies.

Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
index d7fa16554698..6e2b2c93b4b7 100644
--- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -42,6 +42,9 @@ properties:
   "#clock-cells":
     const: 0
 
+  clock-frequency:
+    description: for audio_clkout
+
   "#address-cells":
     const: 1
 
-- 
2.54.0

