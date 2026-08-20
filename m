Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335752874E6;
	Thu, 20 Aug 2026 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238326; cv=fail; b=MPSPOjAp/DCoM3aCcO5Y8jlMVWttmyrbchklS9uLVjaLj9u3X1FOCCJdzAxHff0M9sd2/K0k62LFPcQhmRBheOXWs79t8oDKwdlAU1gkZhjmTQ7l6T67WjQNWZoZaPFHUMyqwT4BiZ2fTVnQpzafkH7wVA6qx+ER/RNUFiPhMig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238326; c=relaxed/simple;
	bh=6k/ldRLohCvshzjhb4UNHB4ABZAdWN0Yc7+EsMv5ebE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bv64FOvP6W6wDOHQO/TGHqBtGOZsXY0SXYSc5JDxKyRTc/8Vm8MzUKQnd+ofA6QSDhHbJbk2TP1F3Ipqer+AJAkPLkpLz7dJGaH6Fi//5rg2RJwkYteyjE7Hj5O71bib4j/+C8lsUr4qSc4KI0qKXSj6GAHcuxeg6qJZpNeNq1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=V+VxIhtH; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V+VxIhtH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+1hVRI12uv1X+YkCgyj76U5gLswgWalhDnvMwCrU/Z6gCFmDq73FTPdGurQp2o2hyWj54jjS5F91kMh5hvGCsOMbOjnSShv1aPa+DZV5EIOQeRpD64Rt9kjcxW7rV509PUmbQgG6LTj7EeNnFo50NUoKHWtZkc/CVxwkA4xSYwzaHwY21MODLYJ0VIfZfd5HTmUUHnLUwLA9HNfjLR/GtyAK3qKmPcMI5mrBdsPrCJXGZd5ZnRTuWrl13BWrBNNzdmdl+iiE5lUPFutzvJZIk2JYi9ByTap52SPSH0LZ87+0cUF1D9Uqh2spIuhzrgafvAlQBRCoeCZBiNNczeAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6k/ldRLohCvshzjhb4UNHB4ABZAdWN0Yc7+EsMv5ebE=;
 b=kYUuyORVZcLNrLipfznQbtLQRAl7chhRdTv02Uh1SNfTwhCJ/f9uD6eKlvAP/1hVpTuH1NRUyfI4SGtmE/ksMpqb/N9wJV/P6K1xXbwaLhCuGSXfIY+mzwC2uK4Fc3Yfmv54R4XAhXAk+flCOW/uwvRFh+W8OF9T+7rJHRW3o1X7Dsh6gL6106CPqJ3q5lKg5/zLqHpu/ewEEr0Z+q9/9vAsQkDpCuXlYl1JeZnP3TQEI8tY0Xr5R9uJIWPKXzDp3YbJ8jZoYihi1a5EAuUvSkwaqHZe/Tj35gmy9u4fZXHyAvrsKXmdLXm/3+oUU0gMf4ciPhlaAJPUmpa94SBkfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k/ldRLohCvshzjhb4UNHB4ABZAdWN0Yc7+EsMv5ebE=;
 b=V+VxIhtHVKf5pLiG0NxCHCigv1ucdzso31o6ynFrvH36bCNROhEYpDKE9xYf/MW7rek7nWC2w15hcXK1byuq1qtQT+JMWto4Lzfqdi1br5LYOCt03U6HDbhQ6Qfii7Gl3p6pv/qVJce+ggA3fgy4wXyb64LAhdViTVNycuOOaoE=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS7PR01MB16965.jpnprd01.prod.outlook.com (2603:1096:604:423::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:05:20 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 15:05:08 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, John Madieu
	<john.madieu.xa@bp.renesas.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: sound: renesas,r9a09g047-sound: Drop
 #clock-cells from required
Thread-Topic: [PATCH 1/2] dt-bindings: sound: renesas,r9a09g047-sound: Drop
 #clock-cells from required
Thread-Index: AQHdMIpqrzcVbysEPUmsaJHHtEzDQbamuAYAgABQPoA=
Date: Thu, 20 Aug 2026 15:05:08 +0000
Message-ID:
 <TYRPR01MB1358899D35FBD843D12ED4F53E0A42@TYRPR01MB13588.jpnprd01.prod.outlook.com>
References: <20260820095742.3094558-1-tommaso.merciai.xr@bp.renesas.com>
 <20260820095742.3094558-2-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXUu8M4Xjb27XLcMWGYFk6NdKwKB6WO2ZQ_FCAvMTJshQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXUu8M4Xjb27XLcMWGYFk6NdKwKB6WO2ZQ_FCAvMTJshQ@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB13588:EE_|OS7PR01MB16965:EE_
x-ms-office365-filtering-correlation-id: 1d53b776-0cb5-40a2-5c54-08defecc6cee
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|11063799006|4143699003|38070700021|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 sWTbkn2G6qEekggDewvpMtRv9dftD51oHAbHLSK2slfVFlZHlXWczEDfcuDZoq6XqzpaQ6cjGXAWU41El/68I+xPKRq8rfUISdZvEAVz7z5Lm8p1PeB/JgKVu6JgPUjbfB2Gjn7Vhzq4vW8NrnvSD5q8Xs3dHCTGcintgEpT+u6avMppKUBPWU5kYPgjGndaY3ZBW2Cl6kkzXiXXbYGVJ4kJdRFZ+o3u4SupOrcBvsSXuHkZbCGjY36VBHpqoSvFqZXB3pqb58a3pHhhV5MmKzwwcYXCuTkJN38BRP0YPLR0myAHB0hg2Ys8pW80+2lOpHF+AIFvWNLNCANItj6V/hxTfewXPwpIkVY2wpay1AiVOFzyH5nJw0zmdZLo2bckYHaW9l9q6xBFMPq1YP0auus4pJSuxSEydpS9uUoU2MRUGqzLuWnfuxG8xfw+W5iDIAYRzZtYFPJKmQGjzYNg2myKEdxX/XUY+Iddk1xyn++hoZX7HKuhVo6vqXlON2MOCZMGFJfkmbRjgvI9/lvY5dI71XJ4wcKB7EsWebN10pQLu4ibF8+C/SwjGKIIv8uPUb40kjxmGwmbei2vA3KKiLhceKomaVXkH9tA3Kx4FWshuNBH+mFJH35q8wSWnZpUE1WFsprasmmwnh3/VMZY+DZjH5Lu2UxGZdRU2hIMp5yvaSC66hlfbwrMia23EXG+CUFAv1n07LFbtbJV4lDCoQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(11063799006)(4143699003)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDIxOUhiWUptczNFdkJtc2VrR2hxejl4OHBBZGZKdEZVTVVsQ2JpMWZEQjZt?=
 =?utf-8?B?bnh6YTRKeGl6K0VIbE8zNHZrMlJDV2RXeXNZR0t0THMzNzB6Sm8zdzVaRWZJ?=
 =?utf-8?B?VlhWQ3dlaENYYytHR0wzT095Yzl3SFYzczU4bDJCRHhYeTc3T3BzTmRnL2or?=
 =?utf-8?B?Y01mUDF5dFNWTVpldG5QSk5tVVgzUnI3RytwZjdrU2VSeHVrcFUyM2xWSk1u?=
 =?utf-8?B?WTZuYXNNbUliZVZzOFRBV3gxZDBOelBiMXdVMlRJaUw3VU02NmM3SkpKdFN0?=
 =?utf-8?B?WmQ1aW5ESWt3TTRVR1J2UWJnMFVDcFRRZmxOTityUDVPYWwzSW1meWZ1bWpU?=
 =?utf-8?B?cXdxY3pock02bmNOWTBVdng4NHpqQjNqRVV1NlBTQ1lxZ283NkJTb2VqRXhC?=
 =?utf-8?B?MjFNMEpWKzhTeDd1aWRvRmhDMG44S2Y2Sm8wbGxha0UxaXNtM2xIdlAxS2xU?=
 =?utf-8?B?ZWNOL3VNVkc3clF6WWk4dFlZRVh4dGRML0JheUxpUFRRU1RLT1diVnl4dHBx?=
 =?utf-8?B?ckhybGJzSVFpd2lBU1N0dUZHZ2tMaHdzRHJCNjNOWkc0T1JxTjBTVFgvVW1p?=
 =?utf-8?B?QVVNZnVOWGpBMFpORXRPVUVwZ1dsdnJ4VE1RRDVLM2Fhb3FkcXZOZkpHakRD?=
 =?utf-8?B?TS9TZFRVZzh4TDU4NkxPRVVIVjBRcC9aYW5CM1V6LzZFSFk2RFNJcGxmemJl?=
 =?utf-8?B?bEVEVVhuL3NPVWdTT2hrSVU0K0tUMmY2a09pOHVTSytWRzFvd2V6WEZXWG9H?=
 =?utf-8?B?YS81NCtSMHloeUdtZWhyTnRBMmQ5K1c0TFFOcW5oVWU2STBLQVJ5RitYdlFo?=
 =?utf-8?B?OG8raXJPZXBhQk85SklCRU0wRlNrcFNLTWdrRFRtUUJyOHRYeW5hYnZ2WWd4?=
 =?utf-8?B?aFd4aGN1NXBjamp6Q25DUjFxRFZFbkxtbDZ1dkJjcmY0ZEdRMUVNQTRYZnBn?=
 =?utf-8?B?enUwMzA1REpOb0x6VkdxVU94NkE3Uk1NdXpiSXdVeHpPOVNRZTRuZlVJQW9U?=
 =?utf-8?B?Zm5sTWxTelpiRjdGc201Q3gvNDVpSkpKUTBNR1pwM1NaU0d0WEJuK2ZCaG5D?=
 =?utf-8?B?MTVzUERIbnA5NFNKSytzSGVRZ0Z0OE81TUlwejhLdDEvOFBlQS9MOEdNNW4w?=
 =?utf-8?B?N280QW0yMjlLUjUyUkxpN3d5UktuTG1QVW1GUnY5azJtSFJpcTRSRlJwZzVv?=
 =?utf-8?B?MDBmNUFpdTNYa01LcGhjUXN2UVJNRkNqTVB1bGFtUjl3OHlNTVlNNzQ0bEM1?=
 =?utf-8?B?dnlBd2t4dXIwdmNzbUQwekc3M0RYKzNxd1g3NFpsR3RBeEQzZzlPSVh4OGdJ?=
 =?utf-8?B?SC81a1dNazUzRHk0bElGWUZ6ajJXd3RxbGVNUm4zVE5obFUrSHhFVEdYc2xt?=
 =?utf-8?B?ZWdqL0laNDdZQW9kRytaRW9xT0tyaU1zczUvUzhueUw3aUVFK0dmL2Vjdlhu?=
 =?utf-8?B?bitOb1I5em41VXRoTlFrSDhjaDhuY3R3alNOY2RNUWRCWnF1SEhGekdiQlNp?=
 =?utf-8?B?a1hTTGRCVnFScnYzaWlNQ3JXUjNleG1iaXRPYXN0RWtOa3BIa3NzQk9qL1pL?=
 =?utf-8?B?QWYwbmNEZE1wcTBCd3N3VS9hak1KOVNVV1dBNVBiR2krb1N2aWFvVUt1U1NB?=
 =?utf-8?B?ZTMrNEh6QUZwM2ZMK3JrV1JKRlBKN2h0SHd5QXlwOXMxTXo0WllxUW1yTVFp?=
 =?utf-8?B?b0ZMVkI5bTJoYUZhbHlmRW9nVFY2bldYV3prM2FCbVE4UTNKbis3Y0wvK3BR?=
 =?utf-8?B?cm96U09yWTVhL2M3ajNaWnNtYitET3hqUm45SGMxNUY4cWR1TS9aMVpFRTdQ?=
 =?utf-8?B?UHFYQWwrWldGYlhyeVRTUzhrRVk5Nm16eXNhclVHcVBwdGd5OFI0NXpUTUQ2?=
 =?utf-8?B?VGZUTGJVbVBZYURUUlA2N3cySmhzRVZZVTltY2tqNTREdFZGNGFnTURUMUJz?=
 =?utf-8?B?T2ViYVFvMnNSK2NVYlNIOUYyTWxlMnNDeHVkN2V5YUJTUDVvUldwTzU1dDNG?=
 =?utf-8?B?b0M0UFRhb0Y4ZEw0cjIyWjUwUk5EMklKUTlBNkc4cUpaUUNnZ1JrN0RnVjlT?=
 =?utf-8?B?MG4vekQrd1BEY1lqS2pubWJXVS9YaGx5RzBJQ3Z2Z1hvM3JlcHVsVVN3SUhZ?=
 =?utf-8?B?Z3gvNTUybTdGbi9idU54TEZORk91RkxjblVEdzk5WTl4djZxbERJZUpJSm56?=
 =?utf-8?B?Y2x6c1Yvb2pvOG1hV1JDUEM0dmdDVzM0THcvYlBtMHRnUkRWK0VuRGZBNXMx?=
 =?utf-8?B?MVIra0p0OWY5Sk01NTBJK1czSytWZHRsU0tTYTgwdVhpUzd5OUw1YlRURTFj?=
 =?utf-8?B?RkQxY1NQdjZ3NmsrL2R1b2FwNVVUMHQzT3UxRlprcFRGVlBHS0N5VnNwYWVO?=
 =?utf-8?Q?oCYd1LiEpRxcRgGI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d53b776-0cb5-40a2-5c54-08defecc6cee
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 15:05:08.7485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /4VuCwrS16auEx1v4SOAUg/u5LW6cAlVuLTuprtKjsjo/LmXP69TluWGacptfCl3EQVNo4IcHSIGTrcWVPeg2ibh3TOa4YIykHoNBHUXTeQDh8wi44G3y2ahlIrEo7Wd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16965

SGkgR2VlcnQsDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjAsIDIwMjYgMTI6MTQgUE0NCj4gVG86IFRv
bW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiBDYzog
VG9tbWFzbyBNZXJjaWFpIDx0b21tLm1lcmNpYWlAZ21haWwuY29tPjsgbGludXgtcmVuZXNhcy0N
Cj4gc29jQHZnZXIua2VybmVsLm9yZzsgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPjsgTGlhbSBHaXJkd29vZA0KPiA8bGdpcmR3b29kQGdtYWlsLmNvbT47IE1hcmsgQnJvd24g
PGJyb29uaWVAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5vcmc+OyBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4g
PGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBtYWdudXMuZGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29t
PjsgS3VuaW5vcmkNCj4gTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29t
PjsgSm9obiBNYWRpZXUNCj4gPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPjsgbGludXgt
c291bmRAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHQt
YmluZGluZ3M6IHNvdW5kOiByZW5lc2FzLHI5YTA5ZzA0Ny1zb3VuZDogRHJvcA0KPiAjY2xvY2st
Y2VsbHMgZnJvbSByZXF1aXJlZA0KPiANCj4gSGkgVG9tbWFzbywNCj4gDQo+IE9uIFRodSwgMjAg
QXVnIDIwMjYgYXQgMTE6NTgsIFRvbW1hc28gTWVyY2lhaQ0KPiA8dG9tbWFzby5tZXJjaWFpLnhy
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBgI2Nsb2NrLWNlbGxzYCBkZWNsYXJlcyB0aGUg
bm9kZSBhcyBhIGNsb2NrIHByb3ZpZGVyIGZvciBBVURJT19DTEtPVVQsDQo+ID4gd2hpY2ggb25s
eSBtYWtlcyBzZW5zZSBvbiBib2FyZHMgdGhhdCByb3V0ZSB0aGF0IHBpbi4NCj4gPg0KPiA+IERy
b3AgaXQgZnJvbSB0aGUgcmVxdWlyZWQgbGlzdCBzbyB0aGF0IGJvYXJkcyB3aGljaCBkbyBub3Qg
d2lyZQ0KPiA+IEFVRElPX0NMS09VVCBjYW4gbGVhdmUgaXQgb3V0Lg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5j
b20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLQ0KPiA+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JlbmVzYXMscjlhMDlnMDQ3LXNv
dW5kLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvcmVuZXNhcyxyOWEwOWcwNDctc291bmQuDQo+ID4gKysrIHlhbWwNCj4gPiBAQCAtMjk4LDcg
KzI5OCw2IEBAIHJlcXVpcmVkOg0KPiA+ICAgIC0gcmVnDQo+ID4gICAgLSByZWctbmFtZXMNCj4g
PiAgICAtICIjc291bmQtZGFpLWNlbGxzIg0KPiA+IC0gIC0gIiNjbG9jay1jZWxscyINCj4gPiAg
ICAtIGNsb2Nrcw0KPiA+ICAgIC0gY2xvY2stbmFtZXMNCj4gPiAgICAtIHJlc2V0cw0KPiANCj4g
SSBkaXNhZ3JlZTogdGhpcyBpcyBhIHByb3BlcnR5IG9mIHRoZSBzb3VuZCBibG9jaywgbm90IG9m
IGJvYXJkIHdpcmluZy4NCg0KTWF5YmUgYmV0dGVyIHRvIGRyb3AgdGhpcyBwYXRjaC4NCk1vdmUg
I2Nsb2NrLWNlbGxzID0gPDA+OyBmcm9tIHI5YTA5ZzA0N2U1Ny1zbWFyYy5kdHMgdG8gcjlhMDln
MDQ3LmR0c2kNCkRyb3AgY2xvY2stZnJlcXVlbmN5ID0gPDExMjg5NjAwPjsgZnJvbSByOWEwOWcw
NDdlNTctc21hcmMuZHRzDQoNCldoYXQgZG8geW91IHRoaW5rPw0KDQpLaW5kIHJlZ2FyZHMsDQpU
b21tYXNvDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+
IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
