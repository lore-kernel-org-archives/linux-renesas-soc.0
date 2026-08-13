Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67035C6A7;
	Thu, 13 Aug 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786651190; cv=fail; b=JdQ8PXD9bca2+J2NKOh0qXNcu4xYkbZ9CDMl0lx8Y+vrlZtthDerzTgIQQOV2Jn+fLNQtte+DHxln5Lb5mdBcaSUKKs6Is2+gDzb26wIH/QuWoytqBDDNg3DNE2iC00Z+jRzW0fBSHmbs1MTQwm77HOjvYq//2/MGh/cEqRxjVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786651190; c=relaxed/simple;
	bh=ef9wUCrJbYQiVK0aCgqlnx6U0ZWL8dOTNIgeuEArr1w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pcgwKf++qfeBbcwlIVG9ezXaMCPVEgPfBugadqoerQcw2KnGzqHEpwLH9JVFZ8NGlgv2Ua/SqwKybKFfKmXbbV4UPSbBCwxrhn9InEB+51RpNjHeFMKgiXQ2IJpO70of6MM/9ouSpgta23PHwDtGkm5JX9Ga9XQIWP081zhlNdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fn80FN+8; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fn80FN+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2fQuo1y6a3y10lZl+rxdYjaRt+7vReMiusECd/jm7oyfuQkuArBxXd8V4RB6+qcCIgSC3WdmfzGcgjApaWWZssu86kwg1ecgwhPwoBr2zZzYcljA/CvyLjO8yMxFN8SKYb6Tmxud2v2/COjwADc4XTmskgAaScISQ0ZqyIp4UlD03fLav2grEZ6YNqrJ+SOyXFQFNeT2amvpjbURwRadkHXlr8AqiUO3LBEckDJ1hTO0jlzxaw8iKp10ujO/ydiYKjS3QKsrbey+x8e9B+OLD2J3n1trXAEwOuBuivpFp2EHdj4o7a6Vrcs8pncDUEbJrmisAQSfiL0yAHWjBc77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ab0Q6paA0kx5rIQWYThMD8WBINxS4pboepBoz/t2MY=;
 b=VffXWjO7byJ/LpvN+2yxavaTTgtGR1wy4wLv79WryqX79aoluYozus6GDush/R4xEWRS8L8k/fkBkKAkT9xWf4vaOdV9z8UtIcXFpNYmhRz/TkAnPOHi8ByQffNWej55Lg50ofJWnTCqXb6tlLAH84kfViipdBpx+PsPQt4Dny0m04urhpHOSj4pgUMLE7tuJn4o4/b4VQxV28sT76R0Fne2OV05zJ6YTZsS0SWy6V5FfelhkSyG6TdDXhi5O+2PlCaQXa12kZoiNlh+utBrq4uAK/X/Cw/237LvSABpR9gi2LwvKsV1uQbdllasZm/0Sdm9qgc6RL2eNMYJgNdsIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ab0Q6paA0kx5rIQWYThMD8WBINxS4pboepBoz/t2MY=;
 b=fn80FN+8edQ2zIBPMdMMXJdMt+4LUBRrw1kMgCAiFSbG87R/C3oh5OuXbNacEN0UcgbIMD7NllO/iXAGy3BgYGgUCX3n48r6HbqHPHW14NIl/QymnHoGhRkSg8GRzS3tQXvT3s+QycADBEwarLHtLiNKwdyAyKudxRTRL7D9b3Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7771.jpnprd01.prod.outlook.com (2603:1096:604:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 19:59:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 19:59:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "biju.das.au" <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>
CC: Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "biju.das.au"
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] irqchip/renesas-rzg2l: Fix loss of interrupt
Thread-Topic: [PATCH] irqchip/renesas-rzg2l: Fix loss of interrupt
Thread-Index: AQHdK0OeK7dlcU8Ho0qV7uXj0P3Un7acY7CQ
Date: Thu, 13 Aug 2026 19:59:45 +0000
Message-ID:
 <TY3PR01MB1134658D087DDE1106CA0DF2E86DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260813164839.129777-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260813164839.129777-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7771:EE_
