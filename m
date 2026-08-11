Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB0400967;
	Tue, 11 Aug 2026 07:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432513; cv=fail; b=iQhWatF1x6U406ztU1WzntCl88NxmWQTtKWzFGYNJ23oN4zh/Ff/dhmSmAEs+ELJBbBqnoRaV7YdWfA1lZjkxz81wO6MfE3FjblosfEzP9gk/eFfJlU2++e2N9WqQARv1Brk3xF0m5RxMG3pVwrdXQCmTAVrinAYsRjfrxXpnC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432513; c=relaxed/simple;
	bh=qdkp/xFq2zhNvOPOG7dJWh5ins9PTpl2QdK1VHQ3nks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mqry1/3t8lF3/ghaFZI6WZf28o9FQHyz+7QSRmFbl8BNvIRoG+EHCrymYN8zrQxs1dLPlW/BTVdqQehERhvxef6v4wPSFYFdcLNwY32jx+csxb75+Dp7MIKK0MyPHb5iU8DrmNSMoqCMvp9rNqI0CA2/qtmnun44rDsk4OGBHoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZcclpUGC; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZcclpUGC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+yZrQgTyN/IUqYFXHluQZnH0akWSXKTROc7NkKIy81MQ/phmsZ1mmpx3X/cUVKut9bZfHrF1vCmOh9CssdcDaWLHhg+J/LzBT0UBEn0+hHFbR+jlwcVh3U7h7AYQf5v7cHuexlWcCvq1Ujc4wOIsPnilm6WI58C8zg7zo/+ZxuZEw+EZu2u2gSUsdIvIQGsV8YWdH+vOyBqbuJvoB7IyEhwacr7yqlYhNAvwoexZHgO1k/805hQrTQiV7z29o6BeIn0f3VZzmuoBlAran1oEjoQWI1fA0OjMTzeTc7Uz06INbDC491uryKuGqZvwkDpci23Q5f7rtVPBMqgL8lEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdkp/xFq2zhNvOPOG7dJWh5ins9PTpl2QdK1VHQ3nks=;
 b=gU/cQHnJAAoUJ7g8819YsuUZlSGnZh7rhMKGNq1m7cpwQCoPT5AgFhf6Wwy6WLyR3/gJjkqJBE88EAn6pc27dm/NiVE+LgWLTQZ1NyhOI9Kbo1gi7qopuPLmlboKJp+pjMXznwOJap9NyjHNLSDrx2KamlO+9szb3/HZGo/9bSETiQqJvoGaxMnMEeJMaBnBz3bp+p92SuXXZqkOdJFra2URIuwCnh99uCA0IsxItbgUfodTrQSDLc4tynydhW0cA7kcYsTRT0KshuKmkM7aTUgiGmiLyXtDQc3GP3rPyUA8fZefzJvVx0KuaweIKaeyRZr581Fi1rTnP8+ihnkOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdkp/xFq2zhNvOPOG7dJWh5ins9PTpl2QdK1VHQ3nks=;
 b=ZcclpUGCNFTpQgWwIuUalszgAhQBC/RsDT+09LvOGmTWoNUCEAOQJ+FAlTj7utz3auPOqEW+84cmt/KrgD8fiNTwDzvAIeeoo4Gj0I7YDuAiFMEPXAbKn6dk5o34vLT6+7eodNZaSWZCeiwgkC4TYNei1aaVdUB7/sZ47zf7oco=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14986.jpnprd01.prod.outlook.com (2603:1096:604:39b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 07:15:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 07:15:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "biju.das.au"
	<biju.das.au@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Mark Brown <broonie@kernel.org>, "magnus.damm"
	<magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 04/10] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Topic: [PATCH v6 04/10] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Index: AQHdJY2ItPbY6FlPIEO0EWMwL7FQ9raYcMCAgAAGImA=
Date: Tue, 11 Aug 2026 07:15:01 +0000
Message-ID:
 <TY3PR01MB113460B06D19C3DC90A73A3F586DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
 <20260806102236.149159-5-biju.das.jz@bp.renesas.com>
 <20260811-cuddly-hypnotic-skylark-17daea@quoll>
