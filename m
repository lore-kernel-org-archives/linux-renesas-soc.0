Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFB139D3FC;
	Mon, 20 Jul 2026 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784589169; cv=fail; b=NUZnUy2xQY3WRjbHXsjYTKiHa0Taf//tEmyIKEgdLRO1kNR4qHlUHvHjoItqh4L67tcjRUNuo0ryTTfybsPEFVhCnxYZC1kz8JiP7G4XkDEfW0Iev9BhkjfTHAOBzcXzN8ftZLkhNOjRuGTdLZv3WkI5poKVW/n9S32U0UzsMUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784589169; c=relaxed/simple;
	bh=QIlL5qNzu4tZZoL/IFQc+J3aTfBpGzeQ7ZA7qDyGv94=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lsKGRSTRn2xitKoePTFvvzaoNt5CTncKL40mD+x8DMTnbllAz/EqXWxKZY/2Zj/IC/PVuiEI711oZrmYjnghA5mn7Ki7vw4aMbRF3evgWCKFIQcxoVN3NnPyD+JP+vr8YZzP8f96qYKp4mPTXcVKjyGIzqBq7Sc7QFli4BvUDq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LTPftw1J; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LTPftw1J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDJPtkLiPb7z9YH23NhHvRA8kh6KnjDG3EoKBZ1BWVMZ2W2RywiySyadoxQog36zWkcZEfwwLNpjAYvTxBDl2WUUqie2FfIGioMcyKBVg1AEk067WHxYpJPDSoMNsyVQaZq1qk/Mlh9k4kjNcUqcfOqHlxZYvri4bDkljppFuwiEuSmSyRlmqz0XphdLxtzF10s3/c0yEjoYStf+ssb8EVlIDUl/sRX1AZL1rdB3IFsVJkNb9j/J5Blw75v8RZNz/Kqf4bDHOwRwOZ0t02k5eziR6HzfqFmJwKMjxTCb9FpATq4+5zG+4GfRTn0YdFHIzRgcnrsHfr+NYHzBPkC8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIlL5qNzu4tZZoL/IFQc+J3aTfBpGzeQ7ZA7qDyGv94=;
 b=tpiRL3prV6QUq9O2jDTi1WhcM/tpLqXOtOHckJWIGW8xaH7CeboinBG/6fQoIxlItKCG2GxTs4ixpr+M/0263UmdQMvUhS6QodJT4iEFY8NE3ItJjZtSzxOhNurks/5PUHuwx4OGL4b3j2mNxUs6HLPpYBX82V0ukbPRMq9PAf/1ekVgUrLPP6d72xORQL02CmdFsKaAPdi5rFJa0bRbj9Efo9LGQ9wOL32GL+YYMhQLu2NhrP0WZuHucuONBzZjg9xv+MdnHUimuoj719PePMWaYIvbnIY4h+rHbvq71WfGmKF4zvGJBsG2Z7UQHPMaF5A4RjQ9qbJk9K1iTE402Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIlL5qNzu4tZZoL/IFQc+J3aTfBpGzeQ7ZA7qDyGv94=;
 b=LTPftw1JLTiNCxIO0TpRCRvUMhocDmRp71qHBjkwBBAhPSHtLWCy1iKMZYnbRACwGh19qTTWNif8K/1SML3UdIncTNDROOYw+n/FfnTMSEoKQJmCvmMtR3lDiRxjJ0FK+9IzsE9/YzYaYQb9DuTHI0q7idBZu0xKQAmr3gQcmTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16076.jpnprd01.prod.outlook.com (2603:1096:405:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 23:12:39 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 23:12:39 +0000
Message-ID: <874ihtl0go.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)
 <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] ASoC: renesas: fsi: Drop platform probing metadata
In-Reply-To: <c79fa0d31abc0c80fbd7b4ec94d95b197ddb9f94.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
	<c79fa0d31abc0c80fbd7b4ec94d95b197ddb9f94.1784528081.git.u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 23:12:39 +0000
