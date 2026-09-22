Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798F49E5DD;
	Tue, 22 Sep 2026 05:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056051; cv=fail; b=sb/YTWUAQx4L7G6poLlQfONZHzFHPPDc4xZYW21cOmZmsYmbHD+ar/MlYblNLbPi72B/ZNG9rmdGS1aheGgKG/74pH6D/Zncm0S++3PaDf34fp+SkoAXlhex7/i7psCW7idvx04UtzvfgR3EUinekteX8dShWqiF8eQvdf8e1/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056051; c=relaxed/simple;
	bh=tRSMeEGDoCIyJ1ykb/92ptRu4V0vo2Ja1B93m+meQN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DKeN4I25n8AfMcexakbX0srHif9Go74SaGHJVj+OL0ctbRkmgXBl3qTXXaqMVYEvKN7dZoLr//ggrbCcEs8TRlKN3JOCt3OsPKuSg9dDqF2Tny/YE+rA5apN19uIZNIW3SVDhchYOOuAVnsBVs/BfMM37+oRjqZI/7kTTsp2MJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Z0+A3hJ8; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Z0+A3hJ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNEHSgzycc/vc/3GQr/gxEthtpl3wZ/LBVnkW+y2ljNuBy5RYI3u5KTyUCCd/FAX/xz2u/BS0McNuKXUcENGLaVlxPTLI62WE670WdEEYxPPJIynBAPjeHQnzuchdjp/IZsntk4fhU1XyyJuoody0iqftCXL5R8B0NP26QsFpfgHcpxkFTqpxcvY1SD8WvydGIRksJjmzUYnTHcf1Iz/XeISBD38lebb3VSGRLu6W4rcBp0yvcTEw3hkTxlk0EBdMx4loGDL7a0QvuMTt+wSTt8pCzXXncDwErCFAUNbLyx4w/GMxzNFbYf5NRY7BN7FIxp8hp2wzqdsQcKn/R8a9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRSMeEGDoCIyJ1ykb/92ptRu4V0vo2Ja1B93m+meQN8=;
 b=kT9fIHXkGGaoSOsTNmUt+CzDOGzBiC8wshGcPTBodNRfZ/gA14aUKUAKbqJqPFi8Fx7q0deiCVJPSKpJqR8v/YAXml/kdK+QqF8v+lGF7U6QIhtR+lqDQOgFWzsIZETQmDlDTFdkyQUG7CkeMNuyyaPmQjK9C358fU9qYCVQnAq1r4y5X3Q48C5VNA7VIXHhgIivctipVNxSOgNj+h9zRdt44WT3QYNBQYHMxkvcaKJuR9BHTwwL7kkMogy+hR8nPpDJ8/2fNlM1FRPOdEEtEUagzmzJSRkRZKx2+Kb13COKKlzO+Dp+zygwE/djrhZox7cACWmS61AYq9TrEk0K8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRSMeEGDoCIyJ1ykb/92ptRu4V0vo2Ja1B93m+meQN8=;
 b=Z0+A3hJ8+uk50Ht+fse/54MO3NVsEDue1VPRmMu5HKvrxN2kbHAqfHinSnZ8TO6Q+zyyk5JZ22mY7IZWG75+v9xhgliKeCXiaSDvhKnW9YHB3vJTuY5qD4oTLlOZr+iX7H1foMdLQIgiaVVCIK9b4bYRO/t53wKVSqpxk7nnLK4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9475.jpnprd01.prod.outlook.com (2603:1096:604:1d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Tue, 22 Sep
 2026 05:47:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 05:47:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "robh@kernel.org" <robh@kernel.org>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "open list:PIN CONTROLLER - RENESAS"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 7/8] iio: adc: rzg2l_adc: Add RZ/G3L ADC support for
 TSU
Thread-Topic: [PATCH v3 7/8] iio: adc: rzg2l_adc: Add RZ/G3L ADC support for
 TSU
Thread-Index: AQHdSkrRXf/ga3TiJUi+8EV5HIPYKLbaBMoAgAAHoiA=
Date: Tue, 22 Sep 2026 05:47:25 +0000
Message-ID:
 <TY3PR01MB113462F1F074F0B0E078832DC86832@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com>
 <20260922042707.116378-8-biju.das.jz@bp.renesas.com>
 <20260922044152.D2BCA1F000FF@smtp.kernel.org>
