Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795452293;
	b=pClqvLEF5OD7NaY5nm38YCPq/LV4efSKccTJsF8IuJTFJAj7YKXVKdyWb3USdchoaN1U
	 TAAFR4ijT59xQXZI9lQ8pV92nfzizWWyYR0Ifa5jnyTTSXoYQH9wrdTlOi+CeKmEwNNVq
	 IkChL3vhm6NFAGRx/BnFKcwWCJ7RSrF9pU61dcdulWY9WLr2fYBMwLIUSjBGkVvFEP+WY
	 pAO0CeZ3xp59ufB/N/yd+8gqYIpFeg3HYoh86b1LJl1hNa8hP1C0CLPIx4LWmUWVhLxwR
	 XwcsdnX66dBp4zaPBxVV83zYpjxMm3sMQIuuJlDLgjG3LAet0//RdrWEt6oH3xOaubQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452293;
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
	bh=WECHLZ2L+rMU/8lyLvJnngzaHIXI7phJvXMH6KmD550=;
	b=zt9XzUM12NTBZupfPUm9ch14DMxUKR98wHV7tg7rROWjR5fF7N62NHt2FU9Th2XvW3N/
	 0A4kpD2+oJt4IkODO7G7RYJSmUnkozBI/bGmqkT9b1J3/KsHomOc+T9nNkLPlNIWCEZGw
	 +LeI9jfet/6vBJpYEttFyIMv/rQmWVub2rSg+VKOMTcZ44nqoLIwCJB7Xwn+gQD40Jjhc
	 LO2/e2Kl0lWQo8lcxE9/BLjo4y3jfQNsBVpmIhcFjTkK5I3TDnLBE3Fm7NUJ0A+BjTka1
	 KT/LFHLvFbQOF1Rr9r3EkbJE7YrRXQSZ8dROVn19zkHmp/F+b1/HLz8YhM+whC0hPvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=MqMQRdaD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.16
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B45606A31A;
	Mon, 23 Nov 2026 16:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B45606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=MqMQRdaD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HW6EHaqmCxspVtKhGBdN0A7yt2SRijAf/N/ZyaZc5Min5WcF0t671ZaGwrNf8t3lJj/ITVjx3XE4WSG//zpCYmy/BkBhJap+7MzV36ISOTTmvxME++p8OimXassGkTqOweExYSs/TsabmlKgFg4nGSaZ5aJxXApzvDK25G3cSx4mjSQiAuBAecCa41VQW3PLVgd/vd++4TX6QNrQnbfujPFwSws/JBArG/M7xlvVJE5CV5/vSLx4mhbjMIIz8Pxe0lFjENZAztq/7vp0hVrMUEikgxve/2G7klzQrQeyZmTe0X0ri0CdXnTvqHrORuXMIiHeS00LjqPGTsrNxHgUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WECHLZ2L+rMU/8lyLvJnngzaHIXI7phJvXMH6KmD550=;
 b=LwoB8f/v2r7oRX/SkWheh+2+fRDJ27rMwb8zfXuNdU82SjLU+Jm8Nuv2O4xyvVHVxiEnEXcyal51dAs08V5kWvQjS7sNoSNJ5kJEnnjfD1Pbjxrbjbs8KLPZTxorczk3iGBB7x5ov7ySnZOD1JGfsnjdjinvY1anJWXUtRcwVmLIXtaJsYmz0B3gWNk1ccbZgRYqE/jBtF54d54/79Q0wZD1grrhRivXcbzXXiGnRN2CbpvnXLdvvqRaUaLg+Xeju5MXbLu0KPcrPulMX+jdBsWwAbQ2bBLhZ/QTeVbJVagS7y0UPKQp0qMMwEhQAdEdTgKdT7Hp5oK4sd2/vz+Vbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WECHLZ2L+rMU/8lyLvJnngzaHIXI7phJvXMH6KmD550=;
 b=MqMQRdaDSHBG8KvS0h88DaqCH9VYn8WHE6f3X6ag+UqNLh1o0Ru82G2DjQc203S/fOK4cZLMqrmVDID6QWO2t8Jett4MfCgFYn953yimztqlVLctcBe3WUjYw9HKfoarlRtWkaUs/eigtxl8wZG9+rWePVlA//tSe7EbkqerBLA=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by OS3PR01MB7431.jpnprd01.prod.outlook.com (2603:1096:604:14a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 16:44:50 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:44:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 07/12] drm: renesas: rz-du: Share the encoder of an
 output driven by several DUs