x-ms-office365-filtering-correlation-id: b0c10a75-7173-417a-2e7b-08def9756c00
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|38070700021|6133799003|10067099003|11063799006;
x-microsoft-antispam-message-info:
 DFJdNHjjuCUZYtIF1s+XSsz6mjaMPYb8VoHxMqj6HQqhJo7P5GSJ/gQEyLav40FkUm4tAVUceIAxydCwm19TbFmUrobEwJVCUnLaeXj5qUWB0eXu8tGboI8PMpDP26RrOKjVVqKFpVTBKzivv7ziWBl2IpTaB9vl0F8rC6w6G35gOARF0n01/mkVq2ikXtzvG34MScDTXDbr5h/9w1193FpO2PJOdiTMSBT133gdxK92Unqa/d4I4OZIfIJwu3M74thnLzK2Ixqse/Y8q/28lIOgm8zSZKPif2FKYmfB/aSGT5JesdIw/PsCduXtce5pHy9a9EYzeY4VzAQw7ShGlNLIE12H66EdyqBfYy1A7t1aJWcWkr02LuPvB5qLdrqb4QHFq0QpNCgboczHGpktggBho0EcPB9msisVMXu+vW/oxlcgkN/g1D44CZB3c6q1KImGZSOsKTZGYvDdVRyNwTydizxo0I6O7eLeGx/apuZQmJWaALbiOJvyRtj618E9ZRLhrJvhC9IYPsx/myg1vUOwc2Vc4DcuOg3C+zM7gId8rQL5YDcWdSdV/ccHCs+cDzNUzB0oMNSpU4fMrtCdqo1BR3CYqCNg2ACHsx/1j78bC9B1MTXGmP6MzH2rxFDQTGO3fajcEnHQ9AHHyCkJQ+5FrwQlVeWS9jK3cq4bbY3NAUm9Gkc9yzkV1U2PTTaH+fDSlz3hKM1uXWDZi3O6PjLAKyFiOo8XmQbfblSBgy0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(38070700021)(6133799003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?03p8WGeDtitlCmqQ2SZXM5iTYoDdEaySwoCTk6O79RKmETFTzm5gH1gcDDe+?=
 =?us-ascii?Q?sB1Yt/5OmogCzGx/u9Ar3+lDorHwc2nElBGtd2zkeaqSfXVTO/9gb9TptiJ9?=
 =?us-ascii?Q?i6iFsmW4Fm4L4KZVJsJDfAxb5zjERWx1OJLbXqkdclJVPa8ALjGLUojizSD+?=
 =?us-ascii?Q?ygycrErV3yG2ga/6tWdh/hvqcOknjA5fuXfXp/8MQohEOKnhHYY8eM40j08c?=
 =?us-ascii?Q?60xqiY16Co/yHCs94QZFSH7baCyTkrKwy22Wl7Yzc9o0VadpIVSqynryTmBF?=
 =?us-ascii?Q?nmqc9uKv1c/T5Nf5irLqDqP+CtgEhBfi/41WqUV+tLsYlFDljnfSPDBfjD70?=
 =?us-ascii?Q?AhtiwDWQuzY45EfzaoysKFCKbgu2+J04z2C9uKQAJgaGldXr6zsDv3nxdNUp?=
 =?us-ascii?Q?p+jbrok2Thogdy4Atz3JaZfURYtxQm+6YWpJddqBSAfNA/sURXCfeClRdL6T?=
 =?us-ascii?Q?XhgXIDIEzJpcVeQx1067pB0yHI1d/Jtt4CcjLtYjvkwjM4VN/vprGIFWKjHp?=
 =?us-ascii?Q?U2QnS8mi37PajRInsnr+Ohida2mwyvLUPTOoyuViXoN6fuB+e2r738Tiijzp?=
 =?us-ascii?Q?E3dauU/t7are9EeCaSBc/i47UxU9znFam0EkvaAEJC3p+AneDvlTaaTozWpb?=
 =?us-ascii?Q?k1ovW9yjPIPDYF3Tj5Mhn0aNw6pgUS3hpdAnW3jbUoxHwyOsW24pLmfMAVWU?=
 =?us-ascii?Q?4G1VUhgKPHT8zQGylsTjnW55kBxwhSk0F6O9LgSE7hWHht34LmPs+Qp4UuKz?=
 =?us-ascii?Q?jquULb64oq1SZQdt9CZiw4PGweliO2f3qRecSsKxBUQicioV0SD6x0JCw6b1?=
 =?us-ascii?Q?NIBnSxDKoslHOE6v/213eF5f6GqeMuNcCsEEzzs0wHp8NflAY0sQTEVCZ0MM?=
 =?us-ascii?Q?zUKTtonC0EHsHZrD/+HgaU0M0uK1OJT7g8g8dPVirHJlnFpuC3rGlfAH59lT?=
 =?us-ascii?Q?JEVXDWpGqZmDxscbzbBF/gIkwUFuvtlI+SE/q6EWc1UN3p0zHVm3nKAn7+ym?=
 =?us-ascii?Q?N1WsXJPU20Zd8Rh1LdZRCgx6sV5xa7ZF+5JcDYit7c8EgBZoDCL2sny4sJya?=
 =?us-ascii?Q?IEmnxbxSvuDqtgUAf4RO74H+pByQyM5+uOtWRDbNUF82EcDK2hbd6H4jDlJT?=
 =?us-ascii?Q?hYSm9Q01TIBT9HgiRghDiSPAbZnQnUfv+zr7QM/lyH8OVFeO9Hng+IZPEAV/?=
 =?us-ascii?Q?EYcKqpUkCN1LUuNbNL0BZVoakAMx7kzOaZgSNfWVwsoLuc4Dp530ENJLvq4x?=
 =?us-ascii?Q?8n46bLmM2aH2Q/ntZyU2JTxgmuHxA3J3a5kDmX4wI1++dmeGOxSBQmnj+9v3?=
 =?us-ascii?Q?6sKhsgh6iL/iWe/p6bPRjbXEGAdl+N0Zhl5bAB/IuEJBngpaIJpGLm08Rkxy?=
 =?us-ascii?Q?kr4uiWxMBR2zsl8Nh7lbA3krCyzr7s0g6n0lVfLJCB6DNd3kmI5yyDAM7Lm2?=
 =?us-ascii?Q?X9GHv2d3bNvXnWJgifj/KbP6XN0LeLeW7zADofAdYxZpLuxLlDikFQ3tkOFq?=
 =?us-ascii?Q?zvD9zuF+sF6arQQPAJZJj94b3ApFNTXYvzjfIl5mrpCw4Aj/K28Tmq0DdNd8?=
 =?us-ascii?Q?3RKQ5nIbJ/tVwNKUsHOB5VzCxFaLUBmUi7n8ghEmuLHygVL7kGRSb/oRjkKv?=
 =?us-ascii?Q?dReu2EeQLtqWIxD3p1MRXczX6A83oK+ID03O3kWq+0RJRFABoSNH4miIHM/O?=
 =?us-ascii?Q?Ico9wV+qGrxlNNzhgSpfGwLZ66BcpkPBLaAPlTXmOy0AGv1Cj/MOgcVes+ax?=
 =?us-ascii?Q?cMyUSgVmGA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c10a75-7173-417a-2e7b-08def9756c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2026 19:59:45.1330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WQe2LeWX3EDS3Iz3/wrUBnyvdhYM4k52HlKvRVgVUVvwbXNBlw3QExIw1yP3Wq58qtOzWnwNzLPL3lZHzhvw5MmSdxnmRRoL70CJgjrymY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7771

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 13 August 2026 17:48


> Subject: [PATCH] irqchip/renesas-rzg2l: Fix loss of interrupt
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Read modify write on rzg2l_clear_{tint,irq}_int() is causing loss of inte=
rrupts when multiple interrupts
> are triggered, for example with:
>=20
>   gpioset -c gpiochip0 355=3D0 353=3D0 328=3D0 352=3D0
>=20
> The ISCR/TSCR status registers are write-1-to-clear per bit, so any bit w=
ritten as 0 is left unchanged by

Typo here. Write 0 to clear the status bit and any bit written as 1 is igno=
red.

Hardware manual mentions 1 as "Invalid to write". According to the hardware=
 engineer,

"Invalid to write" means that the write operation is invalid. Even if a '1'=
 is written to the target bit of the TSCR/ISCR, the write is ignored, and t=
he interrupt status remains unchanged.( so, it is "No effect".)

> hardware. The current code reads the register, clears only the handled bi=
t in software, and writes back
> the whole value. If another interrupt's status bit gets set between the r=
ead and the write, that set bit
> is written back as 1, clearing an interrupt that hasn't been serviced yet=
, so it gets lost.
             back as 0

>=20
> Fix this by writing back only the bit being cleared (all other bits as 0)=
 instead of read-modify-writing

                                                      (all other bits as 1)

I will update the commit description in the next version.

Cheers,
Biju

> the whole register, so that concurrently-set status bits for other interr=
upts are left intact.
>=20
> Fixes: 3fed09559cd8 ("irqchip: Add RZ/G2L IA55 Interrupt Controller drive=
r")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index f6b2e69a2f4e..b3774f82855a 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -161,7 +161,7 @@ static void rzg2l_clear_irq_int(struct rzg2l_irqc_pri=
v *priv, unsigned int hwirq
>  	 * falling/rising-edge.
>  	 */
>  	if ((iscr & bit) && (iitsr & IITSR_IITSEL_MASK(hw_irq))) {
> -		writel_relaxed(iscr & ~bit, priv->base + ISCR);
> +		writel_relaxed(~bit, priv->base + ISCR);
>  		/*
>  		 * Enforce that the posted write is flushed to prevent that the
>  		 * just handled interrupt is raised again.
> @@ -177,7 +177,7 @@ static void rzg2l_clear_tint_int(struct rzg2l_irqc_pr=
iv *priv, unsigned int hwir
>=20
>  	reg =3D readl_relaxed(priv->base + TSCR);
>  	if (reg & bit) {
> -		writel_relaxed(reg & ~bit, priv->base + TSCR);
> +		writel_relaxed(~bit, priv->base + TSCR);
>  		/*
>  		 * Enforce that the posted write is flushed to prevent that the
>  		 * just handled interrupt is raised again.
> --
> 2.43.0
>=20