In-Reply-To: <20260811-cuddly-hypnotic-skylark-17daea@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14986:EE_
x-ms-office365-filtering-correlation-id: bba6064f-36fd-4b94-de5c-08def778422e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 rSqv9su6OHgXAlgeBWlYwVbMBKzLg4UDK5NGnwCd71NZhd/mAWXwG0DsNSoaRx3QleNiAsSGMjKfZgY3xS/oJWiP3P473e8aVoAz8Kt2IwQjI3K6CHawFrYFLV7aFLzZ+H6M6YXV6zvwxdLqUrhNy1to7ONZomrZXdlZLWWe9iQkahlo/LJ3tHH6X6ysgun6yBqPT3Q2l7vRuI+077+cPVuZRypr2ldRQ66LaATODY/4vOEl6er4dTGmdaPp7nqDEAUPPcgYegzXd3rfP6yGVjvL1aKZRk49rmyM4Xi5TK+1ORVQV4KY+mC2JTDcMgn02+8Ym/24hDwGOUYXscUrfDtJfMGD60LhbEqaGmtA4R4kyE6r28wgcja4jROUe19PT5k6BZ54Y85ntda+KgypCRBMSVrkjHK6z9dMVKOkunzMLT1Dzovh+kKDKosx7frXxp/ozG9NfN2bKPmElwle1pODc9xmZIgRZ22I3AukvkD/r/jc7PRpmWJL5VnViiX+MmUSEuGoFyegCq53B1UHm+UYJQUmPSdv/jo1SjGh/CuzanrqHyuhVKnbewwp74IWxTKsR2n1GjEPiFmx69fuDQoSr5Hh5JFd8I0ZV/+nOua9ZQ9TrDj6oaI3WRmL6DPCpwEW07ZzmveDA1gf6uziFi3j7Z1lb036O/We57IfUQh/LpQLYp3MpLEUp1IcQ3Qs8xxS/YVDHMpvtGsMEbzvKOEDriBghWJgh9cj+POqpWA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N3lQb3RFRURtbnlGSHkwL0NKaC9ZSVR2MjJxQzlZMStNUW1Td2NQYm9NQWFk?=
 =?utf-8?B?UEVrTHppejNJVjZzZWFwVVlid1BBdmtKcTM0Y3hFUHlZWHkzL3d2YnJZV1JY?=
 =?utf-8?B?SXBhWE5kZ1FJVW1VQitGbWRlZEV0dkpPMnJDT25IcWVHTWxiVlRvRDl2b0VG?=
 =?utf-8?B?VkRZOTlmcENkQnhBdThtbG0wNHIvalduaytYblptclltTkd5My80dXJiOHhs?=
 =?utf-8?B?TnpOQnFRaERNblhvVGx3STlmZkhSRE1mM0FxRTFiUUVYeTJHeEZKTE1XbEhQ?=
 =?utf-8?B?Q3A5aGFHd3c4bW5GeGNOVExUUGxTblJKNzBVcVJMRUdzVGRKZVlEdUluQWth?=
 =?utf-8?B?QnZvM0Npdlgvb0RLR210cXdPTzA3Mm1FTmVTSDdQdlpwY0pubG0vTnRJdDhQ?=
 =?utf-8?B?N09EV0toUmEwaXJnQUh4ZmdpcERXRXdFQ0Q3ZDVwam1iMmdNV29ZdkdpaWVy?=
 =?utf-8?B?dzd6Z1I2dllsLy93eGxXTndrbkpkdkd1RTFQMUtscDFYY2V6SHJadEZCeDht?=
 =?utf-8?B?ekFpRVk1bElHbFc2SnpQY3FISzNIMTZyVlZmcnE0WmlZZW9lTmY1L0lRV1pu?=
 =?utf-8?B?RjJSRXBNRkQzb3RBc3p6cEE4T1dkK25rRWZtTkxNU295R1JlQ0phZlEvNzQv?=
 =?utf-8?B?Rkp0ZmhiejZOZ3l1dEdMdEplZVQybThseENySXZmU0VJUkVTQWVQSTVKRUpj?=
 =?utf-8?B?WURCd3E5UDFhbTcxdWc3d3pkYXVVdTJIM3ZWVk1QeFRiUGFBN0ZIcmRnN1dD?=
 =?utf-8?B?dDMrSStXd0JFdGJVZG9XMG9LSktvTUNwc1A4ZDA0UGR1Um43MHhCMy8vKzhM?=
 =?utf-8?B?U2JqcmMrQVZwUVppY3UwYjNGRWtIVTc2bVJvSEdIZ0luajU4c2FLMEVTUzE4?=
 =?utf-8?B?b0Q0THllR2tnQnkxckNuK25BOGsyYWVpcnZzbVB4enFjNjR5d2hFYjVrL201?=
 =?utf-8?B?SmNxZ2lWNjBZN1BJamNSM21Kak1EMGIwS0l4bTVKV2VabVhVOGd3K3Z2eERX?=
 =?utf-8?B?YmREQThmblJ4UUdVdlh0REQ4dW0xeUF5TlRPR1dnTEYyeW81NmJoenN2aEFk?=
 =?utf-8?B?TzNqVXdFTCtCY2RORTcxV0ZyeGQvU2xKV2VxZDJkOXdmOEJKZlNscm4zRWZq?=
 =?utf-8?B?NVdrcExIYzRHWm91OVVWd1JpazY5dWMvNk81K2NvdFZJME5JcWdBRzhYdkQw?=
 =?utf-8?B?N2NnQ3BjV0h5dWJGbGhEVXkrQlMzblJuaGMzUnhFQ3pKN2s4RHdnQUVsTU9O?=
 =?utf-8?B?SmRsU3IzWVhyR1JkbEVPMGdIdXl3M3RuOW4vRG1ZQVFXQWV3bWNZTHRZazJx?=
 =?utf-8?B?QmEyN2hXVjNMVUVreVZhYkl6Z3Q2MUc0UWJuNkt0MUNFbW9SVnhIUlIrUXR2?=
 =?utf-8?B?R08rcGRTWFBxY0pMak44TWw1WWN5bFRjbUJkSHhtSkw1dVJoQk1yMUZoeitv?=
 =?utf-8?B?dlR4dkxWU0o1VG8wTm52U1N1TUZHNytHRzVrSEs1bHhqMkg2WEZhdEdvOGty?=
 =?utf-8?B?SVhVWDR0TS9uSjZSR3dVckIyYVBFSkxIR28yY0JicldjT3FHbGdOUzVJRXBO?=
 =?utf-8?B?SFlLcHJIaXRKQm8zbmdTbkwzekhHYktqR21OdDNOK2RQRzc5bFJON3ZPYWEx?=
 =?utf-8?B?VC9vdUZlNU5ZR1Z4aEdMSzcxejd1b3psZDNrbWxHRU1pU3QzZTR0RUx4MEp6?=
 =?utf-8?B?dnQwSTZNaGdOZVVFeURZTmhhdEhlajU4VUZTR1VrOXVYMW9Md1lmWUtWUlk4?=
 =?utf-8?B?OWNDNW5RTXhLUnJRRUEzTEFGSlhpbm96bmJRQ29xT0NpQkNjM0VraFlDTXJB?=
 =?utf-8?B?aHR2a2lXM0lLQUdSdWx2U2tOazluY0p2QzlNYWVLVm5MdUpSNTZwZlA0ZSty?=
 =?utf-8?B?VCt6OFN4THE4b3prTmQvOGlMTnhzQ3dETjBpQlBTcW9kcFNWZEdveVZ4TUho?=
 =?utf-8?B?WUMzZVNMcThSMXdoMUFOZnRZemVzVUF4OUFKN2Z5TjVuYlh5L3Fob0k5b3lF?=
 =?utf-8?B?Y25GbGxuRjB1TE9ubzQ5MWgrVjViWVBRZGkxcUpvMTdJY2pwOE1USThIVjZZ?=
 =?utf-8?B?TzEvOWhTOWpUeVBrbkZnYnVaZW1wN05ubmMwRE5IaDhKT00randNVTNiVStE?=
 =?utf-8?B?MmExVzdibnhNSE5DUjF5ZXNvNGlhUFIxWThPL256S01jclJOS2tYSlJveWJP?=
 =?utf-8?B?cHZ2KzRYZFNDL3JkT3kvOXZnNFJZdmxOU2dCYnI5bXJENldHdG92MzE1LytC?=
 =?utf-8?B?bXUwZkViK2ovN0Z6VFlXZStzc3FkclUwQVpGRVlGOXZwN0g5S3VaeDBJTEhj?=
 =?utf-8?B?bnJFdmpzVTh0Tk9JbDR0UXFnV1BXcGJRNG1iUXkvM3d1NFo1T2pBQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bba6064f-36fd-4b94-de5c-08def778422e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 07:15:01.1224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 39RvVFOdo4fhi3ulhNVGpvIdYbZBea6ePptZHWwHZybM2U7S23UrWyDh/3CrJrSWBpPyoGVnv2hSq8FzvN7luWBpOGMwLpTEntXTVcYoi9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14986

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAxMSBBdWd1c3QgMjAyNiAwNzo1Mg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY2IDA0LzEwXSByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBSWi9H
M0wgc3VwcG9ydA0KPiANCj4gT24gVGh1LCBBdWcgMDYsIDIwMjYgYXQgMTE6MjI6MjNBTSArMDEw
MCwgQmlqdSB3cm90ZToNCj4gPiAgCXN0cnVjdCByZWdfZmllbGQgZmllbGQ7DQo+ID4gIAlzdHJ1
Y3QgcmVnbWFwICpyZWdtYXA7DQo+ID4gQEAgLTE4Myw3ICsyMDAsNDMgQEAgc3RhdGljIGludCBy
emcybF91c2JwaHlfY3RybF9wd3JyZHlfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gIAlp
ZiAocmV0KQ0KPiA+ICAJCXJldHVybiByZXQ7DQo+ID4NCj4gPiAtCXJldHVybiBkZXZtX2FkZF9h
Y3Rpb25fb3JfcmVzZXQoZGV2LCByemcybF91c2JwaHlfY3RybF9wd3JyZHlfb2ZmLCBwcml2LT5w
d3JyZHkpOw0KPiA+ICsJcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIHJ6ZzJs
X3VzYnBoeV9jdHJsX3B3cnJkeV9vZmYsDQo+ID4gK3ByaXYpOyB9DQo+ID4gKw0KPiA+ICtzdGF0
aWMgaW50IHJ6ZzJsX3VzYnBoeV9jdHJsX3B3cnJkeV9wb3dlcnNlcV9pbml0KHN0cnVjdCBkZXZp
Y2UgKmRldiwNCj4gPiArCQkJCQkJICBzdHJ1Y3QgcnpnMmxfdXNicGh5X2N0cmxfcHJpdiAqcHJp
dikgew0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlwcml2LT5wd3JzZXEgPSBkZXZtX3B3
cnNlcV9nZXQoZGV2LCAidXNiLXB3cnJkeSIpOw0KPiANCj4gYGdpdCBncmVwIHVzYi1wd3JyZHlg
IGdhdmUgbWUgemVybyByZXN1bHRzLCBzbyBob3cgaXMgdGhpcyBzdXBwb3NlZCB0byB3b3JrIGlm
IHRoZSBuYW1lIGRvZXMgbm90IGV4aXN0Pw0KDQoNCllvdSBhcmUgY29ycmVjdCAndXNiLXB3cnJk
eScgc3VwcG9ydCBpcyBub3QgbWFpbmxpbmVkLiBJdCBpcyB1bmRlciByZXZpZXcgWzFdDQoNClRo
aXMgcGF0aCBpcyBvbmx5IGF2YWlsYWJsZSBmb3IgUlovRzNMIFNvQyBhbmQgdGhlIGRyaXZlciBw
cm9iZSB3aWxsIGZhaWwgd2l0aG91dCBbMV0NCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI2MDcyOTA5MzExMi45ODMyNC0zLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0K
DQpDaGVlcnMsDQpCaWp1DQo=