In-Reply-To: <20260922044152.D2BCA1F000FF@smtp.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9475:EE_
x-ms-office365-filtering-correlation-id: 4c82fbbf-b5bd-4d69-a51d-08df186cfad4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 tUNe39uVMYcOlbXTyXoJPtL+64n5/RQzvvIcaeCw5bhPG/aWDQTQWMtBkr9VMngqeYTsuQ/qG6OJJ1zVD1uE3n555BtHzG3B9M7+PSE5hmyCDF520SzCsgk/nNLmHPKFCGavU3S4KAbvd4KrLhF7w/psHPpqGboK1JGPNTshsknq+rYS1WkieKUek4+QW/02w7iBOBcxzvYw/bhNbkcDt5F/NI0bA9l0nwvKEy0USJ4SFPwl7N5Pgu5Z9Y2uCZa9hYkA1YPcPUl5JBRTrDAoz8y1B7RHJdUPL8jHhwVYHhd5iD2WAd3aYM0mQa6RvbNqHvKjJxumw7/rIcikB0iJqLLZ/fk9XMxU+4vMfqxOQT5qfPPBtdd/sfP4wqaiME2kUSIrIqB62a939KqsjPN8t/RVx0bFvFPHMyN6S2sS6z1vLQgDwuK5ngksXoIka84xsuh6SNP8SGrgTYGry74efguzbAF3jouHFvEdpp+bktdtqFCNovrKumKSCaBtVPwQ/0FlEeF9pBvom2jEbtfezzW+TPtor2wcPDEY87WgEwcbkwAYMcvTR0SJL5IfQeUTATXLl3l7XTreXyvOaOuX8w2uGL1j9j1b1rb0xT63YWkyVMuE0IsVSR+vQPvsNDM8tOd1Yq7bUlLtIgvX9RYUT8ocG2cyplEaAUiVLaFg5fH+b0lp0IuL9ah81QT/GKqGH/EWWmhMEtRWs+X5C840Qao4W/1ANb2x5+lu9BuQk9Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmJzM3Q3cmR1ZkpaeFNqeGpCZmJMVTRDeks3L1NiM3hFdTA4QVhFQ2o4YitD?=
 =?utf-8?B?eXZRN08vU1pBK2RRamFQYW5DWjBIcUN0ZUtFODBjK2I5TnBvQVkyZGN1TWJQ?=
 =?utf-8?B?STRFbmpKVG1TTkZTRzhwdkhMZXlnekxiOWFveXFXMnpVMmNlZi91aWY4a0lB?=
 =?utf-8?B?YzlOTEdlNHMrNzVhd3FYKzh6cUh1Qlc2REFwMEIzbjNxSk9CRXo3Nk5Lb0s3?=
 =?utf-8?B?RGR4MWpEU1d2bUpicFhHWkxmN1dXNnQ3MnVLRFpsVzZKSVQ3YXd4NEtIUEY4?=
 =?utf-8?B?dEdtUzZ4clhvRUJJTTF1YjI1MU0wWWtUYnNoNGVWb1oyWE1rd1BWZURpT1Ax?=
 =?utf-8?B?YXVCR1A5d2taTGxmWkdhYnpqckFKUzB1SnJUK3F2d25vTnlHT2pwRm5qVUNJ?=
 =?utf-8?B?VkdETzNYQWZYa2Z5L3EyaEVqNE03bmdUc1dmMzlnbFl6ZmpvUXZrVDdJaEpi?=
 =?utf-8?B?TVVYMU9GcisyRTRrMGVrQmNJcDhHa2kyR2RpTWQ3TkF3YzRWd3RmRmRPRHFK?=
 =?utf-8?B?LzBTYzBWcEwxSFFvSHVhcnpaOFkyZEdMMmEwdlhSdlJ6UkFHbUtPN040amVV?=
 =?utf-8?B?WTgxaEozNXhKNXdPVC94RG1qVG05cXMvVk1WUHZhLzlZMW8ycjNPR28xTXBX?=
 =?utf-8?B?WCtqWmJqaFo3ekVJQktIZzgyTS85Qnd1MU12TDVqWHJoNDhVNWF3WSs0b1BX?=
 =?utf-8?B?c3ZLRUF1ZFAyb2VuRnNxUS9PSGsrSWU0WElSWkxJbWd2aTRhLzlrQW4zdVVD?=
 =?utf-8?B?R2lkRmFYMTIwOUowYXIyR3VkUEtQUjJVbjk1Q0FZeFhsbVRjMmFtUmc4MTlz?=
 =?utf-8?B?M292cWdvdGtvbXVyY0IxRCs3Yzd2OGxLYUxWbVZKSFkxam1yKzJHYVlqSkJ5?=
 =?utf-8?B?MUxNcGVkMVlRQUIyK01BTjF0clhCeDhPc3VlM0d5SXlyTUtrcEtVdFEwQTlM?=
 =?utf-8?B?cWkyT1dUdkc1MXBuV0E2Vk5RUzlPNGVzT2lUallucTJ1UFBMMTRjYmdOZDND?=
 =?utf-8?B?ZkZUT3JvZlN5cUREMXVManBLSHl3VEtsL2M4N09UdHdGTXE4d0tybzF0NTBM?=
 =?utf-8?B?REt0dXM2NUdSSWpwUFdMcHpJZjZIdklnOTh3YWt5VUJGN0JYR1h5VUZwVFFB?=
 =?utf-8?B?WW1nNlp6ZUxzR1BsN3Q5WXRjLysrOFh1YzVrMnhObjFzYTZRQW5rK1lJdWZP?=
 =?utf-8?B?dXRDY0ZmYllNaGU2M2dpcHdKd29nZHhCdGc2U2UrNGYxUUcwZTBYTlhUbDhX?=
 =?utf-8?B?andWRURjMTZpVHlWbEx0bUtvWjdHT2txem5iUmdEUDZFWmdGdzIrUnU3eGxV?=
 =?utf-8?B?SmhoZmFBeHh5eVlRWWFid2NZZ0YxZ1gxWndiSGRIZWd5SUhJYms2RFB3M0NP?=
 =?utf-8?B?M2x1V3doZmxHZHJCL01RNE1zK1V0TGpNYUY2ZGltQjJSbWFTZFBuZ2NiVUZO?=
 =?utf-8?B?RkdTRFRhM0RxV1dPNkdaUkZiSFBZZEREOW9TcHRyRHVNd1JzUGRySnlvQjRS?=
 =?utf-8?B?WWFwQWxuL1N0RkYrUGtZOUdBd3J5V1dEMG50NThvTVNucFNhUS94ZXUreWh3?=
 =?utf-8?B?VENaRTZQdU83aDE0QTBDdGtUYk1zYVZ4djZTdGVTUVozK1YyczhtVm90WXdM?=
 =?utf-8?B?ZUs3bDhqUUlZYmVxaXZHbzRLbFU1Szh1VWJmcVJDaURGdmJ4b1hwa1crelNB?=
 =?utf-8?B?cEZSOVhmZk52SjRCKys5eElnVnBFa0x3VzRZbjRQYlBSelF5N1QybUNINkRa?=
 =?utf-8?B?S1hNMDhCU05YekxSQ1oxeDJQeVlwZzJhSFliam1ZcE1wRFBLemllZEpwZ0l2?=
 =?utf-8?B?NXJxNDkxejk5V3d5NHMrOU5xRnBxa3ZYTHp5c0dIMW9aTU5VeHUxN1IzYk91?=
 =?utf-8?B?T1pQTk9iMWZKRGFJZUVaZFg0SG1NMVk5cUtQUmlEMnRPbDhWYXZiUG0vT2dl?=
 =?utf-8?B?R0lnM01nTHJMYWFZOGNSTURBVlZET1lMY3lKSkpuRURGWjBqVllyMi9jVzVQ?=
 =?utf-8?B?a2gvL2FSQUFPRXdCbUEzL0RQTWNjdHNRQVkwY2FWa2oxSFQxeVZvMC93ajdr?=
 =?utf-8?B?WkE0NjlrL1NNSXNGTEVEb2NGcjRxUHN1QnAwMlZGaFZ5aXVSYXhhcFRxT1R1?=
 =?utf-8?B?eXpvU2xpc1BGTjJmQzA4SjgvdVJsTk5vVVJpN24xR0haKy9FMklEQzRoRVdR?=
 =?utf-8?B?RS95SktNTTJ3RlZYN3RnY0FKKzBPVDF1Z0xzVzhnRlJBWHdhRE5TbWhFYVdT?=
 =?utf-8?B?Z0dPeXZUeUdDZ0dGeHI0YVdpUEJiTU4zdTl0bjU1Skl1UFZqM2ZNZjFJWVps?=
 =?utf-8?B?UHVJTGJIdUJSenltRXdiYkhveXV4djFNYVNpekxLQmExWWs2TklOZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c82fbbf-b5bd-4d69-a51d-08df186cfad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 05:47:25.3073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pVNpyfF9bAhC2jeclla6JlCw+vGoxZDJEhD8M1prJgE1ABHw/N2k304S81HbBdRNYvVHMGtsByVZaz3e+lfm0Q2Qj4KyW9uXwTGPRZq6WQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9475