X-ClientProxiedBy: TYCP286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::9) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16076:EE_
X-MS-Office365-Filtering-Correlation-Id: 9686297e-c81a-4f9e-3222-08dee6b464f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|18002099003|22082099003|38350700014|56012099006|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vwAomnhTjOJ1RiDWJn2ZnUEyDcbLzejWUra23cFMN6MqO3Mpt6GKEhwxC3k68LHO/BmB9XjGAM7+EFw4dR+5Hdo/OcJR6gpy47+nOXzJgv8iv5aX1A3C4CbQQGrk+765zCFFWJ9yfvALiocr8QHCcTFuhBjZkvBzBcfPjV7s0Dhu+7GNrioGwadcvZMlwLAAUps7e66kEpNlXTN/JjUMrcW9mrkFcAl3dzkle6N/8ImdDTJDN/onLzc+MivPZP2crh6EIH8sm+Lsq44rDdtXW5hpd9J7r3KfVxjm7cG5l8n3S8Tdi4QIsgHjsUC7cBeWesrQY/veqgMuqblcART1j4Zz8sgz5JRm3ok+5T3fhz7lkaiNnhON5IF2M6Ph9R6WxDXBi1sFJOaQur8AKH8QwHnYfE4sJ174LSEAuAHtaJDa0qjYcN8u8iu5DgaF4aOBPvsy80aJFJDVOCBriqssR9hUS6rCpHVdcn3fcnEaavlmTCIlC0iM8dr/eg8n+tuBlFw6m5M+qd1bp8bLqntqQ7v05ydGplL1b8r3UmBEOCrAZWc1URhWh8yiLuvhJ851m9urASvJzin84gaHki1ZFnTDq3rrNwqvIumAhvkrPiGF7EBFQQDinSRuibB91mN9EVOTJkGuSJvZVEsDp8rSI9lYtAKa/h5ldHp+R/fCn8LEfrYAeiwAL0Hsex/wBA3K3czTq021gsrS1xcFnEqNaQeiZawXGqVIzGx+PaXXXog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(38350700014)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Sj1pelNO1kBUwNWGjH/xj5WVKVimVAIfkoeK2C8YujNkhT6wwSkcCT2eTw?=
 =?iso-8859-1?Q?/wciYcDcy1iukOg6V4YB5Dy8eIhXTIuJsrhJyPKp3o21NrojcYeCLyhgnT?=
 =?iso-8859-1?Q?DJRUaljv/A074b05kIRoGeBQM7KEfI2d0MGu3tZxOgp8A5gsJ/JWnmvTrL?=
 =?iso-8859-1?Q?KnqOx2iiK8w+VZgLkXmG78bdeqR1k3q1fOgLE6aRy985gRUR9nPHpdZYlP?=
 =?iso-8859-1?Q?HGKbdsCU9jcgtJMuXlm5mVxInReLo3nPmAU6QsQozSVs4h5JJnrKU2eOHi?=
 =?iso-8859-1?Q?03irOkLhF4PEppMdX1JHM+yClVlPppO6m4UFFknQMe4bNRGAyfE586o4L6?=
 =?iso-8859-1?Q?O0gnJDQBmLQ7KZJHrtHJUigqfioZ6hoX1XLCj5qKw01+O/TIOkVy7My7f/?=
 =?iso-8859-1?Q?K4KRumEaJQC+EqJMYA5VV7CQcMPq7dFN7KfXfU66NG00C0Tz078saUnscA?=
 =?iso-8859-1?Q?K9rYNlJS5k+9akfrlz2UkIWIQVydE2M9E2QX+3odqOUlXBO+07/53YY6Zl?=
 =?iso-8859-1?Q?IR3oZFPFMpRzOpK1CmWpejmvHMOrefywYv+cRWcq/+W/JImNp2yMjzYKnF?=
 =?iso-8859-1?Q?11ggCFxiQj7abLTxe2dWE4IYkOBU/TXYjTi12oxJPYETEenSiXg9sr1kpl?=
 =?iso-8859-1?Q?BdzB9c2LKoH+b3fI2cIQNptMnAGOsIgrEPpGOQGaOQC4Ytl5N3G03/sTtE?=
 =?iso-8859-1?Q?nnvpyDlo1e/sYWzS21//FRWP+71U5frQL3MMknFaAbpUQg+2hgN1amfkag?=
 =?iso-8859-1?Q?CFON/bfpCD0jo8XMNKqRj4Ss6aOkkF0VRMP/RM3UO+dxdHuKmT7o2yHxfC?=
 =?iso-8859-1?Q?EHEF2P7nrdtrK3bYdtlKNQLn2zXIJq8qVflRrxL80PDl2YFazKqbwxcQg5?=
 =?iso-8859-1?Q?TuJ+m/MbdBWjoHceKruOL9SBVDmWU71+cKcZBZg1jKOLId9s/RK5qto1in?=
 =?iso-8859-1?Q?jypeSlA15DhA8ea5NCyHNUhhop90RnL6GuElzNVR9eUYPsS2CDX75BIJX0?=
 =?iso-8859-1?Q?vMi4c7r10d1vFgopMg3FFtJ9/zfZejK8s7ofXm/H4tR1sbNC2GjcZZkoZ7?=
 =?iso-8859-1?Q?iz5dT4g/vqUxgMzWdNfm50pVR8qrIeO+DAyEU2byukdEQQc19qI2DLtBoa?=
 =?iso-8859-1?Q?4Zgxazjtb7CmJxkiKPpMa9mdWcc6uK+U5sse+grq70hfcLTFAC+XdTDzDh?=
 =?iso-8859-1?Q?geutWIp5rlhmOVZPY21sMk1Cg3Kto1TNDrd0JntLXBzyHW8cmJObuArKpk?=
 =?iso-8859-1?Q?ApzjInVh3K3gnvdMTzXwEcAoKn3XcUO9DatLphy7oEfroOvwassbIsyMjm?=
 =?iso-8859-1?Q?Vt8A+QE4doRPtHDQM78b4xB333imVwbsN/sWClw1BFH78abJAzgdtschWA?=
 =?iso-8859-1?Q?lEel/n9E9cWRXb75Gl8MMqB95Xj01F4kjLIJUw72/ApiHHRuhxgJXZh8Tu?=
 =?iso-8859-1?Q?l+mFIV5lIwBH05itTaBUZFoKo/8vGPTFv37nkek6UYl9trS+BLYZwlEEuO?=
 =?iso-8859-1?Q?1PYrek0mq0D/j01JSgUWwZ/ZtSMe8njkKh/DiYnymL7CJFEapvpIt+v0xk?=
 =?iso-8859-1?Q?qgg+Grzd7hF15mJozRrqMi/hvEMK4WetAYNPVDg9enT9Zma9QqERNnDKiB?=
 =?iso-8859-1?Q?Ym+Xi2oAsCMAdFfE36pKLO8nUpff5zp0SattZQkx1OK6j7ud+6AX86uQJ7?=
 =?iso-8859-1?Q?FOyy8CYY0pNv44xG83u3Vo7lqMgvMwGF8xr71pD2G/j8U3EGicU9L3foru?=
 =?iso-8859-1?Q?kKcd451cRkrJ6J1Zo8mf/vy05kv8ORLL4ejueJruIdLHCmCpP5lvfc0qme?=
 =?iso-8859-1?Q?RJuXwkvHN8w9WPvYN08B+1fz0lrUXmExJ9zVKoC5HtCBXt1v5l3V?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9686297e-c81a-4f9e-3222-08dee6b464f4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 23:12:39.6690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUPTU/UAwGJqk0rwKspNmMvWVz7vEPzS24LHStzvKMdLHzjrq3TJKXt8l74bYX9MnoVHOCfzL9jWMsRzDEomyRfvtDw1wsjNPAE/yfMpGeIvKL38FgTQJp99bj0N0Dim
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16076


Hi Uwe

Thank you for the patch

> Since commit 38d3273075d6 ("ASoC: renesas: fsi: remove platform data
> style support") probing using the traditional platform bus matching
> isn't supported any more.
>=20
> Drop the platform_device_id entries that should have been removed in the
> above commit. Note that keeping the empty array results in the driver
> not matching on "fsi-pcm-audio" (i.e. the driver name).
>=20
> While touching that array, use a single space and no trailing comma for
> the list terminator, which is the most used style for this.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Yes, indeed. id_table is no longer needed

> I was unsure about keeping the array. Also dropping
> MODULE_DEVICE_TABLE() if keeping it might be worth a thought.

Yeah.
Because it doesn't support platform data style, id_table itself
is no longer needed. Our other driver which support DT style only
doesn't have id_table.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
