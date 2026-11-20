Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795180483;
	b=Gvbh60jRfW9lbkmztq2rwFcA1Ld+MCWxselVywmeDw6s3ezMYlMCE0SjuARgvX+D6KW3
	 Xugk1CogMP55h8De4C0+5gQ7HzgpCfXYkbs39BYf/rxuvRmqB8ysnMoOKimyuXoiaiF3A
	 L3yYCKpFoP6FNPgUF33SY/50XsWdTictE8b1KLkRJgbST7ITVMFjhM5eaJ94yh1NhiObb
	 fhQMiBt46qb9gGN8e5D/ehb+88JB39rx0FZh0jtX7ejGIj4QRJ51Xd3bE+EAHWfcM6nig
	 AEwSVQhiJcko48ZWw21p3gSvNKIJKIKTOjIy6c58f1Ghpmo/vPR2n64OoTyIFTIcH7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180483;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=v0QhKsn0C6L8SxKAdW0HMa+twExJ+xkyPiKUU3iHflI=;
	b=uwpLFnCA5LiEeOi3NmvWAUWtBjodkG6W1cS42aX8r3ms/m2QBM8LAa1naiPHFprTMjwD
	 yIcNJMjZTPamGREVYgdMvdCKz3nT7eiFSbXToKvYJklu3EU/A1c182O8o7EEVCTjgoItZ
	 TPdDExPoxfQNVGSK4G/icSRUrJOEqyRGnOnfzJfcepoiz73miUp7wMLBuWXmhkjxdFc9m
	 lfRRJgxfHr50lGvbqFai9x3Y1f26jERSs3E8mOYFuzihbmgLYgV3VQlRxu71FGnRVRSpM
	 TMikZIPecVfsuDHd5L2i9bShUwaSr8fN8Qwnox7zNCVdqhX7g3TM/S8zUyDMqPLyBlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=crbCF4UM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.20
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFEA606A325;
	Fri, 20 Nov 2026 13:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFEA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=crbCF4UM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbMTbojTRmAiwDVIqmqjw1freOB5PGChgl7xxUW6CdI8o1ZJk3lQ5waF/ea6/kHOzGz9Djo9Xx8Mjfb0Jx9EO5WoP2u6QFrdDe77LLXO4B9zjUiHD0MXehvJFbtAINikLa1dc2Ao0ZibI//pTzFZyFuuKzwhQmpECfIOBiS9DuTFmIE8KHiYL+wQ1U6rxC2+00h9FudEJ14TkrjtPMyuopoL7vCnyVTSlFCGaeMcpQF/Uw0JmINUREPUXhs6DvTV4quDOD+ezUSSsm2VamnAmZ2DX9sKQj+NQPo3QEV1PZ2f9NByfrikEV5JpYQpjZ89hBfORwG/LxeOlqhEpfGaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0QhKsn0C6L8SxKAdW0HMa+twExJ+xkyPiKUU3iHflI=;
 b=vf/tAEqpADtJTlhFw78BOyAsLrqRm/XPMOKcQPgsBjeY5+jS5Q7cZoUiygufzdQ7cxYJM1OklyQ1cBRHIM1S2bBH+cvVAsLrxtnP4t+bGOVTyZ2rTFHdi1FUFzJkh27uP4lZkb68f+v1if7ypwDnFnEK0FFCR5WGcXfPEpJraQkmhGvPrfegL89Yt8ClP5kQ//divd6v1wam533JTCST6w0D/ThsCTuF1qmf6rQ6jjl0XsqpjVPDHrs1sDhSGn3UhHfVASFZMuTg2FhDQlz1YhDEiJzV6v2ka4xRcPizlQY9BAkkZU9oYrXdG6j7Ze+8SRJuzWLPfotmDdbfQQXZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0QhKsn0C6L8SxKAdW0HMa+twExJ+xkyPiKUU3iHflI=;
 b=crbCF4UMp8s3VFMAJ5bXGJz3LCBJgXi4EZeCHUmjQNWO2Jt+xxqIWMaIUID9GXXH12jm6kGG2ou15Y+LaUcMI3iuVV8zTm3bFr5DQyYWULUVQpTWyMnRpca6bTWOC/XTUXrqLtKmxqt8AlLVkhvWljmcdZt94JYGcTA8EYWboIc=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by TY3PR01MB11513.jpnprd01.prod.outlook.com (2603:1096:400:374::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:14:37 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:14:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: "magnus.damm" <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
Thread-Topic: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
Thread-Index: AQHdeO4FpxNBLY//rUytKmbH/dmgVrc261yA
Date: Fri, 20 Nov 2026 13:14:37 +0000
Message-ID:
 <TYYPR01MB6603B59F47E78CC7DDBF50B986782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
 <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|TY3PR01MB11513:EE_
x-ms-office365-filtering-correlation-id: 1afaf9cb-3be8-45e8-b8f2-08df47083a6e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|38070700021|4143699003|11063799006|56012099006|261022105027099003|261009223027099003|261021123027099003|261028144727099003|261026121527099003|261026140227099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 m2ZGdPrfGfmTX94ONWZTnKCix3dA6d/8oELGODHfuM8DR/5BwDnS+Zy4vIWjmCVr5R8M7KYbTzd4ARFWBL0bvfAQx6n7pgqGdT09Ek1BALMtjD4FAlBbR4YXBhDHds/v3g6mnSfPHg9WtoRtTQvvDlIcgYsqJ0gXSCm9LHtV5d1A2qB+4KoPGJNx/ahS1Tvn32W2eZwRm5+kOI7fmoQCx/pmq8L/UIR/G0RclXprwShJCzpqql5s7IZx0K4Pnx01R+0d/StYTAj+CyWXlL8wsCDDeglWeKBjkiU9KTUaoLbioiC2JK+lRNaNvLpd5/KuMn4vubxVCtOD4Fud0Jl2vrauZ5jqh+Km87dGCLjRu4fBheFHVSUVGr41YF1+UPxq6gxlx5/K4UYz159bQhlo77QbvLtCLTHU19cBFItgItmo5N7bTdPqvtDqkND9H2X5FZThk/lbBECqhGLO/NV6yQvdAg0sPV0E6o2E6GYGmKYGrWyW+QDiJg5Xw+e1USeQYZsltBOb8m2kj7AedPcNJd7NxMu3lQnl3jSjyqGNS21aD/4u1DzAI7Tx4eePgMf6JnvlhEq7sdexE6y6aoyf93dQMsmRWE5KYwY5Y9A+fi50dsT25r8QTr1eYO+irzQ8QZdGErhiGNtuBJ8F82dW7HoEfIcZRgOlAPYP4m2Ex/AZSKhkxpGV5zpx5eg2B22sWn+Sjx56wPcMCG44GOEaEuieUp4pe5eQCGGs6i/Quzg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(38070700021)(4143699003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261021123027099003)(261028144727099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWU1Zmw2M2ZOSFVLMHRQUGxkbkpIOGp1ek5hKzgrZ3BSc1MxZXB0L2s1eG4v?=
 =?utf-8?B?dXJ6WHhUOWkyOC9ES0g3QXIweFZGVGVqajh2NnUzYTBSMk8wMXpIeDAzVjl6?=
 =?utf-8?B?ajhTUEhSUi9IdzFkaEdrNXFBcWovNy9OQ252ZERUV09XUEVHZDYwZTl1L1lV?=
 =?utf-8?B?OXNJdTZ0am54U2xBczc3ZVZxUmdVWHM0YlJPZWJHTmgwWDJwKzhad1ZLVnRI?=
 =?utf-8?B?N3Y4dENUclZ1bGE2aEtpVUtpNlNKSkQxZmhqS2dZUTU3ZUJWQ3Z2SU1XSTVj?=
 =?utf-8?B?U0RCTUhDMW5nRWN6eks1c2FUNUZ6d1hFL2F2RzN4ZFJ3THp3VHBzdUx0RE9F?=
 =?utf-8?B?RXcreHVzQUFWWXp0dEJGTkF1VmtkSmo5YlhwVDVXWUcxSkNHSkROUm0wZnFz?=
 =?utf-8?B?UitQYWJpRFhRTmluSFdwS1FFRzNvUmliWkViZitTRS9VZlBNMzFBTzRYcjhF?=
 =?utf-8?B?YTdnVGVmUElSZFRQekQ3Q1RHZHMrSWJSMDBFQUlXcE5VZWZVc3RLYXNGRWRJ?=
 =?utf-8?B?dEVrcUR2amVmYlBkbWNJa3NsUWU2N0JQc05HWk9JZGxUdXVBRVhSL2Z0L2k5?=
 =?utf-8?B?VDlaK0dqTjZIM3VEUDVhOU1XNUxRMjhXelJXYWtINXgxZTdCaGhWQlBuMUF3?=
 =?utf-8?B?b0I0WllIY21iRGdIMlMvdHFYOWJXWmpTYitCaXZ4SWE5L3AyS28zdXl5MUNZ?=
 =?utf-8?B?TmFUcVBrOGdUcDNnY0U4dXBpQWoyVVcwa2c5Zk9MdStZUU04bGtlSEhMaDBF?=
 =?utf-8?B?UzVKNmFkT3p2djdtS21yenhOM01QY01oMHFBNkIrNVF0Q0pMbkpRZEpteFdl?=
 =?utf-8?B?ajBrWW51UHVtemZVMWx4cVpLN0hnYytXalZCa1NnWlMxMVlPc3BmekJJUnBj?=
 =?utf-8?B?MkZITVdrSHYyMGRFekNWZDZHU3dkVjg0aktCVHBtcjNNUzd0V2QyZmVnVkdF?=
 =?utf-8?B?bDlKNFdyV3dkQXJvVnR2M2JKMUplZ3g0NXZRWGQxY1V6Tms1SFA2SDVvWUhs?=
 =?utf-8?B?bGJkVUZucEROYmRwbTFGdnpENjFiOHlYb05kMktIdzF2MER5S3pJVFEyK0JU?=
 =?utf-8?B?Nm4zTWVsaTVCNzJKLy9jTG1FMEF5OWE3cFBPTGJlZFZMTUdhVlA3T0lyaU1t?=
 =?utf-8?B?TkNlc3FiZkp4OUNnS2dHMnBSRTVkZUdlUDA5Q3hNRHRWMnQzYTBPQ0xzNDNJ?=
 =?utf-8?B?cWdyS2EzbXJ3ZkpkeUw3Ti9YM3JmM2lURXZFRTdaT1UvUFo5K1J2Nkk3OVBF?=
 =?utf-8?B?NVd3akl2d1pMK21QY2NqVWs2T3FKR3lqYnZJdGVzd1lVQk1lTld0TmlpTENT?=
 =?utf-8?B?MDh2WFlQeno1Z3VxdUxKZWpOWEJWcXBKSzN3bnQ1R1dtSEpSc3pNbFRXdzho?=
 =?utf-8?B?YWpNbnZrZlVzYXQrN21hb043WjF2NkxsZXlrTklaRnp0U3d3TkEvOG1jcjFm?=
 =?utf-8?B?VVRqUjZTTlVDNEQ0QmlVV0cxN1ZhYXlQSU91dlZTZlQycVQwZkFEMHMwWFBP?=
 =?utf-8?B?VnM1VnJtWGFLbzUrMGxKSElPVnlvS09GeXB0cmsyQXZHUDJvTGhlZk5mUWpx?=
 =?utf-8?B?Mk5JVW5xSkJHc1JwaTFGRFVGZ3M4NU0yODVpbWFWd2VLZUp4U0N0NzBTSnhI?=
 =?utf-8?B?UGVROTBVeVRRWHNHTk9XaC9GQVZFdFMrT0tsaUVRK3J0YUQ3eXBNQmtsczhE?=
 =?utf-8?B?Q2x6aTNSQktZYmNoNFR3UEY2RHJOYmVmUlAzTithS2c2a1ZBclZGYys5NFpN?=
 =?utf-8?B?N1Vvc1oreUtSN3pndlFaaklsTy9OSU5YT3h4WnlSczd6YWJUdUNGYlByY09W?=
 =?utf-8?B?b05xcE5odjdSWldaZCtSL1pITWdFbEVPUzAzNVZzcTgxMm5hRUF2eWN2U0R0?=
 =?utf-8?B?Z3pBeGNLRHoraGhqK2F4S2w4aFZDTDZrbXRPUVp5UEc4MmtoejFRdGlxM3hj?=
 =?utf-8?B?bWZ6b2FkVzhGMFpUdWVrNW91a3JGNjFjZXYxY0dZQzFna0RtcXl0Rk9uMTN6?=
 =?utf-8?B?RmE3aGl2M1hkZzB6V0hZVVF4Mjk2cnJQM2thbk1FUThKVklQY2IwclZpc2FV?=
 =?utf-8?B?U1V0Wm1RVjhIa09EUmJxc0Q3N251MU0rMEloVjZwQ0NVd3hvbEdCOEZDamlV?=
 =?utf-8?B?a0xiMjBzeUVSL3U5RTdKQ1FJQUZTdmFtTnFjUy9IVmRPRmxkTzEyb0JEVGxY?=
 =?utf-8?B?STRqdjAybFE5a0hTcGdkMVpzMWluWXN1YXdYbmFQY0NNemE0UG9lQUFXZ0Rn?=
 =?utf-8?B?MFpMYXV3c3R2OHFnajBDamxyOWtDVXVjS2l3OXhHUW9lcnRuYmlaMFJjaXlU?=
 =?utf-8?B?Wk03ME5qQ1VTeUlxNEhXc1FJVVpLaTBIMEZNUTBaSkg5blZLNG9EZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6603.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afaf9cb-3be8-45e8-b8f2-08df47083a6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 13:14:37.5113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQT1J13M98CVmK8+4iydMWmF1Ihx6zR9B+yzBdLO4zpBcFMER0Jc0Ru5dTFGJSbmJkAW2oyBt1bx02e+PUgKlVuw4CZ6zNlffHGlVIzp2zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11513

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMjAgTm92ZW1iZXIgMjAyNiAxMjo1Mg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvM10gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDhnMDQ2OiBBZGQgU0RISSBub2RlcyBm
b3IgUlovRzNMIFNvQyBhbmQgU0RISTENCj4gcGluY29udHJvbCBvbiBTTUFSQyBFVksNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDEyIE5vdiAyMDI2IGF0IDE5OjQ4LCBCaWp1IERhcyA8
YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgZGV2aWNlIHRyZWUgbm9kZXMgZm9y
IHRoZSB0aHJlZSBTREhJIGNvbnRyb2xsZXJzIChTREhJezAsMSwyfSkgb24NCj4gPiB0aGUgUlov
RzNMIFNvQyAocjlhMDhnMDQ2KSBhbmQgZW5hYmxlIFNESEkxIG9uIHRoZSBSWi9HM0wgU01BUkMg
RVZLDQo+ID4gcGxhdGZvcm0gd2l0aCBwaW5jb250cm9sIGFuZCBHUElPLWJhc2VkIHZvbHRhZ2Ug
c3dpdGNoaW5nIHJlZ3VsYXRvcg0KPiA+IHN1cHBvcnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OWEwOGcwNDYuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
OGcwNDYuZHRzaQ0KPiA+IEBAIC0xMDYyLDkgKzEwNjIsODAgQEAgZG1hYzogZG1hLWNvbnRyb2xs
ZXJAMTE4MjAwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGRtYS1jaGFubmVscyA9
IDwxNj47DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAg
c2RoaTA6IG1tY0AxMWMwMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHNkaGktcjlhMDhnMDQ2IjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHgwIDB4MTFjMDAwMDAgMCAweDEwMDAwPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTMwIElSUV9UWVBFX0xFVkVMX0hJR0g+
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAxMzEg
SVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tz
ID0gPCZjcGcgQ1BHX01PRCBSOUEwOEcwNDZfU0RISTBfSU1DTEs+LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgUjlBMDhHMDQ2X1NESEkwX0NMS19I
Uz4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCBS
OUEwOEcwNDZfU0RISTBfSU1DTEsyPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9TREhJMF9JQUNMS00+LA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgUjlBMDhHMDQ2X1NESEkwX0lB
Q0xLUz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSIs
ICJjbGtoIiwgImNkIiwgImFjbGttIiwgImFjbGtzIjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBtYXgtZnJlcXVlbmN5ID0gPDE1MDAwMDAwMD47DQo+IA0KPiBHaXZlbiB0aGUgYnVzIGNs
b2NrIGNhbiBvbmx5IHJ1biBhdCAyMDAsIDEwMCwgNTAsIG9yIDYuMjUgTUh6LA0KPiAxNTAgTWh6
IGxvb2tzIHN0cmFuZ2UgdG8gbWUuDQoNClJlZjogUlpHM0xfY2xvY2tfbGlzdF9yMS4xMF9hZC54
bHN4IA0KNDAwIE1IeiBJTUNMe0ssSzJ9IGNsb2NrIGlzIHByb2hpYml0ZWQgZm9yIHRoaXMgU29D
Lg0KODAwIE1IeiBIUyBjbG9jayBpcyBwcm9oaWJpdGVkIGZvciB0aGlzIFNvQy4NCg0KSU1DTEsg
PSBTRCAvIDINCkhTID0gU0QNCg0KSU1DTEsgY2xvY2sgc291cmNlcyANCjQwMCBNSHo6LSBQcm9o
aWJpdGVkDQozMDAuMDAwIA0KMjUwLjAwMA0KMTMzLjMzMw0KDQoNClRoZSBuZXh0IGF2YWlsYWJs
ZSBtYXggZnJlcXVlbmN5ID0gMzAwIC8gMiA9IDE1MCBNSHogdGhhdCBnb2VzIHRvDQpTRCBpbnRl
cmZhY2UuDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcg
UjlBMDhHMDQ2X1NESEkwX0lYUlNUPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8JmNwZyBSOUEwOEcwNDZfU0RISTBfSVhSU1RBWElNPiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8JmNwZyBSOUEwOEcwNDZfU0RISTBfSVhSU1RBWElTPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZXNldC1uYW1lcyA9ICJyc3QiLCAiYXhpbSIsICJh
eGlzIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZjcGc+
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4g
KyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICAgICAgICAgICAgICAgICBzZGhpMTogbW1j
QDExYzEwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJl
bmVzYXMsc2RoaS1yOWEwOGcwNDYiOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAgMHgxMWMxMDAwMCAwIDB4MTAwMDA+Ow0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IC8qIHBsYWNlaG9sZGVyICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDEzMiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMTMzIElSUV9UWVBFX0xFVkVMX0hJR0g+
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgUjlB
MDhHMDQ2X1NESEkxX0lNQ0xLPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9TREhJMV9DTEtfSFM+LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgUjlBMDhHMDQ2X1NESEkxX0lNQ0xL
Mj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCBS
OUEwOEcwNDZfU0RISTFfSUFDTEtNPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9TREhJMV9JQUNMS1M+Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiY2xraCIsICJjZCIsICJhY2xr
bSIsICJhY2xrcyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbWF4LWZyZXF1ZW5jeSA9
IDwxNTAwMDAwMDA+Ow0KPiANCj4gTGlrZXdpc2UuIFRoaXMgaW5zdGFuY2UgZG9lcyBub3Qgc3Vw
cG9ydCBIUzQwMCwgYnV0IEhTMjAwIGFuZCBIUzQwMCB1c2UgdGhlIHNhbWUgYnVzIGNsb2NrIHNw
ZWVkLA0KPiByaWdodD8NCg0KWWVzIHRoYXQgaXMgY29ycmVjdCwgSFMyMDAgYW5kIEhTNDAwIHVz
ZSB0aGUgc2FtZSBidXMgY2xvY2sgc3BlZWQNCg0KZm9yIEhTMjAwIGl0IGlzIDE6MSBvcHRpb24s
IHNvIDMwME1IeiBhbmQgd2l0aCBpbnRlcm5hbCBkaXZpZGVyKDIpID0gMTUwIE1Ieg0KDQpGb3Ig
SFM0MDAsIERpdmlkZXIgZnJvbSBTRGN0cmwgcmVnaXN0ZXI9MCwgc28gMzAwTUh6IHdpdGggU0Rf
Q1RSTCBkaXZpZGVyIDIgPTE1MCBNSHouDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmVzZXRzID0gPCZjcGcgUjlBMDhHMDQ2X1NESEkxX0lYUlNUPiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBSOUEwOEcwNDZfU0RISTFfSVhSU1RBWElNPiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBSOUEwOEcwNDZfU0RI
STFfSVhSU1RBWElTPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldC1uYW1lcyA9
ICJyc3QiLCAiYXhpbSIsICJheGlzIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwb3dl
ci1kb21haW5zID0gPCZjcGc+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9
ICJkaXNhYmxlZCI7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNkaGkxX3Zx
bW1jOiB2cW1tYy1yZWd1bGF0b3Igew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVndWxhdG9yLW5hbWUgPSAiU0RISTEtVlFNTUMiOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9
IDwzMzAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRv
ci1yYW1wLWRlbGF5ID0gPDEyMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0K
PiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgc2RoaTI6
IG1tY0AxMWMyMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJyZW5lc2FzLHNkaGktcjlhMDhnMDQ2IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwIDB4MTFjMjAwMDAgMCAweDEwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTM0IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAxMzUgSVJRX1RZ
UEVfTEVWRUxfSElHSD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZj
cGcgQ1BHX01PRCBSOUEwOEcwNDZfU0RISTJfSU1DTEs+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgUjlBMDhHMDQ2X1NESEkyX0NMS19IUz4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCBSOUEwOEcw
NDZfU0RISTJfSU1DTEsyPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9TREhJMl9JQUNMS00+LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgUjlBMDhHMDQ2X1NESEkyX0lBQ0xLUz47
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSIsICJjbGto
IiwgImNkIiwgImFjbGttIiwgImFjbGtzIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBt
YXgtZnJlcXVlbmN5ID0gPDE1MDAwMDAwMD47DQo+IA0KPiBUaGlzIGluc3RhbmNlIG1heGVzIG91
dCBhdCBTRFIxMDQsIHNvIG1heC1mcmVxdWVuY3kgc2hvdWxkIGJlIGxvd2VyPw0KDQpTRFIxMDQg
bWF4IGZyZXF1ZW5jeSB0aGVvcmV0aWNhbCAyMDhNSHouDQoNCkluIG91ciBTb0MsIDIwMCBNSHog
aXMgcHJvaGliaXRlZCwgc28gdGhlIG5leHQgbWF4aW11bSBhdmFpbGFibGUgaXMgMTUwTUh6Lg0K
DQpDaGVlcnMsDQpCaWp1DQo=
