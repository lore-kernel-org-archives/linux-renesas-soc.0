Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA493E6383;
	Thu, 20 Aug 2026 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219904; cv=fail; b=HofZp6lJN2oiDU12ielkraemrd7OTFlWzAbmO7gRgck0mrgBMtnq6gekIBJFB2HU1dPAk/yJ+zthWFfU1BPrTPFnp2oM3uuOxg2JRH7Cmmx9PNrZHB+KGNsztdFZd+bgiJS6utl+SjWRs5SFs3RP9nru7+cTqQ6kukfL5MJITBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219904; c=relaxed/simple;
	bh=noHZlJ4kmS+ZVjh18yyzTnYgdfD2YiGjl84Yx/ge3gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l8U7+/r8QhrvlblZIM1ntfYw26okDYrJ1OEgb8krNdDwIndpP8gC90tut+nplM/EYlp/S7iK1hkr+NsDAoWrgdHfbyat3c20FNN40T/TGimOjzSW50b8jNuIi8qzAYks+P9JWF+ntsrCFVeM3oyFAhiNkOro8Dr20GL7ZfDPEuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ltidJqD8; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ltidJqD8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsYi0uhGAZBlMK25OEZ4xLtGveGwNokQtKMI6/hz+nVsZnAi23KZ1I6yuINN1CD3j1pKkLDSsesbphxxVCVuLdw4t1cZ7s+WNwaTMBAjyOX+XI5L+cVYIRUJ5VSSF9gKFrlXtbDIUY1CyxKhrdz9nwE/hY3K3or6jeGpLtyMOtP4DFS0qlWxIrV4tZxAP8Q875VbcphWNAsumWrwVs2VlFHp7Sc8eXnNc9/o1jeYBcSiHIQVecBHKWN/8Ncjby5bLhcN0NSWvBNpvI8fEPc90WCaxWouX2UlDMBe0MzYv1nJot/daYhV5kBdec7WEuuNpC6rVERKrxzLDODS097p2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5zh9aR8xgUpaJ2zHGuhfb0/FiRTYnN+j9FH5Eyiatw=;
 b=wS2u5G5nhfwIQMJuTIIpm8ibQsonGOVFaOyHsRS+peU7SJ16HTV13pSnUzlf8A28ytwIDokbOrHuuDUMwdYYLawfuZoQqNX/r2E9u411nuVltJLeX80FzfmrqKCzexuqs+zGmnAmpQ9YrEI34ns1Ix8VwhmtGWJA3ZBnHrhaz1lu2iR6Vd7KS5YXns6GeT0OsUXrWQrG27ODJbwSZPvfXU+arVXjRlOam9JysQRU4X59Q8J+TzsCc7QYc1morCx6fa9ktZuE22akV6fCTRpQyKTcXjHz3wDu0+DVZdnDhmW5VxoyBbO0/uEw73vdDR9BjzlPE9w0wv0qUev1kEDtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5zh9aR8xgUpaJ2zHGuhfb0/FiRTYnN+j9FH5Eyiatw=;
 b=ltidJqD8KlCjwd6xUEt9q8bNo0Z1ox/ggGoc9TJDRa9gLEr8MP66yQozDpx2eUUiWtrXrsXgRr8YGDd2O+1ZCjS1Wo6ZqtRWwU463PPsM405JYVUEdy8gSDoeFsMhUHz2XxDthMjR9t/sHBsXJ49xJVmGLYmF74/6WYFnNu31K4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB13124.jpnprd01.prod.outlook.com (2603:1096:604:34f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 09:58:20 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 09:58:20 +0000
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Drop AUDIO_CLKOUT properties
Date: Thu, 20 Aug 2026 11:57:37 +0200
Message-ID: <20260820095742.3094558-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com>
References: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: eb9a3780-6dd2-4c2c-08d6-08defea19035
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|7416014|376014|366016|38350700014|22082099003|18002099003|11063799006|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	om9kyfTWGV2eftXmX5N8QWy1EXHrzRdKqE5xf1nLa68j+EXkERm2/+zc8SNe+yPB7hAVaA3xCE7Xj54/XArY6TWL0dO19fjWwh+NWofAP3etPW0bBqUpAjmUtuI0z7q4qZhL/uvuwLqxCf0xlunmx8vfZua+60EmyAyPNfiZMDMrGAMWAPybjFwoJK5VyDcUlkAJumLB34KptU9p88Yb5v1Z+MlTrs21ZHTbHLTL8i6xZQ1AV7H3+SrmupykcBtwcN1UjdHgHWWxzxxEUwvzFpeUJKNU7JcnhZo3W9S0ugpcPzAhGQ/wX9/1G7F1PNRbQ6qjyU7NOoCk/OgaBlVwnyI7JdSF7qxrjE2wruOmRRZB4hYlMmldmZt3eh/S47F7GxUWfYSeuczovge/yyeGLB7FRGSOHIf51oF1Dq4MDs5IDfEp/rY4oUI+NhGyjK1NG3pUtLTcw8pQdw/11jlxUXSlALs6tgZkjcqbZP5P3A88pYCmXxJiDALOb9mGOtS7eOXzCuMJHDZDQPYRdwdZSv9muqxjiYDvDiY/NREOYjrrBOciW10j+WUh5kPX0ZyhIhOBn17CCFNG61Ykp2CZ4jMAUT2LBezak/yQHIUsa8v2OCf1O9MrRgpwm/xFbLcpZaGsJySkK9JXSVJLPJCHawMB/sUQxRnT+5KHecXoBSeqIejU2HyBVI7IFAcH41bGLI0kEtQq54SGApJrWWPyqhQt7eo4hM0upP9alPmjFJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(7416014)(376014)(366016)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2GXv2zx9cWoo50/3/wpBKMjbCS0Kgeuu3+ea6gG1JTVaAdqxbdl7krK7vtC9?=
 =?us-ascii?Q?71wZx9BmSlBVuBdlnb6FfmKmv9E1u2TRj2kJyijk+vxUzQTNZFNN/c7HuXjI?=
 =?us-ascii?Q?ml89Bo8f3CownJnsRUVKcvUYwf2XMEqrT7SPK1h6oyTTIU0xHYqgXRigiqXJ?=
 =?us-ascii?Q?hKMpdMOXSqhuBx2piPxMhrtgzoEsrdNjApovOMaQWgftbWXNailx8qacSbmp?=
 =?us-ascii?Q?Xy//UgN/6QYhjZ54Zyu9SBOIYYccXc3XBgqLdqYXEDCwtCSSFEDLf1LSA0Bd?=
 =?us-ascii?Q?bEfdEUg8VseAXCw3a1EEijkbH1DNAqQlo+s5Nu1XguujUuAUOFgpYYir86FX?=
 =?us-ascii?Q?NhK9MvWx8NuCdporboeXGXWlEHhXXIJAwWqLOLFSPMpd8Z1EbVM1Xr+JH+NV?=
 =?us-ascii?Q?l36nivU7VLR0TRgpt2nyeptJACrEQ4sxIwR53lHFiBcnWlXFIoSdzDHJ45V8?=
 =?us-ascii?Q?evsm4NzA0hmDcV5DLoJMcVm3E5euyPI2n5dwC5nCWwOK3A4gsm1CM/1hTUSK?=
 =?us-ascii?Q?6dbAkLPctl0wqE3946I43/cvAA8Zj7WUWif2vG9fud9XJVtm7w+hZkERVTNZ?=
 =?us-ascii?Q?KUPSN6ctJFXa3a/srV66La0Z0KqcPd6NsWm96YgSGuXPrFU6YMNfucdKGIb3?=
 =?us-ascii?Q?0ZgRtVSBNDnW33wJMM6OUjk4XN2sd8mb16QhXsnTziRML7BnjXHiuS2qpQhw?=
 =?us-ascii?Q?+91dgeBWiWMlWatz+mOC/awOBFyV0iUZMMV7QMITJrNm7mWgewQ5ixVGx0rD?=
 =?us-ascii?Q?gmIdKBZODvVEF/HcwGuEwWI/cfv4YDCWZ7MGAfR1JiL/9jOGHJF77l6d4tPD?=
 =?us-ascii?Q?q7Ivientn327Nzm17RZAyxat0GVQDpBcXZoDYDfN1R9nso4YUFiJmGY26419?=
 =?us-ascii?Q?RWDshD6CD0a/608+k5MNfxFxJ5iyB9g1Yab1f/JEi1OYdTV0eM/sNbaea/Ry?=
 =?us-ascii?Q?2jzOaEt9lZ2T+hUkD1/aBmELXdBb4l0htB7agIbp2BQMz7s6aKeCt+IxXhcO?=
 =?us-ascii?Q?usi3yZuerDB90BWZBuoelogSVjq6+u0ruA0R9IjKoGxlFv1fYPHwsVvWoDAb?=
 =?us-ascii?Q?LMcIeR+YQ2GI9lmpjI+Zhj0CuODK4jE2/Hx0Xw4HriDsOfZc/Ss82bj6Pqnw?=
 =?us-ascii?Q?kd+MGJqKz0yoAJ/kZfOpy3+4xJ/KycecbTCuLyuM2qRcXQB18UoaGJeQglnt?=
 =?us-ascii?Q?t1JoirbV+TJ6tOnnvN8hsPyCFo2lxFg2/71OQkbrrKn77IkGSNkM55V7fni6?=
 =?us-ascii?Q?/iZJJ7gpQAsUZA/STL+5XrSDYME3ddnsNm6JPmwKq9BZrDp4YB4Qfb+vmZeA?=
 =?us-ascii?Q?GRpjF3JW4llKIHMTicjjbBNNnPVZe8nC/7HoBCxng3Dl2gb7J2/H/riEKmrE?=
 =?us-ascii?Q?gebEzBtofyzUbn0MX+DuKyn0srB3dsSmoVC3TPNxfQUdz04wQQlXlwfglrZ4?=
 =?us-ascii?Q?xVoi1mJbRnWSpVRyIBfSpdJ3UEILLSgbOlHupz89pC6+l07oKnbBg9DuiXhV?=
 =?us-ascii?Q?ftEPgxvuBvQWrv4U0j/MCrw9sdD9XxD4uo748wDe5VZm7CnvPpSatDbyBDWw?=
 =?us-ascii?Q?5EjrZBUxg0ePHzfPlhOYaF5sAXTbisDc49UoRpgS4Q1VFXc7aGjBbVfj2cyn?=
 =?us-ascii?Q?C2847YtUMFRPY/KJWCJOItBXFS8gAyCvJS9cCVeQFxZ2HloyumxlGTsP11iO?=
 =?us-ascii?Q?1RfeAvebSdHWKZWLttK69bC0iRA/bRDwaHuuW1T0wR7NuR9Dy4Xqwrxba178?=
 =?us-ascii?Q?USfVGT+330axAtjWn0IeA2NOQgCUYObWZ2azlxkYEbdphOmRgKYb?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9a3780-6dd2-4c2c-08d6-08defea19035
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 09:58:19.9677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKG+D3iuDM5nwUB3NjTFvUbT0iUFKsrRqPDe/xlR6bmq9i4jSgr11ODJ7Xpxh6A2Vt1OsienJIIV4p8454lvKJw+Py3XjONJahI8GwoMG6xP8u3yzkmm/sJ3Fx5APYjk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13124

AUDIO_CLKOUT is neither pinmuxed nor consumed on this board, so the node is
not a clock provider: #clock-cells and clock-frequency describe an output
that does not exist here. The DA7212 MCLK comes from the on-board versa3.

Fixes: 3e23d2548ddb ("arm64: dts: renesas: r9a09g047e57-smarc: Add DA7212 audio codec support")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 4eed095b683b..d43b50bca4a8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -362,10 +362,6 @@ &snd_rzg3e {
 
 	status = "okay";
 
-	/* audio_clkout */
-	#clock-cells = <0>;
-	clock-frequency = <11289600>;
-
 	/* Multi DAI */
 	#sound-dai-cells = <1>;
 
-- 
2.54.0

