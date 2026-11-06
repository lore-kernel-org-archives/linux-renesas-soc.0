Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793960559;
	b=G/M4YrvID6oPsFEH0P5N71jAbN/IeZYg7a3FjA31GrPF5tUdialQYZnA21ER27TdYyh7
	 NRcCTX1CK46Bf/JCu9JpOxJuuvXGa3T7eLzsXZjN9ACMRkkbomiEslC6AMHx0WRJTmSI4
	 TgdsezcYib4pxvJY2OR7kc6y40KllZuAh0O0+WO0vwEF78/KdYgRTh84zbgcaxsJPOyFT
	 zcvvbwgzSz67op2YtRhlbZ71NP7IKlDrnAW28pV+O1icNT26EQmWDmAYXS+Mjw0BSVIzb
	 fOmUGQ+FaAwGoIivjDWfQJDo4JHprFJAKdx+sFvb1FZVyB8Ti/ZQ3bc1AR3E/F8xSXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960559;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=MsysuXdbFDYsM797Kr6eVk4g8Zwz3df3j5KRf5RfrGQ=;
	b=wE+HNiouT8tJqZ2oC88HzBSDoDSLt20ppqUXBlQJLwCcrb01xBOPu1N9auqsVRXAhGw0
	 bE89S1apAg9RzAaC7dNttiO+uzaxdPRIfWtw/f5rKztEShVQopX5pYyHVx/Fpx/DlDuK1
	 wfjdvovKrOXoIJMt280WvlXxtlfwT39+SpG38TytJmoeJdaTxgekQP10JyOEhD33YQKXW
	 T1lpTxxlIknXp/9gnwSWq4JcK9149PTBNgzWY2WR54miHuk2XW+wNEjPJ1RCKJdcLSKAL
	 Z7Av9m5s5eS+KS04+sRmo84BN6YA0AzfhMtYTMP8fSgvCNlQanUp2SLkdL07O9Z0TgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b="LcFFW+/w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.5
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0404606A326
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Nov 2026 10:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0404606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=LcFFW+/w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7US7POUbnh7hSQC2xK8blW+dXnzyjP6r8opYW4lXE+ZPxTmqy8LEenYBpmod9cx/TMy/aiUQe4HX0YHhW5YcWvCMHys5FOGxM+GmITr8zuqzYccLHcm6sunNRDv1to9CNeGZ/XQMYnFSDWOBU1keqA0ETqb/x+MW1xNJ6yjmoC0LjyY6hTagiYnzLO3MuSbYpCMyUNPJJ2UDGjHksMzrWUYl0H7LGEJSNfFNc8UlWaokHSM1Oe0+bLeAL+VERJ9cJ5h19aWh9bsNnfaXqXtk4gWGilY/b7yuGKReOHAOxghXoR9msbQk1SJncqBULT4up9+wf1NzngKcByAKNzPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsysuXdbFDYsM797Kr6eVk4g8Zwz3df3j5KRf5RfrGQ=;
 b=A1nZa1u8bVQ1qtte7uWC1adl2ddK+6NjuxFIiXoT4ar3MmzQJM4N5qMfJYVjuHAGS3q2S7coziqfnAT95OBwkhwEVUGuzQs5pTKTcGK1goipQNIR5WgEPmkd1c8xG6/jKyx5Y6SZn2taUYhuAEYZVOrwVLrHioJm83SctS3IwlMxVoAvzazlXwWByCrO5Z5qt9tGUvPjaXpjCoLWx4MzNCrRFA48N5/iDw8v/RnkTbshixMmElFuM1efEgcndsugbYDUNrLXu739fQjRNx9DRT9Ijy/imfIXqYnSAbYpeFcswQSGIFLD2UmvWz5jiyl11fR6DQ9dNoNCFk6aSF6HCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsysuXdbFDYsM797Kr6eVk4g8Zwz3df3j5KRf5RfrGQ=;
 b=LcFFW+/wvB7tHz4+0Adodrl6hmUn83XOid5ra2bxU9MJgghRGkm7NDUx6SQWNqW3XedDDNEYDME9B69GfPnactyh77PNfCUgOzXFGs+wBnH8RjLSUxVOtMUqIf37fjJQyvMRdUQL0uFG70ADrp4YGDul6S0NzhIbeMnYReDvfKk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12496.jpnprd01.prod.outlook.com (2603:1096:604:329::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 10:22:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 10:22:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 36/83] drm/rz-du: Switch to
 drm_mode_config_create_initial_state
