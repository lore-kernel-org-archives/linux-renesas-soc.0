Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E83B7757;
	Mon,  8 Jun 2026 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928182; cv=fail; b=LjFSuQH470lyBcvIhZ1VCfvT6SjfvQcT5MvUhBA5yhm92nZvUQCJpUeHHoTI7R/mnJTHrV7GxGawa3CXwlEo+qxzINhNPsCdEoxiohCLuUU0DIqmVr7NJpmdNOcm+eqVqeDxbiXSrTukvEwaoWoxse6MIdPqWmFt456Nz+4UsqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928182; c=relaxed/simple;
	bh=ekPgbBBW5mJRzltXJx3Amx1ANDWuMwqeBn+B0I+adN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FkD1jpo4awWVIOkghfb33/zNzX8X+pmKs2XSlB+Co/RekTjeOdhNAZ3kbkH2uaTEuFj7/JDL+WzLpGkBuVMgg2JML3I932fKOPMMGbrg9C6ROMUWeBfxFg5Gr060w6mzYk9ZrQN0WZCmHuAqQGjCsxoP68/fVVszZAVsWDG4oHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OE4CQfr/ reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OE4CQfr/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIxIX1ltOuqNS26IIAhqR3XbrsuIXpJBHAsQVe5hZrQtQ5MM2R79iYQsLHSQf9rQX03C11fdYWJUYWxVdrm/TtPkXMKqEoQrsvbK2DtkfvU/C2VnzlFfHenWbsbl7H4MeY83V4AXeSuWYidj67L+QANtu3t4MAo8WY2a1qh2sUxjd6Ygq3JCn1NG7LSJZfBItT48vvlxOrdo5VT+y93tZ/I5eoZ17Wb+eKLynTXbgvj2+CPAYGv8ZseCDm8+uZ/Tn4+2OVvVwLwSNi9b5SRY+Mc0jsKXBR9URJEOBvNHLVkaIbX6+6GAvAWsQu3SHYgOj9tfBdj1DlO8WVJDgwyp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orB7pYKNkuvQrj72euJ8cKLlP0HECt3E2Xs0sq/dQSM=;
 b=toF/3cNslia5e9PnhreeX2M14bZTLTYdNStT23TBBsW8X+HSCIkG0TTEUWaVxCtDumO4VrlsSkBpgalXemPWV1hQGt1Sb3psxZleGoOSswlMJI6qBeyZurkuYob2C9Z5X4/YGNP9riLbl0mfvZ6kHWvaaooCbH2w6xWDfFVpxDya7NVvoNhFNVmAnsNfF2dKyS9Z0dTpE2cYmg3qVftWCoa2bKnVSNy7uloO+9Qs3wyT8l8DetCdO3guQOgp5lHjdFJ8CKELwuKDTmu4dHVqFs80N2ZvX3JePeCz9c3x02iMI0t9grJxJk2AlCRtjsAfaHx/rtP/r7zkA7e03ckCGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orB7pYKNkuvQrj72euJ8cKLlP0HECt3E2Xs0sq/dQSM=;
 b=OE4CQfr/mmKbNCMRG/DCk8tuXz7OqD/a3e6KjG1eeHynXNwF/ijGZBIRvVlPGK7T6gRTJZpg7RMVp8+7gv9SVbhb2laAybqyQ0PznY8egCDZ3eLBjdR6DWiJZ93IvdHhV/IdsbayCeLotZpuvyApxeTYb0GKxY5+zFw5UDPuVzXlj22Imc9mIkmckU/ICmNy73TAKQHjFUcyzzuIgICLVo7KDot7e93W/PExnjgHapR7xcj46sdIAp+B41mFNmI+N66yqOQCLqNvJshOckh3GLxyyivLcKcNkMOj7UhhJ8XnbGf+XxfWyfTJehHz4qKMTOva0gOWAwGBp2plsbGsOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11929.eurprd04.prod.outlook.com (2603:10a6:20b:6fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:16:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:16:17 +0000
Date: Mon, 8 Jun 2026 09:16:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: freescale: Add dual-channel LVDS
 overlay for TQMa8MPxS
Message-ID: <aibOpGJiQSy0YVOP@SMW015318>
References: <20260603093621.2504490-1-alexander.stein@ew.tq-group.com>
 <20260603093621.2504490-4-alexander.stein@ew.tq-group.com>
 <aiL9i6IQzK3EHGpm@lizhi-Precision-Tower-5810>
 <6005215.DvuYhMxLoT@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6005215.DvuYhMxLoT@steina-w>
X-ClientProxiedBy: PH3PEPF0000409B.namprd05.prod.outlook.com
 (2603:10b6:518:1::47) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11929:EE_
X-MS-Office365-Filtering-Correlation-Id: 2991c115-9190-4775-35cd-08dec5688106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FtlPlvgHivUFO/kh0+3h8BuwuaSwSDNm6KemVrMksLjWeQ6MLzj/XVkyXdITckqC/Um89zhOBUDQcqtiYF5wnudElJRn5c3TwfeRn8dEdku8XQvJP18rhY+P5jTU9IxHp+KFb2bPpA5Asi+tH3kRdxz92A+z+wk1Eh/1w/HNt+UbmO3/4BIu5/mhhl6TqqNyfjYSxuofLmVvovRl8N+tzyisJNoAgy3Q7bmkpg+Gc+sIEeH6mMh6rd61kJFZYYRiO8KnQnqY3cci4jj6/GhcPyvc6+pMfYL0NDXZWFuZIxRTiLS9TRm9wOet0anD7+AaLzsYy2t/V/acJ2Nskz8DBRtpdeonqjS0PlT2qC/n1Pu8XQLkIQHxEvACOa32P7wKNEF4kYBoqKGDezahuUgGtVEhRzwWYbcgJW88nluXN711m5emBO7FRIt1FHlWSvKSm+a900+alaQfLR6/kT1unDgZ4StUzDBFIQx9dXSxbJZi9wqcPR/sN6LbjpPkGrUWhyxuO0rDgtKOhiVLfFUHTvVSCD4iicRtnKSmX9inbORbIX/M7s2Pa3wuZ5SInG7PpnXHjTYyam5zdQ2EvVtPmew0oiFxlPbhlo+SdCjasZ6BBHsglJLBP4oq+sl6Ulu+AIUnmT+WNvc8MXWjxSOMRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?rbO9YlDOyB5lBzXiELIVeXf9sv3s8BLtU4NvEVixfOnnzWtGpZ+muryYPS?=
 =?iso-8859-1?Q?6ApBhIJetzl9bznYwI9hI1hqDuHd1zeWRWMujV4YToTK27C3dlz7AtXFNu?=
 =?iso-8859-1?Q?p6QKk5TFIs99BtrfihCjJLD9IxcTH9raWBzyBbcr/meUN6Qb2M70rA/ufJ?=
 =?iso-8859-1?Q?3Jhss0vkgQlfillkYPd7akHjMBueNKiaNdMrzSpNDcMlh36kr3ibXxt/Vj?=
 =?iso-8859-1?Q?uyTejrrPCA1/P39QUC9UR5ABqrKLeF858PZfAPLHJwPQdd5xrPP5bZ0Q1Q?=
 =?iso-8859-1?Q?KDA3WnGGtKwC0kT/g7FhC0YzWs2rxvZ8oZ8vzm60+StKD7FiS9eUn1p3cy?=
 =?iso-8859-1?Q?NR3T5oH9GH/WVSX/7lldEMTd56F5AhRVV78c2I+ap5i0nagePIgH/5rkXe?=
 =?iso-8859-1?Q?nDqZGJ4Rn4Mt62+L1ZPxnFulfM5T5KIoBajfWqxTUxrqUN6u9KhGEOXwM5?=
 =?iso-8859-1?Q?M+e6RYYnbiMTdoBllqu8hCtbELSrhbDX4hgKS4vFflbnaHK2QFmIVpc7BD?=
 =?iso-8859-1?Q?P3roLuAwAZFkChUgYlVtFsMJmdnRDjs4POGhyY22nESitfffgVcoZNGj31?=
 =?iso-8859-1?Q?oqBsHCi2QJ4BWTW8WoIv8SvwSoIgyjBOi9YRJPVUfU6mL3Q/BkWqkS7JAF?=
 =?iso-8859-1?Q?Oiz2ux4fam03VhnChJtLu0I5Arz1Ie1J2iQBB2191JinWJsH7DO6w2ftcI?=
 =?iso-8859-1?Q?k5MnB3iTl9QgivDvz6pFgKvPGkXas0V7ozeswpB+R3IxDjTx3or9uINcnw?=
 =?iso-8859-1?Q?ez9HqfMMP9yhn7nYcSSl093S7HjB4EbE6U5d2pcaxoCEV/wJL1+HkYWcm0?=
 =?iso-8859-1?Q?IY/SXM8z8irigN7W31cqid9TKH6e63J1xSXYhi8C3jbOF0Pai5ILn7gayY?=
 =?iso-8859-1?Q?SkWTqPE7/+pASPavj/QTuwVok4zwQnq7rHudVHfL7hLw/d04bOuHL7TmUJ?=
 =?iso-8859-1?Q?5LskgMqiAPVOP6M8ZQEncT9d4vaAR5UPQiVP6E3/okGbSioZ0JLItIxXgI?=
 =?iso-8859-1?Q?Ht9SWh4ZRZmmz2t6KEPWt1cOYjiunoc02PAhARbE2izQQHYrBzS1n4ZMoo?=
 =?iso-8859-1?Q?ynzqMXR6f54VdEpCJmDnM8NEjDIdc0mhf6JEuEWtg20aGKVrqS2UE5x8O6?=
 =?iso-8859-1?Q?sjm4g9IWdEyIwdCiHVz/uOCRnQ3E+O8x5yclRA6QO9S0VGBOQFs0wJiCsR?=
 =?iso-8859-1?Q?pAvMqnlVbC89ia+9MB0/rA5D+hZE07ywPQHQIWiqQRKr/dK2dAjm0AyHWd?=
 =?iso-8859-1?Q?BcrcBZKK9/bgOk+LvRccScytBGre8hvpuIhO644iIPdrpG2ZiHS1t9rrpd?=
 =?iso-8859-1?Q?YBzjZrufqw6VQE7zVhFGv1Vg+McQXJwo+FU/oHhnIfOshBTu1uh1c1emVL?=
 =?iso-8859-1?Q?nco2cDQVSZZ9c3oE5vMPxw3gMy6ThO/9RDa6gQFqgNWveJrzJ+ASWHP213?=
 =?iso-8859-1?Q?OY8dY6mT8s6G6sYpJ2refmmehbmIfrXEkdYpzi5dUTgAVteGFGCVYdYwmF?=
 =?iso-8859-1?Q?hPRWVxvOYxn0hoQmMPOeA3/L/1vk1yn9+/UGfsmbWyGlHeekKZS3asY0Rj?=
 =?iso-8859-1?Q?QGqbmav7ZCE2/pqJwFqlwL/s+bzv0FR6QmadR2HPWwVCSOclff53vBTZQd?=
 =?iso-8859-1?Q?RKcjc7FLkUGyLhYy79ihBIWLDED81HAWKAyLRD3zTbb2q11ijkDfisSRfP?=
 =?iso-8859-1?Q?ZdlQb7GWFvDoUeICMkSjkQ7ThLhXIZpv/DSJUmjVGq6IGJtDecvYUwS8hh?=
 =?iso-8859-1?Q?wbwIeNIAmrIWPHLo2aAqBTPpe6r/ofhB29DLELoEp4YupIcUdt+0B7riTI?=
 =?iso-8859-1?Q?/YP+QBU10vwQVNSChmk5tA3MOewtO/uieoN04C5KEX33oVC51Jha?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2991c115-9190-4775-35cd-08dec5688106
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:16:16.9039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5+IwHsPktZrJtsXFe5Pna9dydlwpKUcsRCJ+/F0FoyTtFD24wH/vOlu7iWL1g1NDuiWuWTiJw3kbVnzuUO7IOvPC27EasbeoyVutBf9iQDwQA+AD4J/kNodNtL1S1M9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11929

On Mon, Jun 08, 2026 at 01:22:19PM +0200, Alexander Stein wrote:
> Hi Frank,
>
> Am Freitag, 5. Juni 2026, 18:47:07 CEST schrieb Frank Li:
> > On Wed, Jun 03, 2026 at 11:36:09AM +0200, Alexander Stein wrote:
> > > This adds an overlay for the supported LVDS display AUO G133HAN01.
> > > Configure the video PLL frequency to exactly match typical pixel clock of
> > > 141.200 MHz.
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> >
> > Can you fix W=1 dtb build warnings?
>
> That would require to duplicate the setting from imx8mp.dtsi. Is this really
> intended?
>
> imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso:51.10-55.5: Warning (unit_address_vs_reg): /fragment@3/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso:57.10-61.5: Warning (unit_address_vs_reg): /fragment@3/__overlay__/ports/port@2: node has a unit name, but no reg or ranges property

Yes, add reg is not harmful. some overlay have reg and some have not.
So, I suggest fix it.

Frank

>
> IMHO this warning is not suitable for .dtbo, while it is for .dtb
> (with applied overlays). The .dtbo doesn't have all the information.
>
> Best reagrds
> Alexander
>
> > Frank
> >
> > > Changes in v4:
> > > * New to series v4
> > >
> > >  arch/arm64/boot/dts/freescale/Makefile        |  2 +
> > >  ...p-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso | 74 +++++++++++++++++++
> > >  2 files changed, 76 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > > index dee2bea156740..3f466f102dc1d 100644
> > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > @@ -385,8 +385,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
> > >
> > > +imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtbo
> > >  imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtbo
> > >  imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33-dtbs += imx8mp-tqma8mpqs-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtbo
> > > +dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtb
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
> > > new file mode 100644
> > > index 0000000000000..9595cf4d43cd0
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
> > > @@ -0,0 +1,74 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > > +/*
> > > + * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> > > + * D-82229 Seefeld, Germany.
> > > + * Author: Martin Schmiedel
> > > + */
> > > +
> > > +/dts-v1/;
> > > +/plugin/;
> > > +
> > > +&backlight_lvds0 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&panel_lvds0 {
> > > +	compatible = "auo,g133han01";
> > > +	status = "okay";
> > > +
> > > +	ports {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		port@0 {
> > > +			reg = <0>;
> > > +			dual-lvds-odd-pixels;
> > > +
> > > +			panel_in_lvds0: endpoint {
> > > +				remote-endpoint = <&ldb_lvds_ch0>;
> > > +			};
> > > +		};
> > > +
> > > +		port@1 {
> > > +			reg = <1>;
> > > +			dual-lvds-even-pixels;
> > > +
> > > +			panel_in_lvds1: endpoint {
> > > +				remote-endpoint = <&ldb_lvds_ch1>;
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&lcdif2 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&lvds_bridge {
> > > +	status = "okay";
> > > +
> > > +	ports {
> > > +		port@1 {
> > > +			ldb_lvds_ch0: endpoint {
> > > +				remote-endpoint = <&panel_in_lvds0>;
> > > +			};
> > > +		};
> > > +
> > > +		port@2 {
> > > +			ldb_lvds_ch1: endpoint {
> > > +				remote-endpoint = <&panel_in_lvds1>;
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +// Update VIDEO_PLL1 frequency
> > > +&media_blk_ctrl {
> > > +	assigned-clock-rates = <500000000>, <200000000>,
> > > +			       <0>, <0>, <500000000>,
> > > +			       <988400000>;
> > > +};
> > > +
> > > +&pwm3 {
> > > +	status = "okay";
> > > +};
> > > --
> > > 2.54.0
> > >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
>