SGkgU2FzaGlrbywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBzYXNo
aWtvLWJvdEBrZXJuZWwub3JnIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBTZW50OiAyMiBT
ZXB0ZW1iZXIgMjAyNiAwNTo0Mg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDcvOF0gaWlvOiBh
ZGM6IHJ6ZzJsX2FkYzogQWRkIFJaL0czTCBBREMgc3VwcG9ydCBmb3IgVFNVDQo+IA0KPiBUaGFu
ayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBv
dGVudGlhbCBpc3N1ZShzKSB0byBjb25zaWRlcjoNCj4gLSBbSGlnaF0gaWlvOiBhZGM6IHJ6ZzJs
X2FkYzogbWlzc2luZyBjaGFubmVsIHZhbGlkYXRpb24gZm9yIFJaL0czTCBBREMxIGNhdXNlcyBz
dGF0ZSBsZWFrcyBhbmQgcG90ZW50aWFsDQo+IGNyYXNoZXMNCj4gLS0NCj4gDQo+IGNvbW1pdCA2
YTMwYTczMTYyOWZiNWJhYjU0Zjk3NmQ1YzAxYzlmZDVjMmQ4NDMyDQo+IEF1dGhvcjogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gaWlvOiBhZGM6IHJ6ZzJsX2Fk
YzogQWRkIFJaL0czTCBBREMgc3VwcG9ydCBmb3IgVFNVDQo+IA0KPiBBZGQgcmVuZXNhcyxyOWEw
OGcwNDYtYWRjMSBjb21wYXRpYmxlIHN0cmluZyBhbmQgaXRzIGhhcmR3YXJlIHBhcmFtZXRlcnMg
Zm9yIHRoZSBBREMxIElQIG9uIFJaL0czTCwgd2hpY2gNCj4gaXMgZGVkaWNhdGVkIHRvIHRoZSBv
bi1jaGlwIFRTVSAodGhlcm1hbCBzZW5zb3IgdW5pdCkuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lpby9hZGMvcnpnMmxfYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvcnpnMmxfYWRjLmMN
Cj4gPiBpbmRleCBhYWY3ZTJjZWZmOGFiLi5jODkyZTM1NWI3Mzk4IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvaWlvL2FkYy9yemcybF9hZGMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9y
emcybF9hZGMuYw0KPiA+IEBAIC01MDAsOCArNTAwLDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cnpnMmxfYWRjX2h3X3BhcmFtcyByemczc19od19wYXJhbXMgPSB7DQo+ID4gIAkuYWRpbnRfaW50
ZW5fbWFzayA9IEdFTk1BU0soMTEsIDApLA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgcnpnMmxfYWRjX2h3X3BhcmFtcyByemczbF9hZGMxX2h3X3BhcmFtcyA9IHsNCj4g
PiArCS5tYXhfY2hhbm5lbHMgPSA5LA0KPiA+ICsJLmRlZmF1bHRfYWRjbXAgPSAweDFkLA0KPiA+
ICsJLmRlZmF1bHRfYWRzbXAgPSB7IDB4N2YsIDB4ZmYgfSwNCj4gPiArCS5hZHNtcF9tYXNrID0g
R0VOTUFTSyg3LCAwKSwNCj4gPiArCS5hZGludF9pbnRlbl9tYXNrID0gQklUKDgpLA0KPiANCj4g
W1NldmVyaXR5OiBIaWdoXQ0KPiBEb2VzIHRoaXMgbWFzayBpbmFkdmVydGVudGx5IGxlYWsgdGhl
IGludGVycnVwdCBlbmFibGUgc3RhdGUgZm9yIGNoYW5uZWxzIDAtNyBpZiB0aGV5IGFyZSBpbmNv
cnJlY3RseQ0KPiBjb25maWd1cmVkIGluIHRoZSBkZXZpY2UgdHJlZT8NCg0KQmluZGluZyBjaGVj
a3MgY2FwdHVyZXMgc3VjaCBpbmNvcnJlY3QgY29uZmlndXJhdGlvbi4NCg0KPiANCj4gV2l0aCBt
YXhfY2hhbm5lbHMgc2V0IHRvIDksIHJ6ZzJsX2FkY19wcm9iZSgpIGFjY2VwdHMgY2hhbm5lbHMg
MCB0aHJvdWdoIDggZnJvbSB0aGUgZGV2aWNlIHRyZWUuIElmIGFuDQo+IHVuc3VwcG9ydGVkIGNo
YW5uZWwgKGUuZy4sIDApIGlzIHByb2JlZCBhbmQgYWNjZXNzZWQgdmlhIHN5c2ZzLCByemcybF9h
ZGNfY29udmVyc2lvbl9zZXR1cCgpIHNldHMgQklUKDApDQo+IGluIHRoZSBpbnRlcnJ1cHQgZW5h
YmxlIHJlZ2lzdGVyLg0KDQpyemcybF9hZGNfcGFyc2VfcHJvcGVydGllcygpIG1hcHMgYXJyYXkg
MCB0byBoYXJkd2FyZSBjaGFubmVsIDguIFNpbmNlIC5hZGludF9pbnRlbl9tYXNrID0gQklUKDgp
DQpvbmx5IGhhcmR3YXJlIGNoYW5uZWwgOCBpbnRlcnJ1cHQgb2NjdXJzIGluIHRoZSBzeXN0ZW0u
DQoNCj4gDQo+IEhvd2V2ZXIsIGJlY2F1c2UgYWRpbnRfaW50ZW5fbWFzayBpcyByZXN0cmljdGVk
IHRvIEJJVCg4KSwgdGhlIGRyaXZlcidzIHRpbWVvdXQgYW5kIGNsZWFudXAgcGF0aHMgd2lsbA0K
PiBmYWlsIHRvIGNsZWFyIEJJVCgwKToNCg0KV2UgaGF2ZW4ndCBzZXQgQklUKDApLiBTbyB0aGVy
ZSBpcyBubyB3YXkgd2UgZ2V0IGludGVycnVwdCBvbiBjaGFubmVsIDAuDQpBbHNvLCBJIGRvbid0
IHNlZSBhIHRpbWUgb3V0IGFzIGl0IGNvbmZpZ3VyZXMgY2hhbm5lbCA4IG9ubHkuIFNlZSB0aGUg
bG9ncy4NCg0KWyAgIDg2LjMzNjcxNV0gIyMjIyMjIyMjI3J6ZzJsX2FkY19jb252ZXJzaW9uX3Nl
dHVwIDgNCg0KPiANCj4gZHJpdmVycy9paW8vYWRjL3J6ZzJsX2FkYy5jOkQoKSB7DQo+ICAgICAu
Li4NCj4gCQlyemcybF9hZGNfd3JpdGVsKGFkYywgUlpHMkxfQURJTlQsDQo+IAkJCQkgcnpnMmxf
YWRjX3JlYWRsKGFkYywgUlpHMkxfQURJTlQpICYgfmh3X3BhcmFtcy0+YWRpbnRfaW50ZW5fbWFz
ayk7DQoNClRoaXMgY2xlYXJseSANCj4gICAgIC4uLg0KPiB9DQo+IA0KPiBBZGRpdGlvbmFsbHks
IHJlYWRpbmcgYW4gdW5zdXBwb3J0ZWQgY2hhbm5lbCBkYXRhIHJlZ2lzdGVyIGluIHRoZSBJU1Ig
Y291bGQgY2F1c2UgYSBzeW5jaHJvbm91cyBleHRlcm5hbA0KPiBhYm9ydDoNCg0KRmlyc3Qgb2Yg
YWxsLCBzaW5jZSBCSSg4KSBpcyBjb25maWd1cmVkLCB3ZSBnZXQgb25seSBpbnRlcnJ1cHRzIGZy
b20gY2hhbm5lbCA4Lg0KVGhlcmUgaXMgbm8gc3B1cmlvdXMgSVJRJ3Mgb24gdGhlIHN5c3RlbSB0
byBnZW5lcmF0ZSBpbnRlcnJ1cHRzIG9uIG90aGVyIGNoYW5uZWxzLg0KDQpPbiBhIHdvcnN0IGNh
c2UgZXZlbiBpZiBpdCBoYXBwZW5zIGl0IHdvbid0IGxlYWQgdG8gc3luY2hyb25vdXMgZXh0ZXJu
YWwgYWJvcnQgYXMNCml0IGlzIHNhZmUgdG8gcmVhZCB0aGUgcmVnaXN0ZXIgYW5kIHdyaXR0ZW4g
dmFsdWUgd2lsbCBiZSBpZ25vcmVkIGZvcg0KcmVzZXJ2ZWQgYml0cyh1bnN1cHBvcnRlZCBjaGFu
bmVscykgaW4gdGhpcyByZWdpc3Rlci4NCg0KQ2hlZXJzLA0KQmlqdQ0K
