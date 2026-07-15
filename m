Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D315B3BFAF2;
	Wed, 15 Jul 2026 23:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784157619; cv=fail; b=lw988Z6s7NfjJileNIAFUTwv4qJrEBfigJhBppIRomQYjK7PdvUR6Hr7YsE3J87vn/Oq8uvu9TR6YA6QAQIpmL/2n+NmUJT7YD0Fw47g3AMQq0JzQpTpb9S0vby70cQQ7HnnyqFAoc5XYlNe5dTsB7ZypzSuzL0ILtgIgrIYAf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784157619; c=relaxed/simple;
	bh=ns23gHtsjlB6iyL09Mr5rgeTvr3ojfl3O53q2x6B6ME=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=C1oi50QolNPp0Llyi2mtKKp19tlAuCUuXVjL/q5zxFLlh4Ne7+Jeh1voLaJHM8bG5+RRM3oy/1cMzKKDrI8s1OEXnXbyjjqkpaiqdMAiEVJEkM3yT3mk9x0q3UeG2p3McpHozBd+zkqal36tmjw7LjE13ApcE0JAe1drjF5qQ5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PqPGTF/K; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PqPGTF/K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjEp1aVg0GVFBVxKN2JiMPCGSIAbPTdtNww7garmvO6ZxN5tNRKl7dH/zKiSkQcUNzmp0/4vYaMSGLndq4UKYNztp1OCKLdiYEqhMIobOkq/dWzSzzMBt9jpy4ELQBg8odmAQNsQeTm6oYcjljCf/U0j+a6B3ThHlnS/9cQsVL+2M5CBekGxhs2aaebSnFqfLuwvXn3/EIEIUufGFqq49RsK0jBtAHEgmBNu7ewm8pEueYozzW0H7BRlxGPqjg9WY+MewhRmpzrG3LqRomwtT/nK1AW5DHKtp0gEfj53zf0qXxd7eggFu6XmmZKwQ57adafduwtYh/agWHHiIyY/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3C8uKgsW9sSRGnVPZ20kt7mWNuCCL0RcqueRTpnwS0=;
 b=s3nVIsWhULa25gxvhJGoAKv1ogWJu990PkzeFg5g6H3YYbcuEmvJdo4K97K5Kk5irfvLseP8rw2MEaq18CHYqwSkD9vyqme+7gI5DyoHq1CRZxd0tedbYLRgzclgNVTHqFEBnIbLrdBBVc9c0tBRQzYEnnBBhsNNP6clWQgf3ALN/AKC+BJxJ9cngS4oGYqoKx2sHbw1k/jhXEL19yMWTWaX2pJb0pF0UM3HXXd7fJ3gtPkAH41LEOVJ+HY29dYOq/D3s8HKgsXQLRpNorIWmGTnucOAdz92faWyBbbHU3qTZbPoH7kOsf/GdgnG7vq3s4h91ZZJwuXJ2GbuqJTuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3C8uKgsW9sSRGnVPZ20kt7mWNuCCL0RcqueRTpnwS0=;
 b=PqPGTF/K9Higd7vrPvsiUB8+l9DiK+Q1rhjiRjTnFIV0+mUuJnNEFDXfsNvvkBT7lnjffEKsUsqaAO/L4BhBwVELqyP3wcWApqrVCELqCIYJRE57Tgftl+Hzeh0SUsSo2ZIP4h/Aw+GDbO3Nc6IHuHeHhvrEDZA9dygyjF7+91k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB18013.jpnprd01.prod.outlook.com (2603:1096:604:478::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 23:20:16 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 23:20:15 +0000
Message-ID: <87se5j4z80.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: generic: Card name parsing should be called after xxx_for_each_link()
In-Reply-To: <CAMuHMdXfwYbMhzU4Q4L3Gz1vaatJs8gdgPytVGRUCzWAHTVK1w@mail.gmail.com>
References: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdXfwYbMhzU4Q4L3Gz1vaatJs8gdgPytVGRUCzWAHTVK1w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Jul 2026 23:20:15 +0000
X-ClientProxiedBy: TY6PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB18013:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d49d3d3-2ac8-4578-901c-08dee2c7a0cf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|4133799003|56012099006|10067099003|11063799006|4143699003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5ipx9KmLYfv9AGbuh5YvzpeDFNAxGBIDZSv9C5m34sVQFbgFWbZR/S0mbMYLO4HHycMmV5gRLCFlLosbZChNvgeSqZKnZXjo19fhxafMWkmGn3LHBDvXDKK3IzWqwF4LG2FzHYXZmdXDRsiWqqp2gBJeiQcgouHWfJQfVMXUtFwzahEcwdKLmb+7jepeGHbn69EeWSnT5sQsPmBwv5K+bYYNQRO+PoP74Ji3PF9mbOP9EHYjiPdbDs2cv87nEIhxOW/YeNSf7IfMRvF15B+YwMzjaWGHrW/nThqjQ8d6Q23kpFQZMIfIZy8apEVKxmsEZacTK6P0Kz8bAFzmhYl7/311yoVJ1LOBMtuw68kG7e0mvNoAA4ger0GMx4ncMjxXGQc3uo+7lR0FrLewX3jqtDh/ukg9tuyZlIm8ey7vn5hsZcuTCQsCVwC+Ta95JvN4ll6B7Y498ajLLFfjrAtCLWfcr+7Ec0rZPvytw2r2NOAhWcJBgtQzzLJvtm+jy3O+hhMzcLrLpOd3rdsPy03ACgLSx+xHPrDLdM5PE7yTJ1up0hdJRp8tqD3/jYV4K7j+8ZqyD3gVNBOWjC8l1fnU8xxHI2i2/YV/QRMBIGkFUfvsgfqjUNsL4IZHpm2eWieaN6PXMNlSn+v5d/lqF5A5hNFFO7jwlmSOCSV5CzQo10e1cOnjc/3XbKEDuVx7B+CrRTZtSxwqZf8iN1bOTjjSD3Pi0y9aBfnyTLb7YSLWH0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(4133799003)(56012099006)(10067099003)(11063799006)(4143699003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RJP/ws5ddRUSVadqk2aKNiRM/dvm8hIF34i8cUHj5tZaXbEtjREBx6MUjTit?=
 =?us-ascii?Q?LsH9cBoffmauyy6oucH0M2W/31QAOjGNwRH3UD1Y/pP40r7N5JLZZd/LdSrK?=
 =?us-ascii?Q?ivZ1MR5rGgtJFKj38Euw6os3JRafCiQO+xAfJdWRH+gW/r+IqnBVEeVK2MY4?=
 =?us-ascii?Q?OeGhK4tcnRIdAXIjmuJuf4s3NihSRUTQb0xsG1yg6OkMyldfEplcnNcivHYl?=
 =?us-ascii?Q?TRz0ZdS9d5kMZg0SQlYj/EszMj0ZBEYk+3J8NkESvz9n2wr/7m66/Y6wOye1?=
 =?us-ascii?Q?PSgR9QDYCgGeekN+OUAKH4dfbTitkkwjoCjkffbQfvel/4Mjgk4MF6q9gfc5?=
 =?us-ascii?Q?q1+gQpDoIKQ0PgpjaJQdQSw1t3ArJJoGizljqPLiGkpDaDtq0uph/c4BPxay?=
 =?us-ascii?Q?EkCA5mIPPMVU6kWt/uVw4fUs96R4OM74JXOlyPHrMXhkSRiFgsGbyy05OQAV?=
 =?us-ascii?Q?HWriS2g2KgbNF3O4pjroIddHMZVbQAyo9EolYop6GS4ER8yQU743j28BThr6?=
 =?us-ascii?Q?OgMexs+UB7QGMG1GCNSAP7rfYyZ3E2fo//ViDTdMyf3f0mFuqn2TQZG54isW?=
 =?us-ascii?Q?1uOOuI5tUM4HKbWAbQ9TH9qMj0AEINXfr8iH5xBeqIhUCBxXPJ4X8KfnkuYs?=
 =?us-ascii?Q?7KXej67q3MlytHRe4qXFzZLFv7TSqo5ZJR6e5TFnCh2BkZ51IFlhv749hrG5?=
 =?us-ascii?Q?KYDkax+8Z9HTjFknWzE1imlreFMd3MplkHmVx4x0cRsYy4aGBB3UCBx3Iou7?=
 =?us-ascii?Q?tI3rdOjrTWc+wynpBHZHu4O39xkiGyWTlGt7QoJv6RDumaVz5zOETrptimq0?=
 =?us-ascii?Q?5J24wAgM1JrwgTLEflmD04Uoba7iuBm7dNeIHP4JweVFpNahuti1vobgW0Ik?=
 =?us-ascii?Q?YJbiGLo1z42vr24JtJWFiJKqlXIv0wFsMNnRD5nxsOqd8mNOYORl2VqU3Fca?=
 =?us-ascii?Q?iCZCehfmpxcSGuyeLxPyHcNEDxVUd3LLWIJbEKPHHiiB4o3NGnpPeLbicLcu?=
 =?us-ascii?Q?XDd/oEtuiSpZ8FAQecDPszCw3wQFmyHHph8fNTZvX21MX2Ly84czV7QeAueg?=
 =?us-ascii?Q?h7IlMd5QP4Oq4XI26jxx4vIzoRqzdte5HvxyJRjwyjt54qrCvcVeWP9VELh5?=
 =?us-ascii?Q?5hfv1WcvXZJPHv2/+OozreganHfB/YCh8FDGclo9DNfs2eFNzGqrRNXpmikK?=
 =?us-ascii?Q?O4TzwZgRa9Cwlna8JpBT2TPzoGBmf354U146kdtZ5VJhN3pB2gCyTpsU6ofS?=
 =?us-ascii?Q?qpc5Y/vW1wdGLDWQDMI+jcuhCufuETznQapxYUgV+EvpkZr+b2eXNI8KHfYL?=
 =?us-ascii?Q?c0SOLhpNakxn5pivKkbNVtrsWzAcGEm4s0NsLmS1SvbBvYA0IVD9gldvfw8S?=
 =?us-ascii?Q?RtAkZnpSU6b1cUkDxlmuH2z0dywG/AZHpeQvdL00WqRR0tAoQPPQUCy1q8QJ?=
 =?us-ascii?Q?4lLqCCe8c6yFvSiHnFOQvZj3ofp6Wp/ZfRKsEgbRWXh7OyWl3SDOp3iiJmlc?=
 =?us-ascii?Q?zDTgJCeqecrGJ6JQWEu9UTYgzKxizTLpXv+VJ6BCYbGxwad1fQT5JiM1KUZS?=
 =?us-ascii?Q?tKd1yO63BmOADmxFPNk7rrUh0s/M8lbLGgc0BXNUbHzbySNOZg/Q/2upqnKe?=
 =?us-ascii?Q?YMJPTufewLX6V8E1xy+nn5TLcdTCx6hqQb+Whjxf0UWFZihIoNCM+iF9u4gH?=
 =?us-ascii?Q?aYv6T5NnPoKvU0gquYZtkOfA/hyo//uB9P3f1lFrT8bAVpCJAeFAMxuQsb9a?=
 =?us-ascii?Q?eydOcO83MthbpwL/RSV7JHuIAtDs2nk=3D?=
Content-Transfer-Encoding: 7bit
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d49d3d3-2ac8-4578-901c-08dee2c7a0cf
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 23:20:15.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWOqE5pA/UvNMv8X1Aw+dhuYLgYn5psdZGle1LCEmHKYSTUEVA5OkiCIwEFd3LW4GLCB9WlHWDIQ0IHZAfNTL5HB66rFi30yRXtGprKZBKRgf4kkzubPme4m3Mg0ACcY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB18013


Hi Geert, Mark

Thank you for the feedback

> > Fixes: fa6222d5e121 ("ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()")
> > Fixes: b8081307f5c9 ("ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()")
> > Fixes: 27ecf4da5ad3 ("ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()")
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Link: https://lore.kernel.org/r/b81ebfa2-6a35-4ff0-9d04-b867233eda4d@sirena.org.uk
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Link: https://lore.kernel.org/r/20260714103428.2318895-1-geert+renesas@glider.be
> 
> s/Link/Closes/

OK, will fix

> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thanks, this revives (at least in dmesg) the sound cards on Koelsch
> and RZ/Five (simple-audio-card).  Sound cards are still instantiated on
> Salvator-XS (audio-graph-card) and Gray Hawk Single (audio-graph-card2).

Nice to know.

I noticed that I want to +1 update to this patch.
Basically no functional change, but is for cosmetic fix.
Will post v2 patch today.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
