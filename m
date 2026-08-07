Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060531CA4E;
	Fri,  7 Aug 2026 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114496; cv=fail; b=Dg2BRNZF0SKfieh8Nv2eV2v+7VO1OMDLA/x3k/Sow8d9M3Lm+Z0M4w+esuVYpBHCaplkW9JnQPvalEzN/kpuug66qBkisx2tXKgcnIIv0jlmZpd346Pk+8JxXnWa0ZFCEc4VhppASF3UnJqk+7RDXHiNHQk6OwfrdiCTKw/BLnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114496; c=relaxed/simple;
	bh=NLxBjZsajFZHGVE1O1/HZcfGh6M5wBMYKkjEr+ok4zA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bCb7gqEPJ+pqRY+L+OAoHmaq89twA9M5ZFuCt0TWHeYycYqpf+jXbCkrBnKGQgZYPt8IjsaK710O93fReubu50cAKOBJ/jggrmAav5FqvQCDx5j1mhJXClu3/mkk3kjxQ/wALH44eM2EnO6bVuiOXEyriPk2cjg8nx5pl87LgvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EcT30pUR; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EcT30pUR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIC+IB3JLPyemzZVtnNH7I8vYFtEO7Bkq2ojNgl8tQas/6VMWK6YkVxJi1nWOhc9FOQxOm8jyFR/CvDzeZThVXhFshe+rVAQPDd1OCdxZ3lnnRZKBofopS1P9yXVr6ngPuHe+4AfXC+qRw16ihaDmaFH/cszeYOXO8SWqQSLepNbbKn8MXzv8ImYv4C3puJYWEzKV+FohfbdedYgfC7VwIJg1fPOhVqPcePAEvRs0T9UxLZrPCnZD2M+10ugHALeMervpZOZjLA9UPWLD8gSJhiqy8EJX90PAqcab4fVr03XQi8xLGOokIT/WIA51tgnJlek3NMWsubekq8ECIysbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLxBjZsajFZHGVE1O1/HZcfGh6M5wBMYKkjEr+ok4zA=;
 b=oJTXhxO/KHnzpiZB/JUBMgadPUc8TBHGY9ZOWxJ/itmFQuvu9PrYxIrzuyE7t6JktINBAFMLFIX0blTmNFg/oM7tP+Xf1RHJG6yDfZ+073vOvU9dA+zC0wSQWwn1exWIKhr85eim6qxWriGbX15vN5n8QTiMamyQKmWtYn/EzIxXVqIiJYghDej74RUz+LGq2RJLIHAmiKGlxuCvENok9jrrpq9+0RloYWq+vzZMmrNhl5ww+u0ou6QvQjWRXd6hjb2Jhk+Gk191dnKYFQuyELRIjZkGNqj+DO4vN/YGSgC386XW5FuS6580O+rB0PpvN5xcOfig2x54IgZDRuECzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLxBjZsajFZHGVE1O1/HZcfGh6M5wBMYKkjEr+ok4zA=;
 b=EcT30pURsZU15RSJMUl5+3xTi58SQXPWRBfcGo9IAEuGglmsTTgf4vaEEj/4U6lm+X9n1x6WlYyikK6pMJDfFADJdp/z5CqjBAXptIz3q6bK+rTEuU+iCuEQxH9F1eqsNZ2GG0fsa0EBV7+GOxaZzJNSapmHxpaS+K+U5B/2Kkw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12413.jpnprd01.prod.outlook.com (2603:1096:405:ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 14:54:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 14:54:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "laurent.pinchart"
	<laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] soc: renesas: rz-sysc: Register auxiliary device
 for PWRRDY power sequencer
Thread-Topic: [PATCH v2 1/3] soc: renesas: rz-sysc: Register auxiliary device
 for PWRRDY power sequencer
Thread-Index: AQHdHz0Eaev+bYq2b0G3+CQyd1jaR7aSrtWAgAALmRA=
Date: Fri, 7 Aug 2026 14:54:36 +0000
Message-ID:
 <TY3PR01MB11346C78FE73B40A9049A394F86D12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260729093112.98324-1-biju.das.jz@bp.renesas.com>
 <20260729093112.98324-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUZm38_pYtHngDmczDJ7zvOGbD1zzn7hPc22qS27rxpQA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUZm38_pYtHngDmczDJ7zvOGbD1zzn7hPc22qS27rxpQA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12413:EE_
