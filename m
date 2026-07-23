Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CC041DDF6;
	Thu, 23 Jul 2026 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798954; cv=fail; b=kW71rplN8nLQ58QYp8jO+dctW2fr/cft11NxF59LkyQeIebjxr6bpobhz3dDSSSssSacZTfBgFROgC2Obs/DlFuAksmvUzIAYgFVVK1TyNnVBFwoJMAs4RXpbmH/iHZ+gqfSLdbAKJ3Zyqcb/PcusFeozM5f97ObpqMEAeQathw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798954; c=relaxed/simple;
	bh=WV86xiTe4jmBbzwbv50A/YYSk5GBJ3G7YLRsLA407bg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AmENdcwwVXVsdCTmLx3bNIZNuLxfKt3WQGADSxISYEGWbLfdRm2lT/JhPYct02x3/DxtXpubdIDaeZHQM5/wTF0PXmqgZJ7X/S0FSuPNQIoM3zeZfzG2eZhUCi0qRuBweHkfvnEZYZOElqFkTBQxPPMibwcl8Demtnt213S8yIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Cvj1LKTJ; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Cvj1LKTJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcaegctXuFNgji8rcmp+Con+h2N/pPNzkF3pEFSroSnylXygpzZ7N0a8ZaizeH89VTyp+KtGDGqv5ZxtvH2u0XPsewPvsMyN8pIXN8h86eF/361BB2PStmJ2QfN3N6VAmAYn9jcNi+6QgD7RzdElEpuVMEPTAp8k5K/nMuOr0mCzIcYusUZcTHO8mZqKvwRhP4UQet4RO4UW9nGMuJZtbdGL/CBUFgH5mO6KQ+Hcuk48tN5y+PNaSqVeUDHLDzD3QCkwqjpTQLgkDsbhZ8XMO1gVWyaOp/LLayO6Ulq/MorhoMJj9uSjdDX79/GHwDQYjzwySspp83ROwF3NDp7EhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV86xiTe4jmBbzwbv50A/YYSk5GBJ3G7YLRsLA407bg=;
 b=p71RC14SfNRFlLLeBs8nzXFT0KCapmuuKGE9fWl2OGXekTNiMlk11wELCXWINOmOjvJlITZHR3HULJjbasSDqA3kMCQLaGegWRAFqD1x/NFHc/qYOkgsB/TEftc6EDT+IePE1wCv+tc2F9Dh59Pfsfmf4QyTpwW3k0Smsr/Sr/aZ6Ga77okANlwL2J+PQ3F2aHUzK6vJ2kc/d7GDw6jnUMdg2dQETP8qVUGax8n3P7yH085hn0D6Zuwsp/+jERlgsHxHjQ47zjU1P0FDTEkU3Dk0uBrsarM7A0YChQVTJJJVLxLWv3qo1ogPkkiCWwlvV+Vk1ifeTtx/6aTtPi2kDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV86xiTe4jmBbzwbv50A/YYSk5GBJ3G7YLRsLA407bg=;
 b=Cvj1LKTJ+m8OI/TA2/FuBkyj+LTUZncNKOpROwwJYwXZPQG+9Kx2QLd84eDO0YrVY7PNfsgs7s/iHr6jae4su3SDw3IQqinJ3ur36Mz2eFNj0E3wYwcUpd//b4i5YfpkT0tCKaHtF2aV9n+iXeUDGOjdU7CPz+9/DfeBAfN3ZzU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB16070.jpnprd01.prod.outlook.com (2603:1096:405:2ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 09:29:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:29:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, biju.das.au
	<biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark
 Brown <broonie@kernel.org>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Topic: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Index: AQHdD31S9FH1h8kHdk+L8ggzHtk4aLZ66ZSAgAABTOA=
Date: Thu, 23 Jul 2026 09:29:01 +0000
Message-ID:
 <TY3PR01MB11346CC104651388DC82800A686C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
	 <20260709083108.108370-4-biju.das.jz@bp.renesas.com>
 <205332eed1af6a85a783952210e1640bc583b5a3.camel@pengutronix.de>
