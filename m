Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE313D564A;
	Mon, 27 Jul 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148903; cv=fail; b=sQKDaWAJNXcrn16rH8r5zce1alkZJAXokG8ptCt1QDmersqD1/RTO8ngRaBzmlMkmMSat55lqikaKGhCtrIFQJViMsO655bRFShCokZp0TKphwHe8dcRNzW7Sy7xB1xTnRDLEyhTL374x8aXc6sgIkAS4pVafFo2lUTmb9yLXBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148903; c=relaxed/simple;
	bh=rBkHaKTeR3KFWvzZZynLqy+nXEc146azo1qG91nPkdo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fDrrKUw9TdzkbiFCA8GQ8eGXDHGvkyeiA3YXPMKh39yEaQM++WS6zAgyqabzF7Vx1d5Hf3/rtHDMrF6i8d62b3oALlaBEjB78HH7S70hjHQ1IgePs6Y3vyHOljJQBi5F0T0A+e5wLVS27VkwRKFBiYy4+8gBUgrywvKkBtHGDJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DRD4MUqw; arc=fail smtp.client-ip=52.101.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DRD4MUqw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaGhYjbV6BOMDZicaA5twroLp9mpst0Uo7a1IxHn0sSg62nkiU8VI5/3yxMHOyygNp3/74mOD77tNvPlzMgdP4bgvDYLZ8nUhbtGwh2Y0StnYfx8E+OU0XODJvzpJR2AE9ZdpnWFdC9Na4lvPoNaITwFJ9GRABHepY7/ngzPUmE08t8AY5OfCh3AcxRLFxFksr7q9AmyivvFE2XJUZ2/OPBKH7Gj4TLpy6OrrLr46zB0WWEZjdtqTj0pCSMnufnhxdthmc0DQ39y3BUkrYRRcSb/PQkWQg5GoOEKLMdkTu+9vO9MjasqXT0k0tCDfo9W3v9W18t8lZ4W25a8B8hUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBkHaKTeR3KFWvzZZynLqy+nXEc146azo1qG91nPkdo=;
 b=UYb62Ot/Fzus9MS/YPxVLcTVCh0M+E7pgBcc1qKg5c6cuUoAs7UeM7lzAK/0+Ii6ksTrtjkB3SObPdcZ+cZ+KdlVhAoMNMrRHnsljBJX2h7oHcvi0ojTsSq3KyYn5FTs0TMPxtBJgiqFgzP8XR+X2e58xOkVQYdwWF4es2qp6Rc+7xgyj/9IclqU61ZQu/yDzojKyIqvemmhAIgthtp2MF6NfI7M+Vv59riuELUURidZVSJPEq4Wd9V/XEd0EoGBw8FmsOrjqPooXAPTSbs+iKLYJpy8v40umZDR3MRwe56qqQ81LGWJzfagq/onr5FMh4sYnrmoR6BeVmfqbZR9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBkHaKTeR3KFWvzZZynLqy+nXEc146azo1qG91nPkdo=;
 b=DRD4MUqwCWDhP9MX2+q4fFuVCKs9xD/vgES53bWPGjujlSFKPVIVvzQalAF3/tegRjWUD3nOrlRKJHidU4nv7kQdsLI2TlGIm5iAWj3O9r21DcyvpFvmx9mnTj5/tH9BbVvNaaPpmcmbloTR8ekrBwD6bvZ4Mf2bgkOKWhCbrqA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB7283.jpnprd01.prod.outlook.com (2603:1096:400:e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 10:41:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:41:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, biju.das.au
	<biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <brgl@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/3] soc: renesas: rz-sysc: Register auxiliary device for
 PWRRDY power sequencer
Thread-Topic: [PATCH 1/3] soc: renesas: rz-sysc: Register auxiliary device for
 PWRRDY power sequencer
Thread-Index: AQHdHDH3XzTOXlMHa0WRlXyheheHY7aBAtkAgAAtYFA=
Date: Mon, 27 Jul 2026 10:41:35 +0000
Message-ID:
 <TY3PR01MB11346AC79033CC33D30245B4F86CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260725123433.162348-1-biju.das.jz@bp.renesas.com>
	 <20260725123433.162348-2-biju.das.jz@bp.renesas.com>
 <4f8564aad166a3e64dab2caa550938b6c5ec8038.camel@pengutronix.de>
