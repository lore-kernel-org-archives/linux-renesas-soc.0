Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37814322EE;
	Tue,  4 Aug 2026 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836338; cv=fail; b=M5Fm5gOcQhsOcISX5Q6amZiCAIuVXNgZs2oWFjUoyoOIFCuya2Qw2eYh4iuSDn4W3SlJPyBt6hpCdEI3yv8zDRcRGZfcJITJzusxETqoZfyz2CnrffMCy1IGcipk6NOxdrYRbrKmwXzYqtgnoTloJnbO4HO0lTCmHmKGc88DZPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836338; c=relaxed/simple;
	bh=NIuIBcAnk/85Qrv1Tmb6WrpSdhlgpuaYXPfH6VpsQ2U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M6AwSzwaKdKEVJHa0QxWDMxr/wHke1ZfChd2PtpnQllvd3uzaWm6aWvx6Td1N1WACWGWSn6bcL+lWreaKW5mh2wguBt+Fs34oaEIWlbhk6jJa8+FTX3kJr9CcvUEbwra8aQ7LkdixRq88s7+q+ZetrWnw2cPn20ErrloRoNG2p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HeAJFwgk; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HeAJFwgk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvCpd/dgh97K+hIq+qPYyMjFVrY/Yw8Ea4+CvIS5PfJQEGrac+uvQ4tOiFcx62fOAIWxzi8+g0xbbBbCUkDVE/UuZTAWpTVHl1pEN8GIwRoBbRMlP6E7fwkUDdrN+7exdqCdJHVjQGYWEvZxssHPhXBf5sHhavKMVZCd9oxDI1EudZZr7XQAaHJWgtOopt22VDiX5vDDN2OPzzGd6uOK7154uVCZf0oYYizHNmlxa7/SuZPKI17oFP75YvQf6s44SOFCV2fdefSIW3uu/NxKM4gbOaZbVtGnlF6pDTzFucal1NVPtBOU995WE94a59gmXH/2/zJLv7SdQJButslMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIuIBcAnk/85Qrv1Tmb6WrpSdhlgpuaYXPfH6VpsQ2U=;
 b=Zoetbi+hAQGfidppSQlMvJ1ETndIOml8mzD7vSMhtuArl5LSqWaWw2Z36CQJF66sRW9Va/a8LcCYW3hDzVw0+JV74GUh+yh4X/3YS5Ldm0BJC/bg9JCUES14sBqAxGulCl6MAJosfJtkAsxN/AMAt4c/QYmKJNxUjWBp05D0vXEuurKzimp2Lkaq7Z/99+7HskZtxXE3aalfaIr8w2O8Xl0kzIFWTSYSLrXBYaeiUTRbyFLQTf1pKO60zRpM3UYXI6oxMYsMJQDsLLwHKFPopy2LaXaPCfJysUD8fZ3FBy744hMY7RQIi9D3tUL4MDzDm/31V9cONeq5PgSMoKzBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIuIBcAnk/85Qrv1Tmb6WrpSdhlgpuaYXPfH6VpsQ2U=;
 b=HeAJFwgkaYfL4ibHHvk6QCCTt4FXXyjx0K9C7jw4dCjz0IVdZshdPPSAsrDlBRksqaseZYz+CSZ+XmwizI/mMtZ+Gz141HWtBGrWocvIBddWylXdmFSFhj2x+gd7JvEpQ1xvxI73y2gdTwP6ZV0oapNKpTuY/ZgZK2yMsFLUVTE=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS3PR01MB8636.jpnprd01.prod.outlook.com (2603:1096:604:19a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 09:38:49 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 09:38:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm"
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in
 rcar_gen3_phy_usb2_remove due to race condition
Thread-Topic: [PATCH] phy: renesas: rcar-gen3-usb2: Fix use-after-free in
 rcar_gen3_phy_usb2_remove due to race condition
Thread-Index: AQHdI+lxQiWI1zsUOEayjIBpj7lTFraNj3zAgAAJZwCAAAA0cIAABuSAgAACDvA=
Date: Tue, 4 Aug 2026 09:38:36 +0000
Message-ID:
 <TYCPR01MB11332566338565BC938D459D686D42@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References:
 <d265021fb7fe432e32eedbe9e075fb041c15cbe6.1785830417.git.xiaopei01@kylinos.cn>
 <TY3PR01MB1134664317D6A75D8230DB51B86D42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <63160e2f-8566-4a2f-b0fe-ba97603df78b@kylinos.cn>
 <TY3PR01MB1134613500284ECC47AE1B1D686D42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c1449f71-b516-4184-b224-052d2e0a46e6@kylinos.cn>
In-Reply-To: <c1449f71-b516-4184-b224-052d2e0a46e6@kylinos.cn>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS3PR01MB8636:EE_
x-ms-office365-filtering-correlation-id: b4bcc364-80cd-4c1d-8fff-08def20c284d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 9yIpLtwcptRFRp2QSGplg7Y+Jh8t0DkXegeNwqwfrhn3DtjEMdJ5GuDWGdo48UeyfrtcYjEiuCnXe7ps+FN9lhvCY/m0BoV74yCOlHIcos/OhCnyeVaf3K709PXBUFsITCT7qnlbHjIPx063uH8HqxLy0sg38og7rKwqOGK1CSjmeNmSerSWPKAU7vIkpaUHgz3eWAUU1dYwJ0MZZOJPGDcb6T+koRDYcQp7Pbjn59kZahoIF4DlVc7eHwIX74AFxXhK8Kbf/tOgB+Fyhj4gmekDe+BT1suPrgbDcUD3AFiVks5oCQyid+lfOOS+fFxFPx+c2KOQZAWtEd6QLhYnLvNsug/3xrSfO2X5dJlEZ9Ist9S4ERmcUAJZv5lMgFPtKYmuAts5zMTo1T7BowySwkEitzI6wy2aljbh+nS5Vt1uAbr810T+2uusV24O2kK8rCbCFbY/RtY41eVOmkwlxYgUH1x4Qb3bd8gAHWmXsndewSfSWaNY3Zcb+/7kMIsvq/RSA9Y1Wg5pudkL5dPR30B986PbmZIiZVaakQg3SBajU2urXQmZCdC0umnzYSDNWYRDPxgqXCHK9vlR4zyGhaz1JZbe0IV5Kfnxw05Df15PZzQuYhFuOxjHa1b/PZbonhjL7GgXbpL5SKP386HNCer2hvAZPIQq70TOu/3ljEcvVL82+rQPV1yHRrjBM1oa8hKvrIcsYSMAcCMm3zsRGVCUy6QZU0RQ+2DIDkHsvSE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVRNbmN1L095QUt5SmxEUlNDd0F0a3l0aXJMazBSeGpQY2RFd0pQenlWYW1W?=
 =?utf-8?B?TUorZS9yR0RQYmxMdWlOUXN6RWltWXZ0Um90RDJaZDhJQW5QMXBheUpNLytP?=
 =?utf-8?B?M3NWYUhlMzBzWnRsbTZSdmlrVmZCL04vbUNnRzRuSGt1a1hqRWxhM1Z3dG1L?=
 =?utf-8?B?bHpxdUY1Vm4yVHYrOU9SR1U0V2VTNGhITzlad0FsRlNDUkRncUdpblRKRmJC?=
 =?utf-8?B?U0tEdk5iQjVSNFloR211RWNtSHMwUGhiblRiODZDQnJLYW03MjlIV01zTGkr?=
 =?utf-8?B?R3ZCM3RNOEVwbVlLV1lzL0dWNllXN25vOUV2bWpzYXJieDA1Q014UXk2anlF?=
 =?utf-8?B?QTlqajJwVzBnbVlzWWlGaTIrZDM4RENjcGpzZWdKL2RPdEovOUpaZU5MSHpu?=
 =?utf-8?B?L25neGk0eXkzdWdtdHZTanZXNzlwYjdSNExJOWl3UXVwd3hCajgrbHFUOFNl?=
 =?utf-8?B?enY1NHltQVBGUlpCR0I3K1dCcVFLYmN5NG1BREhWVjJnelFVMlZWWXlobHVE?=
 =?utf-8?B?L1ZIWlZOSlp0R1lLd0JXVzR6eXpiVis4aTBQZ0N2YnpUbjZsa3llbnovc1hC?=
 =?utf-8?B?dW9BN3c2NUJFK21YUEpJbEpLNk0zVGpXb010N1plblV2M21uOTVNaldxa2Ra?=
 =?utf-8?B?MkRLYnJsT0JPdCswU0N1SXJSYTc2OHZmaG5WeDdBL3REalJhTm1aSWI4R1FR?=
 =?utf-8?B?NEJ5MVBxZ0ZZTUVjU2xabTBhY28zcm1xSVpuak9BNC9pdkRJRm1VTFpMZUJD?=
 =?utf-8?B?Y0g2UDVDSTVIWE1HU1llVnpNRmZRM0JkTHJIbjR3aDZTQmo4bzlTQUI4U1cy?=
 =?utf-8?B?aEFQSXFaUEFWRk9lMDk1Snh5OWZYYUhuZXpIR3JBQkJ5TW1LQ0M4aUVDRzc1?=
 =?utf-8?B?dVFaQ1pSWXg0eGlhOW1PSUNHNkhHdVo1b0xJZS9SRXJTTHZteFAvMGNhMGd6?=
 =?utf-8?B?R05xZk4ranZjUDVCWWYxZENXQnpMeUlHSzROQVcrWE9kRU1DMVJFc2tleExR?=
 =?utf-8?B?OGw0MWJHRmlMUHgveFM5MkV4Q0lGSS9EbGNVb2pBKzZsQ3lNSWQ3ckxIaU8y?=
 =?utf-8?B?NnExc0hqcCtDY0d3TittamxFNDdhTWwxTjhJV3ovQXJ6Q3EwUEdDY3FiVnBN?=
 =?utf-8?B?ajZLcmdKZ2pDSUYzVVM0WHBlNkZRUEpTWFZLcE5GSjZGNWVXM2VRaWJ4SUF1?=
 =?utf-8?B?MHZmU1Z1eHkraGZvSnpiOTEwYUZCU1ZnanRjSE1pcnJqZEdhd2J0T0I3ZVhm?=
 =?utf-8?B?VllDL1h6bDAwM3JhZW5hVGg5dktWUW51d1VNYndLb3hoSWU5bWVCSU9VRlY4?=
 =?utf-8?B?VTJSd0RIYU4wL3RMTlVISC9ORFhWVWlmWXJEYXBidlhuZWI3QURHSnZnSTZD?=
 =?utf-8?B?Y2lPYXpHN0RaakpZeHNxM2NOMzd6aVdaS0w3Q05BS0JFU1FxMjZBY25nd2w0?=
 =?utf-8?B?VElNb2VXaUhzdW9MTHY1c1pycnZkNFVnRFVuNk5rMjYreVRReGVDdUNhdkQ4?=
 =?utf-8?B?cW9NaG9PSmZIWlU2aGlBMDV0TXdqaDltM2lkcHVTMSttWUhvUEZXd2gwMkdn?=
 =?utf-8?B?OGNaYm8yMzYxVW02Q3JVd0czckVaUzlqR25acTVHdkhkTmZkUFdlTy9pRHha?=
 =?utf-8?B?elVXWnQ0N2g2R3FWa1FXT0lNQmFMUzJ0ckJpcHBlTjA3NkFpMXFyK0x3Wk1T?=
 =?utf-8?B?VVVXUXJGTW5sNFdxWWxQMHFMckQ4TEhQUG1pd1lvRXBROFF6S2hORGFUVHlh?=
 =?utf-8?B?QjZDQm5XajFhQ3p3MWh4RXdqYlJiZnNJSmxJek9aa1BvbCt5M1FRTFlPMHBo?=
 =?utf-8?B?Zml5TllJYy9Iak1iNzZuNTNGNkhvN09YTSthT1E4d3pqMklRSWZQaEhIUDB3?=
 =?utf-8?B?M1JLaktjOWNyc05LSEhsYzhKVnZLVXV5cDVvWGh1S1B4UmlLNUhOcjg4N0Jl?=
 =?utf-8?B?K21DSGVDdmdFeEFBSS94VWxHb1dWL3BlK0szellPQkRIQnVVUTRhRmNnQ2wx?=
 =?utf-8?B?UTRBU2Q2Q203QmoyZG5zV0RHbWRIR3ZUTlFDdkJsc0U2QVJPbmxheTVYN1pE?=
 =?utf-8?B?REJ1QVFGb0JVOEFkZ1IwRHkyR0JIZTlMaEZOWkpFNW5KV0FNekl5Zk4yczYy?=
 =?utf-8?B?Q0YwK3JxdXRhZW9xV3FTSmhHRVkwaVpzaDVLZUdJQ3g4eUlsSlZRRklIbGRk?=
 =?utf-8?B?SlZFM2Uwc3UvVDhoMjlOSGdhTlhsRnBsdGVaZnQzd3o0ZzJWNGMwVmpIMHFz?=
 =?utf-8?B?ckJrSWJ2WDRuQ1FWUlVpUm9kVzhiUlNJektsSkZrSkRMNlVkU0t0YWJJUW44?=
 =?utf-8?B?c1dQN0RhSlJOODZQbzcxUUV3bVRFNHRHUHRkRnpVQUxINWdCMkJkQT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bcc364-80cd-4c1d-8fff-08def20c284d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 09:38:36.2076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46ayUR/ehqJ7+ItAM1jw1+rHgOvgtPVsGsJiU3Ai7Bsw0GNRziLNxPqiYScYZ6Cl9SLMhktBWMAirWkybNe8oU/Jx3yzN1NhGSA2bsJKYvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8636

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGVpIFhpYW8gPHhpYW9w
ZWkwMUBreWxpbm9zLmNuPg0KPiBTZW50OiAwNCBBdWd1c3QgMjAyNiAxMDozMQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBwaHk6IHJlbmVzYXM6IHJjYXItZ2VuMy11c2IyOiBGaXggdXNlLWFmdGVy
LWZyZWUgaW4gcmNhcl9nZW4zX3BoeV91c2IyX3JlbW92ZSBkdWUgdG8NCj4gcmFjZSBjb25kaXRp
b24NCj4gDQo+IA0KPiANCj4g5ZyoIDIwMjYvOC80IDE3OjA4LCBCaWp1IERhcyDlhpnpgZM6DQo+
ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBQZWkg
WGlhbyA8eGlhb3BlaTAxQGt5bGlub3MuY24+DQo+ID4+IFNlbnQ6IDA0IEF1Z3VzdCAyMDI2IDEw
OjA1DQo+ID4+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBZb3No
aWhpcm8gU2hpbW9kYQ0KPiA+PiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+Ow0K
PiA+PiB2a291bEBrZXJuZWwub3JnOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBnZWVydCty
ZW5lc2FzQGdsaWRlci5iZTsNCj4gPj4gbWFnbnVzLmRhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNv
bT47DQo+ID4+IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgbGludXgtcGh5QGxp
c3RzLmluZnJhZGVhZC5vcmc7DQo+ID4+IGxpbnV4LSBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+
ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHBoeTogcmVuZXNhczogcmNhci1nZW4zLXVzYjI6IEZp
eCB1c2UtYWZ0ZXItZnJlZQ0KPiA+PiBpbiByY2FyX2dlbjNfcGh5X3VzYjJfcmVtb3ZlIGR1ZSB0
byByYWNlIGNvbmRpdGlvbg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+PiDlnKggMjAyNi84LzQgMTY6
MzQsIEJpanUgRGFzIOWGmemBkzoNCj4gPj4+IEhpIFBlaSBYaWFvLA0KPiA+Pj4NCj4gPj4+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoLg0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+Pj4+IEZyb206IFBlaSBYaWFvIDx4aWFvcGVpMDFAa3lsaW5vcy5jbj4NCj4gPj4+
PiBTZW50OiAwNCBBdWd1c3QgMjAyNiAwOTowMg0KPiA+Pj4+IFN1YmplY3Q6IFtQQVRDSF0gcGh5
OiByZW5lc2FzOiByY2FyLWdlbjMtdXNiMjogRml4IHVzZS1hZnRlci1mcmVlDQo+ID4+Pj4gaW4g
cmNhcl9nZW4zX3BoeV91c2IyX3JlbW92ZSBkdWUgdG8gcmFjZSBjb25kaXRpb24NCj4gPj4+Pg0K
PiA+Pj4+IEluIHJjYXJfZ2VuM19waHlfdXNiMl9wcm9iZSwgJmNoYW5uZWwtPndvcmsgaXMgYm91
bmQgd2l0aA0KPiA+Pj4+IHJjYXJfZ2VuM19waHlfdXNiMl93b3JrLiByY2FyX2dlbjNfcGh5X3Vz
YjJfaXJxIGNhbiBzY2hlZHVsZSB0aGlzDQo+ID4+Pj4gd29yayBvbiBzeXN0ZW1fd3EgdmlhIHJj
YXJfZ2VuM19kZXZpY2VfcmVjb2duaXRpb24oKSwgYW5kIHRoZSByb2xlDQo+ID4+Pj4gc3lzZnMg
c3RvcmUgY2FuIGFsc28gc2NoZWR1bGUgaXQNCj4gPj4gdmlhIHJjYXJfZ2VuM19pbml0X2Zvcl9o
b3N0KCkgLyByY2FyX2dlbjNfaW5pdF9mb3JfcGVyaSgpLg0KPiA+Pj4+DQo+ID4+Pj4gSWYgd2Ug
cmVtb3ZlIHRoZSBkZXZpY2UsIHJjYXJfZ2VuM19waHlfdXNiMl9yZW1vdmUgbWFrZXMgY2xlYW51
cA0KPiA+Pj4+IGFuZCB0aGUgbWVtb3J5IGFsbG9jYXRlZCBmb3IgY2hhbm5lbCB3aXRoIGRldm1f
a3phbGxvYygpIGlzDQo+ID4+Pj4gcmVsZWFzZWQgYnkgdGhlIGRldm0gY2xlYW51cCBhZnRlciB0
aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybnMsDQo+ID4+Pj4gd2hpbGUgdGhlIHdvcmsgbWVudGlv
bmVkIGFib3ZlIG1heSBzdGlsbCBiZSBwZW5kaW5nIG9yIHJ1bm5pbmcuIFRoZQ0KPiA+Pj4+IHNl
cXVlbmNlIG9mIG9wZXJhdGlvbnMgdGhhdCBtYXkgbGVhZCB0byBhIFVBRiBidWcNCj4gPj4gaXMg
YXMgZm9sbG93czoNCj4gPj4+Pg0KPiA+Pj4+IENQVTAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIENQVTENCj4gPj4+Pg0KPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgcmNhcl9nZW4zX3BoeV91c2IyX2lycQ0KPiA+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgcmNhcl9nZW4zX2RldmljZV9y
ZWNvZ25pdGlvbg0KPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgcmNhcl9nZW4zX2luaXRfZm9yX2hvc3QNCj4gPj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IHNjaGVkdWxlX3dvcmsoJmNoLT53b3JrKQ0KPiA+Pj4+
IHJjYXJfZ2VuM19waHlfdXNiMl9yZW1vdmUgICAgICAgICAgICAgICAgIHwNCj4gPj4+PiBkZXZp
Y2VfcmVtb3ZlX2ZpbGUoJnBkZXYtPmRldiwgICAgICAgICAgICB8DQo+ID4+Pj4gICAgICAgICAg
ICAgICAgICAgICZkZXZfYXR0cl9yb2xlKSAgICAgICAgfA0KPiA+Pj4+IC8vIHJlbW92ZSByZXR1
cm5zICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPj4+PiAvLyBkZXZtIGNsZWFudXA6IGZy
ZWVfaXJxLCAgICAgICAgICAgICAgICB8DQo+ID4+Pj4gLy8ga2ZyZWUoY2hhbm5lbCkgICAgICAg
ICAgICAgICAgICAgICAgICAgfA0KPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgcmNhcl9nZW4zX3BoeV91c2IyX3dvcmsNCj4gPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IC8vIHVzZSBjaA0KPiA+Pj4+ICh1c2Ut
YWZ0ZXItZnJlZSkNCj4gPj4+Pg0KPiA+Pj4+IEZpeCBpdCBieSBkaXNhYmxpbmcgdGhlIE9URyBp
bnRlcnJ1cHRzLCBzbyB0aGUgSVJRIGhhbmRsZXIgY2Fubm90DQo+ID4+Pj4gc2NoZWR1bGUgbmV3
IHdvcmssIGFuZCBjYW5jZWxpbmcgdGhlIHdvcmsgYmVmb3JlIHRoZSByZW1haW5pbmcNCj4gPj4+
PiBjbGVhbnVwIGluIHJjYXJfZ2VuM19waHlfdXNiMl9yZW1vdmUNCj4gPj4gYW5kIHRoZSBkZXZt
IHJlbGVhc2Ugb2YgY2hhbm5lbC4NCj4gPj4+Pg0KPiA+Pj4+IEZpeGVzOiBjMTRmOGE0MDMyZWYg
KCJwaHk6IHJjYXItZ2VuMy11c2IyOiBmaXggbXV0ZXhfbG9jayBjYWxsaW5nDQo+ID4+Pj4gaW4N
Cj4gPj4+PiBpbnRlcnJ1cHQiKQ0KPiA+Pj4+IEFzc2lzdGVkLWJ5OiBDb2RleDpkZWVwc2Vlay12
NC1mbGFzaA0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFBlaSBYaWFvIDx4aWFvcGVpMDFAa3lsaW5v
cy5jbj4NCj4gPj4+PiAtLS0NCj4gPj4+PiAgZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1n
ZW4zLXVzYjIuYyB8IDEwICsrKysrKysrKy0NCj4gPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJjYXItZ2VuMy11c2IyLmMNCj4gPj4+PiBiL2RyaXZlcnMv
cGh5L3JlbmVzYXMvcGh5LXJjYXItZ2VuMy11c2IyLmMNCj4gPj4+PiBpbmRleCA5YTQ1ZDg0MGVm
ZWIuLmZhMGU2ODBhNGI5MSAxMDA2NDQNCj4gPj4+PiAtLS0gYS9kcml2ZXJzL3BoeS9yZW5lc2Fz
L3BoeS1yY2FyLWdlbjMtdXNiMi5jDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9waHkvcmVuZXNhcy9w
aHktcmNhci1nZW4zLXVzYjIuYw0KPiA+Pj4+IEBAIC0xMDY3LDggKzEwNjcsMTYgQEAgc3RhdGlj
IHZvaWQgcmNhcl9nZW4zX3BoeV91c2IyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KSAgew0KPiA+Pj4+ICAJc3RydWN0IHJjYXJfZ2VuM19jaGFuICpjaGFubmVsID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7DQo+ID4+Pj4NCj4gPj4+PiAtCWlmIChjaGFubmVsLT5pc19v
dGdfY2hhbm5lbCkNCj4gPj4+PiArCWlmIChjaGFubmVsLT5pc19vdGdfY2hhbm5lbCkgew0KPiA+
Pj4+ICsJCS8qIERpc2FibGUgT1RHIGludGVycnVwdHMgc28gdGhlIElSUSBoYW5kbGVyIGNhbm5v
dA0KPiA+Pj4+ICsJCSAqIHNjaGVkdWxlIG5ldyB3b3JrLg0KPiA+Pj4+ICsJCSAqLw0KPiA+Pj4+
ICsJCXJjYXJfZ2VuM19jb250cm9sX290Z19pcnEoY2hhbm5lbCwgMCk7DQo+ID4+Pj4gKw0KPiA+
Pj4+ICAJCWRldmljZV9yZW1vdmVfZmlsZSgmcGRldi0+ZGV2LCAmZGV2X2F0dHJfcm9sZSk7DQo+
ID4+Pj4gKw0KPiA+Pj4+ICsJCWNhbmNlbF93b3JrX3N5bmMoJmNoYW5uZWwtPndvcmspOw0KPiA+
Pj4NCj4gPj4+IFdoYXQgYWJvdXQgcGVuZGluZyB3cSB0aGF0IGlzIHN0aWxsIGFib3V0IGV4ZWN1
dGUgYWZ0ZXINCj4gPj4+ICJkZXZpY2VfcmVtb3ZlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9hdHRy
X3JvbGUpOyIgPw0KPiA+PiBIaSBCaWp1LA0KPiA+PiAgIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0
IHlvdSBtZWFuLiBjYW5jZWxfd29ya19zeW5jIGlzIGV4YWN0bHkgd2hhdA0KPiA+PiBjYXRjaGVz
IHRoaXMga2luZCBvZiBwZW5kaW5nIHdvcmsg4oCUIGl0IGVpdGhlciBjYW5jZWxzIHRoZSB3b3Jr
IHRoYXQNCj4gPj4gaGFzbid0IHJ1biB5ZXQsIG9yIHdhaXRzIGZvciB0aGUgb25lIHRoYXQgaXMg
Y3VycmVudGx5IHJ1bm5pbmcgdG8gZmluaXNoLCBhbmQgaXQgaXMgcGxhY2VkIHJpZ2h0Lg0KPiA+
PiAgQ291bGQgeW91IGV4cGxhaW4gaXQgaW4gbW9yZSBkZXRhaWw/DQo+ID4NCj4gPiBBc3N1bWUg
eW91IHJlbW92ZWQgdGhlIGZpbGUsIGFuZCBiZWZvcmUgY2FuY2VsX3dvcmtfc3luYygpLCB0aGUg
V1EgZ2V0DQo+ID4gc2NoZWR1bGVkIHdpbGwgaXQgcmVzdWx0IGluIFVBRiBidWcgbWVudGlvbmVk
IGluIHRoZSBjb21taXQgbWVzc2FnZS4NCj4gPg0KPiBUaGUgcmNhcl9nZW4zX3BoeV91c2IyX3dv
cmsgb25seSB1c2VzIGNoYW4uIElmIHlvdSBjYWxsIGRldmljZV9yZW1vdmVfZmlsZSgmcGRldi0+
ZGV2LCAmZGV2X2F0dHJfcm9sZSkNCj4gYmVmb3JlIGNhbmNlbF93b3JrX3N5bmMoJmNoYW5uZWwt
PndvcmspLCBpdCBkb2VzIG5vdCBsZWFkIHRvIGEgVUFGLg0KPiANCj4gT24gdGhlIGNvbnRyYXJ5
LCBpZiB5b3UgY2FsbCBjYW5jZWxfd29ya19zeW5jKCZjaGFubmVsLT53b3JrKSBmaXJzdCwgdGhl
IHN5c2ZzIG5vZGUgaGFzIG5vdCBiZWVuIHJlbW92ZWQNCj4geWV0LiBXaGVuIHRoZSBzeXNmcyBu
b2RlIGlzIHdyaXR0ZW4gdG8gKHZpYSBzdG9yZSkgYWdhaW4sIGl0IHdpbGwgc2NoZWR1bGUgdGhl
IHdvcmsgb25jZSBtb3JlLCByZW5kZXJpbmcNCj4gdGhlIGNhbmNlbF93b3JrX3N5bmMgY2FsbCBp
bmVmZmVjdGl2ZS4NCg0KT2ssIEkgbWlzc2VkIHRoaXMuDQoNClRoYW5rcyBmb3IgZXhwbGFuYXRp
b24uDQoNCkNoZWVycywNCkJpanUNCg0KPiA+IE1heWJlPz8NCj4gPg0KPiA+IHJjYXJfZ2VuM19j
b250cm9sX290Z19pcnEoY2hhbm5lbCwgMCk7DQo+ID4gY2FuY2VsX3dvcmtfc3luYygmY2hhbm5l
bC0+d29yayk7IGRldmljZV9yZW1vdmVfZmlsZSgmcGRldi0+ZGV2LA0KPiA+ICZkZXZfYXR0cl9y
b2xlKTsNCj4gPg0KPiA+IENoZWVycywNCj4gPiBCaWp1DQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4g
Pj4NCj4gPj4gVGhhbmtz77yBDQo+ID4+IFBlaS4NCj4gPj4NCj4gPj4gICA+IGFmdGVyIGRldmlj
ZV9yZW1vdmVfZmlsZS4NCj4gPj4NCj4gPj4+IENoZWVycywNCj4gPj4+IEJpanUNCj4gPj4+DQo+
ID4+Pj4gKwl9DQo+ID4+Pj4gIH0NCj4gPj4+Pg0KPiA+Pj4+ICBzdGF0aWMgaW50IHJjYXJfZ2Vu
M19waHlfdXNiMl9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPj4+PiAtLQ0KPiA+Pj4+
IDIuMjUuMQ0KPiA+Pj4+DQo+ID4NCg0K
