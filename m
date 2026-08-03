Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418A7352005;
	Mon,  3 Aug 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773933; cv=fail; b=D5YN+pniZxrkstBJT1kdtBrySXP1JlYIunDyVAEIUtW3QUlYOv+F/q413kfHeCMZSMAAd+4sjR0UPeofCLRNyliCjZD0jbpKy8qXkUnok7Xd1iMWcV7fHW7W+4fEZRHJDWVZjvpGnrT3oUPj0vFJXOaFpnlIvs1dq+v3LW1vKD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773933; c=relaxed/simple;
	bh=+CDyMBIFhHUA6MvAZ52cGtabpfB67S8m4iJB43I2xpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Py2piRDmv9XWPXmLk2U3XvjfgDT7vyJKQxKKNgcL7zV326cIWnzY/XRYS4TK51S5CwGJCKvNFQJ7nPhWf9E/wG099YMA7Zcz3o3u827by2ASjaf1fc2PYJt8JS0y4J0JvkHIEePlQVCdeRh68tOII3dVA8LQOZ33lKXyFnrqhhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mm3k3s/4; arc=fail smtp.client-ip=52.101.125.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mm3k3s/4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByDxEPXVZIVdb1GMHF4lFQcBN8OyXHDneR9WGSUCrdulh11wlmT/AKceNDjvZTcacfBxwxh6OAC0vf9UKbgOSNix8T+1qRVNN9L5zYz3cHho+Byx/YNEBdqu879LhqcEKxLrSr1aRq1MZr7/oWhlKVGnnGp0E7dPlxlX/LztXBkL5s0OuEPKkU933C3h2semhBT7ijrJ+r5wPZ2EALU8zUrU2zSdAgIckD0dwGR+OSLu9UoA39YGeWXpIz7RrzsUTTDxnBPq9sYvoXC/2Me5DTDVD6DpeHGsQGH9Rk1fhObMxjFj7KzyFW2Y9w8z+ylTFyVn2e5mxo//r0EbxOgNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAsETyB5h9ORCkukdPLa4jXFaGn3OpZO/9aP5LzPjQE=;
 b=N8fbvNXq2eLIatnyNZQwO1g6rzQSissfWRkTYLu0lx2gIRk+V/gn0Y26n+mNhtW0qsRWgXqwe/I1ZJK24FpkReKpR2+5pqnmFGjpZbGOg/alZkFv6Qm/VGuNnlBjNovkFwIHOG9Ft3GE/p3JrSYeWfQoE2Y9LMeP5/3qlUAGVunBBR9BjZIouPAvKTUNJnjXjyGQZXya5ADBXk1zpr5B/b37/mhwqvuKoUXvg7odEMPvpldlyjWX1kQUMIZ5pDvvcQNUqn9aWg/cNRzEXAjS6PPYNP4wr5AbO9AkXwnMgGYv889cqR/e4q6kPMv6mLV+u1DkFYsk4Y4b2WVMQ0bLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAsETyB5h9ORCkukdPLa4jXFaGn3OpZO/9aP5LzPjQE=;
 b=mm3k3s/4IrK3u59ivnvYsZW7b3zWjEfdtWItqzYTrh4i8ipziigzX3CpPQ/knDzLl7wHmTQ60vJZJY6yiiZs8GU7D4twhoS9DuJUtx1YycgaHBdgUqD8X5OVSEHix3QP7b1WNEX0AIklLEkOd9MJUESKyDwxkJ2e71DefPDqdwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY3PR01MB11992.jpnprd01.prod.outlook.com (2603:1096:400:376::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 16:18:44 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 16:18:44 +0000
Date: Mon, 3 Aug 2026 18:18:28 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g047: Add missing I2C
 clock-frequency
Message-ID: <anC_VPGuGhgyNJXF@tom-desktop>
References: <20260803132828.3249424-1-tommaso.merciai.xr@bp.renesas.com>
 <20260803132828.3249424-3-tommaso.merciai.xr@bp.renesas.com>
 <a724bb82-f21b-4d9e-8a11-9817f6c97af7@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a724bb82-f21b-4d9e-8a11-9817f6c97af7@kernel.org>
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY3PR01MB11992:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bdaa5c-1372-45ab-6706-08def17ae35a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|52116014|1800799024|3023799007|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	qmrqmpsOjeUILGwt6xJnePOb92iBl2lyuvlMCdEIvN5VJLFkc7EKzXzhAKJjLI2ZW2+bVcminOrwPyi++Nzy6zvbNmdC9Ok2XlyhwbXcPndvALjWUlWWtHpwJ/ETVlHxvyAFEAUFJuCVhQ41LzprKr/cWjPeFusG02uLKNKRfVDbEVmdsREfEOZrimBn6P9G5Zu5kCi+4v5+4gYxevHN6P/s2E39WLv42/d2P9VX7lI2KyLMViNpJnmjSxVqrmnzI9hyq8aWFpBBmjTbNKVnGR5xZr39xOVRi5wWSLG+ao7ycndilZ7kzvha1GnhrZCJrSNumj1/ws6p6UCbW8y831jff2Aqf8FUZhrZAv+K0nuo5Ny6VI7fO2VrK6SXzPN5L7UR0isoQTseqHS8ZvLDkQd1Jk+9ltq4B5S92NKxSdgSUK2IHbLJsxDwEjlYe+XGCD9r9ceLFAyszF+3whhLjiZniBT0X5Llu9xDS7j3uxpvNUNem3fT8Xs10p5uxWTWWSmXx9e3FhVkdYH2V4S7wuu1jJxpviwJKe+LgJpgTOdL1xaWLK3ep+NMAmwrQrDba/j6iGABP07fxS3wGU1His63/I1/zdLcqcwMGj8Is2fbrjlinYBvHLrWEKSc2F4xNrS4a4ktXoPqo0UBtl/afVI5FWw+4B7sZkZpoSf1yk0GkCugXnI12Hd3fT8CMngWTjJoN2bqBvBnzmpIhXs9+OI70qWJPMpbpnYwobkxZr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(52116014)(1800799024)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4tv3GYL5kK1flgn2EwIak+IMBzYcNjRGZ1WaEktO7K/d0afdj3VaiOdn6V+s?=
 =?us-ascii?Q?s6FFXOyKmNTquJadHb55agjY9QbPZmucI0tBnyMHaAoPnG7mDbu6O7ESe5ON?=
 =?us-ascii?Q?ZD8dAQDMxTBFiZvWfLMNvOq+9dPKJGHmir2M1ZVSliWrsTX6JSC4di3x0S6t?=
 =?us-ascii?Q?3NmtBDPGdoFiGnOLUhoaluiUcthSb3DZe4Uy1uFKDWx2GDo3ehW7W2cpWVAu?=
 =?us-ascii?Q?t9oHdXl9dJLZsX5b7BVKRVnYerMsibrSkMTzH5iHYQb2UrGA01wMGd2tzfRZ?=
 =?us-ascii?Q?OG7Dz5GEe3+6xU6FlFWl5ZzL3X+o7LIvxpiz/en0ZAFdNlz88eK2HKFtkK5b?=
 =?us-ascii?Q?v/IblCXBQWEynyXJfaQfOfJqetTkH6j52Xb/80chfbT9WbdIH+lN09yKF7o4?=
 =?us-ascii?Q?wT8osPgQmPJaCd6hqwY5/9CKndc2jbZJBJzqi7EcdnZxvCvR3ScqJAjeZDEz?=
 =?us-ascii?Q?eU9IZ66yYwQEE5vViN/NEeqsvm1GJNyCCfcndMR1LQNC3vT0CqGhNw1kzXI9?=
 =?us-ascii?Q?OIQDlrjJce1KQ96eAdSmcOFwBu1SEl2+Vxy2+5zVRynF9aNGVUAomnM5MREg?=
 =?us-ascii?Q?Uz4Ccg0GpFRPH8ocofzBUnjOkIOUP+SUN8O3rbp/uAAcIWspqwGcxCOgYT6a?=
 =?us-ascii?Q?x8sLNvZo8fU1QCSEyM4uCrEQCrXNimcs17beaBPnyCTJbX30nlBFIPSLH3u3?=
 =?us-ascii?Q?O/DDMd4BCE69Pe8HP0Z4f7hrLrIAXOP6oxeVw5hDZf1/1ApWa4+KjHcwgrSJ?=
 =?us-ascii?Q?NOLkYs7tJASp+vnRDvULHrx2BesjB3o7zNMhxMeV8LZRN6jAnhDnhF/Smmz/?=
 =?us-ascii?Q?tI+TGZGtYo/gxmE2Mu17RPHtwPkJ+uQ2ZBikYqbG9mXyyXOcky+vo+dTKpR0?=
 =?us-ascii?Q?w9FSqLnW3ReTpK6NcHkCr6zdpENob/FX/Nhnfe9Be7dL6eT5KW9YrP3/eHPT?=
 =?us-ascii?Q?LoTfGCf6KR3VFoLMT1UczXu571gjLQmAurs1tt/a//F7fY0GWAtS5omrwlF7?=
 =?us-ascii?Q?+w3XHjssxcCDW8+mMax7Z2+Vztp3OMm6QIvAoFyn/4UsKnPd3hCbV686x513?=
 =?us-ascii?Q?c4qH4YvMzmq3N50phXIUBOzVYH2Wz5xxN0OnAwGx92agF2OL59GllJuCgMlr?=
 =?us-ascii?Q?Mpp7i/e5AITRhhVTvL8xjfeP7HUicjAZUSXLHC9ZhuHN2asPDVn+3vEi/s9q?=
 =?us-ascii?Q?k6GRqM5dTT/JFiKniHlnlXdwMdfoGJWR5NkBFJZlTBozkM4zHa5LrYKv+72S?=
 =?us-ascii?Q?IXPWnnQXaaXyoyzw5xV7qhZH7wJtMzNu/4IaLwzXQFoCLAxFopj8jBSJPXQn?=
 =?us-ascii?Q?2d+Wrp7WWOxhJ8JvGhjXTtDqdXFWOKBWMBDTJsVZEMbQp8MC7uxb1n3h2TAd?=
 =?us-ascii?Q?ee3DmK4Jda7ydjdkO7HhSVYYpVcfe1uiG2kuMM0/zW2ryvT3f7Jy/f1qqlf+?=
 =?us-ascii?Q?110NiQMzi12P7oBhqVBaIq1TQngW83a8hD24h0eoZZEV/REHiGSGYi0MD8kE?=
 =?us-ascii?Q?O1BL7iFYUTJD9GTbtHaGtlRtGDyh6ijBVJhiGAtxriq8reV3y6GQaf5lakyC?=
 =?us-ascii?Q?aH3Um/5260z4huXWufsHMURqY/tcpmX7YRVEdGuIY57JnVUVd2nL2/JBa8Fs?=
 =?us-ascii?Q?7Bfoa7DD3cN1k3aFEUK6jD6EzjUaFsPe7nVoTRkTZlBQszw0/zomYSBw6rqj?=
 =?us-ascii?Q?0avs7HxVrCFa/xDuwnEPM+iEGSuAIvSAc8lozG4EqeYZPWJTty1UOx03nB8w?=
 =?us-ascii?Q?O8y9e19QeZbLtUd/6HOjfqd2ZtiqJHsAnOdMkSc4IJBSYTpAHKBj?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bdaa5c-1372-45ab-6706-08def17ae35a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 16:18:43.9887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhjvTniYgyQ+57TidIqaK0BwrmMWT4+1D9dU3/snjmJWUuDPu2PjN8MzHeE7lkDrnWbhT4xYuOkHmv537ECrSJI7ltKgrjCGohSYKyIltesHSta0W+oZe7Zv3rElnFmG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11992

Hi Krzysztof,
Thanks for your review.

On Mon, Aug 03, 2026 at 03:33:40PM +0200, Krzysztof Kozlowski wrote:
> On 03/08/2026 15:28, Tommaso Merciai wrote:
> > clock-frequency is a required property of the renesas,riic binding, but
> > it is not set in any of the I2C nodes, so dtbs_check fails on boards
> > that enable an I2C controller without providing a rate:
> > 
> >   r9a09g047e57-smarc.dtb: i2c@14400800 (renesas,riic-r9a09g047):
> >   'clock-frequency' is a required property
> > 
> > Add the standard mode rate (100 kHz) to all I2C nodes. Boards that
> > need a faster bus can still override it.
> 
> Why? Binding looks wrong. It clearly says that property can be missing
> and is required.

Good catch, I missed this.

Looking closer, the description is correct: i2c-riic calls
i2c_parse_fw_timings() with use_defaults set, so the core falls back to
I2C_MAX_STANDARD_MODE_FREQ when the property is absent.

So the right fix is to drop clock-frequency from the required
properties instead. I will do that in v2.

Kind regards,
Tommaso

> 
> 
> Best regards,
> Krzysztof