In-Reply-To: <4f8564aad166a3e64dab2caa550938b6c5ec8038.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB7283:EE_
x-ms-office365-filtering-correlation-id: 255c224f-ec6f-443b-474a-08deebcba195
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|4143699003|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 91UGoRp0dQxs/acyJm8+7AlosG9WbN1pACc9KaSQW/FZWSFmGF/Qu4B5J9TU/jnu7Wlrf5EFFH/4oJ6yMDqgte5t+pp+Ea4XCFFB2uFEE2dJJXkSjrAikSg4c2bIatZMlznonlvwUKKOtVHK58DQ3c/YzIvKAPjJO1osmS/5btmL0veVFxfU0r1C1gnRWfs378fqehUPIzt6GHxQNYqrTg+eYdLx1UF1a/wPlyIX/Q6gv3ogPghwXWfob0ZsEN8mUTYcpQ4elu+xB/XdMi9ukn7kK1iAb0IwNawmrVvb343SAGqdFemz1iQwL4EzMU9ozNlLtUcbcJGC9uPKYH24ytGhE5Q+73+SsKav1pYMkRahvg+G6grTm6FOJ5SqLYhjoorVrBZAerGE3g+FT1YQazeHryBAjtEYiqj3bAvORphAHpgfoIylXCOt4VE3QJIM89H2PgeWiHad81Ww09u5LSZTukUXL5x4gLqQIiccyeu45XwdsAahiUAaxvlh4XjAxRW5sWO+rOskO1hmX22TdwTT0obSKMBLkS5aK7gH3chJn0r+bv58RSXWidtGW8gesNSLmnQjiw06oHHbg1TELOfPJ5cK4xhx/T5Z5kctkdyYWToSyT/O2NFSzF7r25aKgifckS2V8oAKgjRHzMro3I7cYXyiUcfo9nLRp7n2F0tUYz2LEqMqfnYdfUhzCa+rdCAwekQ5o0cgtfglOnvx0dTjFnNUolf2ZIN4C+MhjCg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUYranFkNUNaUFRyT3VHQkNrQlQ0eXBjQzNVOFk2SC91aXNmRzlObDRpcmhj?=
 =?utf-8?B?cTk1aFdmSXdpVTY3dXM4TlV0ejk4eUFYVUFSRHg0RHpEQWFKRWQ1WEhXem9O?=
 =?utf-8?B?MnFSQ0JzeldxZXFhcWlxdUpZT05ZMWFSUUR3cVRoc0hhR1ArWEZkN1p1ejBo?=
 =?utf-8?B?QnJvNmwwNjY4TEZwM2kwbldodUtSQnlzSDhDNW1LR0MrZGNNWXdySW5YZzZh?=
 =?utf-8?B?cGlrc0xVWDNOYnRLb1cyaVhkZ1JMMWc5ZzhHdmExYkpBUVY1Z25uTzROcVlv?=
 =?utf-8?B?MS8vV3dRS3FBVFVoVVR6bW51WlJIR2hvc1lxYjRLeVhPbFBjNGlHTENjK3Fh?=
 =?utf-8?B?aWVXUVpBU05zOUR6TGV2aUYwZlZNWFVtcXNDMmVUUXNOdStpc0xPQ1I1bGtm?=
 =?utf-8?B?UWI0N1F0K3dUeW90Umw2UnNDL1FzVUJLMVNveWdVVWhSdGZxTW5VdU1Jallz?=
 =?utf-8?B?bjkwWlZ1THFLN2xLVU1jS0RPcmNZaDFuVmZvdVFPQkF5N1JhcFVQNnhaYWFk?=
 =?utf-8?B?SzluaXZEZzdJdUordTZNSjBsSVV0azcyMVp2WVF1RnlDc3M1eDMvUkNrMDRP?=
 =?utf-8?B?N1hpRlUxVElYdGQrZjRVTERqdE1mM0owdko4cmN3NENGUXZWelFGUUlFVnpv?=
 =?utf-8?B?ZjhuRGUwZENoak9kOGFKcUh6QVJaTStkREtkMi9FSitYczg2QzhQcmRnMTlN?=
 =?utf-8?B?ZFU0R0dHaU1tQWxvK0FNd0QrMUxiQnRTOEpIZlBhaUdUS2E5VEtuNCtkWVlq?=
 =?utf-8?B?dy9NSmg2by9zYytYc0V6bm1saXRvY3huamVXSUFjU3ViY1BwMzhtTHNodVRr?=
 =?utf-8?B?K00wNHlna3pFaVpjZzZKc3FGZm5CYzhTOWsxeWlUK25iZnR4TFVFS2hYU3FF?=
 =?utf-8?B?NTlUK1lpL1AxSmhFeVBBaWFNU0NBUFZmWEJ0bzFJOWZhRlFUTmgrY3RqcW5U?=
 =?utf-8?B?QUIzQ01hQlAwTnNMclpwUGVXNTBPVkV1dVFpMVRYSHAzcC9WQlQ0ZU4zU1I0?=
 =?utf-8?B?V01vamtHWUN6b0pIVmsvWUkrOEVKbGdwcGhuNmY2OFg0V0J1VlJVUnZudXJk?=
 =?utf-8?B?QUFxTjNYUk1DWk9KK2djZ0dwSm1EMmdwUnhucG8xWXhwUzRwUHB4U2o1d1hn?=
 =?utf-8?B?dTB0YStYNVVRaWNIVURQd0pLbEkxN2owUHdyN3lxZ3BnSWZyRlRIdndTeE9t?=
 =?utf-8?B?QjRYeWI0QUV4OFpnVUJQSEl3MjNBbWFjaGdWWlVkRTdjbVM0RDE0NmxTOUh6?=
 =?utf-8?B?VVozRXV2cnliQWJDS2VzY0dOcngzMWNzeXFrb216Y3c5dGRRaisvS2tNWGxS?=
 =?utf-8?B?NHZQaFcyeG5NUzBRZXpJVXBIZS9OWCsrS2h6dUxsSFlnOElwL2NrWGl2QlNH?=
 =?utf-8?B?YzlpRVVNY0ZzZlFWRVMwUElzeHg2SVFXMi9DYlJMUi9VU3BObkhhNmJobnVM?=
 =?utf-8?B?VzlWekVPVEMzRXYvbDJ5VmRTU0lCSTJTOEZ3NS85UHg3cFBLWFp2c2Fzb2cw?=
 =?utf-8?B?dktOcE5tUDdkd3ZYSkp2Y1JRZkw4QjIybDN6dHBTTVNhZWs5RE91YVlpaTcv?=
 =?utf-8?B?QWJHUHQ3bWJMdWZFbVZIUGw3d24rK2x3Ty9OOWJxcTlnYm5mdmZ6SnF4UFdJ?=
 =?utf-8?B?cmZxWUJiTmRsRjMvOHdPTENiYzV0ems2Qkxzb3NZNG00Uk9McUFUZkNicWxY?=
 =?utf-8?B?MjRLSDV2bHBTbUZHREVoL1ZLb1JYMlRIZktBU2xibjVaTDE2SUhqMlBZcWs1?=
 =?utf-8?B?UGpONUJxMTFHK1VMOGJ2VG9TTjU0MTVvN1FzNW0vV0o3U01STVdzRm0xakZ1?=
 =?utf-8?B?Rko5Z1FJNkNVdVRDMzlxejJYRHRvM2FxMGRkaTdjRjRwZ0hBN1NiLzdPeTRX?=
 =?utf-8?B?ZXY5cVJidU5vWFVGOVB5OVRkN0RDYmxQTjRlYjVZQ2ZhMll5TzhhbUtsdU15?=
 =?utf-8?B?VTl1bmZmZGsxRVIxYUcwMlpHZ3ZQejZYaWZSTXpmWmxiS0JkRkxYZDZDc3Fp?=
 =?utf-8?B?V0hQZXp3Rzl5QnQrcjFFZjhxdEwrZVlnSTZOalExSGtJN0ZFZUs1ZVdqOWcz?=
 =?utf-8?B?MDJrTisyU2hXS3MydnAwVGRqbE51bnZnd2ZsajdPQWVZUlFGZGZiNG11SjVL?=
 =?utf-8?B?ZGdOdDFVRE9lY2xUd2s3UWYzMzlsQ3JwcHZaenc0ZUZudVp2SUU0emIrN1Bq?=
 =?utf-8?B?K3RrV0NUZVc1TVRYcDZXcnU1c2tYVFhKNkJndENEWGNQV01GeTZBUUsvMWlo?=
 =?utf-8?B?WFhoQ1VRNGNyZjFkbXdkaTluTkhvS1prK2ZPMzMwbXVjN280N0dObzYxYkt1?=
 =?utf-8?B?T1RHVVRyQ20wekMvZy9BTG5rTE4vMXYrN0NKSUh0SCtmNEI3S2NJQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 255c224f-ec6f-443b-474a-08deebcba195
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 10:41:35.4484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RnLTXP8SRZGdYjeTnZ+hxudqKOnhZ1k2F+7Ugy3sPzA/jgfmioN+5OhwOQ18ODVRl65gdUsqeCAC84NB4vLx++UlQwupl8hdGMfE8d8IQ+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7283

