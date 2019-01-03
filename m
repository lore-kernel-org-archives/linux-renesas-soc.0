Return-Path: <SRS0=Tt7D=PL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6029C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 14:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6520A208E3
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 14:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="tEfyUAEZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729890AbfACOeo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Jan 2019 09:34:44 -0500
Received: from mail-eopbgr1410113.outbound.protection.outlook.com ([40.107.141.113]:26240
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727436AbfACOeo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jan 2019 09:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xojLBvGVYDwzsqxx28ye7CqCAWR+ku7zRUuZRmaUh4c=;
 b=tEfyUAEZP5XN8MCphsR4a7VXFAJDUNQNmq/44iQ0BcSFVqD5rMbHki6jF1Nt8NPMKhjqdKMHxiD02iBAwceHOWLvQLkBkKd4MRlCn+XULseOhYccBYVa5P51HwH1AEZLSBR579s2sClWg0OxWqNwIUOiDUchu5x1PVGPUG9ZpqY=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB5078.jpnprd01.prod.outlook.com (20.179.184.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1471.20; Thu, 3 Jan 2019 14:34:40 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::35e7:300c:a781:3ef6]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::35e7:300c:a781:3ef6%2]) with mapi id 15.20.1495.005; Thu, 3 Jan 2019
 14:34:39 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from du
 node
Thread-Topic: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from du
 node
