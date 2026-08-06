Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011009.outbound.protection.outlook.com [40.107.74.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE752DECC2;
	Thu,  6 Aug 2026 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009552; cv=fail; b=M8LETQn0Fqt7gITq0lZWFbDvkhDmFfFRCfQDHxC9HbvvZe9kk8g915ruUizmpuxqpiXori4PVYvUtSVTKfG4G98SjgkSBl63Fcu0V6NGvAsH5CbAU+jmfNuPpiO558WntRI7BC6pG4jFnbXcql9XGJUbmfs91TkUKw0LSU4fb/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009552; c=relaxed/simple;
	bh=HCHsDi19bILDlJOHit4/0iHUxsXLPTNoFDH75KuNzcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B8BT2rBaRdkpcQXxvaPxZUVVxTLBXEeGc3TTI6eMQnQ4CUVmXIdu+CUDZePoxqYBxkzfeSJ7WYXjqTtT3Dq+hh0O3eTFBqqq4IcwcP2w8y+B1L80GsZyaVcKCxxANCHZcGi/8m9K/O4meQPwrC+myygEXnqFYuTmCD/WCt6gPRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wQZjqIbB; arc=fail smtp.client-ip=40.107.74.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wQZjqIbB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pi6SFhzpV3ui/0zpASij1srV28KPezlOSqd+WJGpLpQV6Cr2FB2kKZRKOTm4/CqggKObzKi3xiH38+fKk4Q/HpU5fPrDR966gCFaBmoltFQ636lTkMY6rue/e3UetHTBMDjUKQxTtL9ve9h+QX8I5PBuhA/4rLWKftiEEAQbkFJ8Srjjyu8nI4kPNlDss4hkIVWDKi1EYeHm/y+hitzc4KLK80Tsi7gHlff8epm+KhGilK3KE2UZrAutVaKrkomr3tNlq3zI+ZtAYMjJAGauMs1Qc14fAy9k+QaQbEaIhaFhtsOhdetxUFDV+7Bn+MZti4vvbwGP2IIucQRcckQExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCHsDi19bILDlJOHit4/0iHUxsXLPTNoFDH75KuNzcM=;
 b=NR8Glc87WVqvppkIfpzfQEJ5Wz+V8UxRpPvlPjCdcUaPJA91pXCU2+dLvKPnb9L4SkjwLsUqVEtfZIcXv3lEbbjrR8PmLEN0Hj9WinzkLuhS1FMxbxoS5YwpqxErK70RVsqrV3B9/0TC300995dm6ZFo4A/0OQTVt75xQ/6DGQPigjmEXlqy8lQVqiRdZUcVwXYinLTSaN/709qGSXqIuhFRdH+57UbkWhMPAJmty1rCxHI61Y0klY4pjE2m1C8RS4EJP34GxFFGXOjSZbkvssUL6MyIsWqBj0I4IOAh3Ylx1l2E+VMqBugcdD++OdTTJ0B/TVvKlHgb4MvPvFsYmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCHsDi19bILDlJOHit4/0iHUxsXLPTNoFDH75KuNzcM=;
 b=wQZjqIbBSrS87XHdutX+XpPqqgo19PEo49Tul2fEWRlcpufobSxhMjApBraN9G2RmcUDW2z58CANiLuaTxGJc1dpgs2ZrxKSc1KSRh9LV/lQS+xgumOo3LUM9vo1goqObr4MvOLK6TFAn6p7CbUXXSnthhJsJNfVNIN6a9qPvD0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB16070.jpnprd01.prod.outlook.com (2603:1096:405:2ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 09:45:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 09:45:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "biju.das.au"
	<biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark
 Brown <broonie@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Topic: [PATCH v4 3/9] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Thread-Index: AQHdD31S9FH1h8kHdk+L8ggzHtk4aLaPYc9ggAFxY4CAABzTcA==
Date: Thu, 6 Aug 2026 09:45:33 +0000
Message-ID:
 <TY3PR01MB1134699B7AD17B7EC0464FB8086D22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
	 <20260709083108.108370-4-biju.das.jz@bp.renesas.com>
	 <TY3PR01MB11346A7ED25E81534A144B22F86D32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5e6e2e4e0f188377e63ac9d02b60aeb08cc29bb7.camel@pengutronix.de>
In-Reply-To: <5e6e2e4e0f188377e63ac9d02b60aeb08cc29bb7.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB16070:EE_
x-ms-office365-filtering-correlation-id: 760bf719-482e-4bde-d76b-08def39f75ac
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 AUP2vkeCxSq6weN2cuVBUKSjm+9D+NO3Vqk7dBu7p2TjoZdyJUMlSM32nrSznQUnwsCxzA5Xr2QiE+phdXT74nFUr0ZBKLDYcEgnNV0+JXU0/gZ48GResfQVZsMHIZrHzRXd2972KZs/a/ZkPjO76hN6YHkqTdfdVU706icGfIZ1flShhM+S22Uie8qBad1QBxa9x/s6ZYmfUtYEurP91DlCxKiWrR1bDScenEg7dglMNy6PTGrb2v0nqmspvQj4ftxan911RVkIS29vY3R6m94nYVFC0LFTUBL/FFghBlKtdef0aQf6aCfHfgvjZHlUgr7pHurOnPA61aUJbZICGAeuHxsOTfJEJtWplQnzdhBgqd0hENluuuBJqu8FUwo9rQdSfSi2UM8AVmxQQdYRPoF7n21nO4n6HWGSJZWUPGCs3K+ILWQX2va0VPksCIcU36RL9zCFN0XUj8zNuU2mnSGviE2q2IBFkKL7tqGEsWS/T85IyiFIrJ0kKj+qbViAHTg0ao0BbxS9QI0AWEI5yxtr1Bse11gPukVD3EL95btOhIPJZUaNK76iFJp/6NAIYsspcaQrqyHPlpctoipo7/Rui+IkYargQ/1KLv0FpNw/w1uiT7w6i6ielK1pTKfHdItUdl+0+dQNszcLFLaLJAC0g+ez6nrfKTkgA8CEoenPqRB/F4ki7qzU90Ti/OYC/oJ2qg1+a+s4fcCbdm84TMziK4kFcKAfeDG1j2UHQKo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2IrbThqTHZwdlBWbEs5czZJUVh1OHowMC84b3ZwZXNUenFyY04xaVdpY1Vi?=
 =?utf-8?B?bmhkbCtWc2xpNWJUdVJ0Y0ZEZ3dsME1rcTlpOXArQ2duWDJkRGJzQkxzc2VH?=
 =?utf-8?B?Y2pmNzhBeTlDemduT3JRVXBKWUt3QlY1QWlYc1dnSlBubm82SnFUN3E2NEww?=
 =?utf-8?B?bFNiTHp1b0F5VkR6ZTVITkRnT0VhOGJOayszZXFVbEtzRS9QK0xQNFo1UjRQ?=
 =?utf-8?B?Y3QrNEVVdktla1NHS3Jsaklxc3A5WEt2dzRjWlN0bStmQXUvdE9tcWJzdlJD?=
 =?utf-8?B?MmpmQnlxRXVjOXBxdW5mZ2VkdXIyd0tVN09CZ1VZdDNUWW9KOTJ3cE9uSmZv?=
 =?utf-8?B?SElKYmorZDR0YmRKUk5OR2s4N2RsY0R6T2NBOEtHazR4ZlhIdWlDeGxKUWR0?=
 =?utf-8?B?MUhSMk1JMUFGeklmbnZSR2VIb0xsdUlpTGlyU1YwQ3RpTGpGdnRRRXQyQlVx?=
 =?utf-8?B?QWxYQWhUajVXSXk0T1JkMmpNV25UK29LcW4wUktvcW5Fczc0a0YvclZLbm4r?=
 =?utf-8?B?RDgwbnh5YjdNMnFTT3NGY0FWU2prK2ZTQWR5ZDlDWnhJelZhZ3F0S3g3UEhw?=
 =?utf-8?B?cjdqbDc1aXdyWnVCQ1lTNW00RmlTWTRmVEFhNWRaV1RHWlJIMDZNeWRLZ1Vi?=
 =?utf-8?B?RjJrSXhud0ZHUWNuWmpuSURwNGhibUpORkZPWFRoY05KNXFiYkpSeDIrdndw?=
 =?utf-8?B?SU9QZFV2cmpnZ1EzT3l5aW8vcDU3cXE0M3doRmxYN3piUndicW1xdjhVKzlN?=
 =?utf-8?B?NDh2TlJuamRwdWJEMXdHY2ptRW9Kbm1FQkNabkxWQmxIWUM3TDhxMktLWWtM?=
 =?utf-8?B?TlJQRnhiai9xU2ZOMmd0R2ZQZk9jUU5HaWxaRk9jUkFaTEZNdjZTOExhMDds?=
 =?utf-8?B?Y21BU3lGaTl3c21CanZja216OFBjQzVxak5oakJsZGpHa0ZsMk9zTE00YmxW?=
 =?utf-8?B?V1dvRS8zZmpwWUtoSXUyczhNb2dJNUJzNjF6Ykc0ZWZxUURodEhTWG5aTFBP?=
 =?utf-8?B?eVExLzBIbk9nMHUrMzBzajM2M0tDZ2VsN21UdGFiL1VBSU1WVi9DTkZpaTMv?=
 =?utf-8?B?T2JzRDJPOEYwaXF4aWIxWWgzam0yaW1Wa3ViMkdEZlI4MlMrbFVQWmpuaTdp?=
 =?utf-8?B?UyswY0lCWGJxUEcvVWptVmRPNVBBS0luVWthb1dnS256LzV6cUE0V2hZKytJ?=
 =?utf-8?B?b2JvYWE1WVo2aUNhbGE5amQ0Y3dlMXJyWlhJT0lLTCtVZVp4Z0Z2ZjFldVkx?=
 =?utf-8?B?NC9JcjBQcGFVbkJPL1M4ZUx4THdZMXRWOWsyS3NtWW1GWTlZL1dBQXkzWFQx?=
 =?utf-8?B?VENZMEV3eEpiQ1VMSlJldG1FTUJaMWRCbFkvSTM2b3FpNVdhZ2RWQmdkdldl?=
 =?utf-8?B?byttRkdpN0hDZTUzSEVVd3BtZFhaQzhWakY5SG5XTGFWOVRKUnY5ejNuNjVu?=
 =?utf-8?B?ZFZUd2M0enE5bHdraW9XN3loeWRwN3NPODIzakMxcVJkRGxxVzlvN2lBNVpu?=
 =?utf-8?B?NFo1dFdQcHp5QTNJWTFQbENsWFh2RnVQMllQM3QvNU5yc0p3a01YbEpyQVlP?=
 =?utf-8?B?ZnJsVkxpUU5sczdWVThXcUdmYXJ1ZzhKbjVjck1kOFRTOVhScXd1S0gyMDF6?=
 =?utf-8?B?KytQUisvUjFDK1JwN0tUcEIveVJpNjFlY0FKTExwWDNaVGo0TDJvVDZyZ2t4?=
 =?utf-8?B?aWY2ZGpSNUZhblp2cUpENmE1WHJDTE5vQ25MMUsxVmVnSnhVQmdtckZKNVlP?=
 =?utf-8?B?b3RPS0tNbFU3TmQ1N1dmMUZLcDBrM1pjOHlVZEZacjk0YkxYd1B1d0JtaEFL?=
 =?utf-8?B?OEVsVHF3ZUVlNVFTdW1FOXNHSVNCdmxwU1g5T09lU213dDFmeGlYeVZaekFl?=
 =?utf-8?B?a0NYYXc5RlFDa044Ly81aTI4SUJ4eTc0UnRzWWRsQjArZUp1RHp0Ty9Ed0pB?=
 =?utf-8?B?Y2xkYlE0ME9YaFpyQmRlMTZaV3ptZ1BGNCtWSlBGWWx4Zjd1ZVBOb0E3enZx?=
 =?utf-8?B?U1IyQm1QWmk1QkgyMUdTWWkzS0VmQWlpK0NWZVdTQmlkQ2lVM0psdzc1aWU2?=
 =?utf-8?B?VmhJMkJoMUlpMnArZXYzRVoxN01vWVQvaXg2cjZ5YnhacnZ4NE45d2NQVHpK?=
 =?utf-8?B?aFF6bkFwZEhrSWllNWUzUUVCU0QxamJFTXV5SndUWEV5NzdyNHhmWit2dnRq?=
 =?utf-8?B?R2dzSFJJRDhoaG9aT1dSdzlkL2pQamtid2dWSmRkdFlLcDZ5cXVrNlBCMW5E?=
 =?utf-8?B?M2JCUTRRMUZSaThNbUtCMEVaalZpL1R5TTQ5OUM3QUhBeENnc09wN2ErejFC?=
 =?utf-8?B?SUJZK0w3OTBPYy9ZdkgwaVcyTlJIS2s4VTZkcUlZckhsVkcwVjNKUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 760bf719-482e-4bde-d76b-08def39f75ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 09:45:33.1976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h+VLP+c8dQNVKjktRwczCj6WmbKL0e4/2XBGPdRZtQ7YHTeV9G8HiurWv1210cJ/luHzJ1aBNsvf0AQi2SBPCkY6RZcIKt98FDlTrJNuGPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16070

SGkgUGhpbGlwcCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAwNiBBdWd1c3QgMjAy
NiAwODo1Ng0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDMvOV0gcmVzZXQ6IHJ6ZzJsLXVzYnBo
eS1jdHJsOiBBZGQgUlovRzNMIHN1cHBvcnQNCj4gDQo+IE9uIE1pLCAyMDI2LTA4LTA1IGF0IDEw
OjI2ICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBIaSBQaGlsaXBwIFphYmVsLA0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQmlqdSA8YmlqdS5k
YXMuYXVAZ21haWwuY29tPg0KPiA+ID4gU2VudDogMDkgSnVseSAyMDI2IDA5OjMxDQo+ID4gPiBT
dWJqZWN0OiBbUEFUQ0ggdjQgMy85XSByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBSWi9H
M0wgc3VwcG9ydA0KPiA+ID4NCj4gPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBBZGQgdGhlIHJlbmVzYXMscjlhMDhnMDQ2LXVzYnBo
eS1jdHJsIGNvbXBhdGlibGUgc3RyaW5nIHRvIHRoZSBPRg0KPiA+ID4gbWF0Y2ggdGFibGUgZm9y
IHRoZSBSWi9HM0wgKHI5YTA4ZzA0NikgU29DLCB1c2luZyBhIGRlZGljYXRlZCByemczbF9pbmZv
IHN0cnVjdCB3aXRoIHB3cnJkeSBzZXQsDQo+IHNpbWlsYXIgdG8gUlovRzNTLg0KPiA+ID4NCj4g
PiA+IFRoZSBSWi9HM0wgU29DIGhhcyAyIE9URyBjb250cm9sbGVycyBjb21wYXJlZCB0byBvbmUg
b24gUlovRzNTLCBzbw0KPiA+ID4gaXQgdXNlcyBhIHNlcGFyYXRlIHJ6ZzNsLXZidXMtIHJlZ3Vs
YXRvciBkcml2ZXIgdG8gaGFuZGxlIHRoZQ0KPiA+ID4gYWRkaXRpb25hbCBWQlVTRU4gY29udHJv
bCBmb3IgcG9ydCAyLiBUaGUgcmVndWxhdG9yX2RyaXZlcl9uYW1lDQo+ID4gPiBmaWVsZCBpcyB1
c2VkIGFzIHRoZSBwbGF0Zm9ybSBkZXZpY2UgbmFtZSBwYXNzZWQgdG8gcGxhdGZvcm1fZGV2aWNl
X2FsbG9jKCksIGFuZCBtdXN0IGV4YWN0bHkgbWF0Y2gNCj4gdGhlIG5hbWUgdGhlIGNvcnJlc3Bv
bmRpbmcgcmVndWxhdG9yIGRyaXZlciByZWdpc3RlcnMgdmlhIGl0cyBpZF90YWJsZSBmb3IgcGxh
dGZvcm0gYnVzIG1hdGNoaW5nIHRvDQo+IHN1Y2NlZWQuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiB2My0+djQ6DQo+ID4gPiAgKiBVcGRhdGVkIHRoZSBjb21taXQgZGVzY3JpcHRpb24uDQo+
ID4gPiAgKiBNaWdyYXRlZCB0byBpZF90YWJsZSBtYXRjaCB1c2luZyBkcml2ZXJfbmFtZSBhbmQg
cmVkdWNlZCB0aGUgbGVuZ3RoDQo+ID4gPiAgICA8IDI0Lg0KPiA+ID4gdjItPnYzOg0KPiA+ID4g
ICogTm8gY2hhbmdlLg0KPiA+ID4gdjEtPnYyOg0KPiA+ID4gICogTm8gY2hhbmdlLg0KPiA+ID4g
LS0tDQo+ID4gPiAgZHJpdmVycy9yZXNldC9yZXNldC1yemcybC11c2JwaHktY3RybC5jIHwgMTQg
KysrKysrKysrKysrLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9y
ZXNldC1yemcybC11c2JwaHktY3RybC5jDQo+ID4gPiBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtcnpn
MmwtdXNicGh5LWN0cmwuYw0KPiA+ID4gaW5kZXggODRlNzQ1ZTQ5MjQwLi4wODAzMTk1MDgwYmQg
MTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXJ6ZzJsLXVzYnBoeS1jdHJs
LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtcnpnMmwtdXNicGh5LWN0cmwuYw0K
PiA+ID4gQEAgLTQyLDYgKzQyLDcgQEAgc3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX3ByaXYgeyAg
fTsNCj4gPiA+DQo+ID4gPiAgc3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX2luZm8gew0KPiA+ID4g
Kwljb25zdCBjaGFyICpyZWd1bGF0b3JfZHJpdmVyX25hbWU7DQo+ID4gPiAgCWJvb2wgcHdycmR5
Ow0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4gQEAgLTExMCwxNSArMTExLDI0IEBAIHN0YXRpYyB2
b2lkIHJ6ZzJsX3VzYnBoeV9jdHJsX2luaXQoc3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX3ByaXYg
KnByaXYpDQo+ID4gPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnByaXYtPmxvY2ssIGZsYWdz
KTsgIH0NCj4gPiA+DQo+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF91c2JwaHlfY3Ry
bF9pbmZvIHJ6ZzJsX2luZm8gPSB7fTsNCj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJs
X3VzYnBoeV9jdHJsX2luZm8gcnpnMmxfaW5mbyA9IHsNCj4gPiA+ICsJLnJlZ3VsYXRvcl9kcml2
ZXJfbmFtZSA9ICJyemcybC12YnVzLXJlZ3VsYXRvciIsIH07DQo+ID4gPg0KPiA+ID4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcnpnMmxfdXNicGh5X2N0cmxfaW5mbyByemczc19pbmZvID0gew0KPiA+
ID4gKwkucmVndWxhdG9yX2RyaXZlcl9uYW1lID0gInJ6ZzJsLXZidXMtcmVndWxhdG9yIiwNCj4g
PiA+ICsJLnB3cnJkeSA9IHRydWUsDQo+ID4gPiArfTsNCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IHJ6ZzJsX3VzYnBoeV9jdHJsX2luZm8gcnpnM2xfaW5mbyA9IHsNCj4gPiA+
ICsJLnJlZ3VsYXRvcl9kcml2ZXJfbmFtZSA9ICJyemczbC12YnVzLXJlZ3VsYXRvciIsDQo+ID4g
PiAgCS5wd3JyZHkgPSB0cnVlLA0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4gIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJ6ZzJsX3VzYnBoeV9jdHJsX21hdGNoX3RhYmxlW10gPSB7
DQo+ID4gPiAgCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyemcybC11c2JwaHktY3RybCIsIC5k
YXRhID0gJnJ6ZzJsX2luZm8gfSwNCj4gPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5
YTA4ZzA0NS11c2JwaHktY3RybCIsIC5kYXRhID0NCj4gPiA+ICZyemczc19pbmZvIH0sDQo+ID4g
PiArCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOGcwNDYtdXNicGh5LWN0cmwiLCAuZGF0
YSA9DQo+ID4gPiArJnJ6ZzNsX2luZm8gfSwNCj4gPiA+ICAJeyAvKiBTZW50aW5lbCAqLyB9DQo+
ID4gPiAgfTsNCj4gPiA+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCByemcybF91c2JwaHlfY3Ry
bF9tYXRjaF90YWJsZSk7IEBAIC0yNDUsNw0KPiA+ID4gKzI1NSw3IEBAIHN0YXRpYyBpbnQgcnpn
MmxfdXNicGh5X2N0cmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+
ICAJaWYgKGVycm9yKQ0KPiA+ID4gIAkJZ290byBlcnJfcG1fcnVudGltZV9wdXQ7DQo+ID4gPg0K
PiA+ID4gLQl2ZGV2ID0gcGxhdGZvcm1fZGV2aWNlX2FsbG9jKCJyemcybC11c2ItdmJ1cy1yZWd1
bGF0b3IiLCBwZGV2LT5pZCk7DQo+ID4gPiArCXZkZXYgPSBwbGF0Zm9ybV9kZXZpY2VfYWxsb2Mo
aW5mby0+cmVndWxhdG9yX2RyaXZlcl9uYW1lLA0KPiA+ID4gK3BkZXYtPmlkKTsNCj4gPg0KPiA+
IFBsZWFzZSBsZXQgbWUga25vdywgc2hvdWxkIEkgc2VuZCBhIHBhdGNoIHRvIGluY3JlYXNlIHRo
ZSBsZW5ndGggZnJvbQ0KPiA+IDI0LT4zMiBbMV0gU28gdGhhdCB0aGVyZSB3b24ndCBiZSBhbnkg
YmFja3dhcmQgY29tcGF0aWJpbGl0eSBpc3N1ZXMuDQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ny4xLjIvc291cmNlL2luY2x1ZGUvbGludXgvbW9k
X2RldmljDQo+ID4gZXRhYmxlLmgjTDYwNA0KPiANCj4gSSdtIG5vdCBzdXJlLg0KPiANCj4gUExB
VEZPUk1fTkFNRV9TSVpFIHdhcyBsYXN0IGV4dGVuZGVkIGluIGNvbW1pdCA2NTU4NjI4NjVjOTcN
Cj4gKCJtb2RfZGV2aWNldGFibGU6IEVubGFyZ2UgdGhlIG1heGltdW0gcGxhdGZvcm1fZGV2aWNl
X2lkIG5hbWUgbGVuZ3RoIiksIGJ1dCBvbmx5IHZlcnkgY29uc2VydmF0aXZlbHkuDQo+IFdoZXRo
ZXIgaXQgaXMgcmVsZXZhbnQgdGhhdCBwbGF0Zm9ybV9kZXZpY2VfaWQgZml0cyBpbnRvIDMyLWJ5
dGUgY2FjaGUgbGluZSBzaXplIG9mIHNvbWUgYXJjaGl0ZWN0dXJlcywgSQ0KPiBjYW4ndCBzYXku
IFRoZSBfTkFNRV9TSVpFcyBvZiBvdGhlciBidXNlcyAoYXV4LCBpMmMsIHNwaSwgLi4uKSBhbHJl
YWR5IHZhcnkgYmV0d2VlbiAyMCBhbmQgNDAgY2hhcnMuDQoNClRoYW5rcyBmb3IgdGhlIHBvaW50
ZXIuIA0KDQo+IA0KPiBZb3UgY291bGQgZWl0aGVyIHRyeSB0aGF0LCBvciB5b3UgY291bGQgcHJl
cGVuZCBhIHNpbmdsZSBwYXRjaCB0aGF0IGRvZXMgdGhlICJyemcybC11c2ItdmJ1cy1yZWd1bGF0
b3IiIC0NCj4gPiAicnpnMmwtdmJ1cy1yZWd1bGF0b3IiIHJlbmFtZSBpbiBib3RoIHJlZ3VsYXRv
ciBhbmQgcmVzZXQgZHJpdmVycyBhbmQgdGhhdCBjb3VsZCBiZSBtZXJnZWQgaW50byBib3RoDQo+
IHRyZWVzLg0KDQoNCkFmdGVyIHJlYWRpbmcgY29tbWl0IG1lc3NhZ2UgaW4gNjU1ODYyODY1Yzk3
IFsxXSwgdGhlIHNpemUgaXMNCnJlc3RyaWN0ZWQgdG8gMzIgYnl0ZXMuIFNvLCBJIHdpbGwgcHJl
cGFyZSBhIHNpbmdsZSBwYXRjaCB0aGF0DQpkb2VzIHRoZSAicnpnMmwtdXNiLXZidXMtcmVndWxh
dG9yIiAtPiJyemcybC12YnVzLXJlZ3VsYXRvciIgcmVuYW1lDQppbiBib3RoIHJlZ3VsYXRvciBh
bmQgcmVzZXQgZHJpdmVycy4NCg0KWzFdDQpzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlX2lkIHsNCiAg
ICAgICAgICAgIGNoYXIgICAgICAgICAgICAgICAgICAgICAgIG5hbWVbMjBdOyAgICAgICAgICAg
ICAvKiAgICAgMCAgICAyMCAqLw0KICAgIA0KICAgICAgICAgICAgLyogWFhYIDQgYnl0ZXMgaG9s
ZSwgdHJ5IHRvIHBhY2sgKi8NCiAgICANCiAgICAgICAgICAgIGtlcm5lbF91bG9uZ190ICAgICAg
ICAgICAgIGRyaXZlcl9kYXRhOyAgICAgICAgICAvKiAgICAyNCAgICAgOCAqLw0KICAgIA0KICAg
ICAgICAgICAgLyogc2l6ZTogMzIsIGNhY2hlbGluZXM6IDEsIG1lbWJlcnM6IDIgKi8NCiAgICAg
ICAgICAgIC8qIHN1bSBtZW1iZXJzOiAyOCwgaG9sZXM6IDEsIHN1bSBob2xlczogNCAqLw0KICAg
ICAgICAgICAgLyogbGFzdCBjYWNoZWxpbmU6IDMyIGJ5dGVzICovDQogICAgfTsNCg0KQ2hlZXJz
LA0KQmlqdQ0K
