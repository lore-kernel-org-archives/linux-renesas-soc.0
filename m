Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3D7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 10:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2454C20675
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 10:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="DWEoH44g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730247AbfCFK7X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 05:59:23 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:10527 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729497AbfCFK7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 05:59:23 -0500
X-IronPort-AV: E=Sophos;i="5.58,447,1544511600"; 
   d="scan'208";a="24895338"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 06 Mar 2019 03:59:21 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 6 Mar 2019 03:59:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCZsho+w6pXs1MUIwxUqWf/tcNCObKUmDxN1r7V3K/I=;
 b=DWEoH44gSItE+OKJ6/mnFYJB/f8ptgOCEPW1hkzHYNW8QSZkgCinHW3MCUv6iKNAO2r8ss9Zve7j35OuDN+CXEaJq6S2kR7/bGGkj2J0OEIuEy4GYonrTvE4ik/12lbD+Fst10wvoxINamHFS+fgaEhW22/ErShatE2jYQEa3VM=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB4083.namprd11.prod.outlook.com (10.255.130.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.16; Wed, 6 Mar 2019 10:59:18 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1665.019; Wed, 6 Mar 2019
 10:59:18 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>, <sergei.shtylyov@cogentembedded.com>
CC:     <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
        <computersforpeace@gmail.com>, <bbrezillon@kernel.org>,
        <richard@nod.at>, <linux-mtd@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Topic: [PATCH 2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Thread-Index: AQHUrcRvVk/NwsnjPU6u4yY8M2eQPqX9XVmAgAFeX4A=
Date:   Wed, 6 Mar 2019 10:59:17 +0000
Message-ID: <0e132c00-fb0c-c535-0f23-0cfa19a9a99e@microchip.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
 <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
 <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
In-Reply-To: <CAMuHMdVjvbcK21r9ajp9xKEGx=VHbXkrSB0ob2EjR8+dmNVdPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0147.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::25) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 893ef816-3dc9-4c01-786a-08d6a222c744
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:BN6PR11MB4083;
x-ms-traffictypediagnostic: BN6PR11MB4083:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUI0MDgzOzIzOmFJZW1yRGlXZWJiM3ZXeXdxVkJCR3VYVzlI?=
 =?utf-8?B?R0wrSWlialgzampIcWJjeTEySmtab0FySUF1VEVoUkNLMjliclNSZXVHOEUx?=
 =?utf-8?B?NDV2eW1WaDg0eGFQYWJ0bzZwQk9QWC92S2xLL1hrMzQ5bTNTL1A5UlRGUFZj?=
 =?utf-8?B?K0VTaDA4aWxYQytYcENRM0EzUGNTV3k2cWc3TUJ0b2hodW1JVkpCYTFnZ3Fz?=
 =?utf-8?B?cUNZa1o0Tjl6VDBRL2JpZXlKQzljN0JVTkt2VUtWZnlTN0QyZjlPZXl5WHBM?=
 =?utf-8?B?dUVFTlk0V0ZmVVprbmdVUGhKcm5YN3IvVFFxOGxHSzZpdmlURnBRVkowTUlJ?=
 =?utf-8?B?MjZzZkI0QnBGOCthRzhQSkh3MEllNXpzd1N3Q2JpMGs2Vlc1N1FXc0JzTkg4?=
 =?utf-8?B?ZHhpU2d2cGYyOW41cm5zQmFKbzNJZ3VsbWJ6VXNIOXY5TFN1UU5FR1UwTWlh?=
 =?utf-8?B?WGhOdnN4NDBHZVY4aERJczdOS291bEVVeDR1V3k1SCt2V05kTzIzTGhZc3kx?=
 =?utf-8?B?Q29zbnJkMDZEOGhBMFdkOGdmeCtJZ1NnMkZZTi9BUk5XUHdVZXJhQVM2UGFz?=
 =?utf-8?B?ZnhaeU13OXZYSm9RTXJDOTMvajV3eHYycmRvVHQ1bkt1VHBlZlpVRFluZkNm?=
 =?utf-8?B?aTg4eTVDRWZNS2k3ZWlqdHBZVnR2TDB4TW42czlSUkpVc1paaC80UzRVd09H?=
 =?utf-8?B?dVNJdGNTNlRVOHpoWTVHU0VBMEdiVmx6TkVqMmRYajNEMkFYbks4RDFvdWpH?=
 =?utf-8?B?SGFDeld3NEVsVjUzSmJPcVQ2ZVlsenpxaUp4TzJ6Qml4SDBjMDVYTVB1elBk?=
 =?utf-8?B?WDN5czJHb3BpMmQyNzlERmpPL0d3bDdzdklvamM3RlZYSktaRGpWQ0lLcEUr?=
 =?utf-8?B?WW1MbFFpaUQrbktTdDQzV2JHL2YrU0FvWUFFYU83WGl2MkFtS2svb1N1R1Ev?=
 =?utf-8?B?c0ZEbVlNNitOb1pCMmprdGFQamlOVk1VZXhUR0w4ZFBsUVJMNDBwUklrd0Rn?=
 =?utf-8?B?T0ZOdmFCa2pnSHcwd0lLSHFvK1JJU0hCYjVCOWs1dzZabmI2Mzg3WFNHN1NH?=
 =?utf-8?B?ODZ1YzRaeVNJMEExTWl3TjZlMk5KNjVpNm5keTRWZVR2a3FaalFwWHhJK1JD?=
 =?utf-8?B?LzkzUy9rZmNraTRaK0lqcFZlU1h0T3V4d3pYalE2bEl4djZoekNkNXVocmpz?=
 =?utf-8?B?QWhKMGIzUHdsNFE1UUlhWEdZOThFM0E3M1gzTTFuTkFFTXVpZXFObmdRalNU?=
 =?utf-8?B?TjExWmtJMUVKcjdvdVhhQjlJVWRTMHRNcHRzR3NjNVhUMXdLYmw4a0k0UE5Z?=
 =?utf-8?B?Uzlhc0tubGUyWlBmSlNjeExLdHhuenVIMlhGbGhwRDVUNXRUMlgveG9qeXdO?=
 =?utf-8?B?MzhucVhZVTZXUXR2RTQ2YXdtK2pkSGhRdGp2RGVxRmZ0U1JoNmw3bzdiUEJs?=
 =?utf-8?B?N2REd3duRVJKSXp2RnVFR2VBSG11R05GMGhiS2dqdXFNR2N3b2FPajRjQ3k4?=
 =?utf-8?B?TFdFekpQbnU5a28vdDFqSkRuN0duOVhMT0NOVzlIZHo5UnBGYjFJYWZFaHoz?=
 =?utf-8?B?RjB0T2RVeWFzYU1VRGthTkJ0NWVYdDE0cU9WL0tkWTNYTHFkbHRhc3ZJQ1pM?=
 =?utf-8?B?eW4wa2JXSEF3L3VzLys4QkJpL1FNK1JmQkgxeThsa1ppVGJ2Um1CVjNtdHFp?=
 =?utf-8?B?enpCNGY4R2RZOTRSVG9YNlN0UmxhWXc0Q3JhbUpzemhFVlI2MFRlcVZRdlpC?=
 =?utf-8?Q?U7zU2omOzKNfezjExqZD62qYutFDpg3zjAOtU=3D?=
x-microsoft-antispam-prvs: <BN6PR11MB4083B4B37404EB8084977FA0F0730@BN6PR11MB4083.namprd11.prod.outlook.com>
x-forefront-prvs: 0968D37274
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(396003)(346002)(39850400004)(376002)(199004)(189003)(81156014)(6246003)(14454004)(476003)(110136005)(31696002)(316002)(486006)(446003)(81166006)(11346002)(2616005)(14444005)(186003)(478600001)(8936002)(54906003)(72206003)(26005)(256004)(8676002)(305945005)(66066001)(386003)(53546011)(5660300002)(52116002)(6506007)(76176011)(99286004)(86362001)(71200400001)(102836004)(71190400001)(97736004)(105586002)(4326008)(25786009)(7736002)(53936002)(31686004)(6436002)(229853002)(6512007)(36756003)(2906002)(6116002)(68736007)(3846002)(106356001)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB4083;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tp+jFu91IyuwFwK7lLCfDrGkj+zZQavMB8qa4xUtoePV44g/eA5rS2v2UP10WCqxxh8cEwXGZI7BBfOOWVY5/ebwqjnPDbuadq+zQe4NlDVwMp2rsYNWuWfwMBX4LnlLnHbcs4F8d/cG2w97Ub0OgtEDScdiO5kGg8AqGH0FoMQVYIT63hoz/A0O2ILxhHYAJuknkNX6jcH9EKY4J4sm0iSgXgUOZU+0/BBrn4pZutu6bTK8eiK35BYYQM2xig3RBgf8Pj65lGNgduymG4Gh9xB1aw0nGPNZGbjKA8qqsg50KljdOm+vHJJngwkR9/sJNvS3PB4FmD0i6B0t/vcDGiB29rW3fRUZRqAZxbVPGPZ5oVZdPl1R3eveThBUDsftT8KAXsWhnQVQ8mQ8VixUSO3k0WM+q2ZZTuWa7FkvWOc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91D953FD3183164FB35E808D5EAA2858@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 893ef816-3dc9-4c01-786a-08d6a222c744
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2019 10:59:18.1009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4083
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksIEdlZXJ0LA0KDQpPbiAwMy8wNS8yMDE5IDA0OjA1IFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+IEhpIFNlcmdlaSwNCj4gDQo+IE9uIFdlZCwgSmFuIDE2LCAyMDE5IGF0IDY6NTMg
UE0gU2VyZ2VpIFNodHlseW92DQo+IDxzZXJnZWkuc2h0eWx5b3ZAY29nZW50ZW1iZWRkZWQuY29t
PiB3cm90ZToNCj4+IFNwYW5zaW9uIFMyNUZMNTEyUyBJRCBpcyBlcnJvbmVvdXNseSB1c2luZyA1
LWJ5dGUgSkVERUMgSUQsIHdoaWxlIHRoZSBjaGlwDQo+PiBmYW1pbHkgSUQgaXMgc3RvcmVkIGlu
IHRoZSA2dGggYnl0ZS4gRHVlIHRvIHVzaW5nIG9ubHkgNS1ieXRlIElELCBpdCdzIGFsc28NCj4+
IGNvdmVyaW5nIFMyNUZTNTEyUyBhbmQgbm93IHRoYXQgd2UgaGF2ZSBhZGRlZCA2LWJ5dGUgSUQg
Zm9yIHRoYXQgY2hpcCwgd2UNCj4+IGNhbiBjb252ZXJ0IFMyNUZMNTEyUyB0byB1c2luZyBhIHBy
b3BlciA2LWJ5dGUgSUQgYXMgd2VsbC4uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFNlcmdlaSBT
aHR5bHlvdiA8c2VyZ2VpLnNodHlseW92QGNvZ2VudGVtYmVkZGVkLmNvbT4NCj4gDQo+IFRoaXMg
aXMgbm93IGNvbW1pdCBhMjEyNmIwYTAxMDkwNWU1ICgibXRkOiBzcGktbm9yOiByZWZpbmUgU3Bh
bnNpb24NCj4gUzI1Rkw1MTJTIElEIiksIGFuZCB0dXJucyBvdXQgdG8gY2F1c2UgYSByZWdyZXNz
aW9uIG9uIHI4YTc3OTEva29lbHNjaC4NCj4gRG1lc2cgZGlmZiBiZWZvcmUvYWZ0ZXI6DQo+IA0K
PiAgICAgLW0yNXA4MCBzcGkwLjA6IHMyNWZsNTEycyAoNjU1MzYgS2J5dGVzKQ0KPiAgICAgLTMg
Zml4ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2Ugc3BpMC4wDQo+
ICAgICAtQ3JlYXRpbmcgMyBNVEQgcGFydGl0aW9ucyBvbiAic3BpMC4wIjoNCj4gICAgIC0weDAw
MDAwMDAwMDAwMC0weDAwMDAwMDA4MDAwMCA6ICJsb2FkZXIiDQo+ICAgICAtMHgwMDAwMDAwODAw
MDAtMHgwMDAwMDA2MDAwMDAgOiAidXNlciINCj4gICAgIC0weDAwMDAwMDYwMDAwMC0weDAwMDAw
NDAwMDAwMCA6ICJmbGFzaCINCj4gICAgICttMjVwODAgc3BpMC4wOiB1bnJlY29nbml6ZWQgSkVE
RUMgaWQgYnl0ZXM6IDAxLCAwMiwgMjANCj4gDQo+IEFzIHRoZSAob2xkKSBVLUJvb3Qgb24gbXkg
S29lbHNjaCBrZWVwcyBtYW55IG1vZHVsZSBjbG9ja3MgZW5hYmxlZCwgSQ0KPiB0eXBpY2FsbHkg
bWVyZ2UgaW4gbXkgdG9waWMvcmVuZXNhcy1kZWJ1ZyBicmFuY2gsIHdoaWNoIG1ha2VzIHN1cmUg
YWxsDQo+IG5vbi1jcml0aWNhbCBtb2R1bGUgY2xvY2tzIGFyZSBkaXNhYmxlZCBlYXJseSBkdXJp
bmcgYm9vdCwgdG8gY2F0Y2gNCj4gZHJpdmVycyBub3QgcHJvcGVybHkgaW1wbGVtZW50aW5nIFJ1
bnRpbWUgUE0uDQo+IA0KPiBIb3dldmVyLCBpdCB0dXJucyBvdXQgdGhpcyBoYXMgc29tZSBpbXBh
Y3Qgb24gSkVERUMgSUQgZGV0ZWN0aW9uOg0KPiAgIC0gV2hlbiBtb2R1bGUgY2xvY2tzIGFyZSBs
ZWZ0IHVudG91Y2hlZCwgc3BpX25vcl9yZWFkX2lkKCkgcmVhZHMNCj4gICAgIDB4MDE6MHgwMjow
eDIwOjB4NGQ6MHgwMDoweDgwLg0KPiAgIC0gV2hlbiBteSBkZWJ1ZyBjb2RlIGhhcyBkaXNhYmxl
ZCBtb2R1bGUgY2xvY2tzIGR1cmluZyBlYXJseSBib290LA0KPiAgICAgVGhlIGxhc3QgYnl0ZSBp
cyAweDAwLg0KPiANCj4gQmVmb3JlIHRoZSBhYm92ZSBjb21taXQsIG9ubHkgdGhlIGZpcnN0IDUg
Ynl0ZXMgd2VyZSBjb21wYXJlZCwgYW5kIHRoZQ0KPiBsYXN0IGJ5dGUgd2FzIGlnbm9yZWQsIHRo
dXMgbm90IGNhdXNpbmcgcHJvYmxlbXMuDQo+IFdoZW4gY29tcGFyaW5nIGFsbCA2IGJ5dGVzLCBk
ZXRlY3Rpb24gZmFpbHMgaWYgdGhlIGxhc3QgYnl0ZSBpcyAweDAwLg0KPiANCg0KV2UnbGwgaGF2
ZSB0byB1bmRlcnN0YW5kIHdoeSBqdXN0IHRoZSA2dGggYnl0ZSBpcyBkaWZmZXJlbnQuDQoNCj4g
SSBiZWxpZXZlIG1haW5saW5lIFUtQm9vdCBmb3IgUi1DYXIgR2VuMiBib2FyZHMgZG9lc24ndCBr
ZWVwIHRoZSBRU1BJDQo+IG1vZHVsZSBjbG9jayBlbmFibGVkLCBzbyB0aGlzIGNvbW1pdCBtYXkg
YnJlYWtzIHRob3NlIGJvYXJkcy4NCg0KV2hvIHByb3ZpZGVzIHRoZSBmbGFzaCdzIGlucHV0IGNs
b2NrIGFuZCBhdCB3aGF0IGZyZXF1ZW5jeT8NCg0KQ2hlZXJzLA0KdGENCg0KPiANCj4gVG8gYmUg
aW52ZXN0aWdhdGVkIG1vcmUgKGUuZy4gd2l0aCBhIGxvZ2ljIGFuYWx5emVyKS4uLg0KPiANCj4+
IC0tLSBsaW51eC1tdGQub3JpZy9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPj4gKysr
IGxpbnV4LW10ZC9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPj4gQEAgLTE4ODcsOCAr
MTg4Nyw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2kNCj4+ICAg
ICAgICAgeyAiczI1c2wwNjRwIiwgIElORk8oMHgwMTAyMTYsIDB4NGQwMCwgIDY0ICogMTAyNCwg
MTI4LCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LA0KPj4gICAgICAg
ICB7ICJzMjVmbDI1NnMwIiwgSU5GTygweDAxMDIxOSwgMHg0ZDAwLCAyNTYgKiAxMDI0LCAxMjgs
IFVTRV9DTFNSKSB9LA0KPj4gICAgICAgICB7ICJzMjVmbDI1NnMxIiwgSU5GTygweDAxMDIxOSwg
MHg0ZDAxLCAgNjQgKiAxMDI0LCA1MTIsIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFE
X1JFQUQgfCBVU0VfQ0xTUikgfSwNCj4+ICsgICAgICAgeyAiczI1Zmw1MTJzIiwgIElORk82KDB4
MDEwMjIwLCAweDRkMDA4MCwgMjU2ICogMTAyNCwgMjU2LCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQ
SV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sDQo+PiAgICAgICAgIHsgInMyNWZzNTEycyIs
ICBJTkZPNigweDAxMDIyMCwgMHg0ZDAwODEsIDI1NiAqIDEwMjQsIDI1NiwgU1BJX05PUl9EVUFM
X1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9LA0KPj4gLSAgICAgICB7ICJz
MjVmbDUxMnMiLCAgSU5GTygweDAxMDIyMCwgMHg0ZDAwLCAyNTYgKiAxMDI0LCAyNTYsIFNQSV9O
T1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQgfCBVU0VfQ0xTUikgfSwNCj4+ICAgICAg
ICAgeyAiczcwZmwwMWdzIiwgIElORk8oMHgwMTAyMjEsIDB4NGQwMCwgMjU2ICogMTAyNCwgMjU2
LCAwKSB9LA0KPj4gICAgICAgICB7ICJzMjVzbDEyODAwIiwgSU5GTygweDAxMjAxOCwgMHgwMzAw
LCAyNTYgKiAxMDI0LCAgNjQsIDApIH0sDQo+PiAgICAgICAgIHsgInMyNXNsMTI4MDEiLCBJTkZP
KDB4MDEyMDE4LCAweDAzMDEsICA2NCAqIDEwMjQsIDI1NiwgMCkgfSwNCj4gDQo+IEdye29ldGpl
LGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0t
DQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4g
d2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzDQo+IA0K
