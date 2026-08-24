Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4407237104C;
	Mon, 24 Aug 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584897; cv=fail; b=CMizzSYVvSq2PNAETT65xlFlwBzBcW6pXyYyhJH36kK7XuKXxv6PDTl5Ly8gPNnIDmI6l01xiOndtAkl7waa34zubTtyCfkTGD8S5dl89+e5aSFNZ+bNUWGMh/K1voMbUrO4ySMiJCnRBqXBy3b2wz5VZkS61uZkRGjLrByYUaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584897; c=relaxed/simple;
	bh=9PYObcrxNMA36+ZUowHthRt9XtcC8RYTNQwi5bhfp6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZhXP6iOPmeP+gYRqFsuPUZDH9BNC7LUet+mZyE2JWuKQoUjbom6xc6NtJ2se4heYPk7ZpQL4wcdm68LLT0FRt2cCqknGpeelF39792Rw4PQeaXExwSeTva+yCsZOma0qGS7s0kiV7r5xxmAvJg0pYm9ISJc27gIhogfsBRhP44o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eXSFN1Mv; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eXSFN1Mv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/rSqELOp0GB71BXPNNs6REQ2y1om02YmT1ZV956GUHV8zqrrKhUv4NwpfuhN/RGJrhm4BY3Ujr5xgDPAEs7dDqNFDowGstl+NWROaPOFbDSbaSmI1zX34BLlBxTFZ0KNlF0y8mfry8Et7QEsoocfKu5tmuRrWtosDvOhan4X/1kjTvPdugPK2v662mCOVZkRG2o8nNrb5ITzKr/i1KVxipJmSvlYh/sIqknstBJWmgdlKA41qfdx35h0qPdjP6HsMFkfBBpF+S5nr9yfDojAvezbNYQCin9b2n2J2DJ3242dAw408EeyzG1Ive6FqcZN4M0C2Ih7Q7712XEhBZVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PYObcrxNMA36+ZUowHthRt9XtcC8RYTNQwi5bhfp6E=;
 b=igmbWFOp8KfJTglQCgyhsaIDnqbnnob7iSJyEDixIq7qzoHAc8wCq+5yPFB0TeeQkH66G8j7INVVq3T9wtSTlQTaYSLbjElS6UZAe6BdCUEVgdWd6IKBmu6YOXwpgDJezvG1DS2UPX82magl0UpQ5jPG09z0n906xGZLF2o059Q+cq4HHTd3dYtvqVRBmehJEoUeXNueaYj28ytIS0GlKX+wU6UZ1aCzzkAYeqQCO2gxd6bxHujpl4ACa5Zwbqmuo+eImaTv8Pn/m+yJbU9E/uDGi9rp1SKyYGy9I5bQv9amjcjLbJ7ORJgjmqGKXXyZ1klyYm3143ioGUPf5DnAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PYObcrxNMA36+ZUowHthRt9XtcC8RYTNQwi5bhfp6E=;
 b=eXSFN1MvcEpBdyT6Pnb0rhG8r/MUqcKoJ4GkgZFTrXQh8xd8TVhypSYgOYjRIaI2kSF2HVDNyScOD5a6bZ1ZwOnW+H7bjG5A0CTITtTz42x2NuMiVUtSM/VcIehzfMxCGbu9nQ1zLNdTgaI74JWDaIjPtftrC2cOgw5EyWWNlfY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12399.jpnprd01.prod.outlook.com (2603:1096:405:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:21:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 15:21:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
Thread-Topic: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
Thread-Index: AQHdLx38hQVWd9c51E2Q2d/3sJrkN7atTZMAgAAK/JA=
Date: Mon, 24 Aug 2026 15:21:32 +0000
Message-ID:
 <TY3PR01MB113466AB79803F83304829D4C86A02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
 <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdUUAcrUbYV+_CFp5sZ1gQtn5eHzswZPvfZs=-=FX44DVg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUUAcrUbYV+_CFp5sZ1gQtn5eHzswZPvfZs=-=FX44DVg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12399:EE_
x-ms-office365-filtering-correlation-id: dcde0a9d-1b5a-4f5c-22bd-08df01f360ee
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Ui6r70AroBxA8k0vdAVcn3B8BiDlPB5SAbGnjKs1lqYkcs3nBO/bLLKvqixSMRankrle/e/YjcV6b8N/E6ysSgqZT+K0FTQ6obZn0tjftNBDoocJpjOVuy+TEOHxL7aPAwfCgRj8xlZSf3lN5zniyW27LG973tRtBspIwxzlMJu2LFwe3pkllsT/wGq5CsuHjY0hBQMQKPYdn01P5v8PSf1s118irNAdYzJJdPeGTwYPm8X2ID0FFGRP7/txhp9bMk/gn12pTpwkYa/Mcu5ruQCz/1aq/umdEK5V8OZA6rTdGbXCxurcHICuuXczKAlrYC97SnyqUtCC8rFfZG7HwrfYWcQOOvKW0GYls1L2eJos5bpO7Iwth+L1uCtEVRMsOMd7oYVcxjqi9Gg7J7/MP8EOgxQFprvE2OQmm+PzWpsJ4/JwASEQTrQDV++X+HEgVinLwrG/2vkg5ltIEAbStXmC1saz6mPPoR0OIccpLZUhrOQjTJtHdG62FP7F4xPfbhZV2ge+NMECcA5XQaE2TgFQSQCli7sylAf/sJjNMB2dyYTfx2h07GYW+gpVTaPq1VGq79CyyhbbZnlujrzQW3njoL0NqM1ZQcM538/GMBgvS7H44pL8vcJCzGJtwPlzywfyhJMvyXGBuykNCDxivK0FTEwkFZUbWzBPr7fD2jgzyC20Q2+xaxwOE2SDGBd+0CkF/+L6DrjZYyOfWxHJX9k2ubqIY3X/mULWBvE1zl0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnBiaHNsbFZ1bEFTd2MvOWxTNG9ic1FGaTBiZXhnN1I1ekVaNlVORk52Mi90?=
 =?utf-8?B?VXBMTW80M1lYRUVzVlk2Ti9HT2xlTGhBbFBKTC9WNUNScXdlalU4V2FCbVMr?=
 =?utf-8?B?cHhsckxiWHRaKzEvWmJKYlYwZWdIU2xVd05wcVJDL0dsWTBveFRQMS9IaTNZ?=
 =?utf-8?B?YjVST1AzdmdPdzhONzFTV1JmTW4vTm4vV3lUL3V3VWlxVDliK0ZmclZMRUZx?=
 =?utf-8?B?QlJocHhPTTQ2V3lyUFJyUDUzSEdCV1liS0RVdlZDejhJNzlsL1lHYVVmNjNi?=
 =?utf-8?B?VFptZ3V0aGN3Z2YzOUE5V0RySkVmOXR1Yk5yZmF3RHBMK3g4cHpMbmdtdjRt?=
 =?utf-8?B?R2dyc0NMQzFMblpUUURwa1FHV0I4QTJHK0M3WE9UcUtuaWF1S3gydk5BTVdB?=
 =?utf-8?B?d3ZGbzY0eVZpWWJPTFpsYm5MTmpPZy9DNDBuaVJWazUzSG15cHIzZkJoLzdk?=
 =?utf-8?B?aXF6RG1GYzA0ZXdOVkZpQkNCRmE4MXd4NkR0SGxGK2g1aUhsclZMRUZ0NllH?=
 =?utf-8?B?VzhDVVdWYnhBYVFxaExsRVg4aVVoVDI4OVNUSCtxeG5yektndXhUblIvK25m?=
 =?utf-8?B?NVArVCtjRnVBZitDbUI1Mkp0bkgwSEllcXJYUEF6ZURBRmFBQ0ZPWjg5dGx1?=
 =?utf-8?B?TEtDYVBzcGo2YUMyV1F4c1Vqc3ZNRXFzb0Y0d2hoaCtZMUNBNmp6Vm5DZTZn?=
 =?utf-8?B?TW5QV0tqM1NmS2xsTG9qNUx2UW95WDFqanQrRC9QVmNhVGUyOFVPYTVyMG5l?=
 =?utf-8?B?WXUzOWtmejdOUURiY3U5V2RNVGdqQVFYVm9ROHFNOXpuVTBPaWxORWMzMUEv?=
 =?utf-8?B?bzVMQmN6YXo1UGNOSm04cGlONi9XbW54MG42NzFoMVNaRHF1ZnVialJZekVF?=
 =?utf-8?B?QmZtbXdCa0w2RTN5M0tWZWcySWNGWEgvWEZLMG50SWlBd3FING53V1Z2VEUz?=
 =?utf-8?B?a2NTRFZIZmtHK3Q5V1E0Q0dFaXFVNDFhTTJWNFI3STZBZ2VDSHFRSEt5ZEdp?=
 =?utf-8?B?VldsM3ZId0JlbDlnZUswOVh0Mk1ta1o4dEtTSEM3MmdBSnEwSndqTDJ2eXZW?=
 =?utf-8?B?eC9xYTZuclFMcGI0bXh5VzRiTFMwck01Vm9CR1M0RklCY1dMdm5BM1R2Qnl5?=
 =?utf-8?B?ZXFEVVRGeUI0NW5ibyt3c0JEanorWFNHSDNMdGNJaEd5UE0vRlBuQmtRTjZx?=
 =?utf-8?B?dndKRU5HMHZDb1F3UjJrMSt6Rm1ZT085a2E3VnJlSnZTejdmaW9ZdnNUbTk1?=
 =?utf-8?B?Vk4xYXY3WnlFR04zL04xb25mS3lsRkdLaURCK1pIMDQzUHFQYzU1eWtsbE9N?=
 =?utf-8?B?MmdwN0dyR2RIM1dJck9WMVQ2eGorZzk3cnlkdG1DZ2JqN2gwRG9kQnp2RGV0?=
 =?utf-8?B?dU1FeTFzOFpNejRQQUpnMzhxNnRleFBrMVZmMzRvR0Y5VTFaTmZ6OE5tR2tZ?=
 =?utf-8?B?VTN6c2xFbFRQcUJHQk54dXhNV2dxRUhTQ1JGaE0zUVFRcVBuMXgwS0t3TlBv?=
 =?utf-8?B?YUNjMlFFYzhCUDEvM2hNQVVVZEFtcnFtSWp4K3pyV2lFdVJXeUtNYndZYzV0?=
 =?utf-8?B?QTZ3MElxZHdxbUN1bmRhdVRsUXZYb2VvMWU2d3BQRGNleGxhaEwwQXM3bjR6?=
 =?utf-8?B?aVhpT1hTWWJ5ZkRNSVYvdnU2L0hKL1JodlAwaWg2aDZqU0N1Q3IrcjNkR3BD?=
 =?utf-8?B?bVY5Q0JrK2o3b3VJV1RoVlBKS0VWaTMwY2RzNUt0VDk1N2psS21ZOXNBa3Br?=
 =?utf-8?B?Q25zb0JqbXpzZ09XZGFXOTRxRkVoSnJuSVpWWWI1YythM0doVlZrRE44K0s0?=
 =?utf-8?B?c1pZQTZ5dUNlaUNSd1BuSUJ5S09zUHk0VGFLVmRBOHJ5VGo2NHI1eGpFMGVB?=
 =?utf-8?B?NisvWDZIdExSTXBDTUZzN2ZQb25OMGJVM3I2dSszOGR3V0xhbjZwSjJURXQ2?=
 =?utf-8?B?THZlK3F1cEtXWU5nNFY4dmRFc0xianJpNW5FVC9nQVM5TE94dVEyd1FXV2Q4?=
 =?utf-8?B?Tzh3SURyTysvVkMwU1RHVGFLVVJSM3hWemF3VDkvVFIzaXhjL0tNRkxMcVRU?=
 =?utf-8?B?WEtYTDRzS1FydS9mS0Z1TzdNRWhLZUZ2NlFtT2NZTkFnZWFBQXpLSzFJZGRx?=
 =?utf-8?B?M3FZTm5oeTc2ZmQzREJiMUdFZ3FhYTVNZzJwSlFWSHhFRzRWcWlpQ0JneFJk?=
 =?utf-8?B?eDcwdE1wT1BZZ296V2xNa24rMyt1NkowSmluaGVPWVQ0UnBQeWhaZVI1MHk4?=
 =?utf-8?B?Z3VncWtESDZIWjcxbnV2d2Q2YmEwbGh6L3pwTUpaUWdJMEIxZVZVVnFpdTd5?=
 =?utf-8?B?bjZhNFNqdHhYU1F1Mmg4SllJOFczWDl1UTgwc25yalFuUTlpU1Rydz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcde0a9d-1b5a-4f5c-22bd-08df01f360ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 15:21:32.4507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sBfNiCxDJ5vYkC5jFsCUfU8zNzwJA2G7fwSzpbDUmV92pwR02E5VSrhroFWe5Vy8RLqZf1mUltywcaIEQyfx6bZm+eOjY/zxFlsdvmjaMsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12399

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI0IEF1Z3VzdCAyMDI2IDE1OjM2DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMS8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOGcwNDY6IEFkZCBVU0IyLjAgcGxhY2Vo
b2xkZXIgbm9kZXMNCj4gDQo+IEhpIFRvbW1hc28sDQo+IA0KPiBPbiBUdWUsIDE4IEF1ZyAyMDI2
IGF0IDE2OjI5LCBUb21tYXNvIE1lcmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4gVGhlIFVTQjIuMCB3aXJpbmcgb24gdGhlIFJaIFNNQVJDIENhcnJp
ZXItSUkgYm9hcmQgaXMgdGhlIHNhbWUgZm9yIHRoZQ0KPiA+IFJaL0czRSBhbmQgUlovRzNMIFNv
TXMsIHNvIHRoZSBub2RlcyBiZWxvbmcgaW4gdGhlIHNoYXJlZA0KPiA+IHJlbmVzYXMtc21hcmMy
LmR0c2kuIEVuYWJsaW5nIHRoZW0gdGhlcmUgYnJlYWtzIHRoZSBSWi9HM0wgU01BUkMgRVZLDQo+
ID4gYnVpbGQsIGFzIHRoZSByOWEwOGcwNDYgKFJaL0czTCkgU29DIERUU0kgZGVzY3JpYmVzIG5l
aXRoZXIgdGhlIFVTQjIuMA0KPiA+IGhvc3QgKE9IQ0kvRUhDSSkgbm9yIGZ1bmN0aW9uIChIU1VT
QikgaW5zdGFuY2VzOg0KPiA+DQo+ID4gRXJyb3I6IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yZW5lc2FzLXNtYXJjMi5kdHNpOjk0LjEtNyBMYWJlbCBvcg0KPiA+IHBhdGggZWhjaTAgbm90
IGZvdW5kDQo+ID4gRXJyb3I6IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNt
YXJjMi5kdHNpOjk5LjEtNyBMYWJlbCBvcg0KPiA+IHBhdGggZWhjaTEgbm90IGZvdW5kDQo+ID4g
RXJyb3I6IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpOjEw
NC4xLTggTGFiZWwNCj4gPiBvciBwYXRoIGhzdXNiMCBub3QgZm91bmQNCj4gPiBFcnJvcjogYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3JlbmVzYXMtc21hcmMyLmR0c2k6MTE0LjEtNyBMYWJl
bA0KPiA+IG9yIHBhdGggb2hjaTAgbm90IGZvdW5kDQo+ID4gRXJyb3I6IGFyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpOjExOS4xLTcgTGFiZWwNCj4gPiBvciBw
YXRoIG9oY2kxIG5vdCBmb3VuZA0KPiA+DQo+ID4gQWRkIG1pbmltYWwgcGxhY2Vob2xkZXIgbm9k
ZXMgY2Fycnlpbmcgb25seSB0aGUgcmVnIHByb3BlcnR5Lg0KPiA+IFRoZSByZW1haW5pbmcgcHJv
cGVydGllcyB3aWxsIGJlIGZpbGxlZCBpbiBvbmNlIFVTQjIuMCBzdXBwb3J0IGZvcg0KPiA+IFJa
L0czTCBpcyBjb21wbGV0ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRvbW1hc28gTWVyY2lh
aSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ2LmR0c2kgfCAyNQ0KPiA+ICsrKysrKysr
KysrKysrKysrKysrKysNCj4gDQo+IEZUUiwgdGhpcyBjb25mbGljdHMgd2l0aCBCaWp1J3MgIltQ
QVRDSCB2NyA2LzldIGFybTY0OiBkdHM6IHJlbmVzYXM6DQo+IHI5YTA4ZzA0NjogQWRkIFVTQjIu
MCBob3N0L3BoeSBkZXZpY2Ugbm9kZXMiLiB3aGljaCBkb2VzIGFkZCB0aGUgcmVhbCBkZXZpY2Ug
bm9kZXMuDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvMjAyNjA4MTIxNDE5NDAu
MjQ2MjIzLTctYmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20NCg0KRm9yIFJaL0czRSBvbmx5IERU
IHBhdGNoZXMgYXJlIHBlbmRpbmcsIHdoZXJlYXMgZm9yIFJaL0czTCBVU0IgcmVzZXQvcmVndWxh
dG9yLw0KcG93ZXIgc2VxdWVuY2UgcGF0Y2hlcyBhcmUgcGVuZGluZyB0aGF0IGlzIHRoZSByZWFz
b24gVG9tbWFzbyBwb3N0ZWQgbGlrZSB0aGlzDQphcyBJIG1lbnRpb25lZCBoaW0sIEkgd2lsbCBy
ZWJhc2Ugb24gdG9wIG9mIGhpcyBwYXRjaCBzZXJpZXMuDQoNCkNoZWVycywNCkJpanUNCg==
