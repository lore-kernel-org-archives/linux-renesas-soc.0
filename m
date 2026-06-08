Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471303B5319;
	Mon,  8 Jun 2026 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927449; cv=fail; b=a4XZG2IBUzKNG/QAWjFTg4VSrzx3drgwG5GSChwn7Gfro8AVZId1QCb2CCCL45TfosmYVQsGHRILt7W4uTSkn6oYL7CsBeeX7yFrKiCYOyTelVZFzWWPMa2Hk1/uwGiR9uDnv43JZdzcSeAJtmsSFE3mSrCqrq0ckRhh5GSx8pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927449; c=relaxed/simple;
	bh=YhsMYnCI0oBTDllvLM5fimyM9cxjPHoYaymnnVoJ9MA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HtuutQQn+sgJR7vUzMMcqvvPOVBy50MZeTlfgI5CiWGq2sqsC1JRleJfiZI6RK2N/YfMmtPDYupW88cTuM2pP8dQd+UiTMcmiBfkW8Z4BrqooU0Lr6sQTCuAncLIZnSPTbwtGzW4CYZv1ERmOqkyOYvHNWcko1Izo9dZXR028Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=N6VkrGqZ; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="N6VkrGqZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJ0JPimGucPimu0Jh9R4xE7IIPqmeiVc1P+qgQTB+EYO/BizDo7y5kYWE6KhJAkZ+NCARIIEkXFxybmQgfeh7wfvowPOHHJY9rsGMkDYMEysMxvugZtVA380ZgdvCFpdIqHOEc2xhzx6e/F/P588wNbvx8QnVeATrXHCkNIvoMLIuBDP9q4wdfWti2GM1wA0mk2yfp35Rw78GNaYKm0nf5WcENGKbYonBZV0Sz2Pqh4Wa7VR00LRwzLe0qI+WqLOXbKwPfU7IVTFywAKWZVbK4m5qkabJnxXANQTrC7rXJFoD8neBeHARNbk9xCUx7bpfe9NHiXDVA46WFjEbyVCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhsMYnCI0oBTDllvLM5fimyM9cxjPHoYaymnnVoJ9MA=;
 b=f5M8Vi6pPeBuIGWNbgKbS8OzKw+QHM60zjeqKTQl1KsUIOW+XaQmR48ijLtZvZF3QgbWSCjtMsH7R1wwCyYyjg6euxHus3Tw0ZUlma1HruXRFiS7w/zJoG5VJRbvuLk9BYY8mP6JPQPr63PBS0HJ4LPjdWocQ6IXkYqAm2w/sT5Vdvjfw0DBgI5jpwy0rn9aCY1CScSU7lJgW0bxHX0yC93W9RRrJyKAERJywQUGpHw/ITxGCMn02j9TY+WxplMlEHYzFdhuhff6jUn9EtSnWu8764z9qqBEUZVVBdhLkdqdc62Dpgq6baMxt8apKQ5rTO9d3ZTJXJAlAQPDNumJjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhsMYnCI0oBTDllvLM5fimyM9cxjPHoYaymnnVoJ9MA=;
 b=N6VkrGqZEV/F8n4UBPerL0h9EiIUGVeV+2PQeE6u/wraF0iAhvY/uHe/I4mE+9J7ayVwlvaaegqtuKTvMt64S6JT8ZmiPH4d4psPnatgamdr1sH0vY0GDxiV6E3kK3GwX84Yoi+dxJdhVqXPTY5QCuNvi9kSOViMqbAquVpDkAw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB15942.jpnprd01.prod.outlook.com (2603:1096:604:3ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:04:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:04:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Index:
 AQHc9z2t0rzHysclGU226VvULbQLWLY0jbuggAAD0ACAAACVgIAAApEAgAAID7CAABIzgIAAAYPA
Date: Mon, 8 Jun 2026 14:04:04 +0000
Message-ID:
 <TY3PR01MB113466CBF5A413E7B432C19C8861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
 <TY3PR01MB113460B7F122E23FAC4D35502861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c4ae68b7-d423-4714-8415-679671467ac5@kernel.org>
 <TY3PR01MB113461D43EFBA56BAE7C8F403861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5f1b0d7d-3105-4371-a603-7e7bacd5f112@kernel.org>
 <TY3PR01MB113466F579F4093217DAA6B70861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ae311746-b395-403b-bacc-33a52438d704@kernel.org>
In-Reply-To: <ae311746-b395-403b-bacc-33a52438d704@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB15942:EE_
x-ms-office365-filtering-correlation-id: 0f524106-d78d-4f43-912b-08dec566cd07
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|38070700021|921020|3023799007|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 ZlsCF0nwrEnk7I/a45hONFzIYu24Ygsb44hG/MjEsetSsTxiK/ut+Q8mzlKph5b/PubeSxtdqqv0IbwHNQGDTStjs3nXSFy4QzcW03uxHJUXYL3LF9dce2NsHk1VpixkPJsCtfoxrLlvTrT5mdZp11t9t+r2zGb9Res7MfFcvAEMSCOWplAOZRX1ftRLukO6Xc9lrXJW7vIjVVmzSYWFP+tVLT9ViX5bsghYy29h+K47eQiGITSTQfYPE9Mn5I39sZYClZdLMes1cA06B2i913xx6XxLC4vQQZzaD+pDfVt0GgfFmiPar/OMc7QGHtbmZoTapwwvSjtzWOan8MZT3+55TX2ebsIods1kJKTJPzJdJRmKecVbU5HYzxrWzccBGNBbn2x9G8f9JDB0NIm3dGRSxSUb5IcjE0POvZh0Jlx8JWu72kWLcpZlapi3yAFR3OoId6Za/lnHEmcAtdHuko1csb3TJE9ZftAoSpzK9OGuQcyWDScw+NueG1/TPLDXj9g5aoJavuh48Umb3mPvFw1SIL+ptu23D1v31QZMgQEQ0WUJ2UjE1oOl4DOhr3gXb7PGGCAJ9l/eAvTp5nDqtMEmIKqFma0JmTBTptwv3s0iaREDU5r/jdTXD/rf9Fh0OqmgWX3rskLBBuVWJQFSB1mG1e7uik4zeUtaJgnVqw0RhiflmEiLFmdI0SfApjS8Q6hAyWJ0X2x8BvSeoY2qzm7XAbQstmXRpli/74UuE5buEKFg9qJ1lZywhqubN2nbn9h7AoLiEMQ0qRxYiTji6Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(38070700021)(921020)(3023799007)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUI0eG8weHBEb1lFUkZsQVNzZWIvTDF0VzFPd2pseTdkM1FydFhYMS9keGJi?=
 =?utf-8?B?MFBkbkJ4RDFYL3EzamhBUlllSVY4dWZRZzQ4MFFHajg0NzFSYndhZXJvQ2xI?=
 =?utf-8?B?Y29uTUhzMlpVNDNLRFhMaHg3ZE0zdG8yU0tGQWJ0WXVmbUwzY0RJejVaSjNG?=
 =?utf-8?B?eGFQNnZTQnFZR05pRWI3Z0JDbnpnUktBaytyZmxVZklBNWdhRmMrQmZOTFVv?=
 =?utf-8?B?Q2J2ZTFXVmE2YkRlV2pmRC96bjBOQWJ2TjR0NUxITjFxN2YvQ2dMWjdkQ2ls?=
 =?utf-8?B?Um1WWEJMTGZZcnNFM1crSzEzODN2OVduM0xiYWcwdG84TURpMW9DRUVqWXYz?=
 =?utf-8?B?bGtMeUVOem9UMm1Ibzk5eHlTRHhReWRicm9pUXBZVzVzSDdBd1RVZFg0ck1a?=
 =?utf-8?B?dG1kZkJiYmlBVkhpYnJQLzg5WVZjaDRyaDlWS1RIMnh0Tm5XeTRMYlJHT1R6?=
 =?utf-8?B?QkEvaHBZNjFYaW5lVCsydGpQRU1SZjd4VDRmWGY2UDl1aXo3QTNzMFVEYVd1?=
 =?utf-8?B?NVNxd0hwengxMGgwOVVvdzBoRXptYUhjZ3duUFZKdmtKamlHWFBlekpYUC9l?=
 =?utf-8?B?QkgyTzBoTFBGb01kSVNhYmdtQW15YkFPaEZ2Sy9ZL043K1NoRGMwOGkrMEJT?=
 =?utf-8?B?elNTR09aSGNkQ1V4bGY2NS9GY2tPMTljM3FoTEJ2SDgzNnFFemZOZC8yUUVY?=
 =?utf-8?B?cEJxcGVzQkk3elAwV1FvYWdFakxYNVVhYzY3L0RJbDI2WWFKUjZ4a2lHL2Zm?=
 =?utf-8?B?L2Exc2hCRUZtVzV6QkVkSnMwV1JMYk9zY2tQbk8wb0g0RjNlbmdkaFM5RXBI?=
 =?utf-8?B?d0Y3N21mREhBUXhFWGlJSis2ZXYwb2FVVlVadkkwa052NXhWQWZuUnpiQ1BK?=
 =?utf-8?B?ZVZpN1ZBN2VRZGYzWFhoMlNiRXdiYWd5QUFjV2FPZ05XQS9UVlFvNUdIeUdZ?=
 =?utf-8?B?S0I3QUFNbEFmMEtsV0tFZmlYMXlQQmZ3aVU0QUJvQk5aYWx5WXZpZDc1OFRZ?=
 =?utf-8?B?bGtCU05uK0xLdnhqVHNQU1g2dkxpN2lPZzlvZE1OSStTUGc5YmI2QnBTM25j?=
 =?utf-8?B?dnNiZ1ArYkFKMXZ3Rm11cFpYNVlIWDByekZjL3QvRFN3Z1Y4SG9mKy9qS0h4?=
 =?utf-8?B?S0syMFF2eDZ1aWgyVHh6K1RkMjZEYzF6L3U5MFE2dGVZOVJ3NWVvM3hsMWtZ?=
 =?utf-8?B?WTRqbVN3eURrbWJ3dU5OdWtMVWFrdXIzKyt6NllITEFia21nbmczVytZSkpx?=
 =?utf-8?B?d256bXczNVZMOE9BME9XMEhwTTFlaVExK0F0WFcwRm5TNFkxTW9lS25XcWVR?=
 =?utf-8?B?aFpXWlpLb3FsYUtjcFdIQVBwVHlOM0cvTnM5K3dHcXBwc0ZROUdCdWUzbk9E?=
 =?utf-8?B?RnlYbXBrd05kd1ZzVjhrNWpVUUJTRlJoUjgydlVPRmJmSVpvNndZTk85YlJo?=
 =?utf-8?B?b2k4eVZsYkErSzNRY0tnNWRBNTIveXNOWlg1RnAyM0duMGJ1T2lyUUQrVVlk?=
 =?utf-8?B?dXBqQk9WYXB1dXBILy9uSGhOL2RKbXFpWWVpSXRqZnAvVzdteFQvL3paY2hQ?=
 =?utf-8?B?dDN0eFNjOS9DZVhBSEE4QzAxQm00dUZzZ0Q3M1pwK1Q2bnlGUGJKMDArVlhk?=
 =?utf-8?B?NVlmckdnbENhdFFFbytXek5Pd2FDTVJSY0Y5ZWJUM09yNVpEWnMzVHBTNUo1?=
 =?utf-8?B?ak5UQ0g4UzZJTEVSdWZLYVozSEc4ZXpWUjNnaHdCdzlob0RRd1A3UE9rUDZ3?=
 =?utf-8?B?R1M2bWdzOW5HT294RytUblkxRTQyNjdIeGM3TElSVGhObGwwc0pkc2NNcElX?=
 =?utf-8?B?elZNMlJDS0VpR0R1MTBRMzRGcGtBcS9tWi9TL2lMU0RWSmVsZ0J5WXB5UVYz?=
 =?utf-8?B?WDN1MDhXaTVBd09pQWJFb0FRRHpXL0REQ3hkTjVYalh0RkJjT291UllQOWhK?=
 =?utf-8?B?WFc4clZNRGJTOFBuV012MTNEMVFQdWgrMktUOUc2QTdBWmUxb3p0dkpLaEZp?=
 =?utf-8?B?RWJxMnBPMldCRVJFN2Vtemh0eHZoWTUvbGFIZlBsSGhEZUNmdHJJVmJLZ2h4?=
 =?utf-8?B?OXd0SUlFNFhsc01ibEZ6Rm5pekJLU1FQVllScVZJQzUrN2pTbFRONEIyYU1V?=
 =?utf-8?B?NER4WHJuUHp6TldMNHdLMVpTMHJTMTVQdWpRWm1RZERrcFk1SkV3UVVBM1Ux?=
 =?utf-8?B?aE5FOEVrVDBNTHNTdzRWS1VkUmpyREZMd21SMExtU05xQUdldEZYaXNiUHh5?=
 =?utf-8?B?Nnk2d2ZieWtUWTNWUjRFeDEyd1B5MmZld2VoU1FiYTNBSmw4UG1ERHN1Nkpm?=
 =?utf-8?B?L2hoUUZwaVBQcERqeURxT2RRRlFBOHNnY2U4cDBDQTFCYzNMSHRRQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f524106-d78d-4f43-912b-08dec566cd07
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 14:04:04.9723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xD37dMfCV5ByT6B/2jdkGAH8F4rxTpwBO9ENikNHR0HFMVVMbVaZUUVmBuUuoL7RyabeOeruMpfyLBajM0bG2WuBgkTgzkikjDWYAUj4TOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15942

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA4
IEp1bmUgMjAyNiAxNDo1Nw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZk
OiBzeXNjb246IFJldmVydCByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiANCj4gT24gMDgv
MDYvMjAyNiAxNTo1MywgQmlqdSBEYXMgd3JvdGU6DQo+ID4NCj4gPiAgIHJlZzoNCj4gPiAgICAg
bWF4SXRlbXM6IDENCj4gPg0KPiA+ICAgIiNhZGRyZXNzLWNlbGxzIjogdHJ1ZQ0KPiA+DQo+ID4g
ICAiI3NpemUtY2VsbHMiOiB0cnVlDQo+ID4NCj4gPiAgIHJhbmdlczogdHJ1ZQ0KPiA+DQo+ID4g
cGF0dGVyblByb3BlcnRpZXM6DQo+ID4gICAiXmx2ZHNAWzAtOWEtZl0rJCI6DQo+ID4gICAgICRy
ZWY6IC9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMscjlhMDhnMDQ2LWx2ZHMueWFtbCMN
Cj4gDQo+IEkgY29tbWVudGVkIG9uIHBhdGNoIHRoZXJlIGFib3V0IHRoaXMgLSB0aGlzIHByb2Jh
Ymx5IHNob3VsZCBiZSBzcXVhc2hlZCBpbnRvIG9uZSBkZXZpY2Ugbm9kZSwgdGh1cyBubw0KPiBu
ZWVkIGZvciBzaW1wbGUtbWZkLg0KDQpSWi9HM0wgaGFzIG9uZSBMVkRTIGNoYW5uZWwNCg0KUlov
RzNFIGhhcyB0d28gTFZEUyBjaGFubmVsIHNoYXJpbmcgY29tbW9uIGJsb2NrLg0KDQpGb3Igc2Nh
bGFiaWxpdHkgd2UgbmVlZCBzaW1wbGUtbWZkLg0KDQoNCkNoZWVycywNCkJpanUNCg==
