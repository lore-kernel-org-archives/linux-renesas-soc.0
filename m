Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8C8283FD4;
	Mon,  3 Aug 2026 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763306; cv=fail; b=WKy6ngRZVTZk2leZmMetpP++KBz0tfHALnBxw7LCu7MGIZT2GoFuppqEpLiYWK1fP8ge3n3Aa+cnZv4hUBXgVUO0vi0FU8lM+6rTtOVJZwrOnA3T4l1DKa04xHKgUYi5OgVSewqbVoOmQyafzXw3Dms9ubka7L5oT4jMDrzqGOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763306; c=relaxed/simple;
	bh=Zy3C7bN0jHdsQmIWYDXE7vg2z0vaPzD2aj7ONhf+BJA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f1H8Te/Na6Sn2UCvaGL79AApuGd309BcLdXvyrvCApnZA00S4DVtUqwLO1+HjoNR8djP3m5wjaepA7PZGJ+IVDlrXpgLbJNTt0vzEzFW0mrYswkXaVLMIIZHFYf0b6eNwcszQb3UrQ3ByV+3fbGseR8jqRxnsfUAs2mzJR6k3Do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dA+hXaUw; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dA+hXaUw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrXoIxYqAEZaelA0kHSZ5Jv0WXzJnAXp1zOzf99t3LEVwBZyI7uz0/tssJDEao2qJCokkUxjrge7VIVtPS5ik0uq57oV7jcIFoZ6m0D+duHl0FFnAv0CF45spUP/SKQgxZtFwdHzRj1h/e+3QWw0+EI7oiZi4UmvPn5ykAhxUG90nJ3laEOiZ136jKCkiBEST6+FlDqLCteIlEaQ4bVCLONO1gmEMUbSOCBw5I90/7AaX13fLpUQSgHkHSluG83F3weY/chbnzEkPf0APdAiL23tjyW/werkHfrHjBnExyZm8onLUuRjkuBBc4tW2NEJ3AYhwElPSMewyaLy7t/7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zy3C7bN0jHdsQmIWYDXE7vg2z0vaPzD2aj7ONhf+BJA=;
 b=Cw042ATTbNQRk1HtD57IKfVkObBVsNSZ+zcoQ8ew73FJJqqvLEz9pYrmq0KCqGoi2es9ZPIKVg+sXv2sarMQdkEtFtG+8VrGw+Ip0+i+6ac7BOCvOlS19fLJexcnnfIGDgPN2rRwGGXMv5FzciuXMrR+etqbKgspyrHlMfzJgzBnZ8bnNRXpMd8c5ePXrlh8Yz9fOqZ0TyTJNEtkSxid4BRdv5uoI7f7j4wF8vHA8PUKytneqrdzt49Vs37j2XpP2nzw92IIpR4i6zJgwkHUVaeDR3HSlEofKhiJP2QF1sS1FmjnnDuB39prVictf9fUAFQOfntyMICrvb56d/L7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy3C7bN0jHdsQmIWYDXE7vg2z0vaPzD2aj7ONhf+BJA=;
 b=dA+hXaUwcOkNkgjWiPb2Q8rUZmWlJvM6wCi6xZ9a9IRolU/GwJL8v/PNZLz+bwFMP8l37UPB0AO+hgqxj+I/zwhLKS/VuI6sF7Frh08q8F8pwaSVwd3sfqpGlUmiFek+MkOSvtBYwsMGRLjZbGyrxesonwjcFjxEkXjtrBgBr5w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12795.jpnprd01.prod.outlook.com (2603:1096:405:160::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 13:21:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 13:21:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Felix Gu <ustc.gu@gmail.com>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: rcar-gen2: Fix double of_node_put on phy
 creation failure
Thread-Topic: [PATCH] phy: renesas: rcar-gen2: Fix double of_node_put on phy
 creation failure
Thread-Index: AQHdI0kT7ZtcEOhbm0KC8pOlV6ALULaMTw/A
Date: Mon, 3 Aug 2026 13:21:29 +0000
Message-ID:
 <TY3PR01MB11346A09428478C8C70BF50FE86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260803-rcar-gen2-v1-1-9aa35c36d7d7@gmail.com>
In-Reply-To: <20260803-rcar-gen2-v1-1-9aa35c36d7d7@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12795:EE_
x-ms-office365-filtering-correlation-id: 9bd3b316-40a4-4652-545f-08def16220cc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|38070700021|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info:
 4hyzCWH7oYIM5EKUnIH4MI/KGpXKlu0M0KFiFwVDrDRh+kBuasStcuhRVveKhyWbdIZxqYflZdP3CUSRxQqIz4HPzGKSBVEns6IcNbkwP2u74dOncgaLH+zv1l2njwtDeElGJAfkoW369MX2WvOQs1NLu9rnNqOwt/Fq/ekuMCLKsxU+N55RTL6HKure1gJNjxOiMvrHGAW40qeN2ovr15U905hFsISzynkgalSbHyaFeUIymtWKPCCzYaQTnsAyznxktU5ASBrVa8M31XdKPmwRCJRBnMyZubTvTNa0dowKvRXmDPnPfbo4vN2bsu6gqqhq8alWyIi36z9rE38YoJXCSE9OG0g/J/AX4D/5osezI4SqpHXJSRZsELxWfA77uhk+XS2ZmwY0VU+LalzeAfj9HL/2PDXqdAAajjpdnJNA0puhmzzIsfcMSg606rRiaEGTqbUkcpj+cJDqvMRWf372Rfim/z90/wRcJ19G6uTFixUBS6Q/bM203/Eu9thPPl61WkgdEVnf1+HAxEMp//UprkA9ul6qRoMpj3Zd2jdzMMDi2CueWxE+8LqcDhE+rCn8CrFJ0WaqxU/WZFoIE87ibYMjEe6NaO964E5o8SmU8u9kYdFzqqV/Fyf6ht26ufNY1tCKYGrAd/mnywrIMoLKPxV04z/+eglVOwzkQ/M3A6y9aMhh1dO3KrC1NrG5KTCs6tPyfGz+RF9kwR+BwO+m/9bq2lhnesqk+157ijk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VEpTNXhOVVdCQ2ViMER0V1dnY2VNUFpOT2hjRXd3cmhCNnZzaDlHVGVXUHNi?=
 =?utf-8?B?T3hKVDhxR095U1JvV0pqbkp0MW5GbGRqZ0ltUC9OT2ZhR3Y0eHZnSE44RERX?=
 =?utf-8?B?RjdNZGJHVnUxRFFidm9heTl0aDFZaHVWdzlnWHhOZ2FqTnlOdldZbEZscGJj?=
 =?utf-8?B?NkhLY2o5SnZSanNKek1nKzk0eWlvOUxoMFJKSktKUDcwdTFKRjR3RlZMb3ky?=
 =?utf-8?B?ZVpXbERZUUc4aHdKb2p6aXFMTVAxU21pSkVUM2sxZFpxN3l2OWx1cndlcURP?=
 =?utf-8?B?MnBweDd4OU1mWCt1WDdUTG1CZ0t6UXFDYWhPSWtWRXc5eWYwZE16aTcrYysz?=
 =?utf-8?B?bUdPcmVwUGxmYVBKU3lDeGtEMlNqQjBnVE4vNzNGRUxSSjFOZG1uaHhHUFk5?=
 =?utf-8?B?WTFyckwwZ3FzQTIrS3hOZGJWWGdoRFVYaTJJZFVGRC83NStGR1hkTHVER3li?=
 =?utf-8?B?RzdjYVUxUmEvaTV4RzB1SVFubXBPVFFpazhnUGtWcTJ0M2lzSjUxakYvSVlk?=
 =?utf-8?B?cnZLWVVhR0NhSmpjV21pYWpJVUdPclR2bzQxRmo0cVBQdm0yOGlKTmlRNHdr?=
 =?utf-8?B?NFJRa2RNaHZ3QmgvdEVNYnJXVHhIeTUxSUd3RDduaEhJdDAwZ1VIcFZSUWg0?=
 =?utf-8?B?R3RYZys3RnFzVFptZENiVUhMVWx1NUxrMG9PTEhQUEFzNGpES2hLVThFZUt3?=
 =?utf-8?B?TWVMRnNnWXVBR2dlNDEzREZ4T2xEeVFrTkJGSFdLT1pDdXNVSlFTK0RZVzk2?=
 =?utf-8?B?dERkbFhhUTFTbEFHY0s1bFhBNW9xclZvYm5PeDVWVG83RHk3QmlKSmNQczNJ?=
 =?utf-8?B?OXJ3NWJIaGxWQXR2OGJBSDYyNVVtYnFIZmNPTzlUZHhZQjkzV0VQaVVQWkxG?=
 =?utf-8?B?QXFZNExOTmNnL3NmY05zRm1lMlVLVUZaZnI4aUVteHMrYmVxOHVvVEpFdVl3?=
 =?utf-8?B?Tm1JYjYvUXpmTnZFK2x5WU9RM2crbXVVb1o3bnkrWGpiVVVIZHRtNTNiSTRs?=
 =?utf-8?B?OEJ3bXJyQWRBTTFXMnRpUDMwSk93L3MxMk9JUG15Vk9MRFd0SXI5SDkwL3RT?=
 =?utf-8?B?Mk5sdjl3TzhESEtMNlhnOU5XMUtHa2xZSHhwM2owQ0FuaDdubXlKeERHNzly?=
 =?utf-8?B?VXREWXl1bDdRUlRtRGN4NGg1RmJMbWZiRkZ4NnpORzVYcHZpZzIxUFQxbmhV?=
 =?utf-8?B?VjRYOURQa2YzVkdGR3U5VXpFRERlZk5TZUtHcGcxeWhvbkpkSTdFT0hxZEkr?=
 =?utf-8?B?enRwNldGQUtBWEJScHdvZ01NckppbEorWHpxL0R3WUgrZE5UaWtMUmlsR2Zq?=
 =?utf-8?B?ZWVqU0szWFVUZXBrV0FuMTdRYktaY25lNXgwNG54TEdvNzVIT3dDYUZxd0gv?=
 =?utf-8?B?emhWTVo5WlBWOWowVUJ4bG9RYzZkamxNMmFLODZpVE5mR1VtNFI2Y0xGTWpj?=
 =?utf-8?B?YWRYaDUzQ1FMQ1lORHByVGxObzZEOHM3Z3dWNUxHYkl0dERIUC9iQURiRzJE?=
 =?utf-8?B?Z0lFRUUvczZadFhpbXZQY21pdVlEZnovUFIyWXR1cDFNU2l3Z0NZWnBZWUd3?=
 =?utf-8?B?ME56alVNTG5mbmI5NElVU0tkWkZKbENzcm9VaFVmeHkwMk5UTDBTVTRRcFpJ?=
 =?utf-8?B?R2VVQjduLzJ5M0pWU3l2bytNNjRGcFA1N1NLcVF3a3Qyd3RRdTVqMElGTGtK?=
 =?utf-8?B?V0Q4U1VQZlZGMHhVaWdLQ0tzbDNiOXFqWUdYSG5UalBGaW1PMDY1MmdVWTdQ?=
 =?utf-8?B?NHpQa3JybXJXeXdLYVpVKzMvTUVNN2JUZm5lUVJtbHJaY0J6RnJ6dWZ6MHBX?=
 =?utf-8?B?S3Rva3pkczRsSzQ3STdFUktndC9Ia3JKandQeEZlSDAxbitPUXJ6b3hIMHRP?=
 =?utf-8?B?Q0lOaEtUczdRNFk3SGhCaGllaFZqZnJtRFVtRnRKZHY4TzQ3WlRWdHoyTmtw?=
 =?utf-8?B?dWV6OXNOVVNEa2ZKdzEyRXFoQzQwZWJhcGV2Vm02YXJ4aU5KU3RHKytkdmx4?=
 =?utf-8?B?ZFVSWjJFRjVJMzBGVUw5L2RBZzVWaDhiNDFXczB1WUdDQ0FVSGhvVUcrRkd4?=
 =?utf-8?B?Z1pnMlk5WTk3K1BqNEFIQ2xlbmpzdmp1cTRnV0dqdURBOHBnTjV3SStrYmJr?=
 =?utf-8?B?cmZuMTJ2VmR6MHhnODRYWEp3NFFvUU9BNjN3citnWjhSQ3hBdTVOMlQveEdr?=
 =?utf-8?B?ZU1xTGVmand0UnloTXpVTHJydWE3djAycFE2dHdQMlkrL1RaSEl5V2k1R3dr?=
 =?utf-8?B?UHZnaWdadXZGT1ZEcTgxbFhVcFUyc29rc3EzVE5UWG92TzI4YVQxSk8yRU9O?=
 =?utf-8?B?R0g1TFJ3Mm1FYk92K2ZEWE83OFgxaEkrODZCTm1pZlBWWllJNVRldz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd3b316-40a4-4652-545f-08def16220cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 13:21:29.2217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wilOSd87l9a3vv1GffIrypzZZruKpL0gnc3qws3x532xnAUSmT2QuU+I5ifCaFatVtHeJaetZ7tc3ipLoJDOVRTsQSmnEEbxlef/gVdRTEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12795

SGkgRmVsaXggR3UsDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4NCj4gU2Vu
dDogMDMgQXVndXN0IDIwMjYgMTM6NDMNCj4gU3ViamVjdDogW1BBVENIXSBwaHk6IHJlbmVzYXM6
IHJjYXItZ2VuMjogRml4IGRvdWJsZSBvZl9ub2RlX3B1dCBvbiBwaHkgY3JlYXRpb24gZmFpbHVy
ZQ0KPiANCj4gZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQoKSByZWxlYXNlcyB0aGUgbm9k
ZSByZWZlcmVuY2Ugb24gc2NvcGUgZXhpdCwgc28gdGhlIGV4cGxpY2l0DQo+IG9mX25vZGVfcHV0
KG5wKSBpbiB0aGUgZGV2bV9waHlfY3JlYXRlKCkgZXJyb3IgcGF0aCBkcm9wcyBpdCB0d2ljZS4N
Cj4gDQo+IERyb3AgdGhlIHJlZHVuZGFudCBvZl9ub2RlX3B1dCgpIGFuZCBsZXQgdGhlIHNjb3Bl
ZCBjbGVhbnVwIGhhbmRsZSBpdC4NCj4gDQo+IEZpeGVzOiBiNjRiMzI3OTFmYjUgKCJwaHk6IHJl
bmVzYXM6IHJjYXItZ2VuMjogU2ltcGxpZnkgd2l0aCBzY29wZWQgZm9yIGVhY2ggT0YgY2hpbGQg
bG9vcCIpDQo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjIuYyB8IDEgLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bo
eS9yZW5lc2FzL3BoeS1yY2FyLWdlbjIuYyBiL2RyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJjYXIt
Z2VuMi5jDQo+IGluZGV4IDZjNjcxMjU0YzYyNS4uNWEyNzJlMjVlMDUxIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjIuYw0KPiArKysgYi9kcml2ZXJzL3Bo
eS9yZW5lc2FzL3BoeS1yY2FyLWdlbjIuYw0KPiBAQCAtNDA1LDcgKzQwNSw2IEBAIHN0YXRpYyBp
bnQgcmNhcl9nZW4yX3BoeV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAg
CQkJCQkJICAgZGF0YS0+Z2VuMl9waHlfb3BzKTsNCj4gIAkJCWlmIChJU19FUlIocGh5LT5waHkp
KSB7DQo+ICAJCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gY3JlYXRlIFBIWVxuIik7DQo+IC0J
CQkJb2Zfbm9kZV9wdXQobnApOw0KPiAgCQkJCXJldHVybiBQVFJfRVJSKHBoeS0+cGh5KTsNCg0K
Tm93LCBjYW4gd2UgdXNlIGRldl9lcnJfcHJvYmUoKSBhcyBpdCBpcyBwcm9iZSBmdW5jdGlvbj8/
DQoNCkNoZWVycywNCkJpanUNCg0KPiAgCQkJfQ0KPiAgCQkJcGh5X3NldF9kcnZkYXRhKHBoeS0+
cGh5LCBwaHkpOw0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA0MTU2MDZhN2JlOTM5ODM1ZGI5
YjBkNmI3MTE4ODc1ODY2NDYzNDZkDQo+IGNoYW5nZS1pZDogMjAyNjA4MDMtcmNhci1nZW4yLTE0
MGYwMTRjZDM4NA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBGZWxpeCBHdSA8dXN0Yy5n
dUBnbWFpbC5jb20+DQo+IA0KDQo=
