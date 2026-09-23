Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E63C7E13;
	Wed, 23 Sep 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160012; cv=fail; b=JqP7JYEn7KDLbUFNWnSNt32DyiE5GXrtYl1V+YA2Ko3ckXHIJyFuy1TVaY+TYpeQLPQzOg6l2M85H/NG9ew4DMTYdTM1SNL3p3sOafYdslfHKam+AeszoZbd9hGmSTN+f+zkwKhg5B2Y44UgwQpkNzx4cFOCYzbZxqAOduG/xp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160012; c=relaxed/simple;
	bh=ZE79ZepsXm+jMaskQwkrtC3mue1TVDK+vjLcqJ1NaNI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QzkziceO6borfmmNVIpDfr2ckrvvR8hALKPLXAd/d0uZmonUNatsBG2l5dazCFYX/yrssLXml2TM4p3emUD+JuZEjgjkVf63A5uM+308zBVcDBH7gwS9Ao3He143oyh1DXEKH6f0QdHQY9o9mrb5qxgei06ZpxGGNiCxzkR3Q5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PwyALHk9; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PwyALHk9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7XQg+GIeXqeqAxHabyOFBToCbCQ0X6CN0RXnANBMidyHTCMlENP/IqOqu74xnJGtEYPP9fAhzBEW5yCssZwbA6G7JwvYH3SgA56/LFZNhARCDPMFQKFLHKPMf5nIP60a6AS74UqWqz5BKl4SqZs6BLrlVQhVOnFuA6AiKVf3VJLUT60Zv/22C37VMIE4lYKDPjB6V9DLSn29r4eiAUTWoCg7yDd4lnAYneT4yFR0MpatXqmlSucx9/Ctp4sPo8oxxIthqgd3jKPRig/VDi62rFrR61Yfesu592peYCK+JnosFO96Rw6RH0m/sQdLj/eVmuoGZsB1WGMwgTgUD+pDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE79ZepsXm+jMaskQwkrtC3mue1TVDK+vjLcqJ1NaNI=;
 b=MooWlmw9jtWGN1BLjEKTHhcwIH+gW3eoHN/GWWQi9vYO08X4Yxuc4FsPvpy0MHghqjnB2HWPjRGAXksHamuKKcLlHxlU7gGmL4EiSl+GJkSeJlE1QiXSYUpt2Bh8++RR7+a/UNrAhJEtsS+z01XQJBS0sJ5f4RCLHwyyo5c6JIZzrGygz0xyPB2Z3ioEoV07eElYFp5a5bPyLH0wd/5ZPzEBkPwn2t1QcA5wVDEG5zx+hO+KoUTIRgL0GYEOkl/bkJBIkeDei9a+d0LX9bmFDIVK1p5rE+mRcrMFn71tHIwGRBfYxgDw9L23cAF/64aovis3uPT6W0gA3xxSyOcp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE79ZepsXm+jMaskQwkrtC3mue1TVDK+vjLcqJ1NaNI=;
 b=PwyALHk9TT1zVEfSRUoX8vz/Raj+YzcOuvvJ5GHC+A537gTl2r/jY+e2/RI0LOpHt4fJQQY1tnZ7cSsx8MS2gYlrvS6iYnYrimAqYRnnuUGurH8DZb2TDN2RbdTFi2y0u6VmxpyREVeEkSoeI4m9qAF+9Uiduq5d32Qqm2nvnCI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13085.jpnprd01.prod.outlook.com (2603:1096:604:332::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 10:39:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:39:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson
	<Chris.Paterson2@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD
Thread-Topic: [PATCH 5/5] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 CANFD
Thread-Index: AQHdScv+inCXpKcCe0mkEFwADyxU3rbb5xsAgAATfOA=
Date: Wed, 23 Sep 2026 10:39:58 +0000
Message-ID:
 <TY3PR01MB113464CD88B130B5C9F17A28786822@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260921131951.187981-1-biju.das.jz@bp.renesas.com>
 <20260921131951.187981-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdVUQiOr1oetds27ovQy_7aYLEwc7GP_wTkokyft9UMy4w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVUQiOr1oetds27ovQy_7aYLEwc7GP_wTkokyft9UMy4w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13085:EE_
x-ms-office365-filtering-correlation-id: 56f5c2a1-8fd4-4e57-6868-08df195f03e8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 FpkMYgW8V2+DXwM6iALO9VBtaYPrZ5ZMhJ5J+Qgumg4ENl7trDVpbGE4GSjiXYSgIixI1+tolEiWPFfKOWv5WbKzAaz+FtXuTq0+aD6nF4j++nU3padQW4hm4fWAWslv3pglnI03jlx0Jst+R2dnd/rxqdpJQcudNZyE/0CR7pw174Bs9e2Bf0CVuRPS1Ev7iZak1zqsfLLmWBxiQiEixxD/4yLkBdflFV6AgRX4lYIXniLxXdouVsBUSOa0EgJCLoXQLWYW0EFFhuhgG4RarYo3zN9oA7z0XbIVA0FXebNsDPSkY7js9jd2uWQnU7QhO78Cy9yDGIJAqHcPVHK3Xh3piHYhv2CZbrHch+XlyZxfsvYbAH3M0vSwPzV/0mltWXOVXm72SL6NZtdhFwM/RfrwT9SLewSr6Gny5uSwZy2fFpM1UdLf2XOcTQ+Ay7NnsYHFHJdybFobH38jjpwnNchSqh5dIhE39LXOgdADztiP7fs+jaOTw6KroPe1FcSlGakysEqlxED1SaNa8W69w8ocYlOilRkxjmgub7a/Klpa4dSsUFIXWsVRXwMRnpi6BGfM9TapTY66PGadKjyYB+gWIo4Xvy4Dj5B1VZIsybMplG7egvJuT0oGh4iHloA5sy0dhdk9QAm/6jaylS/b9jEnvzyA806po25K/jlCtkBN4kAuBNIKu5L/pdzsvj5nU8fjRcLtUSB3MrDB7mK99sjA9aYEdv2vRWL+Xmz6LL8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajNxaWxvYWFjYlNuWnBpUFFtRmo5YUR1NkJZb2VLNnh3NHlZczNKOE1udGd4?=
 =?utf-8?B?c2RoeEdsM0NxbzlNT0RPRE4xUEJDZ1VWL0orTEMzd1hkUUxkeTM4RDZ3b0p6?=
 =?utf-8?B?eHdySy9RbHZvRnJTdXdISWhYOUVTWGN5TDhJb084c0djOGNIS05yVm9RV3li?=
 =?utf-8?B?ZUxMcWtOWUE5TStzSFBqcXhCWFpFM3VoVWUybmE1V1Z5dVJvZjZENE5mUFFu?=
 =?utf-8?B?aXVIeG84MlRiQ3VGa0I1azMva1hteE5VRzk2ZzRaaUVHekJLSHlLZTN1MHVC?=
 =?utf-8?B?MkRTSWNGSWx2M25RR09tT3FWVWtRdjVpWjRMYlN4bmordTVLbnE5WHpKRytq?=
 =?utf-8?B?bStIdGJLbFNWUnF0UnhJajIrd3NWK1o4aDIwZkVpK3hSVkhDbWJrcEJmM1NF?=
 =?utf-8?B?Y1pPejZVRXpwMzhzb25xejdmNk5DM0laSmlaUk9GN0l4cmlYNTh3R21aWHNt?=
 =?utf-8?B?cmNVYk1IUXFpMFl4QnV5ZWdVbzZNNVRTM1VQc0F2U25kaU9pV3FadUwyMExk?=
 =?utf-8?B?VERMNGFIa2NkcjdyekM3ZDdOOWtITnE1aFdUUGsxS1JrQ2wzY3FrU0JMaEJh?=
 =?utf-8?B?TkZoVmpocEMzcnZ4Y1lVUkVsTC82cU1Rc09sZEh3NTBhY3FPZlYxdmlPZysz?=
 =?utf-8?B?T3Z0YU5KREFuODJVS3A3SXRtdjVZN1huT3VVZTk4RzQrdG1zNE5BdGE4TG45?=
 =?utf-8?B?Tktxa3VsUDlFMWRzRHJaSFdFdFZHVThOSVBjelRJUlFVZTF4TUs3ZVluMEZI?=
 =?utf-8?B?dGM4S0xsMzhYUWtqWXhHRkxQc2dNa0hjV0c0T1lMRk5YN2pkODlJcjdaLytX?=
 =?utf-8?B?enVMSzBob3k1cFdHUDBybFh3eURLczdMY0ZvTm94ZEVjUDR3Y3Vhc0FXT3pX?=
 =?utf-8?B?T2dvaG5nT3RXeFZWYm5tcGNESUFYZnNid0Q5V2kzdnBGQi9SZnFOd2thK21J?=
 =?utf-8?B?MHFISkl3VjU2UTBvZE56S2cvQ0RtNy9SNFdhZ3pqUzVTWC82aEZNRVh1YS9F?=
 =?utf-8?B?N1IrcHBoNkxIUWQvYW05eVNsSFgyZks4cFVlc0RvSUNjcno1U1pXeUxUc3N3?=
 =?utf-8?B?UmtmSllyZFB5MHhKaG9UZjUrMS92NU5GR2trd1dHbzZjeml5YVBOY2NUOTZW?=
 =?utf-8?B?V3ppV1NqUXFmSElRL0FnWkF3UnMyUEFMVXpoR09NR2lHRVZMK3RraWs5RzB6?=
 =?utf-8?B?Y0Y0YW1lMjhvZ3BlUXBYaGw1Nnk5bERHa043T0ZlZ05CamdJd296WFh3dDZy?=
 =?utf-8?B?MXR0NTd1Y1JnamUvWmtXUXNSa0RmQnFYR2pWZ2dqaGhwRlN2U3FBQk1ybC9a?=
 =?utf-8?B?TkVGTitQSWhMSHhiWVZRZnF3UkVkbXRUWGcvcWZOb2t1ZGVpVG9KeTVhSUJ2?=
 =?utf-8?B?UHVRdGdmRkwyNVVTQmw2WStYSHkvWUxiY2RnOW9UdlBYSGU2dzJINGF2di9r?=
 =?utf-8?B?cFllaTRIQmN0TmtKTGU0dkZEZWlGNmJKUStPM0pvQThNMWRYVURXU2Qzc1hq?=
 =?utf-8?B?bmI5RFhxdlVHNHl6U2NhN3gyNGgyMTlLREhZQy9weHplYkNjaGRZOWg1QU9C?=
 =?utf-8?B?STUzN2hBbmd1NUcvZzFmbnZHa28yZ2p4RDlVZTJmaVEyNFFjQXdaNHo2RCtK?=
 =?utf-8?B?WWk1T0JKdDNjZGRjODU2WnUrOTlOYmhvVFBoZENGWWQyMUxHZEJCZFlvQjhi?=
 =?utf-8?B?WVFWSWdQcW5aeFdXdWRXZmllZWlBYlR0V3Nkb2loYU96UUl1bkJudEFZL29D?=
 =?utf-8?B?a21oZGhzd0wzYW9PQTh5NTZ5WWlSaVUyNE5RNUVVY2JOQzB6V3hSaXlqdUhw?=
 =?utf-8?B?bmE1RkxXN0JNNE9jZ1dWaytjZEhLTmxzMXhCYk5zWlZXQ3Y1WlhxWUtYajZM?=
 =?utf-8?B?Q2JsS3VzaDlIdFZkd3BXSkxkbEFPR29QYTVXWHNKSDNDSFhia3lvaEFqQlY0?=
 =?utf-8?B?UHVUU2F3YjBwQSt1U2kwMi9ybVN3WWhzaHNKQWxJNjZWN0ZnTnhlR0dlYTE3?=
 =?utf-8?B?Y2V6V3hScDNvVnpac3FoSlo4L0pBQTBkSk55VjlZNHIwTURaMDF1K3JNbFBX?=
 =?utf-8?B?UGM1aXRsN2grdTBXL1hvNzVJaGdaWmkvanBIN1RJT3Fod0N3OTFqTFJQbmpG?=
 =?utf-8?B?a3ROVnM5QjUwMnhRQTBYSVVmTkdUZjAwMFFyRGhreElZeVZsam1seTYyUlVH?=
 =?utf-8?B?bXhjK1BsN3gyZ0hRN2RaOEpOSkE5TjNYVTUrWUZqZHE3eGExMkRYRkxYVkhW?=
 =?utf-8?B?Y01DWlFwZ0pQOVpwUHZjSnFLYk9VeXJZNlNEVXJjQWVlUm1UU0FORXVNVXRY?=
 =?utf-8?B?R3ZDVFdPa094a3J0ejJIYlI5ZGVHMDYwNFRsNEpWTXZ5NE4za253dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f5c2a1-8fd4-4e57-6868-08df195f03e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 10:39:58.7551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AoUFyk0ptE6whnwUTxQrjns9K0UmlR4lvbKRLxxZu/S9yMgTMq0SYeAtwhI7genROqQieTGcVe06TXBHzeyjsy3exy5EKAj0AQJbn0bfETw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13085

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIzIFNlcHRlbWJlciAyMDI2IDEwOjI1DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNS81XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOGcwNDZsNDgtc21hcmM6IEVuYWJs
ZSBDQU5GRA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgMjEgU2VwdCAyMDI2IGF0IDE1
OjIwLCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEVu
YWJsZSBDQU5GRCBjaGFubmVsMCBhbmQgY2hhbm5lbDEgb24gdGhlIFNNQVJDIGNhcnJpZXIgYm9h
cmQuDQo+ID4NCj4gPiBDaGFubmVsMCBpcyBhbHdheXMgZW5hYmxlZCwgd2hpbGUgY2hhbm5lbDEg
aXMgZ3VhcmRlZCBieSBTV19EUElfRU4NCj4gPiBzaW5jZSBpdCBzaGFyZXMgcGlucyB3aXRoIHRo
ZSBEUEkgaW50ZXJmYWNlLiBUaGUgQ0FOIHRyYW5zY2VpdmVyJ3MNCj4gPiBzdGFuZGJ5IEdQSU9z
IGFyZSBjb25kaXRpb25hbGx5IHdpcmVkIHVwIGJhc2VkIG9uIHRoZSBjYXJyaWVyLWJvYXJkDQo+
ID4gc3dpdGNoIHNldHRpbmdzIChTV19HUElPOF9DQU4wX1NUQiwgU1dfR1BJTzlfQ0FOMV9TVEIp
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDhnMDQ2bDQ4LXNtYXJjLmR0cw0KPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOGcwNDZsNDgtc21hcmMuZHRzDQo+IA0K
PiA+ICsNCj4gPiArJmNhbl90cmFuc2NlaXZlciB7DQo+ID4gKyAgICAgICBzdGFuZGJ5LWdwaW9z
ID0NCj4gPiArI2lmICghU1dfRFBJX0VOKSAmJiAoIVNXX1NEMl9FTikgJiYgKFNXX0dQSU84X0NB
TjBfU1RCKQ0KPiANCj4gUGxlYXNlIHJldmVydCB0aGUgb3JkZXIgb2YgdGhlIFNXX0RQSV9FTiBh
bmQgU1dfU0QyX0VOLCB0byBtYXRjaCB0aGUgc2lnbmFsIGZsb3cgb3JkZXIuDQoNCk9LLg0KDQo+
IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDwmcGluY3RybCBSWkczTF9HUElPKEssIDAp
IEdQSU9fQUNUSVZFX0hJR0g+LA0KPiA+ICsjZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIDwwPiwNCj4gPiArI2VuZGlmDQo+ID4gKyNpZiAoIVNXX1NEMl9FTikgJiYgKFNXX0dQSU85
X0NBTjFfU1RCKQ0KPiANCj4gTWlzc2luZyBjaGVjayBmb3IgIVNXX0RQSV9FTj8NCg0KQWdyZWVk
LiBXaWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=
