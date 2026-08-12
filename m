Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6402A433E80;
	Wed, 12 Aug 2026 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536248; cv=fail; b=aeTlKptUnBWaL6+fnWc5tIBtvEq98r/6XoZztYe5wQL9+WnYRWxExCHs83nD1mqUBN1iocuN9TXu/+PP3bwv5agCNGFTz3u1xk+th7H8SzRSCDJmGv3CGias1aBJWj/c8QEk7GGEibN7f8tOPBm/779ZQy4WFM0LhVga0Q84h3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536248; c=relaxed/simple;
	bh=gznV4OnoZydipAxBg/xh5yPWMyqlFiUutxDzAasNeX8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m8ylQqTsoKxIgvjz1H0e+g1L+lJKwoRIADssuUYKdE8oRYenetoYhCDc6DOnrsc4iiK5j5LekUhLVMBRt8V3HadrH9p9mfB+EjQ+9SSYRMuRyw5cA4rC2ecKEDPSEf3MX5TP6SjSIheSTBH8f0C/iYmM3Xw8UBM7bst2TjAouRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lQBG5DaP; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lQBG5DaP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVaDm1Y0jlM6HLIu4F0s9wnaPmHi5atZ2NvJHKtwRiTHEme6E8PZHIqRvruSCw9bj0fG6xR6iRkDcOEqblvcNQpUpig3J3x/OsnzPkKp1SB/FNj2hL81NZDY9LoMFnIax0UCkwEO4CVTJQIse+EV5EtP6Di4Hx00XaDFeOhHZPJMMBw8/3V0PooN/SU/mvIoNL2P6xAjEhWACh8s1+2QNVftqrd/edGz6oIy+U/+KjSR/h8yFDM0R02MefKMOF0uFfGllGE2DXegDfP9nlZa5UAt4+23yvlydCUE85rbuWwrsyBKAbYJKheVklr77RGmcwSjGQpBC7fsVly048fxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gznV4OnoZydipAxBg/xh5yPWMyqlFiUutxDzAasNeX8=;
 b=gf+jeOZiC16T9KsdnoOAo6msoSp3lxp1wEuQ6d3ahEMx/TY9zTho7MsSkIbVF8EJGd9OsiljTRgpqXKvULvbnEk9Vz/S9W8j9JPrG4PVlN35JkeRX3+E/6Z91/gsgms0hoZ2sMJatu/X24NAXUC1E8nbsWAgYTnLC/pQovtjEtdS5WxqytnfQ7S4Hwjjtc1FCxmGJ8LPz714AkcMLdYLwMuXg3ebWpctGAWzm6l9xf4drC7VoPIFelQ7dkBfRuFb0smXxo/CPJG7liayXiey9QzlIIzGAJjqSzMWg7Y2XO5s7KMJ91EdtA3LvkfXn6+PazxR6Q7GcsbszIsUJLi8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gznV4OnoZydipAxBg/xh5yPWMyqlFiUutxDzAasNeX8=;
 b=lQBG5DaPxTmu/ytafQWFxBA0JBJUS6+A9rbFpbgg3iZn9O64hS0m623nTb5RgQx6yMNTZv0sUwPPcDBHMNhRbvHfetFhUMGcA46XLi/0aPRKKjSQqjarSKGVuHduCm8qw5mZ1sOKf2I12egK4k8BEXylOccfLL6JBTAnj/FfWTM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6681.jpnprd01.prod.outlook.com (2603:1096:400:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 12:04:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 12:04:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "biju.das.au"
	<biju.das.au@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm"
	<magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 02/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Thread-Topic: [PATCH v6 02/10] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Thread-Index: AQHdJY2Gm3cU4Fak4UCpPRGd3aumBraYb4cAgAHqcpA=
Date: Wed, 12 Aug 2026 12:04:02 +0000
Message-ID:
 <TY3PR01MB113461DECDD29531259C5598E86DC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
 <20260806102236.149159-3-biju.das.jz@bp.renesas.com>
 <20260811-condor-of-satisfying-eternity-3b43aa@quoll>
In-Reply-To: <20260811-condor-of-satisfying-eternity-3b43aa@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6681:EE_
x-ms-office365-filtering-correlation-id: 31cfc472-7885-492d-3941-08def869cccf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|18002099003|22082099003|38070700021|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 uMCIL//xkuwK9HWXAuCE4QQy+HgEcSPepeAW/MXFP/QegFKYMH3l+oS/ZG/m3euPzMKh2/Iyx4r2h/tRuzPcu1qm2W69ve1whuv3kTpybZDd2JXQWei0L37UE7kgc9bAA75OIp2V/lOy8GAPSlnc6A+0kSkiw1qqtA749bkr3UpdypcVY5AeD84JLfdxl4KmP4j9YpTT9Z0hRT8bABfUK0t0XTyksr6i425th5+nHgBT5Vq1wapdTwNJAGgOGOnaCMmjwIiMctA+bo7YgkxhkS4pWLDRACcrhfFGEdCXFbcUhgducIHO1sHshMiK7YfxwsFzYUwEAvG/gBLYpwCm9nrSqU0fMmk+1c6BkEQsaPqAcCH9YNy9jwQ7NdUviV+jKYZ/tQzb+iEPrJQmXfnzYbj/WMPHWdhCFkzb2Ux+Gt7FgZ9s7Pbm+Q7pZ+aUinh14UCuwdXOxxuAkNwIr76XhuEVCSAnVSba14k42STQp/eem+6WcZJDIOrqL4P84yu9VFO2QL8sVqVpPUbQn+LaPFxOOcyZ4olANubyEWTpPUSvmbQ5J4i1cTWrIKWucXHQMjes1E829mNWd+kmCsEAdkP+1MqylycvkdAGqIRqysaHMYoYWc6fywZAnJT/VOvQylkwN7UUtfmDlgJd4Fi5JLsNrfBYn+Z5VC6IXlZdwCahkiX+HcQmV3v5jSWeLw6iaYxKWsk+cKq3NHXjuvVU6A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTBFK2F4ZkFTS0VaWmxmUGlLZ2Fmb29oTUZIQW1YNmdUSzNpeGQwU2RrWnFE?=
 =?utf-8?B?TjRjY2d2Um84cVVIcTR6YzB2VXFMeEppN1l2cWFIR1VabnluS0hGc25ZZFlG?=
 =?utf-8?B?NXJqWGpSa1hqRFdQTnBEbU1WZVd0cDhSUmlJbDdKdmZaa2k5ckppQkdvNXFh?=
 =?utf-8?B?TlNjOThWR3RrdkltSWJNWE1TWDQ5d1VHSUFsbmV4Q0c3NmE4VXpXTElGMTAz?=
 =?utf-8?B?Q3hjM0gvVlNtZ0pYZXRvejlQbHNvVUdFY0FTTWdtM0ttTFdXd1pRNlAvSXdC?=
 =?utf-8?B?NkxpcEZoc2NveW5Xa2V0Q212eG1XL01LNkhGNGl2SndSOUxFdndKMmRlbVNr?=
 =?utf-8?B?TktRNEJ4a2c4VHFwejIycS9rcGhSTVZpQUxmK3pZQnBZeFNEZ3pOc2Z0UnpM?=
 =?utf-8?B?SkhJbXBmWE04R1psRmdzWWx0Y29DcmY2NUlKU1NUOHV4aWRRdk9LMHE0dDhu?=
 =?utf-8?B?cG5GOWJpZDFiTHdybHExY3dqb3NZUlN3SStjUk1pWmFhTHhUMHc1NDR0UkRt?=
 =?utf-8?B?WTE1OStFTVgxcFlXQjNhMjZnMnFXdlA3T1I5L24zV1RjZmx4UmxKQlBweGs3?=
 =?utf-8?B?QjR4Myt2Qld5amVpTHdzcnhRT25xTjg1RE1vOGRkRFhXNVg2TGgvTy9nMW1o?=
 =?utf-8?B?bzd5TEZyQTJQL20rVm9rbUllT0Qyb2tOeG9sRzIrVzd3QkpQb1VvSVF1Kzlx?=
 =?utf-8?B?TGw1NC9TcFVGYWJxeGNoOWdNMm9sVk5mMUJ1WUllUUFwc2c1MXJITm1xaU14?=
 =?utf-8?B?eFQ3bG9QdG5lRlFJTjBqOERzWW0zYVlIdjQzNllGSzd3K3NhditVS3cxdWpn?=
 =?utf-8?B?NldYKy9ZQk9oSHFSTmJxWDJwZ09FajhvMWhiWW9yV3JXM0tjcXlLOU5LZ0g3?=
 =?utf-8?B?V3psY1gvYU90cEttLzNjZEZZTXBvdFlNWm1vUSthRWVzSXQ0bE9GcVRSMzM0?=
 =?utf-8?B?VjdWOGp1anFadjZzcklZT3BZRlpnM3kwUWZLaWk2WjVTZzAwa0EzcU9QQlBQ?=
 =?utf-8?B?Qzl0UzkwZVlYYzZjUEpQWjNEK0NYVXNqL3lPNU9HSWZTV1pZZUdlS05HaVFY?=
 =?utf-8?B?RXlRa3BRSWJOTm5NemJwTmdjSjd0MGZoWWl4Q0VWSWsvVC9aMERwUjM1blBt?=
 =?utf-8?B?RnRLTTNGenNUMng3MHg0TFByam1VOUp5Z1Jwa09pY3Vla0xPbWU2V2NSMUZk?=
 =?utf-8?B?K3RCS2ROS1FuZHI5MVV4czZqeUJBZXpFdFBCVjBTcUdTODBKRFM3MWVFSldZ?=
 =?utf-8?B?UjJYVEc1TzRUTHRWNFdaWWl5Wmd1RDVmb0pZR2JZeGM4UENaclEzTlRHZENp?=
 =?utf-8?B?enNkeDNBMXNRN2FPUWpyUG9ESWcrc1hKWU1EVFhPQXEzWjdWUVpkdzJuSDlY?=
 =?utf-8?B?czdIVklpRW03ejJQWXdPWUkwQVh6bkhtQWI3aWcrR1pBcTZTUXhVb0pQa0xX?=
 =?utf-8?B?QndNeFl4K3NVczJIR01ZdXk1WVpLVUNMdUlPWHNySE5UcHZONTJHMFpBSGZa?=
 =?utf-8?B?MUlGYnlHVHV5bSt4ZlA4TjRFU0NJNkFSalBzTnZmcUdqQWdiMEluN1MvcEdo?=
 =?utf-8?B?ZXVEeWE2SUp3UXgvS0N3ZzlwOExIcXpxamJQWWFOZm1GRVBRaGFRbGZFcVdz?=
 =?utf-8?B?MmZuWkY5TEJGRnloTVE2ZS93Y0Q1aDcvZ1UydVhDSFJDTmhSaTllUkV5Smla?=
 =?utf-8?B?S3l0UmRISVAyeEpQaTJqZkZvUktOVVBJcGhJRERPMkUwbkk3UVlFanJYZWYv?=
 =?utf-8?B?SzNTcVBKSzgxdlZVNGx4bWdYYXlVVGtuNGxUdGZPNk54QXdIT2cxWUVxazBs?=
 =?utf-8?B?YzZ6U2hsSWt1WHlSbmJYZGZsRi9PcE14TUFBUUVpYkZzRXVCdVlHSmk4QmVE?=
 =?utf-8?B?S1Erb1o0Z1lIbDRJSEFEVnRSd3ZUOGtlOVFYNGtocWZhTGpWdDJ3bG1rcEJs?=
 =?utf-8?B?TWZiSmx1bVgycmwvclIwd3VOV0FqdXZUZkhXdEQvOGxMcGxvOVVrUzE0QzZm?=
 =?utf-8?B?TWFrcWVoUkRaS3JLMjAyZjRSdkZ1ZSsxTWlOQjltT05EZ2d4YllJUFE1RDZu?=
 =?utf-8?B?Q1pXNTNRSUdDdWJ6SHFPbUNJbG5yVy80cjJOWldYbW1BTUZ5cWxRbnF5TWtH?=
 =?utf-8?B?aW1aQTNXbWU3UUNTRDZ2Zi9JOHJRcC92SDgwd3B5WWFkTkQyc1pkbjRaVERC?=
 =?utf-8?B?VXVLRXh1UnRGWVNTUGpqd3paY3kyRlFqL05kRWg3WTVVdGk0WXZxeGRTKzlQ?=
 =?utf-8?B?aFltcmJNNXY2eVpLSTVhbnJ6RTM0SEhxTmRVNUpyVEg3OSsrMHV5RHBuYWZy?=
 =?utf-8?B?c1BOaC9FR2cwS1NET2x4QUJ5L1MreCtYQmt6SDhNOEpnOGQ1cG8xZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cfc472-7885-492d-3941-08def869cccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 12:04:02.4391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RrsJISpxiJ10Z3WlGhlMSPBXhNSn1+a92jJ4pvPZOWtzIBITN9LFdPcMxZTfIoFPmB0f2m2g6Kcfl/1NHrLNbsK2PLnhSGMgnLjApqsmbrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6681

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAxMSBBdWd1c3QgMjAyNiAwNzo0OA0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY2IDAyLzEwXSBkdC1iaW5kaW5nczogcmVzZXQ6IHJlbmVzYXMscnpnMmwt
dXNicGh5LWN0cmw6IERvY3VtZW50IFJaL0czTCBzdXBwb3J0DQo+IA0KPiBPbiBUaHUsIEF1ZyAw
NiwgMjAyNiBhdCAxMToyMjoyMUFNICswMTAwLCBCaWp1IHdyb3RlOg0KPiA+IEZyb206IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IERvY3VtZW50IFJlbmVz
YXMgUlovRzNMIChyOWEwOGcwNDYpIFVTQiBQSFkgY29udHJvbGxlciBiaW5kaW5ncy4NCj4gPiBU
aGUgUlovRzNMIFVTQiBQSFkgYmxvY2sgaXMgc2ltaWxhciB0byBSWi9HM1MgYnV0IGRpZmZlcnMg
aW4gdGhhdCBlYWNoDQo+ID4gcG9ydCBoYXMgaXRzIG93biBPVEcgY29udHJvbGxlciwgd2hlcmVh
cyBSWi9HM1Mgb25seSBoYXMgb25lIG9uIHBvcnQgMS4NCj4gPiBUbyByZWZsZWN0IHRoaXMsIFJa
L0czTCB1c2VzIGEgcmVndWxhdG9ycyBzdWItbm9kZSB3aXRoIHBlci1wb3J0IHZidXMwDQo+ID4g
YW5kIHZidXMxIGVudHJpZXMgaW5zdGVhZCBvZiB0aGUgc2luZ2xlIHJlZ3VsYXRvci12YnVzIHBy
b3BlcnR5IHVzZWQNCj4gPiBieSBvdGhlciBjb21wYXRpYmxlIFNvQ3MuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0t
DQo+ID4gdjUtPnY2Og0KPiA+ICAqIE5vIGNoYW5nZS4NCj4gDQo+IFVuYWRkcmVzc2VkIHJldmll
dyBmcm9tIFNhc2hpa28uDQoNCldpbGwgc2VuZCB2NyB3aXRoIGFkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQ0KDQpDaGVlcnMsDQpCaWp1DQo=
