Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188732;
	b=lLNU24AlmdOtGHpBY6QT2DRtILjsSchoHBBWYfZC5nk5FQAaoMfKWGtWyyN4EXe3ByxF
	 L0L18k/RlMbgq3ZfRa+TJN4E98wdd6IZoxYxP5N+T9a/75r2XGYRAh9JdqpcHRrGBavHf
	 8oPj9VheujtjlqZXBmxH/20Lm7OV7MnNsVc06KjGUon1tFWjAhuD9PiQapOSfq2VZ5N8C
	 xSBMfQxkne5C0On6jSZtIG4lcDxzbmiiEHwT9JH5GqmA+hqTYqZagzl5Yino7nUYjrdy7
	 LfrNTBEHRTH3tgMCetBziMVm9Re45stdo+PT+JM72RcX8dPUAccQ/wqtkRuYK3lkhgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188732;
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
	bh=DUNedUZcxOMUf2LbQK4BfDLrCr4h54JOorxdcBCj3Fo=;
	b=KE/8AS/jHtY2KYpLlocAChNsFxsBFAC4UYObal6u5iT3gpw+XIc0b6pbRXWfFh1SYJmr
	 4po2tzU/u7gq224E12hun7p8j+S3POIH1ayP2CdDtKirkA7tLEObTYWPa3l7xa3Rk33g3
	 Y8tP612yjvijAyHg/n5BaZiEXDRONt8G3dBAmd067Pb78rNLn2rD/YmtGd2A/a370guhL
	 9kPxhGJpjQYZz9j6/SDa8N0CpJ93eRIDZvd0yHd+OAemA4RYFcDFic0AtgnHYfoZ82KGt
	 AKkVbpGWITVOwHvulVBLIBBVbcidKwHgsbEKeO+RY4gWktiEpvPN/fkd3R727MtFGig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=TvPZBCnN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.25
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA886606A320;
	Fri, 20 Nov 2026 15:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA886606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=TvPZBCnN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZS0HqzS/YtQk8eBy98pYdLdzoMq7ERGdMTQbVspyXhPQR6MtoA1blRgcX9ZMAK310NwbzlFCcTRXytsH31p7wYRcSC9MbqH4HRAGCGIHbF8a2No/rSTedPAlVpynkIEamCQFjjxHOEdzhhMS/jjNk1TlIsVE7k4RQO3At107ke+v3zHkETji6hkvRu/QXvpY/zmGhfxA5I3uxzauB5si8yWJvAgYcUmIQU05lwHfxP8y1ZarBSa4WUPnKMF4ewrA55/4JgcTiYpX1k0pd5/nZZwwOOmRgv2/Vu5YBl9kIaiVpYmZMBrkC4a7lXC3+C3Yv29gvJTF++qkFhTyD+j7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUNedUZcxOMUf2LbQK4BfDLrCr4h54JOorxdcBCj3Fo=;
 b=m1WsYLjz/gORVM2Mju7hNpmLQztxyoyqwGAC4il4J0oDoG0t/iO4PHbJJzroUzS9G2fLuQgXi1NFymu+ttOgCwMGUYL66Dbb3tPxuq243aRaxcr84SVbngOo3KRHOGFVC8zdjCCTvr276IhvCg0WXbtBnZXMOiiqZ799rq7reyz0ahyMdkJCZjLAsOS7N4QlFOK8tD5bb0oqLXAg3XVSLRh1kB09TC+J/j+ilQDzjx0EZKy4ZIy0waKyoAwq0uRXVloS6oKIsScq+0RBnFQhcPW9iLQ6nHQxuPlfQgUU8fyX3z5TILXxVGXxoBGY2rIIc08SX1NeFAK1//RRZ3EZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUNedUZcxOMUf2LbQK4BfDLrCr4h54JOorxdcBCj3Fo=;
 b=TvPZBCnN6DxfDlMQ1xNHB8PfdGyWwd+3Hkp41oN2Cvu9XiiofdbchkK8qmZUwk7ssnSSok0eDGeGe7/0CECXbvFQkkTqBbTWHysTO4tQ5QldLXbZ1xJGnxWQJwqWf/l56Hv2tJzibUQRe4/ADcxlbmpG6DDzHvh00+TQ1cdhdFQ=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by OS3PR01MB8399.jpnprd01.prod.outlook.com (2603:1096:604:192::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 15:32:09 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 15:32:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm"
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Thread-Index: AQHdcwbzdoF+tJfdNU6EwTi/iPmsXLc2/OYAgAAAozCAAAEJgIAAAFyw
Date: Fri, 20 Nov 2026 15:32:09 +0000
Message-ID:
 <TYYPR01MB6603D17A85F55C31ECC7581A86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
 <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
 <TYYPR01MB660300EF63BBCDA82272C45C86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
 <CAMuHMdX+Ny-0ehq=hCK--OM+5gzpf8+gNnbtHVr_Kxc9c5kYWQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX+Ny-0ehq=hCK--OM+5gzpf8+gNnbtHVr_Kxc9c5kYWQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|OS3PR01MB8399:EE_
x-ms-office365-filtering-correlation-id: a89b2ddd-d778-463f-ccd8-08df471b70ca
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|22082099003|18002099003|11063799006|4143699003|261026121527099003|56012099006|10067099003|261009223027099003|261021121427099003|261102123227099003|38070700021;
x-microsoft-antispam-message-info:
 j8h78xzN5GiyjSpoisFzW1l0rLdy5rYVhYbow7Kc0TE6TBlmbfV4nRb6oOvh0XQ/bseST81YCGpEHcxlu40ZFcR+ui1r55q+8YZGp9j3ip+cMCtrphlnk6KxCEb56n242Z+Iw1Ucay3/ClQa5UrDmLwmmwF2TLYZoHRhWwGS7Ij2eR232lp5DzgPZhk978AO0h/s4KVhtrEddfRm8v5G/sFwMsNeZ/+26sJlRj1MynWQF0uQdzn3aO+ItTR5Yy6ED2jByHnGT8xUw49ecpC6k4GQq8co207xFg9zlqJKgisfWE15vcjK3Yv05b9x9mEZbPsDeUm27PlafxKdsF9ayKb8RmDZ5BQ6xx+jF0uqH5PKprIiufCpfIpYFpkDPZVryB3OL6v0G3Npt2/wWwrZ2eh5APzDdKoZtJjwaDrgH25Sriq/C05uFjrJXCgqNAIpNB+axX3PDwQ6opD4fRJ+TSL8fAJXFNVko3k8fOqtmx6+ZwPdpTLh+rI3Fxl7ToEgGgbNoR8FuRg0n1ek1QgrQkgqGMZlwDS+e8gU3dFZ5L3gI3NQg+/X7q9VlK5nSTtGblBjVqhOMP6EV5vE9wtdn1q4r0b++EcvYYJLifWAOYXkn7Yik2tRGlIRhJJqieJwx2yXVLKH5xyz96jh7r1THFP0HjvdWwRmhm5EpyiP7Dqc9t2q/88eF7znRQDDsQtIyGCBWjIupShAkHgGP9lI7A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(261026121527099003)(56012099006)(10067099003)(261009223027099003)(261021121427099003)(261102123227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWh2UWJqMlhJcEZud3NqS1pGZmw4T3I1cGFGT0RvT1YxSTdhNDJ2S1dJcExW?=
 =?utf-8?B?cnNVbWplL1IzbjJ2a0xIV2crMWpjaU5kUFRjQVduQWhBS3ptenFBUVpHeDFI?=
 =?utf-8?B?R1crMmcxenJONWNTazFGUUpnR3RKR0t2cW9lWFgwVEkwK2lSZlowb3VkVWJa?=
 =?utf-8?B?Z21TTzYxUW5QMmJqNkx2ZXErWWh0SVQyOFRXQVozZUNOcExRK1k3ejF5eC9h?=
 =?utf-8?B?TzVrMUc1ZEtVTHR5b2tZY1AxRlR5elNkLzVsT2VaZ2lHM1dyOE4rQkhoYm16?=
 =?utf-8?B?N215UTRkczFsUmhMaTEyQmo4aWRQMEhuUEQzc3lXWU1OcGhRQjZyYSs0Z1Aw?=
 =?utf-8?B?QzhQUXJFaFVmWlh6eUdiQ3hsTWNXWmZ0WjFyYWJnY0h4VHlxZDA5WmFsL0Rl?=
 =?utf-8?B?RG9YdkxVQm85ZW9Fb3ZVMUMxVEpmT0gzbFViRWJEeXJUYUt5aFdvNkFXdmRU?=
 =?utf-8?B?cDBGcEZCS2psUnhzMURHMS8ySTVHZ3JQM3hYMEg2WE9qcjdCQWE0SzhyaUl6?=
 =?utf-8?B?aGtSR0t5NG4xdVNlM1UwTTYzQWhPVW03Y0ViUHlzMUc4clNlRjFHVzRXSmV5?=
 =?utf-8?B?dUhOVFV2aFBaWlJQbFQ4aitBSmw1UXlwdU8zbVlUYktheGZsMFNIdkJMYmhr?=
 =?utf-8?B?NlRhdDRrOUNxWjlIN21HWkVaVW1PNUFXS3lNd0J3M0laazhVU0tSZEU4eEZ5?=
 =?utf-8?B?OXJEd1RqT21KTTFtaVVJK1A1aUdJL2l6NmZnWmxtenJtV216U2RvTXVsd3Qv?=
 =?utf-8?B?Nlp0UjRRUjZNQTBJVnh1ZGdDZStRTktQdjlqSWJ2VjRYTW4vVHhGbUYva2x0?=
 =?utf-8?B?bkJuZUhXUXBTUVRQTWFyeWdiSzRpV0FrY2c2RmhETWxzZ2U1czdOOHZIUlk5?=
 =?utf-8?B?UjlZbGdHM2JIUjhJZHB5ZmQ5Ujl6MVFBYSs1cDJ6NHIyWkx4cVNjV1Q3Slpw?=
 =?utf-8?B?TUlWRlpCL1VnV29lNnR3UXkvZ2R1Z2ZBczBLYXFjQTFMSCtJOWxrVThMQ1Fy?=
 =?utf-8?B?R09yTHNOV1Y3ZDZsdVhkSHhpZE5GYXBkci80MVhXNUo3UUxrc3EzQ0xCT2cy?=
 =?utf-8?B?UE43ei96dkovWXM3VC9ScmpxNXhMUG93b3QwRTAwM0ZwL2FIRFp6c1VHdVZ5?=
 =?utf-8?B?cjVFcWFPYzF6WjFhaW9yWXo4ZTZWV2FJZjRidFMrVU8zOExYYjVxTVhDS3kz?=
 =?utf-8?B?ZmU4WXZxaWRVZkJFaHZEODA3VE9adWFFSi81YytGczFOK3hMMmdxV3VpMDMr?=
 =?utf-8?B?czIrU2VLcGhVcklVTDNLb2VrdFExUFJGdkorWDh5L3N2cE56bFJGMkJxa1p0?=
 =?utf-8?B?TVVORHlZSGRVdzZOZDJrb2crbFBXQmZXVGlBajBHb055dzBlVXR2LzNrWmVQ?=
 =?utf-8?B?WERGZCtaOTRVbUc0MzB4bFR0RHF0aGk2cDhMNnJ3RjdGN045Z0VOK0Z1Zyty?=
 =?utf-8?B?REVTTDJDd0pyanVYTHJiT3lTOE55NjFZTllFaFF1UmdPUDZ0M0l2dGFIa2du?=
 =?utf-8?B?MlhkcGVCNWl0aHFQZ2luQkV5VXhZdHlqQWUweGxNTFpFREF3YlBhWXZ5T1Bh?=
 =?utf-8?B?Y2FKTmZkenpzR0Z3cXlGZXRpNkFKQzNvNldCUEVsU1B4dG81b0tkS2ZCbkpq?=
 =?utf-8?B?VUl3cW1EUUFJcUQ0ZVhyRzdrelorbE52R3FpUnNvancvY1NOV3FWNHB1WjZL?=
 =?utf-8?B?eTRyU2s5UkFqcHAweUkrWWdGNmpCTkRmcUJTNytla2N6K1RONEtnTnh6aE82?=
 =?utf-8?B?SXZONVNWa1kyNnduS1ZvZEVmL0RrVkl0QkhzOTh3MTU3SHVSOW1uV2xWM3FF?=
 =?utf-8?B?dGlZOW5NbWFUUmxiOEhaQTJxTHZ4YmpsY1lTWDNtN2tIVDNheWxic3h3MUZY?=
 =?utf-8?B?RG1RVTlqQ2lsSHdNTm1tV1NpVUcyS1ROOFFvdDdFeUJSeUhkd0lQUm03NW5S?=
 =?utf-8?B?OURvU0tKT0FnUlk0ZUJDaUJqdENNZ0hhcEQ4T2xoQmZteVBqdkJhWFAzUTNp?=
 =?utf-8?B?WnhFYWNoUGVtaW1tNVFGWmpkZ05OQ09LdlFyaGptYXpRVEdPcUg1cnBqdzQw?=
 =?utf-8?B?R1V3U2F1WW1CeDIycWs1RHRiT3RxTjc0aG15cUhmVnVPWlJGN3NDK2dJVEhm?=
 =?utf-8?B?SmxmbmRZZjczK29RRk1yc1ZEa0pTYmNnVGFFR3RNT1FBNUo5bS9vVHJxOERR?=
 =?utf-8?B?aHJLRkthWjdhcjQ4UnpMOW5yaEE3V1YzNVdjQ0Z6c1JIQWpIZDZHdXdZV1cz?=
 =?utf-8?B?N2JBeWRJaisxampVUnlzakErd1JvVUg1cnhSY0R5NWRva1FGek0vc0JEbW5H?=
 =?utf-8?B?WWF5SDh4dTBramRWZVIzdGEwZmd3bXlPSVBZQkFqVkExd3phNTc0UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a89b2ddd-d778-463f-ccd8-08df471b70ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 15:32:09.0821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X2NlvWR8TJY29skr1AbEaqjWIg5qjQ24S/1syYsv/jz8wGqI9Tn26r9K8RXQa4In5M/nwIRaP8+zgFmvHO0+z4BoXfSqk7zvSgrTXxuDvVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8399

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjAgTm92ZW1iZXIg
MjAyNiAxMzoyMw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gYXJtNjQ6IGR0czogcmVuZXNh
czogcnpnM2wtc21hcmMtc29tOiBFbmFibGUgU0RISTINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBP
biBGcmksIDIwIE5vdiAyMDI2IGF0IDE0OjIyLCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gT24gVGh1LCAxMiBOb3YgMjAyNg0KPiA+ID4gYXQgMTk6NDgsIEJpanUg
RGFzIDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IEVuYWJsZSBT
REhJMiBvbiB0aGUgUlovRzNMIFNNQVJDIEVWSyBwbGF0Zm9ybSB1c2luZyB0aGUgaW50ZXJuYWwN
Cj4gPiA+ID4gdm9sdGFnZSByZWd1bGF0b3IgZm9yIHZvbHRhZ2Ugc3dpdGNoaW5nLiBTREhJMiBz
aWduYWxzIGFyZSBtdXhlZA0KPiA+ID4gPiB3aXRoIEkyUzA7IHRoZSBzZWxlY3Rpb24gaXMgY29u
dHJvbGxlZCBieSB0aGUgU1dfU0QyX0VOIG1hY3JvIGluDQo+ID4gPiA+IHRoZSBib2FyZCBEVFMs
IHdoaWNoIG11c3QgbWF0Y2ggdGhlIHBvc2l0aW9uIG9mIHN3aXRjaCBTWVMuNCBvbg0KPiA+ID4g
PiB0aGUgU29NLiBCeSBkZWZhdWx0LCBJMlMwIGlzIGVuYWJsZWQuDQo+ID4gPiA+DQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+DQo+ID4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4gPiA+DQo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yemczbC1zbWFyYy1zb20uZHRzaQ0KPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcnpnM2wtc21hcmMtc29tLmR0c2kNCj4gPiA+ID4gQEAgLTQyLDYgKzQyLDcgQEAg
YWxpYXNlcyB7DQo+ID4gPiA+ICAgICAgICAgICAgICAgICBldGhlcm5ldDEgPSAmZXRoMTsNCj4g
PiA+ID4gICAgICAgICAgICAgICAgIGkyYzAgPSAmaTJjMDsNCj4gPiA+ID4gICAgICAgICAgICAg
ICAgIG1tYzAgPSAmc2RoaTA7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBtbWMyID0gJnNkaGky
Ow0KPiA+ID4gPiAgICAgICAgIH07DQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgICAgbWVtb3J5QDQ4
MDAwMDAwIHsNCj4gPiA+ID4gQEAgLTM1NSw2ICszNTYsNzQgQEAgc2QwLWRhdGEgew0KPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1zb3VyY2UgPSA8MTgwMD47DQo+ID4gPiA+
ICAgICAgICAgICAgICAgICB9Ow0KPiA+ID4gPiAgICAgICAgIH07DQo+ID4gPiA+ICsNCj4gPiA+
ID4gKyAgICAgICBzZGhpMl9waW5zOiBzZDIgew0KPiA+ID4NCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIHNkMi1wd2VuIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0g
PFJaRzNMX1BPUlRfUElOTVVYKEssIDIsIDEpPjsgLyogU0QyX1BXRU4gKi8NCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgIH07DQo+ID4gPiA+ICsgICAgICAgfTsNCj4gPiA+DQo+ID4gPiBKdXN0IHdv
bmRlcmluZzogd2h5IGRvIHlvdSB1c2UgdGhlIGludGVybmFsIHZvbHRhZ2UgcmVndWxhdG9yIGZv
ciBTRDIgIGFuZCBHUElPIGhvZ3MgZm9yIFNEMCBhbmQNCj4gU0QxPw0KPiA+DQo+ID4gSnVzdCB0
byBnaXZlIGFuIGV4YW1wbGUgZm9yIHRoZSBjdXN0b21lciB1c2FnZS4gRWl0aGVyIHVzZSBHUElP
IG9yDQo+ID4gaW50ZXJuYWwgcmVndWxhdG9yIGJvdGggYXJlIHN1cHBvcnRlZCBpbiBkcml2ZXIu
DQo+IA0KPiBPSy4gUGxlYXNlIGNsYXJpZnkgaW4gYSBjb21tZW50Lg0KPiANCg0KSSB3aWxsIGFk
ZCB0aGlzIGNvbW1lbnQgaW4gYm9hcmQgZHRzIGZpbGUgb24gdGhlIHRvcCB0byBjb3ZlciBhbGwg
U0QgaW50ZXJmYWNlczoNCg0KLyoNCiAqIFRoZSBTREhJIHBvd2VyIHNpZ25hbCBjYW4gYmUgY29u
dHJvbGxlZCBlaXRoZXIgYnkgZ3BpbyBob2cgb3IgaW50ZXJuYWwgcmVndWxhdG9yLCBzbyBhDQog
KiBjdXN0b21lciBkZXNpZ24gY2FuIHVzZSB3aGljaGV2ZXIgbWF0Y2hlcyBpdHMgaGFyZHdhcmU6
DQogKiAgLSBTRDAgYW5kIFNEMSB1c2UgR1BJTyBob2dzIHRvIGNvbnRyb2wgdGhlIHZvbHRhZ2Ut
c2VsZWN0L3Bvd2VyDQogKiAgICBzaWduYWwgb24gdGhlIGJvYXJkLg0KICogIC0gU0QyIHVzZXMg
dGhlIFNvQydzIGludGVybmFsIHZvbHRhZ2UgcmVndWxhdG9yLg0KICoNCiAqIFRoZSBtaXhlZCB1
c2FnZSBpcyBvbmx5IG1lYW50IHRvIGRlbW9uc3RyYXRlIGJvdGggb3B0aW9ucy4gSXQgaXMgbm90
IGENCiAqIGhhcmR3YXJlIHJlcXVpcmVtZW50IG9mIHRoaXMgYm9hcmQuDQogKi8NCg0KQ2hlZXJz
LA0KQmlqdQ0KDQo=