In-Reply-To: <205332eed1af6a85a783952210e1640bc583b5a3.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB16070:EE_
x-ms-office365-filtering-correlation-id: 217535c9-85ac-4932-434f-08dee89cd4ec
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 6W0seScfTwDN91kKO+vaiH/jNJzKcSSoQX+Z0R79nfIP/x+/PBy7YWlNjMaq6bdn0dj6XTlRQIhe1XT/x2MGuuUETKg/YZKK7M07lxMTdIeRSSEGXdgepddYycu3YTitd4z1zcMzTs5bW8Vo/L62aGaIDH8WsUIRbD2hi/1bj/bjrVmftkueGUMfsMxbViDw+pyFdQMzfQA231tfUGZfshQ6+sY/0lbuvsEkyf3bFeU8ZrQBBRIagIYu0DwPzoEgjv9WJ85dsiS+V4brW9K6eXg6ao4q1hJzw95NFUArD3JYh1e32JY6EW7Zo4hv+pVOAeNKSaq02H7sOZkid6Pwn6CJGLx6sANxnYAgwrB2W9C7u4J+A1+R93i8hi2cWMD9GNNDSZdQrCmvUznnlue+AmyLBq8B7gdreeROK2tRAox2Q+y/EHWtbvZy/tZVE4b8/f3CkLcN1a4xTcRYxFFV7QdF6EWGS/lzszet3j+XGkRBDqUu2bNabRK6jW88tqYalzFgOGhBuwGEOzsM/AWpIUKKec3c7+BbkFvttDuItELRMu1qCvNsi25aMPAxcrrnXvy5pfGCqtqOLbSE3ArkHzs0v6rDEHryZpVNoIUpoz1WaMHPLBDIFqeMOuY88stQuVW8OUQjaagtdmw47Atf5/O2O2TN6ljRr561hX90ZnfCReGaeUFlkLQ0a6C6hucd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWZjS04vV2x6MDhuWVk2QXBwL1dQSWEwWHRod29tQVdJc0UwY0dwQmpIYVdi?=
 =?utf-8?B?angwSHZKeEFCTUx0OGNsMHM4WTEwZE92WW1jVE0rQWJIekE0MUxEbWwwSXRy?=
 =?utf-8?B?NE5tTUxRZUpYaG4zejJEaUgyT09yYnZVZkdRKzc0UkVoTkVaeGVPTjZQc0F3?=
 =?utf-8?B?eERyQzV4aHVGWXlHbUNVeU4vVUJ2Skp6cXdaWHRZSFFyYUFtRlJQN0Rtd3VQ?=
 =?utf-8?B?em0xTzNTWmt4eFJsREJnc1p1NzhacTU4WmxnazN3YnBEM25pZGNDeHpkV0g3?=
 =?utf-8?B?Mkg3L2pCaW1IYS92VDlyNHg5cFpHNHorTk0xQ1pUZ25MZTE4blJVdzJCUVpu?=
 =?utf-8?B?UnVQRjU0WWlaaldQQ3QweDRqdS91MnZGZDh4VEFjRXZ4eVBCcnUxN2wrdFZ1?=
 =?utf-8?B?Si9DWWNJNXZURy9VQ3RuV2syQkt4Vm1ZQWdlaWtzdmlYY2RTWlB2OHk4bVh2?=
 =?utf-8?B?OUdRRzVnOEZpYlBScjVUc1psemlLY0lzd0NPSzJxTXdTUVcwL3QxYXRiR2Vl?=
 =?utf-8?B?d1gycnVQK0czaC9SS1l5WDF0WTB3T1JKamFYZWhjWTJqRVU4YUtJZnVNdngz?=
 =?utf-8?B?OGQrbGYxcmRmd0pTdzRyZytsUXg4Y2NOS2RGWk0xWnhKM28zRWE4N2V5OG1U?=
 =?utf-8?B?ditsMW5yZHgwc0kxcWhrVFplUTFkay82c0lDSmptMnp6N0Y5eHY2RGNBdk5X?=
 =?utf-8?B?VUJ1NWdmUUtwbzBIUWllVXppcHhyMHh1OGtqd04vVUJIU3JRU3RQL2M1c2pL?=
 =?utf-8?B?WDhQQWVCZkF0Z1FBNWw2N2MzSkNmRHZJaHprYnVjbWRmRTZVbExrNWVMYy9i?=
 =?utf-8?B?SE5rK2lpNy9aN3FqeVZsNW9QSFlaTmFlQ01iR3Ftd3NueTNSaUl1RlNVYWJZ?=
 =?utf-8?B?b2FRZlBxT3N6ZnA2WnRodlNhNFBSVythVlU0MnZ0TmwrcWIwUlZrWW11ZklE?=
 =?utf-8?B?dVVyT2RlS21jUkhXY3FLekMzMG9SRmRaejlLY0lDNm93WVVjUyt3dm9YR3VG?=
 =?utf-8?B?ZGtQK0FKcXU2SWFuTUxXajlGK3VJL2FMYS9jbjBKeHgzc3o5V09rUTNVdkhC?=
 =?utf-8?B?R3VTSkFFZmFmN0pycnExeU53WnJMNXlOUEdDclptOHh3aHRzZGpBU0YrVGpY?=
 =?utf-8?B?ME12ck9HcktiL3NRWTQ1djJrQytLWElXVGJYUGdxdUpORXdLb1Z1bTVCdWFQ?=
 =?utf-8?B?S0JmR3JRRHdYWG1QdDQ2QksvVGxPajdNK0FhNVR5bmFaUWd1MWhyVng2dFFy?=
 =?utf-8?B?a3l1RXZIMXdwVlB5ZHA0Um5tU2VkakloMjhLcXBWQnhhN3Z4UTJISVlnRjBZ?=
 =?utf-8?B?UGxwd2pmQlR3bmwvVHQ5cEtmcjNwcDRmN1E0UGNaWW9ieWxhTjJiYXJTMDM5?=
 =?utf-8?B?ZW9OaUVySVY2SDhXQzEyQitIc0N2YUh4TUQvY0JTU3pZOVlQMXNJSCt6enZG?=
 =?utf-8?B?RGNiUHFyRnJYRnZENFA5VU1xYkN1NWRqVVBFbXNuN1gvWFBJZWoycDA1R2Ez?=
 =?utf-8?B?UE4xQk52bitPU0FtWGRCaW84Tkx4NE8wcTdGNmFTbkhqQ0IyTnAwWUFYVXVs?=
 =?utf-8?B?NDJXQW9MSlZPbUNTMGtRczZqUlVkcXUzd2thT29OOVVBRjh5a3RPTkExK2xD?=
 =?utf-8?B?U2ZLbVlBTlBaMldJT1dNSzNFMC9VTzVDWDBKRjA1OEwzQnQ5S1FUM0MxelNS?=
 =?utf-8?B?YzNvUW9sRVRSMDViS0xIU2hYVEZ0WFhPeFZhdGE2WnJTSzRmR08xcjgyTXFk?=
 =?utf-8?B?YU1uZ2Q2ZzM5M1VkQkE1UG13VFpub01TQUJzTVViTFhTWndTUHVqcXBqa1Zo?=
 =?utf-8?B?a0kwUUdFeVl5RlZHbWcxb1VERXRPMVlYWGpMRFI2V3l3UU1ia2Ztek1BY3Nr?=
 =?utf-8?B?c1dyd3U5elhTNUc0WHdseG0zSVByZHJPOFlWK2diSm9iYVVTNzlOekkxclhu?=
 =?utf-8?B?V2pBaVVDZVJtb1NRaVdLVHdVRDhDeGtwRE4veWhack1iNU5Fd0htWHlKOWNn?=
 =?utf-8?B?NGVja0JzQVVnM3hwd3FSaTI2dmdDdmZRSEVWbDNBNFVRVno0ZlVITTYrZjBS?=
 =?utf-8?B?S3ZGRlp6NytZT3BSQ3I3MTVHMFNjMHU3S1h5QkJvaHBsVnk4UlBFNFltdUh5?=
 =?utf-8?B?ajNwK2ZPNEF6R1h4SEpLamhFQXVuenV2RzI3czJCOEhmV1ljcWVyYTQ4OTJ1?=
 =?utf-8?B?MzlnM1hwdnU2RW1YaGtEVjR6TGVyTTJ6UlA0SWVJd1c1VWlIRWJ4QTRPbDFT?=
 =?utf-8?B?Z2hqSmtRdmdRMjVqcDFld3JBT1lPa3hWeXhtWGhCVXUzNE5FdnZpZCtEdnJ5?=
 =?utf-8?B?QlhsZVpSRFpNQVlZYnhYT3dUWnhsaThIZUhiNG1vNzRtd3k4dnlodz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 217535c9-85ac-4932-434f-08dee89cd4ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 09:29:01.7888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgbyKpP78EspRIpQD1VK1lCKUi4757Vso8KfiWrbtp6Uv7EH9YRZYuDWFk/H3n+khnHvJMo3LPAfyhxBC46sqyMlNUb0ycmTNyNCzswI5Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16070

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT4NCj4gU2VudDogMjMgSnVseSAyMDI2IDEwOjE5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djQgMy85XSByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBSWi9HM0wgc3VwcG9ydA0KPiAN
Cj4gT24gRG8sIDIwMjYtMDctMDkgYXQgMDk6MzAgKzAxMDAsIEJpanUgd3JvdGU6DQo+ID4gRnJv
bTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIHRo
ZSByZW5lc2FzLHI5YTA4ZzA0Ni11c2JwaHktY3RybCBjb21wYXRpYmxlIHN0cmluZyB0byB0aGUg
T0YNCj4gPiBtYXRjaCB0YWJsZSBmb3IgdGhlIFJaL0czTCAocjlhMDhnMDQ2KSBTb0MsIHVzaW5n
IGEgZGVkaWNhdGVkDQo+ID4gcnpnM2xfaW5mbyBzdHJ1Y3Qgd2l0aCBwd3JyZHkgc2V0LCBzaW1p
bGFyIHRvIFJaL0czUy4NCj4gPg0KPiA+IFRoZSBSWi9HM0wgU29DIGhhcyAyIE9URyBjb250cm9s
bGVycyBjb21wYXJlZCB0byBvbmUgb24gUlovRzNTLCBzbyBpdA0KPiA+IHVzZXMgYSBzZXBhcmF0
ZSByemczbC12YnVzLXJlZ3VsYXRvciBkcml2ZXIgdG8gaGFuZGxlIHRoZSBhZGRpdGlvbmFsDQo+
ID4gVkJVU0VOIGNvbnRyb2wgZm9yIHBvcnQgMi4gVGhlIHJlZ3VsYXRvcl9kcml2ZXJfbmFtZSBm
aWVsZCBpcyB1c2VkIGFzDQo+ID4gdGhlIHBsYXRmb3JtIGRldmljZSBuYW1lIHBhc3NlZCB0byBw
bGF0Zm9ybV9kZXZpY2VfYWxsb2MoKSwgYW5kIG11c3QNCj4gPiBleGFjdGx5IG1hdGNoIHRoZSBu
YW1lIHRoZSBjb3JyZXNwb25kaW5nIHJlZ3VsYXRvciBkcml2ZXIgcmVnaXN0ZXJzDQo+ID4gdmlh
IGl0cyBpZF90YWJsZSBmb3IgcGxhdGZvcm0gYnVzIG1hdGNoaW5nIHRvIHN1Y2NlZWQuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAqIFVwZGF0ZWQgdGhlIGNvbW1pdCBkZXNjcmlw
dGlvbi4NCj4gPiAgKiBNaWdyYXRlZCB0byBpZF90YWJsZSBtYXRjaCB1c2luZyBkcml2ZXJfbmFt
ZSBhbmQgcmVkdWNlZCB0aGUgbGVuZ3RoDQo+ID4gICAgPCAyNC4NCj4gPiB2Mi0+djM6DQo+ID4g
ICogTm8gY2hhbmdlLg0KPiA+IHYxLT52MjoNCj4gPiAgKiBObyBjaGFuZ2UuDQo+ID4gLS0tDQo+
ID4gIGRyaXZlcnMvcmVzZXQvcmVzZXQtcnpnMmwtdXNicGh5LWN0cmwuYyB8IDE0ICsrKysrKysr
KysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtcnpnMmwtdXNi
cGh5LWN0cmwuYw0KPiA+IGIvZHJpdmVycy9yZXNldC9yZXNldC1yemcybC11c2JwaHktY3RybC5j
DQo+ID4gaW5kZXggODRlNzQ1ZTQ5MjQwLi4wODAzMTk1MDgwYmQgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9yZXNldC9yZXNldC1yemcybC11c2JwaHktY3RybC5jDQo+ID4gKysrIGIvZHJpdmVy
cy9yZXNldC9yZXNldC1yemcybC11c2JwaHktY3RybC5jDQo+ID4gQEAgLTQyLDYgKzQyLDcgQEAg
c3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX3ByaXYgeyAgfTsNCj4gPg0KPiA+ICBzdHJ1Y3Qgcnpn
MmxfdXNicGh5X2N0cmxfaW5mbyB7DQo+ID4gKwljb25zdCBjaGFyICpyZWd1bGF0b3JfZHJpdmVy
X25hbWU7DQo+IA0KPiBBZnRlciBwYXRjaCA0LCB0aGlzIHdpbGwgbm90IGJlIGRyaXZlci5uYW1l
IGFueW1vcmUuDQo+IE1heWJlIGNhbGwgdGhpcyByZWd1bGF0b3JfbmFtZSBvciByZWd1bGF0b3Jf
ZGV2aWNlX25hbWU/DQoNCk9LLiBXaWxsIHVzZSByZWd1bGF0b3JfbmFtZS4NCg0KPiANCj4gPiAg
CWJvb2wgcHdycmR5Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gQEAgLTExMCwxNSArMTExLDI0IEBAIHN0
YXRpYyB2b2lkIHJ6ZzJsX3VzYnBoeV9jdHJsX2luaXQoc3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJs
X3ByaXYgKnByaXYpDQo+ID4gIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwcml2LT5sb2NrLCBm
bGFncyk7ICB9DQo+ID4NCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF91c2JwaHlfY3Ry
bF9pbmZvIHJ6ZzJsX2luZm8gPSB7fTsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF91
c2JwaHlfY3RybF9pbmZvIHJ6ZzJsX2luZm8gPSB7DQo+ID4gKwkucmVndWxhdG9yX2RyaXZlcl9u
YW1lID0gInJ6ZzJsLXZidXMtcmVndWxhdG9yIiwgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX2luZm8gcnpnM3NfaW5mbyA9IHsNCj4gPiArCS5yZWd1
bGF0b3JfZHJpdmVyX25hbWUgPSAicnpnMmwtdmJ1cy1yZWd1bGF0b3IiLA0KPiA+ICsJLnB3cnJk
eSA9IHRydWUsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJs
X3VzYnBoeV9jdHJsX2luZm8gcnpnM2xfaW5mbyA9IHsNCj4gPiArCS5yZWd1bGF0b3JfZHJpdmVy
X25hbWUgPSAicnpnM2wtdmJ1cy1yZWd1bGF0b3IiLA0KPiA+ICAJLnB3cnJkeSA9IHRydWUsDQo+
ID4gIH07DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnpnMmxf
dXNicGh5X2N0cmxfbWF0Y2hfdGFibGVbXSA9IHsNCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAicmVu
ZXNhcyxyemcybC11c2JwaHktY3RybCIsIC5kYXRhID0gJnJ6ZzJsX2luZm8gfSwNCj4gPiAgCXsg
LmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOGcwNDUtdXNicGh5LWN0cmwiLCAuZGF0YSA9ICZy
emczc19pbmZvDQo+ID4gfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOGcw
NDYtdXNicGh5LWN0cmwiLCAuZGF0YSA9ICZyemczbF9pbmZvDQo+ID4gK30sDQo+ID4gIAl7IC8q
IFNlbnRpbmVsICovIH0NCj4gPiAgfTsNCj4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcnpn
MmxfdXNicGh5X2N0cmxfbWF0Y2hfdGFibGUpOyBAQCAtMjQ1LDcNCj4gPiArMjU1LDcgQEAgc3Rh
dGljIGludCByemcybF91c2JwaHlfY3RybF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiA+ICAJaWYgKGVycm9yKQ0KPiA+ICAJCWdvdG8gZXJyX3BtX3J1bnRpbWVfcHV0Ow0K
PiA+DQo+ID4gLQl2ZGV2ID0gcGxhdGZvcm1fZGV2aWNlX2FsbG9jKCJyemcybC11c2ItdmJ1cy1y
ZWd1bGF0b3IiLCBwZGV2LT5pZCk7DQo+ID4gKwl2ZGV2ID0gcGxhdGZvcm1fZGV2aWNlX2FsbG9j
KGluZm8tPnJlZ3VsYXRvcl9kcml2ZXJfbmFtZSwgcGRldi0+aWQpOw0KPiANCj4gU3dpdGNoaW5n
IGZyb20gInJ6ZzJsLXVzYi12YnVzLXJlZ3VsYXRvciIgdG8gInJ6ZzJsLXZidXMtcmVndWxhdG9y
Ig0KPiBicmVha3MgYmlzZWN0YWJpbGl0eS4gQW55IHJlYXNvbiBub3QgdG8ganVzdCB1c2UgInJ6
ZzJsLXVzYi12YnVzLSByZWd1bGF0b3IiIGFuZCAicnpnM2wtdXNiLXZidXMtDQo+IHJlZ3VsYXRv
ciI/DQoNCkkgaGFkIGFuIGlzc3VlIGluIHByb2JpbmcgdGhlIGRldmljZSByZWxhdGVkIHRvIGlk
X3RhYmxlIG1hdGNoIGR1ZSB0byBzdHJpbmcgbGVuZ3RoDQpyZXN0cmljdGlvbiBpbiBbMV0sIHNv
IGFkanVzdGVkIHRoZSBsZW5ndGggdG8gbGVzcyB0aGFuIDI0IGNoYXJzLg0KDQpTaG91bGQgSSBj
cmVhdGUgYSBwYXRjaCB0byBpbmNyZWFzZSB0aGUgbGVuZ3RoIHRvIDMyY2hhcnM/IFBsZWFzZSBs
ZXQgbWUga25vdy4NCg0KWzFdaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjcuMS4y
L3NvdXJjZS9pbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oI0w2MDQNCg0KQ2hlZXJzLA0K
QmlqdQ0K
