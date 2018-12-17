Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9672EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:22:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DCCF20874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:22:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="cNqpqL9P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388125AbeLQQWg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:22:36 -0500
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:19584
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726657AbeLQQWg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ECEMrXCr13FDzQFdX9TKYQWbb0mszN1Nnf6HcIKfZ4=;
 b=cNqpqL9PYcvAu1AvYgf4KO9oONWZX7TLS1seFbmhg6C0sFRoUrjI5Qox1LVWANg1Wk1rYm/6j+mfQsJvC5e1asANcSw5fAMcreL3NMuPGeam6ib3j/2vbODe/1Y+sHPqcJnmYC/Bmo+nF5V1ArJyJjWJ5W0OF+R3r9RSPJ2WBB4=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1789.jpnprd01.prod.outlook.com (52.133.168.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.18; Mon, 17 Dec 2018 16:22:29 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::78ca:ce95:aef5:e8ca]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::78ca:ce95:aef5:e8ca%6]) with mapi id 15.20.1425.023; Mon, 17 Dec 2018
 16:22:29 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Kumar Gala <kumar.gala@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Thread-Topic: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Thread-Index: AQHUh+RU1KuMS3Q/EEimI0alfQTw/KV6cWmAgAC/l5CAADpbAIAAAJpggAe+YoCAAAeecA==
Date:   Mon, 17 Dec 2018 16:22:28 +0000
Message-ID: <TYXPR01MB156894C0FEE2A2CF02820A018ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com>
 <20181212021549.GA26333@bogus>
 <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
 <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
 <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