Thread-Index: AQHUjHsZHX2VrqnyIEaV0xiZ3WYDo6WdvK0AgAAIVxA=
Date:   Thu, 3 Jan 2019 14:34:39 +0000
Message-ID: <OSBPR01MB2103C5C4C2A5B276E80D047AB88D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW+qVJxu0fjC+j8w-neHU8FOHmJqRbHAtp1JvKYJ+RrXQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW+qVJxu0fjC+j8w-neHU8FOHmJqRbHAtp1JvKYJ+RrXQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB5078;20:UDLr33GmbFZ2tMLSCj174IkclMCJcDn4fOydMKewviDd9RXgz51bdGm2l6kPMDfdWCsDuqTlVLjwNHmem0nhSKPZc4AxIYiF4cWnISIz6QIwoKcVEKpzmGXVumoSMAmshX1DZ+Is6g2Qs7d9+o5ZftfMBDCJ4G1yhBClCERsg7o=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 102c1f8b-9b59-4a24-eb87-08d6718897b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB5078;
x-ms-traffictypediagnostic: OSBPR01MB5078:
x-microsoft-antispam-prvs: <OSBPR01MB50786EABE0463B5F00B3F7FDB88D0@OSBPR01MB5078.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(3002001)(6055026)(6041310)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB5078;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB5078;
x-forefront-prvs: 0906E83A25
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(39850400004)(376002)(366004)(396003)(199004)(189003)(51914003)(9686003)(107886003)(6506007)(81166006)(81156014)(55016002)(86362001)(25786009)(316002)(39060400002)(186003)(68736007)(102836004)(71190400001)(6246003)(5660300001)(53936002)(7696005)(7736002)(33656002)(53546011)(6436002)(54906003)(14454004)(71200400001)(8936002)(478600001)(26005)(8676002)(4326008)(76176011)(476003)(486006)(97736004)(99286004)(229853002)(74316002)(106356001)(6116002)(44832011)(14444005)(256004)(305945005)(2906002)(11346002)(105586002)(6916009)(3846002)(446003)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB5078;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YVt5mcCdgFdDGlFsrqMns97oT7M2aeXWCQnCavfOrUQgMcmYq9pwlQU84hAUSCPtsMSNqvIQ9z3Ksv5sXCoYcOOnnDmhv/9FtbR2mmdzijCBzPMMoFWXypsY+sz28G25gYYraMO7RSm7XqwSDBjewLzij7slCKrdJ1E+KFarqW9VQKW0mrSKySnN5K+hlljV+U1D92Cch4F04ousYkIpR2NNESJDE6b9i7HqOJqg4ht5vWZQJw8KERMQM9s2uihDu4wx3lxhC/l1ITFzw9+rICHL1c/0k6cVKCLCiyxPQ3jVp0ISWHy0VesOxpwOZzL2
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102c1f8b-9b59-4a24-eb87-08d6718897b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2019 14:34:39.3167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5078
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgNC81XSBBUk06IGR0czogcjhhNzc0MzogUmVtb3ZlIExWRFMgZW5jb2RlciBmcm9t
DQo+IGR1IG5vZGUNCj4NCj4gSGkgQmlqdSwNCj4NCj4gT24gV2VkLCBEZWMgNSwgMjAxOCBhdCAx
MDoxNSBBTSBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+
IFRoZSBpbnRlcm5hbCBMVkRTIGVuY29kZXIgbm93IGhhcyBEVCBiaW5kaW5ncyBzZXBhcmF0ZSBm
cm9tIHRoZSBEVS4NCj4gPiBTbyByZW1vdmUgaXQgZnJvbSBkdSBub2RlLg0KPiA+DQo+ID4gRml4
ZXM6IGM2YTI3ZmE0MWZhYiAoImRybTogcmNhci1kdTogQ29udmVydCBMVkRTIGVuY29kZXIgY29k
ZSB0bw0KPiA+IGJyaWRnZSBkcml2ZXIiKQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPg0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
DQo+DQo+ID4gLS0tDQo+ID4gVjEtLT5WMg0KPiA+ICAgICAgICAgKiBSZW1vdmVkIExWRFMgZW5j
b2RlciBkZWZpbml0aW9uIGZyb20gRFUgbm9kZS4NCj4NCj4gU2hvdWxkbid0IHlvdSBhZGQgYSBu
ZXcgbm9kZSBmb3IgdGhlIExWRFMgZW5jb2Rlcj8NCg0KWWVzIGZvciBTb2MgRHRzaSAsIEkgd2ls
bCBhZGQgdGhlIG5ldyBub2RlIGZvciBMVkRTIGVuY29kZXIuDQoNClJlZ2FyZHMsDQpCaWp1DQo+
ID4gLS0tDQo+ID4gIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDMuZHRzaSB8IDkgKysrLS0tLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc0My5kdHNpDQo+ID4g
Yi9hcmNoL2FybS9ib290L2R0cy9yOGE3NzQzLmR0c2kgaW5kZXggM2NjMzNmNy4uM2FkMWVmYyAx
MDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9yOGE3NzQzLmR0c2kNCj4gPiArKysg
Yi9hcmNoL2FybS9ib290L2R0cy9yOGE3NzQzLmR0c2kNCj4gPiBAQCAtMTY4MSwxNSArMTY4MSwx
MiBAQA0KPiA+DQo+ID4gICAgICAgICAgICAgICAgIGR1OiBkaXNwbGF5QGZlYjAwMDAwIHsNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsZHUtcjhhNzc0
MyI7DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHhmZWIwMDAwMCAwIDB4
NDAwMDA+LA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwwIDB4ZmViOTAwMDAg
MCAweDFjPjsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICByZWctbmFtZXMgPSAiZHUiLCAi
bHZkcy4wIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweGZlYjAwMDAw
IDAgMHg0MDAwMD47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDI1NiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMjY4IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzI0PiwNCj4g
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDcyMz4sDQo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCA3MjY+Ow0K
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImR1LjAiLCAiZHUuMSIs
ICJsdmRzLjAiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQ
R19NT0QgNzIzPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJk
dS4wIiwgImR1LjEiOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7DQo+ID4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0cyB7DQo+DQo+IEdy
e29ldGplLGVldGluZ31zLA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPg0K
PiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPg0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJv
cGUgTHRkLCBEdWtlcyBNZWFkb3csIE1pbGxib2FyZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5n
aGFtc2hpcmUsIFNMOCA1RkgsIFVLLiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRl
ciBSZWdpc3RlcmVkIE5vLiAwNDU4NjcwOS4NCg==