SGkgUGhpbGlwcCBaYWJlbCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4NCj4gU2VudDogMjcgSnVseSAyMDI2IDA4OjU4DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8zXSBzb2M6IHJlbmVzYXM6IHJ6LXN5c2M6IFJlZ2lzdGVyIGF1eGlsaWFyeSBkZXZp
Y2UgZm9yIFBXUlJEWSBwb3dlciBzZXF1ZW5jZXINCj4gDQo+IE9uIFNhLCAyMDI2LTA3LTI1IGF0
IDEzOjM0ICswMTAwLCBCaWp1IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFNvbWUgUlogU29DcyAoZS5nLiBSWi9HM0wpIGhh
dmUgYSBQV1JSRFkgcmVnaXN0ZXIgdGhhdCBpcyBjb250cm9sbGVkDQo+ID4gdGhyb3VnaCBhIHBv
d2VyIHNlcXVlbmNlciByYXRoZXIgdGhhbiBkaXJlY3RseSBieSB0aGUgU1lTQyBkcml2ZXIuDQo+
ID4NCj4gPiBBZGQgYSBwd3JyZHlfcHdyc2VxIGZsYWcgdG8gc3RydWN0IHJ6X3N5c2Nfc29jX2lk
X2luaXRfZGF0YSB0byBtYXJrDQo+ID4gU29DcyB3aXRoIHRoaXMgcHJvcGVydHksIGFuZCBzZXQg
aXQgZm9yIFJaL0czTC4gV2hlbiBzZXQsDQo+ID4gcnpfc3lzY19wcm9iZSgpIHJlZ2lzdGVycyBh
ICJwd3JzZXEtcHdycmR5IiBhdXhpbGlhcnkgZGV2aWNlIHNvIGENCj4gPiBkZWRpY2F0ZWQgZHJp
dmVyIGNhbiBoYW5kbGUgdGhlIFBXUlJEWSBzZXF1ZW5jaW5nLCB3aXRoIGF1dG9tYXRpYw0KPiA+
IHRlYXJkb3duIHZpYSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOGcwNDYtc3lzYy5jIHwgIDEgKw0KPiA+ICBk
cml2ZXJzL3NvYy9yZW5lc2FzL3J6LXN5c2MuYyAgICAgICAgfCA0MCArKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvc29jL3JlbmVzYXMvcnotc3lzYy5oICAgICAgICB8
ICAyICsrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3JlbmVzYXMvcjlhMDhnMDQ2LXN5c2MuYw0KPiA+IGIv
ZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOGcwNDYtc3lzYy5jDQo+ID4gaW5kZXggOTBkYjlkMzgz
NTM5Li5jZDEyOWM3Mjc0NjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvcmVuZXNhcy9y
OWEwOGcwNDYtc3lzYy5jDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOGcwNDYt
c3lzYy5jDQo+ID4gQEAgLTc2LDYgKzc2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByel9zeXNj
X3NvY19pZF9pbml0X2RhdGEgcnpnM2xfc3lzY19zb2NfaWRfaW5pdF9kYXRhIF9faW5pdGMNCj4g
PiAgCS5kZXZpZF9vZmZzZXQgPSAweGEwNCwNCj4gPiAgCS5yZXZpc2lvbl9tYXNrID0gR0VOTUFT
SygzMSwgMjgpLA0KPiA+ICAJLnNwZWNpZmljX2lkX21hc2sgPSBHRU5NQVNLKDI3LCAwKSwNCj4g
PiArCS5wd3JyZHlfcHdyc2VxID0gdHJ1ZSwNCj4gPiAgfTsNCj4gPg0KPiA+ICBjb25zdCBzdHJ1
Y3Qgcnpfc3lzY19pbml0X2RhdGEgcnpnM2xfc3lzY19pbml0X2RhdGEgX19pbml0Y29uc3QgPSB7
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3JlbmVzYXMvcnotc3lzYy5jDQo+ID4gYi9k
cml2ZXJzL3NvYy9yZW5lc2FzL3J6LXN5c2MuYyBpbmRleCAxNjFlOGMzOGVlYTYuLmVhNDljYTUx
ZTc0MA0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL3JlbmVzYXMvcnotc3lzYy5j
DQo+ID4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9yei1zeXNjLmMNCj4gPiBAQCAtNSw2ICs1
LDcgQEANCj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDI0IFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29y
cC4NCj4gPiAgICovDQo+ID4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2F1eGlsaWFyeV9idXMuaD4N
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9j
bGVhbnVwLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiA+IEBAIC04NCw2ICs4NSw0
MSBAQCBzdGF0aWMgaW50IHJ6X3N5c2Nfc29jX2luaXQoc3RydWN0IHJ6X3N5c2MgKnN5c2MsIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdA0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4g
Pg0KPiA+ICtzdGF0aWMgdm9pZCByel9zeXNjX3B3cnJkeV9wd3JzZXFfdW5yZWdpc3Rlcl9hZGV2
KHZvaWQgKmFkZXYpIHsNCj4gPiArCWF1eGlsaWFyeV9kZXZpY2VfZGVsZXRlKGFkZXYpOw0KPiA+
ICsJYXV4aWxpYXJ5X2RldmljZV91bmluaXQoYWRldik7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0
YXRpYyBpbnQgcnpfc3lzY19wd3JyZHlfcHdyc2VxX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBj
b25zdA0KPiA+ICtzdHJ1Y3Qgcnpfc3lzY19pbml0X2RhdGEgKmRhdGEpIHsNCj4gPiArCWNvbnN0
IHN0cnVjdCByel9zeXNjX3NvY19pZF9pbml0X2RhdGEgKnNvY19kYXRhID0gZGF0YS0+c29jX2lk
X2luaXRfZGF0YTsNCj4gPiArCXN0cnVjdCBhdXhpbGlhcnlfZGV2aWNlICphZGV2Ow0KPiA+ICsJ
aW50IHJldDsNCj4gPiArDQo+ID4gKwlpZiAoIXNvY19kYXRhLT5wd3JyZHlfcHdyc2VxKQ0KPiA+
ICsJCXJldHVybiAwOw0KPiA+ICsNCj4gPiArCWFkZXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXpl
b2YoKmFkZXYpLCBHRlBfS0VSTkVMKTsNCj4gDQo+IFRoZSBsaWZldGltZSBvZiB0aGlzIGFsbG9j
YXRpb24gc2hvdWxkIGJlIHRpZWQgdG8gYWRldi0+ZGV2LCBub3QgaXRzIHBhcmVudC4gQ2FuJ3Qg
eW91IGp1c3QgdXNlDQo+IGRldm1fYXV4aWxpYXJ5X2RldmljZV9jcmVhdGUoKSB0aG91Z2g/DQoN
CkFncmVlZC4gV2lsbCBzd2l0Y2ggdG8gZGV2bV9hdXhpbGlhcnlfZGV2aWNlX2NyZWF0ZSgpLg0K
DQpDaGVlcnMsDQpCaWp1DQo=