In-Reply-To: <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1789;20:ZJ6OIMi3g/PFYKzM2O4fzi1LVIye0K806PpoU+13NaqJL/ZtvWeUDJxwubxXXtSI/f0TnjaUHTJUr1FQBTUzKSpxZPaOBoIE4H4GsR+6hBGIi5NBir9J244/+ISpRV8MeOzPCjt+fBrf1qH3ML1rKIior8+QYQ6h9iAH7yUpb1g=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 50fd87f5-ef49-4250-4e0a-08d6643bd700
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1789;
x-ms-traffictypediagnostic: TYXPR01MB1789:
x-microsoft-antispam-prvs: <TYXPR01MB1789B2B9FA40A4AE7D1F1F888ABC0@TYXPR01MB1789.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231475)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:TYXPR01MB1789;BCL:0;PCL:0;RULEID:;SRVR:TYXPR01MB1789;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(366004)(39860400002)(376002)(396003)(51444003)(189003)(199004)(9686003)(55016002)(6116002)(3846002)(476003)(71190400001)(229853002)(7736002)(71200400001)(14444005)(6506007)(256004)(305945005)(74316002)(53936002)(5660300001)(14454004)(99286004)(6916009)(2906002)(11346002)(7696005)(25786009)(33656002)(446003)(66066001)(76176011)(4326008)(26005)(6436002)(68736007)(106356001)(8676002)(478600001)(8936002)(81166006)(81156014)(72206003)(186003)(97736004)(102836004)(54906003)(486006)(6246003)(316002)(105586002)(93886005)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1789;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: cN32JgDPZ0CDb3GQkpFnChLlpSaxuE1DU5ZIvDJSBoViH5NxstGoe0UP1+6wYX30qhPT7uMqvrVwfOcDOnqv1MmyP1MdYJWc/WXJkXCevcohr7ggmSPDmVzUqJUQpFhie9uqaBoq0mjnIZnQAJmtLg9aJpCRYtWdTstx7qqSPntYomlEPdh66SdInbI84UG+FqiZoSCfJRQhnPZxcC2mUriPrHSzLTofujLm6G4n3zEOdjpcQeUTOhX9kT7GGuUbhVVDU0Cb6uXEUizlhSfMIkVIzFW8uaO8epZBsV4F4j7XFizW6dbKUNGoLsVPrZod
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fd87f5-ef49-4250-4e0a-08d6643bd700
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 16:22:29.0271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1789
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gTW9uZGF5LCBEZWNlbWJlciAxNywgMjAxOCAxLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiBC
dXQsIFhJUF9LRVJORUwgZG9lcyBub3Qgc2VlbSB0byBiZSBtYWluc3RyZWFtIGVpdGhlci4NCj4g
DQo+IFBhcnQgb2YgdGhlIHByb2JsZW0gdGhlcmUgaXMgWElQX0tFUk5FTCBkb2Vzbid0IHdvcmsg
d2l0aA0KPiBtdWx0aS1wbGF0Zm9ybS4gSSB0aGluayB0aGF0IGlzIG1haW5seSBkdWUgdG8gdGhl
IGRlcGVuZGVuY3kgb24NCj4gcnVuLXRpbWUgcGh5czJ2aXJ0IHBhdGNoaW5nLiBXZSBzaG91bGQg
Zml4IHRoYXQgc3VjaCB0aGF0IGVpdGhlciB3ZQ0KPiBjYW4gc2V0IGEgZGVmYXVsdCBwaHlzX29m
ZnNldCBvciBwb3NzaWJseSB3ZSBjb3VsZCBkbyBzb21lIG9mZmxpbmUNCj4gcGF0Y2hpbmcuDQoN
Ck5vdCByZWFsbHkuIEkgZml4ZWQgYWxsIG9mIHRoYXQgYmFjayBpbiA0LjYuDQoNClRoZSBpc3N1
ZSBpcyBtb3JlIG9mIHRoZSAndGhlb3JldGljYWwnIGtpbmQuDQoNClRoZSBBUk0gbWFpbnRhaW5l
ciBkZWZpbmVzICJtdWx0aXBsYXRmb3JtIiBhcyBiZWluZyBhYmxlIHRvIGJ1aWxkIDEgDQpiaW5h
cnkgaW1hZ2UgdGhhdCBjYW4gYmUgcnVuIG9uIG11bHRpcGxlIFNvQ3MuDQpCdXQuLi50aGF0IHdv
bid0IHdvcmsgd2hlbiB5b3UgaGF2ZSB0byBkZWZpbmUgdGhlIFJPTS9SQU0gYXJlYSBhdCANCmNv
bXBpbGUgdGltZS4NCg0KSSBwcmVmZXIgdG8gdGhpbmsgb2YgIm11bHRpcGxhdGZvcm0iIGFzIGEg
d2F5IG9mIGdyb3VwaW5nIGxpa2UgU29DcyANCnRvZ2V0aGVyIChpZiB5b3UgbmVlZCB0bykgYW5k
IHVzZSBEVCB0byBzb3J0IG91dCBhbnkgZGlmZmVyZW5jZXMuDQoNCkJhc2ljYWxseSwgSSBqdXN0
IG5lZWQgdGhpcyBzaW1wbGUgcGF0Y2ggaW4gb3JkZXIgdG8gYnVpbGQgYW5kIGJvb3Qgc28gSQ0K
Y2FuIHRlc3Qga2VybmVsIHJlbGVhc2VzOg0KDQpbYXJjaC9hcm0vS2NvbmZpZ10NCg0KY29uZmln
IFhJUF9LRVJORUwNCiAJYm9vbCAiS2VybmVsIEV4ZWN1dGUtSW4tUGxhY2UgZnJvbSBST00iDQot
CWRlcGVuZHMgb24gIUFSTV9MUEFFICYmICFBUkNIX01VTFRJUExBVEZPUk0NCisJZGVwZW5kcyBv
biAhQVJNX0xQQUUNCg0KSG93ZXZlci4uLkkndmUgZ2l2ZW4gdXAgb24gdHJ5aW5nIHRvIGdldCBY
SVBfS0VSTkVMIGVuYWJsZWQgaW4gS2NvbmZpZy4gDQpCdXQsIG9mIGNvdXJzZSBzdGlsbCBrZWVw
IGFuIGV5ZSBvbiBhbGwgdGhlICdjb2RlJyBpbiB0aGUgQVJNIGNvcmUgdG8gDQptYWtlIHN1cmUg
bm8gb25lIGJyZWFrcyBpdC4NCg0KDQoNCj4gPiBBdCB0aGUgZW5kIG9mIHRoZSBkYXksIGFsbCBJ
IHdhbnQgaXMgZm9yIHRoZSBrZXJuZWwgdG8gZG8gYW4gaW9yZW1hcCBvZg0KPiA+IHRoaXMgYXJl
YSBmb3IgbWUgc28gbXkgZmlsZSBzeXN0ZW0gKFhJUCBjcmFtZnMgaW4gdGhpcyBjYXNlKSBjYW4g
YWNjZXNzDQo+ID4gaXQuICJtdGQtcm9tIiBkb2VzIHRoaXMgZm9yIG1lIHRvZGF5Lg0KPiANCj4g
QW5kIHBhcnRpdGlvbiBsYXlvdXQ/IElmIGl0IHdhcyBvbmx5IHdoYXQgdG8gbWFwLCB3ZSBjb3Vs
ZCBhZGQgYQ0KPiBwcm9wZXJ0eSBpbiBjaG9zZW4gb3IgcGVyaGFwcyBhIHJlc2VydmVkLW1lbW9y
eSBub2RlLiBCdXQgSSBkb3VidCBpdA0KPiB3aWxsIHJlbWFpbiB0aGF0IHNpbXBsZS4gV2hhdCBo
YXBwZW5zIHdoZW4geW91IGhhdmUgY2xvY2sgbWFuYWdlbWVudA0KPiBhbmQgbmVlZCB0byBrZWVw
IHRoZSBTUEkgY2xvY2sgZW5hYmxlZCBmb3IgZXhhbXBsZS4NCg0KWXVwLi4udGhlcmUncyB0aGUg
a2lsbGVyIQ0KWW91J2xsIG5vdGljZSB0aGF0IGluIG1haW5saW5lIFJaL0EgZGV2aWNlcywgdGhl
cmUgaXMgbm8gUVNQSSBkcml2ZXIsIA0KYW5kIGFsc28gdGhlIFFTUEkgY2xvY2sgaXMgbGVmdCBv
dXQgb2YgdGhlIGxpc3Qgb2YgSFcgY2xvY2tzLiBPdGhlcndpc2UsIA0KYXMgeW91IG1lbnRpb25l
ZCwgdGhhdCAndW51c2VkJyBjbG9jayB3b3VsZCBnZXQgc2h1dCBvZmYgYXQgdGhlIGVuZCBvZiAN
CmJvb3QuLi5hbmQgeW91J3JlIHdob2xlIHN5c3RlbSB3b3VsZCBzdG9wIGltbWVkaWF0ZWx5Lg0K
DQo+IFRoZSBvdGhlciBvcHRpb24gaXMganVzdCBoYXZlIHlvdXIgcGxhdGZvcm0gY29kZSBpbnN0
YW50aWF0ZSBhbg0KPiBtdGQtcm9tIGRldmljZS4gRWl0aGVyIGRlc2NyaWJlIHRoZSBoL3cgd2l0
aCBEVCBvciBkb24ndCB1c2UgRFQuDQoNCllvdSBtZWFuIGluIGEgJ2JvYXJkJyBmaWxlPw0KDQpC
VFcsIEkgc3RpbGwgdXNlIGJvYXJkIGZpbGVzIGZvciB0aGluZ3MgdGhhdCBhcmUgdG9vIGNvbXBs
aWNhdGVkIGZvciBEVC4NCg0KDQo+ID4gVGhlIG90aGVyIFhJUCBmaWxlIHN5c3RlbSB0aGF0IHdl
IHVzZSBtb3JlIG9mdGVuIChBWEZTLCBub3QgaW4gbWFpbmxpbmUpDQo+ID4gZG9lcyBub3QgcmVx
dWlyZSB0aGUgcGFydGl0aW9ucyBpbiBEVCBhdCBhbGwsIHNvIGl0J3MgcmVhbGx5IG9ubHkNCj4g
PiBuZWVkZWQgd2hlbiB1c2luZyBjcmFtZnMuIFNvIGZvciBub3csIG1heWJlIGl0IHdvdWxkIGJl
IGJldHRlciB0byBqdXN0DQo+IHJlbW92ZQ0KPiA+IHRoaXMgY29uZnVzaW5nIHBvcnRpb24gb2Yg
dGhlIGR0cy4NCj4gDQo+IFdoYXQgZG9lcyBBWEZTIGhhdmUgdGhhdCBjcmFtZnMgZG9lc24ndCBt
YWtpbmcgaXQgbm90IG5lZWQgcGFydGl0aW9ucz8NCg0KRm9yIEFYRlMsIHlvdSBwYXNzIGluIHRo
ZSBwaHlzaWNhbCBhZGRyZXNzIHRvIHlvdXIgcm9vdGZzIG9uIHRoZSBrZXJuZWwgDQpjb21tYW5k
IGxpbmUgYW5kIHRoZW4gQVhGUyBkb2VzIHRoZSBpb3JlYXBwaW5nIGl0c2VsZiBpbnNpZGUgdGhl
IGRyaXZlci4NCg0KV2hlbiBOaWNvbGFzIFBpdHJlIHN0YXJ0ZWQgYWRkaW5nIFhJUCBtb2RlIHRv
IGNyYW1mcyBsYXN0IHllYXIsIGhlIGFsc28gDQpzdGFydGVkIG91dCB0aGF0IHdheS4gQnV0LCB0
aGF0IHdhcyByZWplY3RlZCAoYXMgaXQgd2FzIGFsc28gcmVqZWN0ZWQgDQp3aGVuIERBWCB3YXMg
Zmlyc3Qgc3RhcnRlZCkuIFRoZSBmaWxlIHN5c3RlbSBwZW9wbGUgc2FpZCAnZmlsZSBzeXN0ZW0g
DQpkcml2ZXMgc2hvdWxkIG5vdCBoYXZlIHRoZSBhYmlsaXR5IHRvIG1hcCBwaHlzaWNhbCBtZW1v
cnkgdGhlbXNlbHZlcycuDQoNCkFub3RoZXIgdGhpbmcgQVhGUyBjYW4gZG8gdGhhdCBDcmFtZnMg
Y2FuJ3QgZG8gKHlldCksIGlzIEFYRlMgY2FuIHdpdGhpbg0KKmVhY2ggZmlsZSogc2VsZWN0IHdo
YXQgcGFnZXMgd2lsbCBiZSBYSVAsIGFuZCB3aGF0IG9uZXMgd2lsbCBiZSANCmNvbXByZXNzZWQu
IFRoaXMgc2F2ZXMgYSBsb3Qgb24gRmxhc2ggc3BhY2Ugd2hlbiBvbmx5IHlvdXIgZXhlY3V0YWJs
ZSBhbmQgDQpjb25zdCBwYWdlcyBhcmUgbGVmdCBhcyB1bmNvbXByZXNzZWQgWElQIHBhZ2VzLg0K
DQoNCkNocmlzDQoNCg==
