Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA328D831;
	Mon,  3 Aug 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763739; cv=fail; b=HhCh8WMgzEFlSKNcZjHq/NhLxKD3z03z5i0MeAvsoHxI6NezV7uQ0OineiNmu8lx6F+l4JBm4Beyxu90rTIl8hijUxBLJbQHpP17M6Lx2yzTNfcMOCLMeIg1G9oS1Q8YF2EytSuTdSVIE8IHBTzHNNN86de5kto7p5L8YgWUrVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763739; c=relaxed/simple;
	bh=QIVx+cpP8gAQ+QebLIHRWRjtmZ9OngCUuCwilxy2zH8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nqWaPNo1aoSGhDUjFHsGq19QLCU3Ez1+/CV1jUqnRZnUPNKyjrArkPVZDcy8IAokbyM9BIxzxOLzCSFvYgrok0qy/wxBfTsNzxu5tRjHxvtQoWhpZhoK0lFZQp0O45Xsq/hoP3h107r6cuysiYxTeOtrq69ocldDb68J0xOU0co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Yqqk3rmN; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Yqqk3rmN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0qz7vTxF6BE+e9+SNodZQ3Bu4kgWhFSzD5sMf7HIvLwCSOkNxqMGmeAViZ32ATi1PZSBA8Yo4gvuoaHUXoeNM1qQx36hWQPeEzKW66nVWK/AN5LfYoKC1dMzbqgLGDikHIzJxiJdJzrdCyay+nqCjxnpQ7i12/Kxodrgd27M1UJSZlSblzPL3s9QrYAKa1SiY2Z5TDcyy/6y9fWqwLRRDlr4Zahujh4Wq+PcrpB2l7gDE3oyx3I+LOhUVfVeO6rZIw8p8cmmBfv9v0u8jOq6yu87n76oXzKmeLwUU5Wq8oudPLKtFIEdahJr9UcSTnOt5BPNjthPWUxKbtREjFbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVl7KEeN6sH9X82/egObnh3hbvw2Rp/EWbrSVWu5fm4=;
 b=MIRyhhdftmMyX+BnSx/VAjTu1daev5JPCXxpJFBmldFMk3Rlj31N4IvpSZ9b79jv2QMrnHJyjqsweR8x9srYZW6/9NSX8qzzoIo/seV5Xnuai+R6GcwGl5iMy+psaOB/8TpjdCHJMvxwTqdLbRoPjbGQVn7z7179TAUfm2ZFbAjT7YxmTTAjei/0pXzsNViyZlkbKd5kT7Td/qw/iTFelz4yGYyLrsg3a/Lve/fZkb7VZ3eCa5a7TXbmaJeLwClumYjZwxQgyKED53g2JRbQsnnCZqDJEClBm63HqxOW+ZtEvscz7acl4JV6qLsCvHk9VTWM+LfbFCtZI6sD1E+kDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVl7KEeN6sH9X82/egObnh3hbvw2Rp/EWbrSVWu5fm4=;
 b=Yqqk3rmNCMygzwqcZ4KvTtzzE6NCeFLZLEnfZG87O8ACaQeWgnHItxed78jPPcN7wT9foLLDFdH69QOMc6UbDL0icGW/dH86uPhCGcWraBLFzjVpWlNSQgOb6sULSJhcIFGcPaz/4wKFKeTgxWT3r+TfDpAYd4yVXKP6kZQfDh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY4PR01MB17923.jpnprd01.prod.outlook.com (2603:1096:405:34a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 13:28:50 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 13:28:50 +0000
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
Subject: [PATCH 0/3] RZ/G3E: Fix dtbs_check failures
Date: Mon,  3 Aug 2026 15:28:23 +0200
Message-ID: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-Office365-Filtering-Correlation-Id: bc8de247-f4c8-4ff2-71ed-08def1632794
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|23010399003|366016|18002099003|38350700014|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	beSiZRSbv9AUVa/kAAu6xlO8kJQS6emLBwzA82MjFIG62roAH9i7Kir7Ltqga6zXAQA8o//JG4spFjVAkL6S2TWXBUwJGnbtbn4Z+6GCpnPfGVXOe/QxpdbzIQ+gZpHqym9GtxwPX0pGQlDCD5UPgQpHz5Na2xqdbfBjKUD5LBl/LHv1wsso3U49jWG9oVCZOxlfyWOPNMKIVFUF9mVT3yR9NJNejCHr1az1Oj4Qh6Btnuo99nwOU3E2EA2jFrH459GIAMPxlPgq4xeYze5+KWRokuZ+rErL6ePfjEG/8s6N6ysYm4iV8dVGsxqY92oRNrPhTbJpSlaOz5O4MEbvQTXHgmLQYTOuZQpVbWNDBXcb7Tm4O7rJZKD0H7krPUOnMm3KPuhFMEioEVNUAIAsVXuhqcg46DpcSX80mHpt1JKj4kkIc2MZlt2QCDKZoqm42S7TFK3mpzKZNN2nz3TrK389Uz3Biap1cF1JtR+9rm6cBKtB9YL/51gTxcfHThb6yrbSwyb+4UAkPRfU4Z+IPe2A+JMSV9xJCbAjk5is5hpkeIwnCEG0PRmraRqj08f00sQ3ccGsvHDdjonEmIZBnN4vOVkjg9qwqU1c3UgSgPGCA8HhFg7mmQsRW/1ipUyzXwGwXNFt+HsXA2VG0mowKuYgcTpnHf/UZHh2sjEl7G9OKTh0mrgYLNAsbYh4i1dy369hMIiu6/5u5MCnHvl41/BzUTUvbRorDs12hCsiRIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(38350700014)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6T7FjvrBHlTLRHLPtLhdd05IqJzhF4gdlrnVlDWKi3l2+AmLy1CjJuHlQPKP?=
 =?us-ascii?Q?neePMo7wgVq2Q6dbL/kUKvT2pMfZBP4/HZ82YPCSRL2iqT9REn3J4/8oVs0x?=
 =?us-ascii?Q?9MQxqDf2+AT8iM5gayFkItFXyA3H8nAS5LjK8osL0sctLGQCNMoJW5z88dsb?=
 =?us-ascii?Q?SdG6/SMSeaHIHkJvL4zJw5XDErzFYiqcbY6J1iuRzJE4wJ6QziRNCJoGGo/w?=
 =?us-ascii?Q?1V8FJlL2MHYODAVWYviza3HaU+6sDMPbIFP0dcUug97jntIapckX7wwuA0yu?=
 =?us-ascii?Q?fkYVuyjpFO63aETgPYHn5gMCeIMqisUtKInVOb7tubyKwJJfPmTtkWBoLQR3?=
 =?us-ascii?Q?0J2XeAklJr+bDA/8+vTeqsBudBeA4zsHxNCmy+sQwE5fHHD1Ap57LFl0uDvP?=
 =?us-ascii?Q?mqupAllwtxOwcxAVLJj4o2W9QNTWTr+V4FcLutPBaAYGjGv/mFjp4taZXWRT?=
 =?us-ascii?Q?aCvod1qzu0HVy5mAn8QowxDFqiGwY7xauC/SogO29Srd6igy5Tjm2i0hgk+Q?=
 =?us-ascii?Q?hiHmJYEq6VsS9bQLYHONQjouS4WXcnOU3PWneVkn1sJ//lp+75k/RrwPINbi?=
 =?us-ascii?Q?bTan4wBbXdThlCpA1tlgRrlp8BGzxEBW9ECMho+PWbzcO4y7D1YLqWEiGTim?=
 =?us-ascii?Q?bBY3dlL6nUx/tHW/PAXPRYTbHhOl7FJVcnh5X3rhq3SYu8FYrPnn/zNeUStM?=
 =?us-ascii?Q?mMz7LI08KQ45EmYgtL1ezz0MpnymV2DKf2P+h6RE4MT62UQqJjAMrdr3DyFn?=
 =?us-ascii?Q?kNLXm1zT5i3hOJsDCW95IHvF6JkEgBer1f9ldZK+0jMDrOIwTGiTVX6LmMC3?=
 =?us-ascii?Q?m1p2Z+D8jgzPPEp21ts+f3zZRI7a+L68uo8w/YKgAR/q/WEq/e4SB7Tb5ZQX?=
 =?us-ascii?Q?bTyr5QcrWDk2meSMK4sjmNmW8N5R2LISOEQkFFyxrY+swiZxqsZkZs/UO+AW?=
 =?us-ascii?Q?wHNi+aIYp+MWLX/qfTpm1piTn+t4snxUgf+r0xXCO1oUwNan/9+bQ6qWtoRb?=
 =?us-ascii?Q?nmfiDLoxGzRlp67s74RMDXUXl210+xX7A8wy98yxiAREH4sLMt+3l9BbirgP?=
 =?us-ascii?Q?OQ9dDyUV4kVNLcrPF9mPf7mTbCR5w+DxZIh6sKMaAbz6mEjdPVLNMoYu7Njt?=
 =?us-ascii?Q?k2UGkM8rD/lnk9px6ai29C3X99jIyPBN08O5tNSZmRhlFzmT3Hm9xBN6qhz+?=
 =?us-ascii?Q?aYCpZYiZ+wntcRzcGZKbIwvS0LeKx3UEbeJwErK+yl4B7w18DtqK+rOWoszS?=
 =?us-ascii?Q?TY9yZKipwXyFe6leie7o+UJwWdtfz0/YUDn0hvYKk6iEb05G/D7WNP0zxdQq?=
 =?us-ascii?Q?9jnDhZ01jTv/5MFFG4wplzJ9y3z4UPSJl48PYg3w/m37l0daypq1LfFGODvl?=
 =?us-ascii?Q?KjVy9KzEAhqvM/kixplTd8FGukkiUv9qxwDZ9JgXf0RTM3Pe5rkEoVB2hMcp?=
 =?us-ascii?Q?6+vYKbMnTadf2cbv9KlwP3qtAra36GH6bPDEoz7ica4LyMbnjn+EBkReF7rz?=
 =?us-ascii?Q?5B0rC2HglgLMRqPZ4K02rDilV7aOO4s9sUr6tNb3U5BBya/+ovMlOu7fK9ZX?=
 =?us-ascii?Q?d74DST7nCraiGmDVM9xJtAH3AsRFcrUBvmNi6QGA6KtXdyEep+1zB6Jz0OZ3?=
 =?us-ascii?Q?uadzAo1S8s3fU2t00V/9BM48CZxkW7bi2QAq3/Vy+moNdY3+qrsU8sMPU4OT?=
 =?us-ascii?Q?zcmQ43sJyw74yW33rlcXTyrMjrz/46ltRFrGXNQl+NKT8McB5jrUnA5jqIsl?=
 =?us-ascii?Q?sXJZXUeM1a0iGG9X40Y6T4TdzKlzwbpbQMrF1xvnPJpdJkjr5/ld?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8de247-f4c8-4ff2-71ed-08def1632794
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:28:50.5006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zE1Qs6cZvIo+0V27fr9f3x77YWDFCrEh/k7XJmKeKZFb+tmVT51cLPFbHJH34pyWVsAstnW/MnwoA/uxs/MWaI0giKtp0KqU6JyNNOh3T31AlYU4SXyU5W2C0T0+cHb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17923

Dear All,

This series fix the following dtbs_check failures:

sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties
  are not allowed ('clock-frequency' was unexpected)

i2c@14400800 (renesas,riic-r9a09g047): 'clock-frequency' is a
  required property

Additionally, set the i2c1 clock frequency to 1 MHz in r9a09g047e57-smarc.dts.

Kind regards,
Tommaso

Tommaso Merciai (3):
  ASoC: dt-bindings: renesas,r9a09g047-sound: Document audio_clkout
    clock-frequency
  arm64: dts: renesas: r9a09g047: Add missing I2C clock-frequency
  arm64: dts: renesas: r9a09g047e57-smarc: Set I2C1 clock frequency to 1
    MHz

 .../bindings/sound/renesas,r9a09g047-sound.yaml          | 3 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi               | 9 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts       | 2 ++
 3 files changed, 14 insertions(+)

-- 
2.54.0

