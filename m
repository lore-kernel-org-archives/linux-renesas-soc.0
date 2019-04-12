Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36599C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 10:06:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE7E22084D
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 10:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="hR/XO9SE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfDLKGW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:06:22 -0400
Received: from mail-eopbgr1400099.outbound.protection.outlook.com ([40.107.140.99]:51072
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726714AbfDLKGW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 06:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVHMv4evOcP/CSQyNsTIJ07gN3qWdZ9MbLwGR9S95R0=;
 b=hR/XO9SEErgbGThJ7U89vyLq1kwNgkRwm17dDPOlKf2Wvxp45MhA/BBgKNmTTxukVkGMnuednemU3AzCwG/hEgpvwTmIReVqxm+W26Mu2UzPdZNFXz0WUO7dl93uL/W8EYH6AQ8DY0p7qNKK46vEGe9JHUcV43bDsXAxCWbBQ7Y=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3640.jpnprd01.prod.outlook.com (20.178.97.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.12; Fri, 12 Apr 2019 10:06:17 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1792.009; Fri, 12 Apr 2019
 10:06:17 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/4] dt-bindings: display: renesas: du: Document the
 r8a774a1 bindings
Thread-Topic: [PATCH 1/4] dt-bindings: display: renesas: du: Document the
 r8a774a1 bindings
Thread-Index: AQHU8HScKZbfa8O500eWh3qw4Gh4PaY4Sn2AgAABpbA=
Date:   Fri, 12 Apr 2019 10:06:17 +0000
Message-ID: <OSBPR01MB2103A33BAEAA8716D23FB272B8280@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
 <1554993271-29523-2-git-send-email-biju.das@bp.renesas.com>
 <d73aa824-9627-7d5b-39c8-0d564e56d23f@ideasonboard.com>
In-Reply-To: <d73aa824-9627-7d5b-39c8-0d564e56d23f@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bf11a5e-ec2e-4bbf-d0b7-08d6bf2e8159
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3640;
x-ms-traffictypediagnostic: OSBPR01MB3640:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB3640951E78BE4FC12B2F9188B8280@OSBPR01MB3640.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(346002)(396003)(376002)(366004)(51914003)(199004)(189003)(68736007)(105586002)(110136005)(4326008)(5660300002)(76176011)(6506007)(52536014)(53546011)(256004)(7736002)(74316002)(86362001)(26005)(7416002)(186003)(6436002)(478600001)(97736004)(102836004)(3846002)(6116002)(229853002)(66066001)(486006)(476003)(966005)(2906002)(6306002)(53936002)(55016002)(9686003)(7696005)(33656002)(99286004)(14454004)(71190400001)(71200400001)(11346002)(8936002)(446003)(6246003)(25786009)(305945005)(81156014)(106356001)(8676002)(81166006)(107886003)(316002)(44832011)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3640;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +mK9SKjfhTqGeiUzoinauUscC7wD39AUqxh20uVY9KUFK3mo6S+SHILjDWAK3V2cuCDeZejt/EdULKS149HyEwpxWkrhB4/+KPMf91R7ap2opymEsUsjwaDDSYw9bgI9vprmH3SyRihmKYFGlao1NGpTxPiV53i3aaBpZuwcJpPYan+9eQ5vVTmHwk8c6Jpk6uJYVr2lTUGgaEsYiE+jZsfjFgZp6EUviDiOckfB+rsTkOQMzOcHTThDjPQFIdICVUF9WLBZkZazf8daOhl8XnreRZeKYP3tMlUu/XhOF0bK/Qo8+zaYJsRuhLCESChvKX3gb2itU/6jcw1RNtTwChpkKHNcwxLw+XWjvPXMwf1Mq91tjWXj4nXtOzDU4P37CZehVe6qTQwx18KqVRGqwmdrYKhoCdjtyGobKjDYf5s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf11a5e-ec2e-4bbf-d0b7-08d6bf2e8159
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 10:06:17.7450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3640
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS2llcmFuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDEvNF0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IHJlbmVzYXM6IGR1OiBEb2N1bWVudCB0
aGUNCj4gcjhhNzc0YTEgYmluZGluZ3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiAxMS8wNC8y
MDE5IDE1OjM0LCBCaWp1IERhcyB3cm90ZToNCj4gPiBEb2N1bWVudCB0aGUgUlovRzJNIChSOEE3
NzRBMSkgU29DIGluIHRoZSBSLUNhciBEVSBiaW5kaW5ncy4NCj4gDQo+IEJhc2VkIG9uIHRoZSBl
eHBlY3RhdGlvbiB0aGF0IHRoaXMgaXMgZXF1aXZhbGVudCB0byB0aGUgTTMtVywgdGhlbiB0aGlz
IGxvb2tzDQo+IGdvb2QgdG8gbWUuDQo+IA0KPiBBcmUgdGhlIFJaL0cgZGF0YXNoZWV0cyBhdmFp
bGFibGUgcHVibGljbHkgc29tZXdoZXJlPyBJZiBub3QgSSdsbCBzZWUgaWYgSSBjYW4NCj4gc291
cmNlIGl0IHRocm91Z2ggbXkgUmVuZXNhcyBOREEgY2hhbm5lbHMuDQoNCkN1cnJlbnRseSBJdCBp
cyBub3QgcHVibGljbHkgYXZhaWxhYmxlLiBDaHJpcyBQYXRlcnNvbiB3aWxsIHByb3ZpZGUgeW91
IHRoZSBkZXRhaWxzLg0KDQpBbiBvdmVydmlldyBkb2MgaXMgYXZhaWxhYmxlIGhlcmUuDQpodHRw
czovL3d3dy5yZW5lc2FzLmNvbS9ldS9lbi9wcm9kdWN0cy9taWNyb2NvbnRyb2xsZXJzLW1pY3Jv
cHJvY2Vzc29ycy9yei9yemcvcnpnMm0uaHRtbCNkb2N1bWVudHMNCg0KcmVnYXJkcywNCkJpanUN
Cg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4N
Cj4gDQo+IFJldmlld2VkLWJ5OiBLaWVyYW4gQmluZ2hhbQ0KPiA8a2llcmFuLmJpbmdoYW0rcmVu
ZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gDQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0IHwgMiArKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNhcyxkdS50eHQN
Cj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
ZHUudHh0DQo+ID4gaW5kZXggYWVkYjIyYi4uYzk3ZGZhYyAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
ZHUudHh0DQo+ID4gQEAgLTcsNiArNyw3IEBAIFJlcXVpcmVkIFByb3BlcnRpZXM6DQo+ID4gICAg
ICAtICJyZW5lc2FzLGR1LXI4YTc3NDQiIGZvciBSOEE3NzQ0IChSWi9HMU4pIGNvbXBhdGlibGUg
RFUNCj4gPiAgICAgIC0gInJlbmVzYXMsZHUtcjhhNzc0NSIgZm9yIFI4QTc3NDUgKFJaL0cxRSkg
Y29tcGF0aWJsZSBEVQ0KPiA+ICAgICAgLSAicmVuZXNhcyxkdS1yOGE3NzQ3MCIgZm9yIFI4QTc3
NDcwIChSWi9HMUMpIGNvbXBhdGlibGUgRFUNCj4gPiArICAgIC0gInJlbmVzYXMsZHUtcjhhNzc0
YTEiIGZvciBSOEE3NzRBMSAoUlovRzJNKSBjb21wYXRpYmxlIERVDQo+ID4gICAgICAtICJyZW5l
c2FzLGR1LXI4YTc3NGMwIiBmb3IgUjhBNzc0QzAgKFJaL0cyRSkgY29tcGF0aWJsZSBEVQ0KPiA+
ICAgICAgLSAicmVuZXNhcyxkdS1yOGE3Nzc5IiBmb3IgUjhBNzc3OSAoUi1DYXIgSDEpIGNvbXBh
dGlibGUgRFUNCj4gPiAgICAgIC0gInJlbmVzYXMsZHUtcjhhNzc5MCIgZm9yIFI4QTc3OTAgKFIt
Q2FyIEgyKSBjb21wYXRpYmxlIERVIEBADQo+ID4gLTU4LDYgKzU5LDcgQEAgY29ycmVzcG9uZGlu
ZyB0byBlYWNoIERVIG91dHB1dC4NCj4gPiAgIFI4QTc3NDQgKFJaL0cxTikgICAgICAgRFBBRCAw
ICAgICAgICAgTFZEUyAwICAgICAgICAgLSAgICAgICAgICAgICAgLQ0KPiA+ICAgUjhBNzc0NSAo
UlovRzFFKSAgICAgICBEUEFEIDAgICAgICAgICBEUEFEIDEgICAgICAgICAtICAgICAgICAgICAg
ICAtDQo+ID4gICBSOEE3NzQ3MCAoUlovRzFDKSAgICAgIERQQUQgMCAgICAgICAgIERQQUQgMSAg
ICAgICAgIExWRFMgMCAgICAgICAgIC0NCj4gPiArIFI4QTc3NEExIChSWi9HMk0pICAgICAgRFBB
RCAwICAgICAgICAgSERNSSAwICAgICAgICAgTFZEUyAwICAgICAgICAgLQ0KPiA+ICAgUjhBNzc0
QzAgKFJaL0cyRSkgICAgICBEUEFEIDAgICAgICAgICBMVkRTIDAgICAgICAgICBMVkRTIDEgICAg
ICAgICAtDQo+ID4gICBSOEE3Nzc5IChSLUNhciBIMSkgICAgIERQQUQgMCAgICAgICAgIERQQUQg
MSAgICAgICAgIC0gICAgICAgICAgICAgIC0NCj4gPiAgIFI4QTc3OTAgKFItQ2FyIEgyKSAgICAg
RFBBRCAwICAgICAgICAgTFZEUyAwICAgICAgICAgTFZEUyAxICAgICAgICAgLQ0KPiA+DQoNCg==