Thread-Topic: [PATCH 36/83] drm/rz-du: Switch to
 drm_mode_config_create_initial_state
Thread-Index: AQHdbS9mTesSgnWIF0m21/KiUMUE6Lcg1kRg
Date: Fri, 6 Nov 2026 10:22:18 +0000
Message-ID:
 <TY3PR01MB11346B5FF3005A67FC59B2DF386762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
 <20261105-drm-no-more-config-reset-v1-36-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-36-763560c2cc3f@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12496:EE_
x-ms-office365-filtering-correlation-id: b9733519-f6fe-48ab-1a49-08df3befd666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|22082099003|18002099003|38070700021|56012099006|4143699003|11063799006|261022075727099003|261021123027099003|261009223027099003|261021121427099003|261102123227099003;
x-microsoft-antispam-message-info:
 faymGkEksnr9/R+yhuvo2RLzBsh634yuXjo8W6HlEenjmbxuPQbP9ajfhk7yCtT28LjqnkTOINrJZcVCoT+gRzVar2vLm8r4oIYpSy2Zo2zNdNgOZTBPBLeNvbpWDZ1wccnVuW2ltJtVbBvLAGVMRKU7OzgQ3anESKkgC11DNp0IHuWyJWrg2O5tkmmjxPWX01Z49OnkUOTAIL6npx60TTWZEZ/3BZSgyp4Iw4WUj6pH4F6+iyOROebFr/abdoWwouhtB+ZKsU70TcWh3unnqu5VwPsx3ZG1QmbVhfamgyi7ySF9dYz9cdLZrQB0Gz7NYZIChp7KzrxeH5mkKyhmbthSIziLe9qfisqTZi1TkAHEBGpNTW2TBA4mQW5t/+CPucd1NUFD9FHIxzvNk6G9lVKD+ACkdyXR/RKEIJ+abT+t1jE0usZOweZAD/Vi2JyRylXnGFriZxiBfD39ZqHbc1E3By7d7dzxx5qOMJB9BzWNyR+PyNhZD96GL9S3Dx6ozf7d3L3xJQcOQlnE7JkI8jJO5V22862IWu+u5yfjL++nNVMnbhvY5iPjl5PUHwRlCV+yWh2ycKzaU08462RECb632IMpbAo/mOSr6PJf63cWojJxhIJvqBbCXIwyC3mNRrsXIZzdQ184fvvlH8GGHEACZ8iYLDkSjU3h16u3ds5hKp86opzd1Wzi2rBvhOwaUpq7X4gj5+LI0G45L/A1Ng==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(4143699003)(11063799006)(261022075727099003)(261021123027099003)(261009223027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azZiRlc1Ym9IVnZPSUk4Z3lmWGZFL3VZakdPUDJnN0pHYmRiT1dNdXhjc3NG?=
 =?utf-8?B?ZUVyNmxVMnpWZms4Ky9WeWlITHNKOEY4cmlNREV3cDVFUG9RTllVbzdEWlNI?=
 =?utf-8?B?MFJMT044Z0tTQ2lPUFhsam9PWmpVdlVMQmNoeFFWalZCdHdWZ2hFRTNaYzhE?=
 =?utf-8?B?cVRudmFDSERwcWFiSXlHM1BmRkgxK2w0Mm83U1poeTE3WFlYWVg1QXJJQkUv?=
 =?utf-8?B?Z2FJaktLRHd2ZTN2VVlYUzMxeE5MYjQ5clhNVzRqVmwwV2JGS1gxTU5Za2tY?=
 =?utf-8?B?T0t3bEFtR3M5TjVsK0IyVjVCeU9tVWxLdG9RQXpKcFU4SW9TSFNPRTd5Q2VD?=
 =?utf-8?B?cXZEejE0Und2cmZrRGsvSWlaZVRPdmJYYXdwdWFOS09WSkhuSEpZS0I3NHkz?=
 =?utf-8?B?Tmo4bXQ0ZlhKc0hHSVo5eFUxYWVuY0JXa0tYc1pMN1lacSt3MUh2bjc2c0N0?=
 =?utf-8?B?c3JJaDI1WC81VU95VTIwZnZ1S2VTTEFmSHE1b3MwSFlPN0lyNjNxcTRSWkJW?=
 =?utf-8?B?cDBXRVJ2ejlpTTZWUW1tV2ZIc0FkUmlhZnZYMDNycDRxbzFwWEVpcUx3Z0Fl?=
 =?utf-8?B?bTBoVUVTVnh6T2ZNNXVYTkpZdzcvOTZEMkdSS2N6TlRUWDQ4VG9iNEpkbEY2?=
 =?utf-8?B?L3NFdFFmaVlEZTVaYVFwbFdtSlVEN1B1QkZVR28zemdLRU5NWjdveTd2L2M2?=
 =?utf-8?B?ckZQY3FjVUZJMzBvTnRnei9ydnFocVRnK2wzV3k4QW1kNnc4RDlkR2ZKcGY1?=
 =?utf-8?B?M2ppNnRXSndQakRBcjh1bDlnWVRsZWs3ODRWZ3pabncvSXZuK2dKRDdRelBh?=
 =?utf-8?B?VEs1Nzh6NEZ4bU5FM2thWmhtVnJpd0t6dDgxKytKSGpLU2JOSWZRd28vOG5z?=
 =?utf-8?B?VnJhZ0JRTXpwcjVqQ3hVbXpVV3hUOFVmSXBKRWIvR2ppVnNlVHpPNUxkMTF0?=
 =?utf-8?B?Q2tlWnhQdmdFNVFxRnBzWFdTamNkekRvbEJzalBPVmxEU1Q4U0dTeHh0SHNp?=
 =?utf-8?B?RGV5Mk1BNElhM1dIWC9mODU2eGsyRGpkSVFGVkR6WFppMk9IQkFSUGN6eVpa?=
 =?utf-8?B?ODJENEtHaFlUUEpHVWU4NzB0SkViVE9xL0ZTWHpVMm5BS1hHbXVCNHFVdHlx?=
 =?utf-8?B?UHNnZVgrVFlTZkFFSTVWaW9KME9JeFhFOW94TGZCSlZ1K1poUWp4Yk5JYlJr?=
 =?utf-8?B?bUpiSDVZTEFzdWJLQ20wWGJTTU9oQWdSa3FiU05wVld2YWV4KzZJYndSTEVX?=
 =?utf-8?B?Y3pEWW03VlBJZjArSHdjYzF5cnhRRTlqWjNFaExEcFpjOEY4UkQvQk9qMW1U?=
 =?utf-8?B?ZzJMaXk2aDlqekswbjcvaUNseGhZbXVVM3pDTHA3WG1POGNZN2kvdWJ1SlVX?=
 =?utf-8?B?N1Mwd0k0MG11STRPdXo5RXhRbzR1clB5QXFOY1VIOTdWTE1vUXRjZ1ZPNGls?=
 =?utf-8?B?UXFsU1EwU2RyWXZDYVBVY2cvRVI5Qk8wWVBGZmdDWDN5eFZLbnRRZDRMRlJG?=
 =?utf-8?B?ZEVCMC9nRjFlKzZJTVFwS1Z1b2hJUE13VFlYUmVYSzRUeHRNT0FKZmd0OSti?=
 =?utf-8?B?WkwzSFN5UU9tY0RwMThGcEp1dGpvY3NDWk8zNEh4amx6M01DL1poeXIrWmNo?=
 =?utf-8?B?dkJ2RXQ3TU1nSFl3Vml4UElLa2ZwRm1UU1FRODkyVGQ2QjljUHVnRFR4UjVo?=
 =?utf-8?B?OXdFRDhtQUpSMGNhY0JMbWxTMkVPeHpRdTJRQjdhT20xR0EyUWFPWm02bjU2?=
 =?utf-8?B?R212MjNMK0ZUMnpHeTdFazVqMlBBMGpraEpaVkQ2eks5SDV2TkxpcW9LR242?=
 =?utf-8?B?eEgzUVJPdERoVFliR3VyY1ZqbG1sY3psU1JjTWUzQWRMWWRYMFlWL3M0aHhn?=
 =?utf-8?B?RUpnUm9lc2tSUlZQVm1UeWZrYXkvWTV1Y2d5MHcxVitmcVNuU0creUNXT3VM?=
 =?utf-8?B?d0hSdnk1R05MN0hoZ0NPVkYyR3N6Y1Jic2Z3bnFjVEo0elpRQ1dUYW16RCs3?=
 =?utf-8?B?THliVWZBTVEyekVsRnpDaWdiK0FRZTZFSXNsZWJNeTFFc1FYV0dNdmFaNlVk?=
 =?utf-8?B?ZTNtNFl4U2owaHJsR1hsV3M1eHMxRkY1M3d6Z1hMY1FnOVZ5WnJyQUl2ZzBY?=
 =?utf-8?B?Tmt2dURrcHBRblJaaWJLYXdJeDVxREFmYURjWGIvRzdZOFpLa1dsNlJsc0Mw?=
 =?utf-8?B?bW5QV012TFY0YmlCcWRLUEJvempJUWVQRGh1aXhZQ0J1R2VxWi93ejZmK0R0?=
 =?utf-8?B?RVNLMm9ESGxaQkZkWjVJRjhsbWxOZkYvRVBhMktEWncrbUZ2TW81SWhSVGU4?=
 =?utf-8?B?cXRaRWV3ZDVVRFpFRDlLN3gxeUxUa1dIMnp6NitKbGVzNXdBeHRuZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9733519-f6fe-48ab-1a49-08df3befd666
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 10:22:18.9731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVR9LYF0fSJHu1aYRR+2JwJu+qJeSK8HXWFdI9MOK5eI75cn6pHTEEW37W+ONnevGym0/A6yevB5F/iA+llcuxlY8ddWsq1NDY0lXmQbpz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12496

SGkgTWF4aW1lLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1heGlt
ZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gU2VudDogMDUgTm92ZW1iZXIgMjAyNiAx
NDowOA0KPiBTdWJqZWN0OiBbUEFUQ0ggMzYvODNdIGRybS9yei1kdTogU3dpdGNoIHRvIGRybV9t
b2RlX2NvbmZpZ19jcmVhdGVfaW5pdGlhbF9zdGF0ZQ0KPiANCj4gZHJtX21vZGVfY29uZmlnX3Jl
c2V0KCkgaGFzIGEgZHVhbCByb2xlOiBpdCBjcmVhdGVzIHRoZSBpbml0aWFsIEtNUyBzdGF0ZSBh
dCBwcm9iZSB0aW1lLCBhbmQgcmVzZXRzDQo+IGhhcmR3YXJlIGFuZCBzb2Z0d2FyZSBzdGF0ZSBk
dXJpbmcgc3VzcGVuZC9yZXN1bWUgY3ljbGVzLg0KPiANCj4gU2luY2UgdGhlIHR3byByb2xlcyBu
ZWVkIGRpZmZlcmVudCBiZWhhdmlvcnMgKG5vdGFibHkgZm9yIG9iamVjdHMgbGlrZSBkcm1fcHJp
dmF0ZV9vYmogdGhhdCBtdXN0DQo+IHBlcnNpc3QgYWNyb3NzIHN1c3BlbmQvcmVzdW1lKSwNCj4g
ZHJtX21vZGVfY29uZmlnX2NyZWF0ZV9pbml0aWFsX3N0YXRlKCkgd2FzIGludHJvZHVjZWQgdG8g
aGFuZGxlIG9ubHkgdGhlIGluaXRpYWwgc3RhdGUgY3JlYXRpb24gYXQNCj4gcHJvYmUgdGltZS4N
Cj4gDQo+IFN3aXRjaCB0byBkcm1fbW9kZV9jb25maWdfY3JlYXRlX2luaXRpYWxfc3RhdGUoKS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4N
Cg0KUmV2aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCg0K
Q2hlZXJzLA0KQmlqdQ0KDQo+IC0tLQ0KPiBDYzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiBDYzogbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnDQo+IC0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfa21zLmMgfCA0ICsr
Ky0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV9r
bXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LQ0KPiBkdS9yemcybF9kdV9rbXMuYw0K
PiBpbmRleCA4N2YxNzExNDVhMjMuLjA3MTcxZjJmMzA1MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfa21zLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfa21zLmMNCj4gQEAgLTQ3Miw1ICs0NzIsNyBA
QCBpbnQgcnpnMmxfZHVfbW9kZXNldF9pbml0KHN0cnVjdCByemcybF9kdV9kZXZpY2UgKnJjZHUp
DQo+ICAJfQ0KPiANCj4gLQlkcm1fbW9kZV9jb25maWdfcmVzZXQoZGV2KTsNCj4gKwlyZXQgPSBk
cm1fbW9kZV9jb25maWdfY3JlYXRlX2luaXRpYWxfc3RhdGUoZGV2KTsNCj4gKwlpZiAocmV0KQ0K
PiArCQlyZXR1cm4gcmV0Ow0KPiANCj4gIAlkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZGV2KTsN
Cj4gDQo+IC0tDQo+IDIuNTUuMA0KDQo=