x-ms-office365-filtering-correlation-id: f9b1a94d-df2f-4001-2a3b-08def493ccfb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|56012099006|4143699003|18002099003|22082099003|38070700021|10067099003|11063799006;
x-microsoft-antispam-message-info:
 vuvfx2D5BM8TIGbdZWkThmlRBnNMWe1VDvZugXk4J+z7SnAuW69WJsHKfUznaHh8ghAjLQx/jtGjPvf/UtRtr/L2jSc5D2thmdTPPnZ9EDi3b/T8wTgFhlwRkouNx8BlnQZjvMS/m2wXVFo9lntgow8IvzK/hJtNvq9qw2HA+feU2oeNa7cqz18ixh68WV3DMu93PIJodjCDRAlwwJn4CeONOohz/yjQDWtmEtFVeFjszQdMYjl1OkpfrxFld4hCl7PznhrBeQgloNvJgLmXeR/cgo44/RtQx9S7AKyvSjwYbIx5wJsZ77VgzXPV3ppDSKxw/QoZsKY2zFoorJnLPoAYqbo+HhwcM8rgId5FQyW/kVWHMTyPUxMsN2pDeYsjzN4LKAHCHiCcprfMzFaYr11UsHYZwHhTFZQQZm1eG34Iju7BxPTVh627dtIvsEJp3gdickr6bkQ6W0hAFs4xo0KOhUN01J/ylG13SpAyKADyTvMwcilj7lbn8eKjYPvZu10+oYSEDzZTClcsEzAXLuGaUwCpRQC8qJZqudMo9gIpJE34PCHIvFcllE4bWszIXG6Ewq8Ts0Ir2LIfq4PPYli7KO80Oc/a0XkbxY89e/yHrb+WghnOdOBnaydqd0+pJ9VZLbflDEhxhNC7kly/TMW9Mg97zqidCgVHrg2NQh1I7Yuhw7wVNrz6uy68WLh9FofaO0BCk+wcJoiY/2glyBobfLEWkW7AZIXVmEA0yVc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(56012099006)(4143699003)(18002099003)(22082099003)(38070700021)(10067099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmxtNVhlWDJ0T3JUZHptV3ZSSjJzSitWTHhsMnBiYXJrV1hNSG1hZ2dhWnFN?=
 =?utf-8?B?L1ZSdnh2a2ltRmE5bkJjVVFuRXFGSE9GQUNzOE1vY1NzUmt4QWwvRmYwREdY?=
 =?utf-8?B?OTgrZWxpQlVqandqclpzeVAzU2ZyL1lPM2xURkNMcnNPdTBCdHZzU2x5VUEz?=
 =?utf-8?B?M3pIcGZIa0RUVmxMdjA4aGVDTVRvZUJQYXgyQlhpWnRicE1HMlI3Q1ErbjRE?=
 =?utf-8?B?WS93bzdjTGVnZFg3TUlidVlLbzhMMFA4eUxRbXRNWkVXRUhOWDZ0bHhYOUlJ?=
 =?utf-8?B?VXRSOFpGbW5xNG1xWjVUMGFtR2M0UFZ6RGFyckx0N0xLTzBybUNodDB1cGFa?=
 =?utf-8?B?bG52T1pCWlpLVEtQcWY3V2NYeFl2L2ZwekVtMzJPV3d3TWFsUWRvOFdmVS9L?=
 =?utf-8?B?Z0hoNVp1Yk9ST0Y1LzJzSnFMYlpJMUlTV1lJNzlsTUtKYjI4cXUwYjJ4dGJH?=
 =?utf-8?B?b051Y2thL0htS0taa21UNHlQOHlrcTZjQXdZR0gyUVM2Y01Fc2djdCtoVHpn?=
 =?utf-8?B?N1A3WVovTXpPZ29QUXhJUFBBQW5nK0hUVWdLT0k1NXUwazdXQS9EdHJMcnFG?=
 =?utf-8?B?Zi9MYkxUWGl6bmtkaXZpVzFidlB4ZkZUMnFuOU5kTnBzdTJLNXcvSnVMU0w1?=
 =?utf-8?B?WXV2TjdaR0MvNWdQY0lHT1R4Znc4YUZPN0NYLzlJWENXNVZxa1plM3hLSDgw?=
 =?utf-8?B?aU84Z3lLZkhaSmsrWHQ1N2loeGQzYzlLUzJwdnRlVWFyZGpJOUlUL1ZLWGtz?=
 =?utf-8?B?VDIyMjZiV1lEbFlwMDR4aTFuS0Q2eU9CTEgvOU93Ti85L1hiT09XVHBYSWNa?=
 =?utf-8?B?WU5vWEJoWFhKM0UrVzg0OU5wMmd1eUhtaytjSTFOZHRaUDdPSVpjVnhEcWVz?=
 =?utf-8?B?TzZEZ2tCUW5seWszbDZTL1Bad01nbVFMZDRqYTFmcU5JRHpQQlZFcWdGK29t?=
 =?utf-8?B?ckdkcWkyay9qV1dUMUExcjFBTGQ3dFJyM2JMN3BoM3J4K2oxZ3dZMnlTUElj?=
 =?utf-8?B?b1cxZExOYkdocXptbmF2SFJKUjZKWUh4YzdrdFF1a2VvYjVKdkJQbXgzT0Zy?=
 =?utf-8?B?KzMwclI5MktyVmEyeDJ0Wk5ZWEd6bTJnQjF3T29BQmpocEFLbzl5VitKTjBl?=
 =?utf-8?B?TUhPTFk5ZWZQcEFFaVE0ank1WThXeDl0ZEdrVURaclE1WmJNVjZyUjJkTmVz?=
 =?utf-8?B?a0Y3T3g2NDdqWXZKbXpBenBxaXI2aGwvZXJTdDROOHJYOWtVaWI2QTI3Z3Er?=
 =?utf-8?B?K09wMXVMbjVGSDM0VTR0MytteVJIWlYwTG9PRjhiajNaVUxRNEFnb3hKNzZK?=
 =?utf-8?B?QVpWZjBJaDcwQTFEdU1KRGdjbzZSK1ZuWGZzSnF2Vk96SVIzTVdSNUJJSzBB?=
 =?utf-8?B?N1AwUVl2aGZkdVFkZ3IwMXg4Vko1TC9LNVdhbjVvRnhSRHhUVFhobkc3V2ZE?=
 =?utf-8?B?c0hlNW04RCtidVRYQk53U0pwMXRSTEcxQ1lhZzRmT3BpK0d1bS9hZWg0WHVk?=
 =?utf-8?B?cncyeDdTOEVMU2xWcGtla1FhcFFnQXQ4NGNESmlOd2xBQUdDRll5MW4zMVlo?=
 =?utf-8?B?dE9FQXlxdjYwSzNlK3Urdml2WGNxaGZIVVNFajVpeXJQNmFUMlhBOG9Jb3JS?=
 =?utf-8?B?MnN4OWFaK0dkNkthbWRDYU11emdJVzJvK0FwUE9ZdS9IZ0E3ZXZicm9KTlA0?=
 =?utf-8?B?TXBQQzU5bDVwc2kwSmZsekN0Z2h1dHMxYVVqZkVjYjBsYitiTzVRTDZEZXdQ?=
 =?utf-8?B?Nmd3VXVOd25CQm9FMHc0NXJ2Zm1rVGJVU0lZaUowa3dJYkdoSzkxWEJWeklY?=
 =?utf-8?B?QytkNER0elFVd0dxc282WFdJclY1eHFheC9OUnJlVG1vTDd5WkF6Y1FPeEZw?=
 =?utf-8?B?d1hEdk1OczNjZ0Nab0RTRGJ2b0dIRENsci85YlpmaGhoWk5xdmUyYWM4U21P?=
 =?utf-8?B?V1NoM2x2WnVjdVdnWkNHRDJUa1h0T3U5WFlYYUtEUnhDenNLZG1VUkYxQTVX?=
 =?utf-8?B?dlVCZWJPMStMQitqOTE0K1FIMTQyTThNeGJnUlZ1YXlmdTZ2Y2RBaGduYi9q?=
 =?utf-8?B?UFcwRmdxdVRLVG10UExyUTlJN2NDU3JYb0JDd3B2czl3cVJhekdxdUpTODg5?=
 =?utf-8?B?WFA0VkNodmU2RHhJa3BkSlNiZGZLQmszeldpSXNDQzVMeFlQbUJydDBrNTll?=
 =?utf-8?B?TmRFeWsxVnlqQ2dteE5NbmFsNG9xMkVCd3c0T3RwRDIxRFVsMEs2WVVwdVVv?=
 =?utf-8?B?VXdSdmdhdVJhV2dhd1dwK3pqMjVRbllUVzUxV3FxbERnZ1YvQUtncUF3bTZS?=
 =?utf-8?B?ZTJGSGhWeTZqMW9odGZzZU5Da0o5SXpHRWNkV1pKZFVqQnYwanNVQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b1a94d-df2f-4001-2a3b-08def493ccfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 14:54:36.9321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YtETf4TjGwcaxKGfFCGPwyZzxhXZEKSx/dPPlA7cIygcRivoWPqu3EL6FSDyTkK1HhoNSUlsTnRwrlnljub07O8JEaYoSEGdigODmleiFlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12413

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA3IEF1Z3VzdCAyMDI2IDE1OjEyDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMS8zXSBzb2M6IHJlbmVzYXM6IHJ6LXN5c2M6IFJlZ2lzdGVyIGF1eGlsaWFyeSBkZXZp
Y2UgZm9yIFBXUlJEWSBwb3dlciBzZXF1ZW5jZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBX
ZWQsIDI5IEp1bCAyMDI2IGF0IDExOjMxLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdy
b3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
Pg0KPiA+IFNvbWUgUlogU29DcyAoZS5nLiBSWi9HM0wpIGhhdmUgYSBQV1JSRFkgcmVnaXN0ZXIg
dGhhdCBpcyBjb250cm9sbGVkDQo+ID4gdGhyb3VnaCBhIHBvd2VyIHNlcXVlbmNlciByYXRoZXIg
dGhhbiBkaXJlY3RseSBieSB0aGUgU1lTQyBkcml2ZXIuDQo+ID4NCj4gPiBBZGQgYSBwd3JyZHlf
cHdyc2VxIGZsYWcgdG8gc3RydWN0IHJ6X3N5c2Nfc29jX2lkX2luaXRfZGF0YSB0byBtYXJrDQo+
ID4gU29DcyB3aXRoIHRoaXMgcHJvcGVydHksIGFuZCBzZXQgaXQgZm9yIFJaL0czTC4gV2hlbiBz
ZXQsDQo+ID4gcnpfc3lzY19wcm9iZSgpIHJlZ2lzdGVycyBhICJwd3JzZXEtcHdycmR5IiBhdXhp
bGlhcnkgZGV2aWNlIHNvIGENCj4gPiBkZWRpY2F0ZWQgZHJpdmVyIGNhbiBoYW5kbGUgdGhlIFBX
UlJEWSBzZXF1ZW5jaW5nLCB3aXRoIGF1dG9tYXRpYw0KPiA+IHRlYXJkb3duIHZpYSBkZXZtX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQoKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6DQo+ID4gICog
U3dpdGNoZWQgdG8gZGV2bV9hdXhpbGlhcnlfZGV2aWNlX2NyZWF0ZSgpLg0KPiA+ICAqIEFkZGVk
IHJlZ21hcCBwYXJhbWV0ZXIgdG8gcnpfc3lzY19wd3JyZHlfcHdyc2VxX2luaXQoKSxzbyB0aGF0
IHJlZ21hcA0KPiA+ICAgIGNhbiBiZSBwYXNzZWQgYXMgcGxhdGZvcm0gZGF0YS4NCj4gDQo+IFRo
YW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvcmVuZXNhcy9y
ei1zeXNjLmMNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL3J6LXN5c2MuYw0KPiANCj4g
PiBAQCAtODQsNiArODUsMjIgQEAgc3RhdGljIGludCByel9zeXNjX3NvY19pbml0KHN0cnVjdCBy
el9zeXNjICpzeXNjLCBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXQNCj4gPiAgICAgICAg
IHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIGludCByel9zeXNjX3B3cnJkeV9w
d3JzZXFfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCByZWdtYXAgKnJlZ21hcCwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCByel9z
eXNjX2luaXRfZGF0YQ0KPiA+ICsqZGF0YSkgew0KPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IHJ6
X3N5c2Nfc29jX2lkX2luaXRfZGF0YSAqc29jX2RhdGEgPSBkYXRhLT5zb2NfaWRfaW5pdF9kYXRh
Ow0KPiA+ICsgICAgICAgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXY7DQo+ID4gKw0KPiA+
ICsgICAgICAgaWYgKCFzb2NfZGF0YS0+cHdycmR5X3B3cnNlcSkNCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsgICAgICAgYWRldiA9IGRldm1fYXV4aWxpYXJ5X2Rl
dmljZV9jcmVhdGUoZGV2LCAicHdyc2VxLXB3cnJkeSIsDQo+ID4gKyAoX19mb3JjZSB2b2lkICop
cmVnbWFwKTsNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgYSBjYXN0IChjb3BpZWQgZnJv
bSBhIGRyaXZlciBwYXNzaW5nIGFuIF9faW9tZW0gcG9pbnRlcj8pDQoNCllvdSBhcmUgY29ycmVj
dCwgd2lsbCBkcm9wIHRoZSBjYXN0aW5nIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQo+IA0KPiA+ICsgICAgICAgaWYgKCFhZGV2KQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gLUVOT0RFVjsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnpfc3lzY19tYXRjaFtdID0g
eyAgI2lmZGVmDQo+ID4gQ09ORklHX1NZU0NfUjlBMDhHMDQ1DQo+ID4gICAgICAgICB7IC5jb21w
YXRpYmxlID0gInJlbmVzYXMscjlhMDhnMDQ1LXN5c2MiLCAuZGF0YSA9DQo+ID4gJnJ6ZzNzX3N5
c2NfaW5pdF9kYXRhIH0sDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
DQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
