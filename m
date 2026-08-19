Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C5360EE2;
	Wed, 19 Aug 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126704; cv=fail; b=SzkzCz2nTjmugoYiyi/fLpsv4eZfvP9lMOjAaZp02J8W3cU+gtKR/U9q4vCyFffzMQuZgO5THbQjD0jypTCYQy0mHjtPmIua3BImHh/ovrX3ck8LbX/6vYIvVnHHTj9HhNA/dzJ9kmMDwFifdRLDhMxZ/Tfj5aqIABh2nXyWFoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126704; c=relaxed/simple;
	bh=eVgGPq0+vJO7gfSVZW+JbPoS7fOKBbchh/S5Kn8i5QM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pc9I5ajIwkhe2C1M/L4nCtJ+sgejx5UFod8U8sqWAhxkzPuKpl+PBwUc6Lk9lWssJ234qGydB1jW0t31SzGvlgqBmSfqbBaAuYu9TxEtZj5TsziFfrvNRVAKb6r9FZkDP1Ncib/2kcl4CTLfpL3bR/NQC3f/YLPwx3y4hbDLR8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=B8OPdUe6; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="B8OPdUe6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeJ+vRQYbk28KKay9aOHD/2J5NmXu+vi5u81Qy/MbWmsCkpKJ6UecKM6TxMuQXd4e6wEp5eg050ryF4ixanlpD5kMRQ/DdgzCdf1KPbosU67o+0xpwV4lFvHdaPlg9uUrT6KZNx7SnfkFfN3vJNhbTG69BQZHhqwsTevzsZU/qeMq0Gl9vbsnlE7vcE/dRqGo8iA8aPhFo0tJt+Ufweo/mKPYYMOl1WZylxR9HgIJP0IL6oufrcZIMFd3P41twSqcYOx9PDTF20GIVq1WRBEIRCz7wT4YbA1lKiNEqPh7tsERczUkrM+xNAPPTLA7e+SoEiUsHRQ8f1COQWCZSOQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVgGPq0+vJO7gfSVZW+JbPoS7fOKBbchh/S5Kn8i5QM=;
 b=CQdAVdQAplDtqHT4ZI3EGsYI8iK2ZvmugLL2gB2ZNtH64rMVyKlKXsN/HJG45Dch2yJvc2BrToimVim/ktjGZVsDfU3zy6XIaavOr6lnQr165JTc5HgMRsElc0UiGUP0TODGSP+1a2ndvkBcsOqnHWkLzS15ClHFlGph3gbBzGdLFRPAcIp5vxMCAOfzuCcXCpYaHwkJsiGG7LFoAkxFITSePkTZXfQIk+JJKCm2kV3pF0tZwUGAdGTEO8R3Tlvr8KeVa0Xl0r975+0kworqvaOjrzWuj6Szbbf3neEo2Fj2m+UaMLQOTko3N/Rz2pxzbMCj0O/caMXlzxQtofHWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVgGPq0+vJO7gfSVZW+JbPoS7fOKBbchh/S5Kn8i5QM=;
 b=B8OPdUe686lYUJHaa3i3hLVXpV08yarV94ZJ2JMHfWM82Z4eT603y8Dg1xboxnG/7oAUWMjCcgCJ4QfsCO/kWH8dGl+nFQowxozsu6egPVIPgiVWiR09Gq2ELHVMbz9Rd2sWtDmUKtiSoRMKb8QGh7NcI5+RDoSw0+/yzE/hCaQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB17348.jpnprd01.prod.outlook.com (2603:1096:604:451::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 08:04:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 08:04:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "laurent.pinchart"
	<laurent.pinchart@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"magnus.damm" <magnus.damm@gmail.com>
Subject: RE: [PATCH v3 1/3] soc: renesas: rz-sysc: Register auxiliary device
 for PWRRDY power sequencer
Thread-Topic: [PATCH v3 1/3] soc: renesas: rz-sysc: Register auxiliary device
 for PWRRDY power sequencer
Thread-Index: AQHdKlDALx0+KqLCYUuWmWsQ84a88Lab+h0AgAkTjuA=
Date: Wed, 19 Aug 2026 08:04:59 +0000
Message-ID:
 <TY3PR01MB113469BB9760C6C6F2477D08386A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260812115010.108322-1-biju.das.jz@bp.renesas.com>
 <20260812115010.108322-2-biju.das.jz@bp.renesas.com>
 <CAMRc=MeSC2KTdFSX7dNJN_1zUH9+N3A3ctHgHuweW=e7yAV-JA@mail.gmail.com>
In-Reply-To:
 <CAMRc=MeSC2KTdFSX7dNJN_1zUH9+N3A3ctHgHuweW=e7yAV-JA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB17348:EE_
x-ms-office365-filtering-correlation-id: 1a95831e-42fb-47f8-23ab-08defdc89078
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 rQ/EZp/0pKMjnO2gACs1CeXVJ7+TD7NoScaMMESP9fc8HWthhTf2kDETuscvKs5nlpu7WfMDPTXZyxdVJAvyWJIRF1Bskr9rDWNHQXb3DnYi3PAUQkinw1uBxqgzuOfu8yqtbv0H7pW27PZ28BsWazR1rei9xdGXKniBBbqmEK+cWbd5WUU5wNV2XxPlDfuQWn/3G/Z8SqjsA3GlAti99MF7HfqLFiu+eC60/4+qS4NmjprcqLceR/PduvD11u7VY9HDNnz55/XrhetouMcQOa+8MhHUXGb0qxsXtRt0NQMi4agA6R3a6HDDR9djwKr7Hzjw0rlo7gi+nrrUqC0vS+/vaGaoU76cAKKlChecJShWT636rHLMPRYdLKLEsW9QCEPUwpM331S9TIcYBEYbFKVybVL/02y0vH/MJ/ijFjUFoAw8zwEhv7oDGs+QT2Ec+d2iLyjxZHIfMiGiCKS5/p4fWN+Plpa2AZS+6T+IQm235nd9kF+DQAS7qseamrslTulc8djtUfZVK/sUHjwXdnyXXW8NrpmmtVyydl3mrn8Aetuzj2kqlCFLKQk9vJ1P3zXBw5zSdfB7dPNU7rNMNn1fVvRBh2GCaVKnaKWlzcNZOg4i+stARAbBIAMMZyQ8K3l8Exx4/Lovwhg0e9YEIgNUINhafOckl6YlpnhhPNH6R4LirlMWr3y09dVEr63ZTTfx/NCZ+70W35EIQn2BYCXo7dIPSvXUfqjB/PmJIDI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDZad1Z6eS9iWS9JSGE0UXV3SjFVemV0ZGlxYnRmd0JGSHo3dHRKQ2VkTUVi?=
 =?utf-8?B?NXpURnVxTUM0SHNFRUl4TXhVbW5vTVlxV042b0d5eGd6eTJVNXlJYXlBSm5C?=
 =?utf-8?B?RVZDa2phaTBDNVZuMlY2dVUzLzErZHkyc284dm00UUd2T3ZnZFU1SFUrUVo2?=
 =?utf-8?B?T3RkMWpTdmVqZVdGcWRkN09rRkpTUUI4ci9kWSs0Q3FZSFo5QUNpOWlrMzA5?=
 =?utf-8?B?a0NSUzMwa2gwOTdjQ0UyR0lNN0NXVlZpT2xyL0x0RDdHV3M1VHRkUkU5dElO?=
 =?utf-8?B?Mm9yVGRIODZna2ZFUCtRQ2RZL0ozekVua2VzbWx1ZUFCdWRJN2Y0WTBqT216?=
 =?utf-8?B?RGpWVkxjckZ5RUlrdWJkQmhIN0dXRy9XWm1sTGZHTTAzYjFDanEzcXV5aHlu?=
 =?utf-8?B?RnR1bEEwVWRzOWZkMExhYlc0SVRKNUpBWkNJV0VaYXlYMDRWZENOSVBXbWMw?=
 =?utf-8?B?aGxzck9wZUd4YnV2eUJDa2t2OGtCcTRpcDQrTWRWbm9vUEZwekxVVEV2L1VP?=
 =?utf-8?B?RWdnSTNVUEJTaDRmUFFEVkJ0MmNHYnBJSUlMbTRSVkM3YnlKSTlIb2xhYmtk?=
 =?utf-8?B?ZGNOYWd5RUpOeVEwR1IwcjhXRW1UOHUyM21weWF6bmdjK2NJMnplWkh4KzJh?=
 =?utf-8?B?M0FDdUh1VmFKVFlsUGljUUZzdE1hWWZVblZoeXc1cFBwKzFpZ2J0R2F0TEsx?=
 =?utf-8?B?aG9ES1pEeGtYakNqUTBvNnB6ZWVMREtQejZGcWdPRlJjR2RaRlplUHFwRXU0?=
 =?utf-8?B?cXdxMkltd0NjbDlVa1c0dmhJalZmMjNXUWFwQVdKSllzZ0Y0eC9Qc1NQSGlT?=
 =?utf-8?B?bWN3MlVCQzI3c1NzdmVwQTduZk9XbTZwNDlBYjVaRERxSzBrTTA0em5TY2d5?=
 =?utf-8?B?L2tXVEFRcWNveGl5QUp2ZEllamxTQ0d3RXhvRVI5MXFPWG56d3crM3VJaXds?=
 =?utf-8?B?QjYxUjUwM0dTSVhtQnNMc0VGNmUyYmVYcEUyV05EcEpNc0ZLaHhmSExsUVlu?=
 =?utf-8?B?UDlxSy9qWUtVbktJTXpnRWNTY0VRVWczQzVKVS9sZDZwT1VDQ0YwSXBBaFk1?=
 =?utf-8?B?UUtwVDQ1SjAwRWJsQ3orZHJyV1pGOHRTZU5xaVUwUjJ6OGgvaDU3YW5WSmxZ?=
 =?utf-8?B?Q0xQdFQxclNRZHVGU25tenhKMitad0VmUnJ4Zy9WTXlOVlNhRnd4SW5uU1lW?=
 =?utf-8?B?dUg5ODZROHNvdlZvSUwrZ2NXL3Fvd2lsaDdjYUtadnVMUngzR2RISUFmT00w?=
 =?utf-8?B?UHl3RVRYY05GUlRuaGoxc05jRk9jQUNkR3B3d3dGa2VRTUJBMjhCUzNrQ3R2?=
 =?utf-8?B?Snp3RWIzNmQxQ2Y1TEgzbDhncjNRNFBrdXhGSjVBMUp3YUVySXRRZTRPWmlv?=
 =?utf-8?B?eVJMNEpUNGJTSDhHOGx3dkhOR0NUcEdGT1M5MEduSzlGZTRLNnp0a1dOcWtY?=
 =?utf-8?B?Nm10VmsvMkhYSE9MMk1oSCs1Rms2bVkxV1hGVWZzSE1iandxY0VGN0o3N1Qr?=
 =?utf-8?B?M2ErYyt3TU81bDZQcVlCWCt0M1ZCOVYrdDdMVW40VGxkQ2hYYUVMN204bXFL?=
 =?utf-8?B?eHVDWFZxbzRkRkZCbUsxQzFFWW4xQ29HTWxqcGNiRmZ5TXRoVVJ6Ny9ZcW9N?=
 =?utf-8?B?UHFGYi9hb0hIdkxwNWx5dnRYbDMwN1gzTXVQVnVSUTBDNCtaT29BTzlLZ05h?=
 =?utf-8?B?Wkt0RVVvNWZVWFZoTXh6Q2ZOZUp5Q2JNNkNqOXU3R1pLWUM3NVZpRC83cmd4?=
 =?utf-8?B?bklubW4yNmZFZmtxS1A4SUN4UUxUc0ZYVGw0YThtdFNKcnZCODR3dUN3ZzJh?=
 =?utf-8?B?WHlNS25hRjhHTTBHTGRvWXlMS2Znc1pFblJ2bCtUK2xURU1Ic3N2bEVxNUNi?=
 =?utf-8?B?MFZrTklsUXU0TWRQS3BvNDdXTDduVjA0QklJRWFOeGdqdkErVVNweTVKbE1Q?=
 =?utf-8?B?bUQ0eTJmaHpTSU9nRFRoNnJjWnVDaEhsdHNyMktwMDNYdC9CRnVRb3o2YjZT?=
 =?utf-8?B?UUdZY3hzSGhjUWpaQnlNbEo0NTBLREtMa2VPbEZZbExZenIydHNrKzlHR3ZT?=
 =?utf-8?B?am9BaTljaTdLZmxKRU85RVRTVnUyQXo3SUVuMm5MeTdmUjBhVExQbnJoL3Vh?=
 =?utf-8?B?am1FQkcwQnVyNWpOVnk5RU9BaUtCWUVMZDBIRmh5QU94SjZyM2dFVUZmbUhh?=
 =?utf-8?B?WGhqa2dvemNBd0JNUE5KS25POGl0M2p3bzhkNUFiOUlEalJXUVpEUVVONGRG?=
 =?utf-8?B?aVVYMGhFRHoxQ3UxYjljdXBTOHdKQi9HdzRVL2FCL1doVlFxTkdtbWt6VzZH?=
 =?utf-8?B?QzBmRklidFMwa0FlOXRIMzZQdWNMSVhFZ3Nsb3h6dVdVNTFmZWladz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a95831e-42fb-47f8-23ab-08defdc89078
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 08:04:59.1937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsA6fO9PYEqjZVqBYRJnkEmFN1n+MG3w2Mkneo49IkPb1/gQc68C8R5BNZeQuODRMuVBAmL7YLTenJXOagGxyXiNxAunx02p173U2KIFt1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17348

SGkgQmFydG9zeiBhbmQgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAa2VybmVsLm9yZz4NCj4gU2VudDogMTMgQXVndXN0IDIwMjYgMTQ6MjcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MyAxLzNdIHNvYzogcmVuZXNhczogcnotc3lzYzogUmVnaXN0ZXIgYXV4aWxp
YXJ5IGRldmljZSBmb3IgUFdSUkRZIHBvd2VyIHNlcXVlbmNlcg0KPiANCj4gT24gV2VkLCAxMiBB
dWcgMjAyNiAxMzo1MDowMyArMDIwMCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiBzYWlk
Og0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0K
PiA+IFNvbWUgUlogU29DcyAoZS5nLiBSWi9HM0wpIGhhdmUgYSBQV1JSRFkgcmVnaXN0ZXIgdGhh
dCBpcyBjb250cm9sbGVkDQo+ID4gdGhyb3VnaCBhIHBvd2VyIHNlcXVlbmNlciByYXRoZXIgdGhh
biBkaXJlY3RseSBieSB0aGUgU1lTQyBkcml2ZXIuDQo+ID4NCj4gPiBBZGQgYSBwd3JyZHlfcHdy
c2VxIGZsYWcgdG8gc3RydWN0IHJ6X3N5c2Nfc29jX2lkX2luaXRfZGF0YSB0byBtYXJrDQo+ID4g
U29DcyB3aXRoIHRoaXMgcHJvcGVydHksIGFuZCBzZXQgaXQgZm9yIFJaL0czTC4gV2hlbiBzZXQs
DQo+ID4gcnpfc3lzY19wcm9iZSgpIHJlZ2lzdGVycyBhICJwd3JzZXEtcHdycmR5IiBhdXhpbGlh
cnkgZGV2aWNlIHNvIGENCj4gPiBkZWRpY2F0ZWQgZHJpdmVyIGNhbiBoYW5kbGUgdGhlIFBXUlJE
WSBzZXF1ZW5jaW5nLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAgKiBVcGRhdGVk
IGNvbW1pdCBkZXNjcmlwdGlvbiBieSBkcm9wcGluZyBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
KS4NCj4gPiAgKiBDb25maWcgbm93IHNlbGVjdHMgQVVYSUxJQVJZX0JVUyB0byBhdm9pZCBjb21w
aWxhdGlvbiBpc3N1ZXMuDQo+ID4gICogRHJvcHBlZCB0aGUgY2FzdCBpbiBkZXZtX2F1eGlsaWFy
eV9kZXZpY2VfY3JlYXRlKCkuDQo+ID4gdjEtPnYyOg0KPiA+ICAqIFN3aXRjaGVkIHRvIGRldm1f
YXV4aWxpYXJ5X2RldmljZV9jcmVhdGUoKS4NCj4gPiAgKiBBZGRlZCByZWdtYXAgcGFyYW1ldGVy
IHRvIHJ6X3N5c2NfcHdycmR5X3B3cnNlcV9pbml0KCksc28gdGhhdCByZWdtYXANCj4gPiAgICBj
YW4gYmUgcGFzc2VkIGFzIHBsYXRmb3JtIGRhdGEuDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvc29j
L3JlbmVzYXMvS2NvbmZpZyAgICAgICAgICB8ICAxICsNCj4gPiAgZHJpdmVycy9zb2MvcmVuZXNh
cy9yOWEwOGcwNDYtc3lzYy5jIHwgIDEgKw0KPiA+ICBkcml2ZXJzL3NvYy9yZW5lc2FzL3J6LXN5
c2MuYyAgICAgICAgfCAyMSArKysrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9zb2Mv
cmVuZXNhcy9yei1zeXNjLmggICAgICAgIHwgIDIgKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvcmVuZXNh
cy9LY29uZmlnIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnDQo+ID4gaW5kZXggZmRmMThl
ZDJkZmMyLi5hYjFjMjVmYzI2NTYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvcmVuZXNh
cy9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnDQo+ID4gQEAg
LTQ4NSw2ICs0ODUsNyBAQCBjb25maWcgUlpOMV9JUlFNVVggIGNvbmZpZyBTWVNDX1JaDQo+ID4g
IAlib29sICJTeXN0ZW0gY29udHJvbGxlciBmb3IgUlogU29DcyIgaWYgQ09NUElMRV9URVNUDQo+
ID4gIAlzZWxlY3QgTUZEX1NZU0NPTg0KPiA+ICsJc2VsZWN0IEFVWElMSUFSWV9CVVMNCj4gPg0K
PiA+ICBjb25maWcgU1lTQ19SOUEwOEcwNDUNCj4gPiAgCWJvb2wgIlJlbmVzYXMgU3lzdGVtIGNv
bnRyb2xsZXIgc3VwcG9ydCBmb3IgUjlBMDhHMDQ1IChSWi9HM1MpIiBpZiBDT01QSUxFX1RFU1QN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOGcwNDYtc3lzYy5jIGIv
ZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOGcwNDYtc3lzYy5jDQo+ID4gaW5kZXggOTBkYjlkMzgz
NTM5Li5jZDEyOWM3Mjc0NjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvcmVuZXNhcy9y
OWEwOGcwNDYtc3lzYy5jDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9yOWEwOGcwNDYt
c3lzYy5jDQo+ID4gQEAgLTc2LDYgKzc2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByel9zeXNj
X3NvY19pZF9pbml0X2RhdGEgcnpnM2xfc3lzY19zb2NfaWRfaW5pdF9kYXRhIF9faW5pdGMNCj4g
PiAgCS5kZXZpZF9vZmZzZXQgPSAweGEwNCwNCj4gPiAgCS5yZXZpc2lvbl9tYXNrID0gR0VOTUFT
SygzMSwgMjgpLA0KPiA+ICAJLnNwZWNpZmljX2lkX21hc2sgPSBHRU5NQVNLKDI3LCAwKSwNCj4g
PiArCS5wd3JyZHlfcHdyc2VxID0gdHJ1ZSwNCj4gPiAgfTsNCj4gPg0KPiA+ICBjb25zdCBzdHJ1
Y3Qgcnpfc3lzY19pbml0X2RhdGEgcnpnM2xfc3lzY19pbml0X2RhdGEgX19pbml0Y29uc3QgPSB7
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3JlbmVzYXMvcnotc3lzYy5jIGIvZHJpdmVy
cy9zb2MvcmVuZXNhcy9yei1zeXNjLmMNCj4gPiBpbmRleCAxNjFlOGMzOGVlYTYuLjc5YzZhZjkz
NDcyMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2FzL3J6LXN5c2MuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvcnotc3lzYy5jDQo+ID4gQEAgLTUsNiArNSw3IEBA
DQo+ID4gICAqIENvcHlyaWdodCAoQykgMjAyNCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+
ID4gICAqLw0KPiA+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9hdXhpbGlhcnlfYnVzLmg+DQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvY2xlYW51
cC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gPiBAQCAtODQsNiArODUsMjIgQEAg
c3RhdGljIGludCByel9zeXNjX3NvY19pbml0KHN0cnVjdCByel9zeXNjICpzeXNjLCBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXQNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4g
PiArc3RhdGljIGludCByel9zeXNjX3B3cnJkeV9wd3JzZXFfaW5pdChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCByZWdtYXAgKnJlZ21hcCwNCj4gPiArCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBy
el9zeXNjX2luaXRfZGF0YSAqZGF0YSkNCj4gPiArew0KPiA+ICsJY29uc3Qgc3RydWN0IHJ6X3N5
c2Nfc29jX2lkX2luaXRfZGF0YSAqc29jX2RhdGEgPSBkYXRhLT5zb2NfaWRfaW5pdF9kYXRhOw0K
PiA+ICsJc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXY7DQo+ID4gKw0KPiA+ICsJaWYgKCFz
b2NfZGF0YS0+cHdycmR5X3B3cnNlcSkNCj4gPiArCQlyZXR1cm4gMDsNCj4gPiArDQo+ID4gKwlh
ZGV2ID0gZGV2bV9hdXhpbGlhcnlfZGV2aWNlX2NyZWF0ZShkZXYsICJwd3JzZXEtcHdycmR5Iiwg
cmVnbWFwKTsNCj4gPiArCWlmICghYWRldikNCj4gPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gPiAr
DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgcnpfc3lzY19tYXRjaFtdID0gew0KPiA+ICAjaWZkZWYgQ09ORklHX1NZ
U0NfUjlBMDhHMDQ1DQo+ID4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDhnMDQ1LXN5
c2MiLCAuZGF0YSA9ICZyemczc19zeXNjX2luaXRfZGF0YSB9LA0KPiA+IEBAIC0xNDksNiArMTY2
LDEwIEBAIHN0YXRpYyBpbnQgcnpfc3lzY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiA+ICAJaWYgKElTX0VSUihyZWdtYXApKQ0KPiA+ICAJCXJldHVybiBQVFJfRVJSKHJl
Z21hcCk7DQo+ID4NCj4gPiArCXJldCA9IHJ6X3N5c2NfcHdycmR5X3B3cnNlcV9pbml0KGRldiwg
cmVnbWFwLCBtYXRjaC0+ZGF0YSk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7
DQo+IA0KPiBIb25lc3RseSBJIGRvbid0IHRoaW5rIHRoaXMgaXMgd29ydGggYSBzZXBhcmF0ZSBm
dW5jdGlvbiwgY291bGQgaGF2ZSBhcyB3ZWxsDQo+IGJlZW46DQo+IA0KPiAJaWYgKG1hdGNoLT5k
YXRhLT5zb2NfZGF0YS0+cHdycmR5X3B3cnNlcSkgew0KPiAJCWFkZXYgPSAuLi4NCj4gCX0NCj4g
DQo+IEJ1dCBJIHdvbid0IGRpZSBvbiB0aGF0IGhpbGwuDQoNCk9rLCB3aWxsIGZpeCB0aGlzIGlu
IG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBCYXJ0DQo+IA0KPiA+ICsN
Cj4gPiAgCXJldHVybiBvZl9zeXNjb25fcmVnaXN0ZXJfcmVnbWFwKGRldi0+b2Zfbm9kZSwgcmVn
bWFwKTsNCj4gPiAgfQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL3JlbmVzYXMv
cnotc3lzYy5oIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9yei1zeXNjLmgNCj4gPiBpbmRleCA5MjFl
ZTBkMjZjNDcuLmU1NWYzMjU4ZDcwMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5l
c2FzL3J6LXN5c2MuaA0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL3JlbmVzYXMvcnotc3lzYy5oDQo+
ID4gQEAgLTIwLDYgKzIwLDcgQEANCj4gPiAgICogQHJldmlzaW9uX21hc2s6IFNZU0MgU29DIElE
IHJldmlzaW9uIG1hc2sNCj4gPiAgICogQHNwZWNpZmljX2lkX21hc2s6IFNZU0MgU29DIElEIHNw
ZWNpZmljIElEIG1hc2sNCj4gPiAgICogQHByaW50X2lkOiBwcmludCBTb0Mtc3BlY2lmaWMgZXh0
ZW5kZWQgZGV2aWNlIGlkZW50aWZpY2F0aW9uDQo+ID4gKyAqIEBwd3JyZHlfcHdyc2VxOiBoYXMg
cHdycmR5IHJlZ2lzdGVyIGNvbnRyb2xsZWQgdGhyb3VnaCBwb3dlciBzZXF1ZW5jZXINCj4gPiAg
ICovDQo+ID4gIHN0cnVjdCByel9zeXNjX3NvY19pZF9pbml0X2RhdGEgew0KPiA+ICAJY29uc3Qg
Y2hhciAqIGNvbnN0IGZhbWlseTsNCj4gPiBAQCAtMjksNiArMzAsNyBAQCBzdHJ1Y3Qgcnpfc3lz
Y19zb2NfaWRfaW5pdF9kYXRhIHsNCj4gPiAgCXUzMiBzcGVjaWZpY19pZF9tYXNrOw0KPiA+ICAJ
dm9pZCAoKnByaW50X2lkKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqc3lzY19i
YXNlLA0KPiA+ICAJCQkgc3RydWN0IHNvY19kZXZpY2VfYXR0cmlidXRlICpzb2NfZGV2X2F0dHIp
Ow0KPiA+ICsJYm9vbCBwd3JyZHlfcHdyc2VxOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIC8qKg0KPiA+
IC0tDQo+ID4gMi40My4wDQo+ID4NCj4gPg0K
