Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C813DA7F3;
	Thu, 20 Aug 2026 09:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219892; cv=fail; b=KiAGVJLZCiMyfj9/VAdX5QuoWhSHSPjg/BHVl2fKgQiUcIvJP1SRNh3+4mEw7An9EpsTY98xnli8NU1hyCPPWGwB1wIETm7ONtANpcXViHhTqc/FeH+P4L4c8feacysPCQHAyvAwXjgmVsZkZQiDUoRsg0pSizYwnjnGwbGsWYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219892; c=relaxed/simple;
	bh=nUFwMq0QwiUf7wROC9kn0YGcZ0BOsnlEc0kI+5vgxFY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OGaa4Zlj0HEGjJPF1dHtb4uZ5o6RNFueHupio6jgt7CZru2BlJRF0gEpfteiaBGPKu0FaBsIOp9b2HjaYHuG8LYohNb83SVzOFzcXlI9uo3Qtj+aV6dTjeeM5Pym8kgZzXqN0HFZGRwlmVHa30pPFx41Gb/IMVEa78bE2z6nSRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LahJ/W1k; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LahJ/W1k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mI+jkZzX5t/tWJ+Kbf5rdl8iv1q/j7fhQ0l0iKgQl/Hu/AIW3w3XkbjCJ8jm8Z4JDXd2mEAd1xQ+GYkeNh4+WEbEqDXSN7W02A4J28Mb44tmbBiz4CkOw+4TBGEENTadCWL8IJL1TzrVaG1detmkMCwnOwSR22JPmsxWfaqJ2FwDYuPRqRNznIC17SKeFGUyc8hywcW68GuNxDB5MohmczJwHKckPBA1/0Vx8rxbHtxweTmHC29ig1xYpsPkxczP/VnG2b4Wxu8dwgh0tY9Ke53WI0I806yY4S2Qy0DMk5s1G5Vj0DuVUSE9OGTY2ba7rvuWC/ykYAqyit48oaEmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AiVxb832n4n/Ivcpj1mYF7rvznPe6qtKi047SATwydM=;
 b=RBEROnJ3LOrCoJ3zcodGrr4fAhfpTNnJvDOwaGFfOzNEM0sFhDqDTs4kJIonVi5izRXsQ/R6OkbS2k7qFDiBv1CpkYwiy8VGgtZoPF2u+ZrSRfYKURdbLKE0tSTHfwejHTfWXOpqUszuI6jNhV7jc6+vD+ywDvJ2uQYOAT9DUho7V54rWp4lrqPRQdFp6zdrr1Ur3C93SCeJb3VZFfGR0gXI+lPl0E1iQiehXGvEgUXC9u4xMaD05CnY0ctiYGLOVUxwPsI7OPieFotjPq3FM7zvQXeSiu1Y/u+4wk67tbRwRx2gnVE18izl6jDr6DlTToRBGfxm5u7xlPP7+eB9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiVxb832n4n/Ivcpj1mYF7rvznPe6qtKi047SATwydM=;
 b=LahJ/W1kIz2S+aAkcEOs1BrpYJ9GlwBKyUmiQUwzpXynrwnKF4ttJorNrLii+9Vi3svukUdFT+05MqBAHMr3fLjWIyWl9s5w43cBPC0OR4M27leoLC10CIJwBaCsXXheeFl0RIYU9HgNjn+KCfpO9Uw2ZZGwXwrmsmdlWYPBXYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB13124.jpnprd01.prod.outlook.com (2603:1096:604:34f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 09:58:08 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 09:58:08 +0000
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
Subject: [PATCH 0/2] Make AUDIO_CLKOUT optional and drop it from RZ/G3E SMARC
Date: Thu, 20 Aug 2026 11:57:35 +0200
Message-ID: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::13) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB13124:EE_
X-MS-Office365-Filtering-Correlation-Id: b9508f05-8af4-4433-5561-08defea18942
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|376014|366016|38350700014|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	k0l4DHlo25fl192UUi2MMaRoH/akRpg3j0AF6+DkmEGT6ae4RqiWpfRQD6t1/Hx5cUSGebtrPiu+Lis2+J0I6zLKiDqV9Ltcx6choVoT4/6sWR6/2jIODenKkl65SxXcxN+MxI/xbhSRGk3FkeAQDAS2Pw+xSX4Oo53FTFfaoAZBG+x8GySAi4b3SN2XR0bLo3gf9VWyiuJ5aaR4PQ26SQlFjwB9De+Z9GnDPD1dJYhDdX/tNFZ8vZOj4O5rVaMR5fO4wQzLAMqMjDRaY6xu+euYse+GWLeJw8kvGK2BYGGj2mtwQXMyzxkkuBALohijVMh1eBEghhoYorWDGdBeEMqPoMnjls2lNg0vmVad+oUovmJe3xVlwTQwcUuRqT5sX1OH3v2ypsMYCw88arRmSyRJrzZqMOZ1HkNNzASr3VT8eZ1nggoSElf8pb754WghsX7MN4i9IRfmroFJkji/i1PDExupzbQzFO6WpSi0BwL0eSKXOwXuWtvgq55NfR9orvmzUYQXQO/XPenVhrySLS7gGjkoBxYsiKHRwJHKbmp0nDDPc4sABcgpujF0sjeIJ+UDqw/gzAwkN3QykYg45p2lAzlkIYteX6/45KUf7gHzx6VudMXkKKD3uqzW/jS1xK9mx2Jraf3hdgtF/qj2OMAfOFf4V7m2VYMlDXjh38d4WawE1ZRqd69Q1uuIL4jcUYCMYuETUeee1tGHS5AQfOUck0lMw8Q4KLjQq0op/Bs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(376014)(366016)(38350700014)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wr1m6zZbicgXZDY3GehusMU0UzcD6wAXv3SaUZ5m85XfSfrAm7bZ9SxO5Y6h?=
 =?us-ascii?Q?vsJ0ArPVEsd7iRzKk5GauMEgbD0AyD0/iOeDiPELHNjzm5t0zxvNGM4eB8Z3?=
 =?us-ascii?Q?HCGNPiz9yYYk6d+A3r50Ke+0b2m1t18xOxOnGDLeiPhVhZqxiOpWKF0mKw3F?=
 =?us-ascii?Q?Jvc8Vt3fun5kYIC9I6mAn87v/4D4czq2q3a4UGz3eixJdp5bzEFy3/+HITfb?=
 =?us-ascii?Q?AkPm1sER54/Sb4KFmzRpegSF+BqiNQmPFKDUaJlrfWqYWoeEuXtAQPPmAW4P?=
 =?us-ascii?Q?Cfg1QEkuSwT47Ochnh7uLUjzVlxpWCKtQMxFX615cwFD34s7ZIjQnHsqxkqy?=
 =?us-ascii?Q?4X2tSwHPERp7mbW1AncgM0gk9g0zykNSYvXbg4GR85BXZuwEqOC25YNi1f75?=
 =?us-ascii?Q?l+126woH/USWECTZq4K7eXAs/Jzn9XDlU2KRAlbV5GgimUaZCk0luJPOw0bB?=
 =?us-ascii?Q?e3yhze6wiji3qNAT+en3959OXKbhAjuW+JwYhTLxg88Vq64N10pgmNIBB+jJ?=
 =?us-ascii?Q?LXL3SPtnJkxcCfTqeVOQaq+FoE9KuwaR1z4iMjWHL0MHo6cynf5bRl6ELV5M?=
 =?us-ascii?Q?zQAISxG1FwQz4UiCqxVk/ubtYtU+jb/JKESh1CWk2hdZvI/W4+poabBsdPbh?=
 =?us-ascii?Q?EvPx+TBy+56n1DGOchhs82HIp0XrG95FW7Avz97sHDddtXW2T5nGbGH0XWNp?=
 =?us-ascii?Q?qYVzcHNbejLOImuqjh72DlYXbW5VYrMYUoIFvnPCg79snVHCYA/Y3cZl4eLX?=
 =?us-ascii?Q?w1nJFbKcIM14ermaVZuwMX1ljKlkbuyPl8MwC3fqbhvdhSJqFOraL3yHhcS+?=
 =?us-ascii?Q?oo0LaWVuxuUeIWWnklLtTiOEm97QSYw3DIZxZYAZKfltGnckjW+4EbxUNK/n?=
 =?us-ascii?Q?mV50gi9yj2S32P6/lZDmMQNEY9+PrYPp1DdN1JPo0/IXkgp40G4BXFBRVrud?=
 =?us-ascii?Q?tU8tZJePbAL1fUtbjVegCxpIoagJbrHOrYsHWtbRApAjZcwC+X9oOjsNbSWh?=
 =?us-ascii?Q?ENEM3a78Y3UwT34Awr3oTdpmrWrJNk82uhN33LScNsoUzPXksaoXePSLcfpM?=
 =?us-ascii?Q?frMYc2RWDfc8j/GezYQ2gpzrLFVqyPmqjORMaNi5PiiWrfzpdQPcJs/4LaSD?=
 =?us-ascii?Q?L942m6mraxrHaFaxN8vzJPGyJmoOlhwnENNzK4EQszZyoKg9ykddKeGiz8B2?=
 =?us-ascii?Q?htXK5gBXeX4QcEt0TLLPZFUBtWuOZzCVaW144jDbQJp5tvXxZf1IYpqib/xi?=
 =?us-ascii?Q?rXqvbpP9vqPqRmLQtAEOnW/VhFM5FyO/M2Iwu0xRJXPBmOTvnkRGqXstnf2U?=
 =?us-ascii?Q?dzOCjZTnngeYv8TqNntI30HEbVm74syHB9CQxIwLercwEvV8g3tB4nvtwxae?=
 =?us-ascii?Q?7EYHe5yOnfeaE0UfYXsqQQ8BMRAPpUz5QZK97OsdUV1LBaKg6peATJnp7Upk?=
 =?us-ascii?Q?dfdxG/Prp8vb16pCJEsRvxPftDoNP+rlqijBcXZ2C5XPdasFa0e1OLypwL79?=
 =?us-ascii?Q?/s9AI0neUuHp7wR8kA5XGh384KazPxDeWcvM7lqXmI+VYtETtB58KGwhjuyL?=
 =?us-ascii?Q?LXSkeJ76gllmoFFMGX8zSfgzWhHoIpWuZwhYniTYq8LFBIrkV1tafEvu+OE8?=
 =?us-ascii?Q?v8LwhAhGlLlBWlSG51bEiXIJP1ytp6m+S3TWCBIzt++S5CNk+w4S494F/bXM?=
 =?us-ascii?Q?YfY/o3fzm0hpFTk3ejJ8FB88hVMoM/2U2SlJOLsCsreZSio5CPvhLBkIGjYa?=
 =?us-ascii?Q?ZdVDq7j97NQtXc1hbDa9W29bGOSGr26zVDjce7FVDuXez7E/fXoj?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9508f05-8af4-4433-5561-08defea18942
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 09:58:08.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeB8TNFTyQ686cX579U8PA9V+1p4iIVnhhr3Z/wtcVnI3EJMsjg2SSmpSq1PWoC5HjD+mK34H0luIWF4sle8EXIapMUHRbEyfb1fBrFJbaKKvTmp/qoVM3SUe1VrZYMy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13124

Dear All,

This series makes #clock-cells optional in the renesas,r9a09g047-sound
binding, since the node acts as a clock provider only on boards that
route AUDIO_CLKOUT, and drops the corresponding AUDIO_CLKOUT properties
from r9a09g047e57-smarc.dts, where the pin is neither pinmuxed nor
consumed. The DA7212 MCLK comes from the on-board versa3.

This fix also addresses the following warning:

sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties are not
allowed ('clock-frequency' was unexpected)

Spotted running dtbs_check with -W=1.

Kind regards,
Tommaso

Tommaso Merciai (2):
  dt-bindings: sound: renesas,r9a09g047-sound: Drop #clock-cells from
    required
  arm64: dts: renesas: r9a09g047e57-smarc: Drop AUDIO_CLKOUT properties

 .../devicetree/bindings/sound/renesas,r9a09g047-sound.yaml    | 1 -
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts            | 4 ----
 2 files changed, 5 deletions(-)

-- 
2.54.0

