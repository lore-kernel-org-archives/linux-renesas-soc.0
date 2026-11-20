Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795180934;
	b=X48Sq7UYnKuDNp0snkbeykdmzSK/nYJPS+l8Hyi3PyMBeU2aLuBAI9qmf9zR4B+tmrcH
	 XoSkD5IDk8K5JJHl9sFmRn1EgDaLzmnotBvkWR4Ykl0NTaovVBLqc9ax0CeJ6xZbVu2aI
	 YQtVCz4UOI2OJA5oD2AF/BT9LzcaIfnBPzZmVGiT3ZzwlwFJxLZbcCo/vArcUOjM1ecn0
	 UWQwbPc7axSSeI2w8IszQJyaV9z7RXAjvXrFAh0Fhm2TPoHWZ8N/np42lfplRpI7j+Ii0
	 U/n4QVUyajp2NxmLKHrDURE5Q+Gv7rjcNKquCuC9IQDQ9b09NPcBae0Ph7OenZJeVkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180934;
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
	bh=HXLJjvgxvc0oZ2WR7fNCGpbykQx7BPxr1ZOSYwwyrEg=;
	b=3UXrkRzHbYvcB3YRn56GsVFGhRM/YZRnPVba+xrKzeFPTtmQKmmyx12cCm8fQKVvVwK9
	 0dbhJOWutmQYi5xf9G04XaCil5+cKgzVDIQYlWX/6MlJB11dAqr1yB6jB+1VCBqTnwszM
	 YjWNSSjG3CBxS7fwYNM1nR35p2zTauuK/ZgzxMUZfw4hDiWL7Gs2C6lyA/jCDHaqng0zh
	 7PpLPgCPUDzuC5jBPvI6PkUPJ2/zHfE3TvzhL+7gRprBr9szzve6maCXMv17hubSNq7EA
	 dmM95LG0B12egzVNUMomN6pjHHdm/MQec1Iv5sA8IP4CZ4dtbtICdCszZddodmbkXJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=IXESTvWp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.43
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56126606A32C;
	Fri, 20 Nov 2026 13:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56126606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=IXESTvWp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tm4BISAp7Y7Q42Q9AOqvnWBguVHjbznfhxzO9Wk1KDk9906ge7CIRUgkVHgU5DbzThRBJCXATKvcAn2FlBAfCGOCRu/3O0MGtJGJTb2xkbSH5C9iWztLXbTls02pisabtSAv8kYDIeF115/F+xzw3L2HMNJhFThFXo4X+Hmv/3FAIlJNABjbwlLnzmmwnsfbNmu1slwxxUS4G1gU2fnMNNltUuuiD7RVzN5hgjUIyKAr4ktZPznhrtJTUTeaZ1hlU6KFrUXbsGJC5h1OO/Hm4jKOTB+x3mIyxTJ0fFDVwnls7NaZUayAl9jXlNINscQSMnrmjJyS07hOoorXWLprOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXLJjvgxvc0oZ2WR7fNCGpbykQx7BPxr1ZOSYwwyrEg=;
 b=sR45gTief/l45wAzJUdOB2w4ljpHj/RLIeEZ12+7a1Dv+8XEg2FoU16HnElCGBAeU6p9D1Sa99U4Ydd5K90EaFTbUP/pImXdM40diCqircqs0FEoD8BgwLABJakcsiY+BLyB1r11cxV31qJ281S1fqjRyeGNUEgnvhfO+ntgHO0vbC60npesdPMJ1Zh+dy4sfl9lA45wm/npBabrrkj7WOxKHUKU6ALLvZNavtdVLpWrboyThlah1Jat/00rTgXsqrXBVSAXn6IX+QUW6H+S+tBTyt1UZ9VbPX0gbV2hyn5aAs/RfEb0N929SUw+Ok7kGSBg0Kr/ce2J0SnhpME6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXLJjvgxvc0oZ2WR7fNCGpbykQx7BPxr1ZOSYwwyrEg=;
 b=IXESTvWpyIWWTnt1k54KWc93MklufOGC4qoCnI7n5FDB6s26cQ2xI6jRykK1yWVaqjK+SgYZQIspOLqI7jlVXCAiWWYRRWBIYCvYAti1r/U/eSR6ipr3eBn0uxTzAYn12cMW2yzZG2qin422Dulq7m0TZkiMbev34+8JMy7NZ2E=
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com (2603:1096:400:e0::9)
 by OS9PR01MB17216.jpnprd01.prod.outlook.com (2603:1096:604:40b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:22:09 +0000
Received: from TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f]) by TYYPR01MB6603.jpnprd01.prod.outlook.com
 ([fe80::145b:b854:162:2e7f%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:22:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, "biju.das.au" <biju.das.au@gmail.com>
CC: "magnus.damm" <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2
Thread-Index: AQHdcwbzdoF+tJfdNU6EwTi/iPmsXLc2/OYAgAAAozA=
Date: Fri, 20 Nov 2026 13:22:09 +0000
Message-ID:
 <TYYPR01MB660300EF63BBCDA82272C45C86782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-3-ca30b209615d@bp.renesas.com>
 <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVepu0jANzDL552TKrFueydG3AHtd4v9MMXBsw6AK83kQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6603:EE_|OS9PR01MB17216:EE_
x-ms-office365-filtering-correlation-id: d1d757c9-24bb-4565-d71a-08df4709480d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|22082099003|18002099003|11063799006|4143699003|56012099006|261026121527099003|261102123227099003|261021121427099003|261009223027099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 oHydw/w1F1a8fBhS2NgRKynlXz7LJfOKZUpy1rN7Ol0xxHyGX3n6MYKXa/YCl2fJOmvICp93ZtNTLDMtrLyp97VMExhth2ah/M/vKf0xQwvyAR2aaGf5zoAnSFG8WPJ8POePy/tb9TDMy9fFwkxVUJvxrxp6znQH2Yi4Sq1wcfFKwViSB/uhgeOelxhQa6qDYLq6WR6afEyt35UIAd7fDgDbZZZ831Wdwrpk8yPh5ztVDzZXkBktAaXLFG2Z9PLqmIoIqwUpw/QxrmMkJ452Pzi5ya7E38/ESEWq0OSBG8kSwNuMn7gESjDLkXHHyRoxgNG4twMDPklyplxQjaH4fQTN9TYC6Eff3rY/qnY+8Stwc5kIjnxt70FFS9+/pGclc85bOhW1Mp78pYdBaTO9E50DytkaTRCPhouEflPeDyod7mx9geJqxo7eb14IXVFWTXQ1OR43GEcZ6xAqnXhlBdKv7RwSFrFO3Vz90xIv37S3G+oT+ZhxkGivhIzSoClTVNq10WMcCjisfI2OAMrEOs2Z5RSQvA3hOLBk+7lz8DjYulA8UwF/ulhXhO+orkXDbIQMW4+NhzH3q0GWJpEy1/VDzQcX4qCkoT28Jy8Y/OebWC16J49KvPCmndsYv4jxeblbfmd379gcHYYr4YgXy/6RmAOewtukQAnUpPHmpqGxXNHhsjTu62A0QrKMRF5eNgZeTGy0Ad7UDYYCOjZUO2LBzwcpggat6nqgQ8sHgHY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6603.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261102123227099003)(261021121427099003)(261009223027099003)(10067099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkl3OFIzWlc4UC9FT2o2VHNmcUJYbHRNRkRRZi82WW1tK1QwVExWMnNGUlF0?=
 =?utf-8?B?d0ZRMFU0TkxmdytlQ0crQVdld1dpamMydHFORXZEQ0M5VVhmVmhWN25EYk9y?=
 =?utf-8?B?YVdQdjNHQXVJakIvckFCeDRmS1d4WHZ1SjkybDhBNlltQjk5UjM3bURTVFVY?=
 =?utf-8?B?TEJkMXUyS1FjcDhlbHpES0V2cGY5RlAwZ3A1ZTRUWVY0cUJUSjdwMk9VY0Nr?=
 =?utf-8?B?Z2xFdjV1T2pXWk82ZXBEc1Jyc3JPa1kvUDFadHVZczl4bWphS2p0RmFjYklG?=
 =?utf-8?B?NENmQlF3OXFKaGZSVDlGU3NUUGQweGVhNVdFQThWdTkvb0t0ZUM2MGl3dmlX?=
 =?utf-8?B?NEdiQWJGMWZGYlByNFNGejZPSVVlMDRpM0JxdXd0dG5xZHV5K2pCQTZzZ2xJ?=
 =?utf-8?B?RVp0REI4RjBma0JPQjR3RUEvSW5UMTVLWkpJQ0ppQTgyMVlwbWJMb2ZWZWJ1?=
 =?utf-8?B?RGZHV2Y1UWl3a2RQR1FKUWN4a1lLdUtGRG1meldWdUFZYmFBdXdoZ0N1em9N?=
 =?utf-8?B?bXdBenlyV1dXRmczNDhZeTZMZExhOXgzYlJYaGVVa25WYUs3ZEt4VCsybGpt?=
 =?utf-8?B?NjhZdWIrRmY3ejFoWVpVK1RtVStIaysydnMzbWRNR0FwMzBhbmRDMUxLTURl?=
 =?utf-8?B?S2JHTUZxYVlSNDRXUWJqZVNoSEVYbjMzeG04TnJWamN0L2dPdytjWUN3WktC?=
 =?utf-8?B?S1dPZEkyTkhCbno3M0ViNHAvNlB4NDRvdEtyN1lKWmZDVkNOL3JQNXFiS0JF?=
 =?utf-8?B?TGlhTUgwVUNFS2srTklWbkNCZFNCSGU1Y1hmaDhWK09VTjVPbXQ2MzA3REh0?=
 =?utf-8?B?OTFtMnhuMnVmUGNBR1ExZG8vN1ppbEV2dlpKQ1REa0ZpUW43S3poTitRd1kr?=
 =?utf-8?B?bzMvY0JXVG9RNG1tdGowZGYwQzUxYW82NVlueUpVTExtaHlWMjdlVzdKTlEr?=
 =?utf-8?B?dXhpUHg1SXZpOWZsQml5eG9iZ1NobHo2bmI3MXlqTFJtMFpwMXUzVnBBb2tx?=
 =?utf-8?B?ekMxczZZcW9ydHZzZlZUa3h3SkZ6N2RrS0JEa3gxd3VhempBbGV5VDJrSW94?=
 =?utf-8?B?ak5JdE81NW5yOU9oMGRNOGZ5cjV0UmdwVlhSNnRlelp4Z29NQVdoTm10Wkd6?=
 =?utf-8?B?RFhONWxRcUI4VkZSUjVWUFQ3Yi9qaGRtcmNVek5VK1RwQy83aE5MT0RGWTlz?=
 =?utf-8?B?ZHFLYStXdDVERUJFSmRYRHR5SXJhb0JTdTRxeWJERDJ0QVVKdW00bmhxTjJt?=
 =?utf-8?B?WjFNRGgvM09QdnUxUnFnQ3RSS0RaNmhDa2hyTS8xbFJjTHZnK09zUmFZQXhn?=
 =?utf-8?B?dDRTU2NUUVBPRkRrZ2tFRjdCZzFJbFdXU3N6WENYbDNvUUVKbmgwMlFjZnhT?=
 =?utf-8?B?OHZBZHgreWdVMUxZTDNTaEpaUklSdXJocG1mWDgxNWVIYkRLNFBZeXpGNzdh?=
 =?utf-8?B?V250T1lqeStRQ1dBOG4zUXNoTFlpcC9LbXZ1RVNnSFBmWlFIa2lJRUN4MEFh?=
 =?utf-8?B?bldxUE5sNEhhMk1qamJMLzRGTy80Mi9NbTg0cEsvRVV0ejZXQkVWT1ZESGh3?=
 =?utf-8?B?NGg4ajkzZjNmWkd2bzNCOWJTRlpQM2ZhdURSMjFPRlpvUXgyMTh3cjJoc0E0?=
 =?utf-8?B?b1pzMXpSWCs5ZFlYak9iakY0cjgxM250ZXBldmNqRHhObzU1UnNMcndwSU51?=
 =?utf-8?B?Mk1YV0FSOUlKcE83WnhadEErRXBTb0FiWldZMXpJc0NUS2VaL0c3TjZSU1N1?=
 =?utf-8?B?ZklSQ3FHS2dPU1ZzSy9HWHNucjZSbmt3QTNiRUdIS0E0SHA5V2txbzVJOWZr?=
 =?utf-8?B?cmZRN0s3bjR2a0VUWTY5Q3hRZnRveHpzR3NYMTlJOW1YWDJialF5aHBYQ01Q?=
 =?utf-8?B?MmNkNUhYRjRSeXpIaWJmbVZGR1JRdUVKaGRxNTBobmVTRDJuUEFnMk9ZbEpu?=
 =?utf-8?B?WitXV2F6ZnB6djdQaVJrOTFjejM0M3UrTVZTUmpMcTFsK1VwaVJ1S2lQNUEy?=
 =?utf-8?B?M1k4K0dmaFB2NGtFWHhlQnlIMStkb3dyN3RiSVdmSGQ4R0FGeUp2Qms3UERm?=
 =?utf-8?B?T3MvTHpCbTAydEY1YU42S1NOMkxmTnZvakpobnZXR0YwUG9lVEo4aWZhQVZp?=
 =?utf-8?B?OVlKT2Y3N1N4QVFTUE1NUGh1a0dpdkZxN3hTYmR5OFhreDBTaUZvalNQbUl2?=
 =?utf-8?B?UXkxQnNzRHRLSitFYmE0Q2pWaHRHQUp4ZHFBazBVZ3lyVGMwMDd4ZHY5QkNq?=
 =?utf-8?B?RnY1WGRzSDNnTXhRQWp0dFlUVk0yeXJ1TlN0Z3ZydVViVlh5MDZMODJTTlls?=
 =?utf-8?B?ZFJyQ3RLUHU5UHNaWjhWWFA2YXdTK1dhcGJxME1GbmhWMTNIbklLUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d757c9-24bb-4565-d71a-08df4709480d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 13:22:09.8905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwgFQFiU3I6g/nAsWWHysQPUSgza9c2xjsbc388dLLcPK2AQevcLZAueIphXNHC0+dJ3qZxnZ/fvSmk7O4nhdF5K4BhwXekG6t06b6BUODU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17216

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjAgTm92ZW1iZXIg
MjAyNiAxMzoxNw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10gYXJtNjQ6IGR0czogcmVuZXNh
czogcnpnM2wtc21hcmMtc29tOiBFbmFibGUgU0RISTINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBP
biBUaHUsIDEyIE5vdiAyMDI2IGF0IDE5OjQ4LCBCaWp1IERhcyA8YmlqdS5kYXMuYXVAZ21haWwu
Y29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4NCj4gPiBFbmFibGUgU0RISTIgb24gdGhlIFJaL0czTCBTTUFSQyBFVksgcGxhdGZv
cm0gdXNpbmcgdGhlIGludGVybmFsDQo+ID4gdm9sdGFnZSByZWd1bGF0b3IgZm9yIHZvbHRhZ2Ug
c3dpdGNoaW5nLiBTREhJMiBzaWduYWxzIGFyZSBtdXhlZCB3aXRoDQo+ID4gSTJTMDsgdGhlIHNl
bGVjdGlvbiBpcyBjb250cm9sbGVkIGJ5IHRoZSBTV19TRDJfRU4gbWFjcm8gaW4gdGhlIGJvYXJk
DQo+ID4gRFRTLCB3aGljaCBtdXN0IG1hdGNoIHRoZSBwb3NpdGlvbiBvZiBzd2l0Y2ggU1lTLjQg
b24gdGhlIFNvTS4gQnkNCj4gPiBkZWZhdWx0LCBJMlMwIGlzIGVuYWJsZWQuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0K
PiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4N
Cj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNsLXNtYXJjLXNv
bS5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzNsLXNtYXJj
LXNvbS5kdHNpDQo+ID4gQEAgLTQyLDYgKzQyLDcgQEAgYWxpYXNlcyB7DQo+ID4gICAgICAgICAg
ICAgICAgIGV0aGVybmV0MSA9ICZldGgxOw0KPiA+ICAgICAgICAgICAgICAgICBpMmMwID0gJmky
YzA7DQo+ID4gICAgICAgICAgICAgICAgIG1tYzAgPSAmc2RoaTA7DQo+ID4gKyAgICAgICAgICAg
ICAgIG1tYzIgPSAmc2RoaTI7DQo+ID4gICAgICAgICB9Ow0KPiA+DQo+ID4gICAgICAgICBtZW1v
cnlANDgwMDAwMDAgew0KPiA+IEBAIC0zNTUsNiArMzU2LDc0IEBAIHNkMC1kYXRhIHsNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1zb3VyY2UgPSA8MTgwMD47DQo+ID4gICAgICAg
ICAgICAgICAgIH07DQo+ID4gICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgIHNkaGkyX3Bp
bnM6IHNkMiB7DQo+IA0KPiA+ICsgICAgICAgICAgICAgICBzZDItcHdlbiB7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzNMX1BPUlRfUElOTVVYKEssIDIsIDEpPjsg
LyogU0QyX1BXRU4gKi8NCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgIH07DQo+
IA0KPiBKdXN0IHdvbmRlcmluZzogd2h5IGRvIHlvdSB1c2UgdGhlIGludGVybmFsIHZvbHRhZ2Ug
cmVndWxhdG9yIGZvciBTRDIgIGFuZCBHUElPIGhvZ3MgZm9yIFNEMCBhbmQgU0QxPw0KDQpKdXN0
IHRvIGdpdmUgYW4gZXhhbXBsZSBmb3IgdGhlIGN1c3RvbWVyIHVzYWdlLiBFaXRoZXIgdXNlIEdQ
SU8gb3IgaW50ZXJuYWwgcmVndWxhdG9yDQpib3RoIGFyZSBzdXBwb3J0ZWQgaW4gZHJpdmVyLg0K
DQpDaGVlcnMsDQpCaWp1DQo=