Thread-Topic: [PATCH v10 07/12] drm: renesas: rz-du: Share the encoder of an
 output driven by several DUs
Thread-Index: AQHdc2mDy94KmvPz0UCG5Af9ZtEqQLc77Kdg
Date: Mon, 23 Nov 2026 16:44:50 +0000
Message-ID:
 <TYYPR01MB66034C0CF2211D1FED15137F86452@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <cover.1794502191.git.tommaso.merciai.xr@bp.renesas.com>
 <1d149f50391e48dd64355473309fb610ef1c17bf.1794502191.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To:
 <1d149f50391e48dd64355473309fb610ef1c17bf.1794502191.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|OS3PR01MB7431:EE_
x-ms-office365-filtering-correlation-id: e3594b74-5ad8-4834-73e0-08df4981176e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261102123227099003|261026140227099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|38070700021|11063799006|5023799004|4143699003|56012099006|10067099003|261009223027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 6KD54C01UIIa2As09Zcof5pcpFa2WKLWxe8Y2tPHHpwcqIVaRWSHy5+4oeAzBFaXQnCnASaKiI9unavX+DWGi/PekMMv/y1PmMlsaneo4Kl53LMmJyGP4L1c5tGLUsban3xWCK3AG0+H7AnA2YGIjUUNhcEXI38M7NKbuBM2CptWKZtrerWFoQYvuRYDEEZCqajqLQXjt6FU4DCJxKOxsBz2ACRakkcugWCdxUXYRfqzZ6Dii3WQm0aOG4cngb3NJnUw/sFGvX0r4/JMAiHf+tHE+e4D8GcOkKfb3I64JvtIofjeF2J6+uT3JdbCA77WQWs4A7RS+h/S1jpuuGUIzv1B3dFKukPuX48PqVoyKrNRfVSryHsl/X9uMnVHP1NjdZhmwWNmVDm9h12RLYaIKGUyKfqB80dwcgbVwgg/si7wP/yCK23wcquYSPky5fR0dIY9dMsloB6H6Ie/W6TJpBWfeN2lVjQPTav9nSJZ+IlXPhshwvb7dpdPyhEv5QOysWqRMncqY1v7DLQILFRvTLy9M6u1RT7Z21qb9Rquvzx55l9YjtsEVETrPgyKZhgvxpj4O/C00CXptoyymfVzBnarypDS0e78GQren9/nJcW91CRh7xhp2tITA/PnSNL/RUMYwZ80XruKKaiNzDz3V5fcKFazWL9T85saU9jhNbxf4BoOhs2wMEr68Y9DQ5IdQAq2R0sog1qypxrD328Hzdq9mH1KfnJ4GWdr1Nm+k7I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261102123227099003)(261026140227099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(38070700021)(11063799006)(5023799004)(4143699003)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MbUeE8L0LmUy4gVZK5tFtnN3ucCmDQohjI/Cr8Ko8Ni+WcG6DHLn3pVTIy?=
 =?iso-8859-1?Q?W/ZN70tp0cAQcnXJSUYSj68TAi6ihykblgR/0fLoE59jfawFFC+vwh8NOI?=
 =?iso-8859-1?Q?PJPjP0Z0QiLp6dp7+//wSm4yVXProcw6tq4njikyBgXzm0Ne/2TlfiMMY8?=
 =?iso-8859-1?Q?c9OZJLlD/whP7xuiSRg0WG1/w89L4rSoaQnF/hVpCPRVzlSru5nrTQSUoT?=
 =?iso-8859-1?Q?4YoLaL+Sl8o48hGvtKjdENXmpye8utG2QtFLxfUBlfk5wLerFbTBbzKZ7b?=
 =?iso-8859-1?Q?/Gpci1YgMKZ8mUHtulTqCTCxDRy1IiaMwZR9pRlrKUw+R0WbivnLut0kVu?=
 =?iso-8859-1?Q?OXoy1L5onbMXtJ2JSxYFCjd4nODIN9gzWqa35D192rbzcWfsixQnKyXJde?=
 =?iso-8859-1?Q?8hQuNlpMF5uYa25f4S63kG00fP5P5E0XGoN3vNLuAG7a0Ppeyx6gW/Qqlh?=
 =?iso-8859-1?Q?t/bIIGUlaHLe1gadPkXka+6zamy9QjvehGkvDzcRZM9fynAGAFqJZuRLXw?=
 =?iso-8859-1?Q?YdXOvbDgeqqBFYHbfMuzKCRzotD+D+AhUSq40JOCd3+Dlw7gPJp7w3flxX?=
 =?iso-8859-1?Q?1xg6wsCuwQIbM14O1rrJMGeCzFndUrY82OZ+EXUT1XeGO6okNgj7KxndzZ?=
 =?iso-8859-1?Q?0xbzk1YmH4h1yFXH7qdftLqVaQiuTZFdD6obLgLmJkApq8PXvGTKkCaRvU?=
 =?iso-8859-1?Q?bjVyIYu8bxbRAtdgkSXhbKzxzUEYM0M0dPYMfxoCt1x+jYQ1iLBTwCHTZK?=
 =?iso-8859-1?Q?hOIa8FMxUX4lLY6NGppmQUYzYtEyK/zWHw7rymwhJ56AusVhoVug/m3x/m?=
 =?iso-8859-1?Q?mZFK8PJHNJ9R0ixOjXynLYCh0cTvO7PC4TGKR3tHI0ck/kCsC6Inb7LO3x?=
 =?iso-8859-1?Q?7GVjCzEsM9zX5JmzhWmxn4w/ydlKbi9rWY9HsZKJXWRyVmqD5JqoeiVX4U?=
 =?iso-8859-1?Q?9yM3Kogv4MpqbWsnpN7sLae26czd1AsZLytfE12ZZm34QpkkWhFzcj5JQc?=
 =?iso-8859-1?Q?vtNpsjKfGm0tMQugMptCO3vjNpZxnJuhJEVYyBfF/VHDqR59DW5ewXN26I?=
 =?iso-8859-1?Q?Is2dSn2whBWuLNxO9mFXU32KaO9ScEKDOswSKXvZDaeGy2JMaNVAgmy3dw?=
 =?iso-8859-1?Q?EKN7fG1ue86+ElIYU5hfwOtxoeu7GyCKfAwlq+tcnyYX/gP60731R45Sxo?=
 =?iso-8859-1?Q?hFPeKn97NSVH9xiKADv0TtGumFyP0hQCnHuDuwWMyZTvRKr0hO9e3GjpvZ?=
 =?iso-8859-1?Q?u71m+sgYBFZoe2Rl51mOxVdWNlfLjNIiAX+WkszDcqC+79/dQU9LZaTB3s?=
 =?iso-8859-1?Q?9nh+4CVOO3q7G8EXssA48qy3VyS5SS2ZJS7HDA8BqL5UxMzmOpVZ1aofCj?=
 =?iso-8859-1?Q?N2iQpR6VpRfVo+itudMqSaJC3ojoN574FKDDlLtAokAJCHE7uKZ9HASnSv?=
 =?iso-8859-1?Q?h2V3kdNdq0uCQDbhD2S7ETRNjQoD4mco/zyqS8A9E6U2aoEDw3Xw7BvapB?=
 =?iso-8859-1?Q?nl+E3SSBHd7ANkUR3ieT4Plxp57eLWwGgvjMxq5JJd5qWpAllB6qQhzSLi?=
 =?iso-8859-1?Q?mY/N9LreIkorPfrQZxlyTBlYSt31uCS4I5/uZ/kTv6H4qJ3Xh14KVSNO5A?=
 =?iso-8859-1?Q?VInZLWOBjZeOzHDVYgPGgl2J4ZCHxDlCkfwgBwG3/M3MBQ6PvsUgjtJh43?=
 =?iso-8859-1?Q?EjoJU+G8kgyR8XmZKEVEqwfhiz64JE6g5McipbD9uG43N6SEis5KYRHjWK?=
 =?iso-8859-1?Q?k1+QNqC5nWbweGT/wmamI7zABn8uSD7ChcTaN5AMO6d/0TJpEm2oF2LWFh?=
 =?iso-8859-1?Q?adt3sxWYdw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e3594b74-5ad8-4834-73e0-08df4981176e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 16:44:50.1990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RI5wN0w1cz3DcB2E0NMBMcXyi6BgUiD4i53R+0e+8R/5ak+mWYpOLZctKZwmNZgx2GGN36/S4adSOY8taZft7o/jHe79wfDBY6n2BVt4Ff8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7431

Hi Tommaso,

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 13 November 2026 12:20
> Subject: [PATCH v10 07/12] drm: renesas: rz-du: Share the encoder of an o=
utput driven by several DUs
>=20
> On a SoC with several DU instances an output can be reachable from more t=
han one of them, but a
> drm_bridge can only be attached to one encoder.
>=20
> In preparation for supporting RZ/G3E, where the DSI and the LVDS channel
> 1 are reachable from both instances, let the first instance create the en=
coder and the others add
> their CRTC to its possible_crtcs mask, which
> rzg2l_du_modeset_init_finish() then extends rather than overwrites.
>=20
> Without this the second drm_bridge_attach() fails with -EBUSY, leaving be=
hind the encoder allocated
> just before it.
>=20
> SoCs with a single instance are unaffected, as no encoder is ever already=
 attached.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v9->v10:
>  - No changes.
>=20
> v8->v9:
>  - New patch
>=20
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 12 ++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c     |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/g=
pu/drm/renesas/rz-
> du/rzg2l_du_encoder.c
> index 5c21c5f9fbaf..45f980ea3c20 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> @@ -129,6 +129,18 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *r=
cdu,
>  			return -EPROBE_DEFER;
>  	}
>=20
> +	/*
> +	 * A bridge can only be attached to one encoder. If another DU instance
> +	 * has already attached it, add this instance's CRTC to that encoder.
> +	 */

The shared-encoder path returns 0 without creating a connector. That is fin=
e,
but it relies on bridge->encoder=A0and bridge->dev=A0being valid, so please=
 add a=20
comment about that.

Cheers,
Biju

> +	if (bridge->dev =3D=3D rcdu->ddev && bridge->encoder) {
> +		const struct rzg2l_du_output_routing *route =3D
> +			&rcdu->info->routes[output];
> +
> +		bridge->encoder->possible_crtcs |=3D route->possible_outputs << rcdu->=
index;
> +		return 0;
> +	}
> +
>  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
>  		enc_node, rzg2l_du_output_name(output));
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_kms.c
> index 456b29538db9..001c802539e7 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -480,7 +480,7 @@ int rzg2l_du_modeset_init_finish(struct drm_device *d=
ev)
>  		const struct rzg2l_du_output_routing *route =3D
>  			&renc->dev->info->routes[renc->output];
>=20
> -		encoder->possible_crtcs =3D route->possible_outputs << renc->dev->inde=
x;
> +		encoder->possible_crtcs |=3D route->possible_outputs <<
> +renc->dev->index;
>  		encoder->possible_clones =3D (1 << num_encoders) - 1;
>  	}
>=20
> --
> 2.54.0

