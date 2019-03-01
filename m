Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D829C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BE952087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="QfLEOyk6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfCAKqH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 05:46:07 -0500
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:29284
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725978AbfCAKqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 05:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+pesMIbONDWsMXzl9slP1gh7lzdJqIoxptCEQ2cMhM=;
 b=QfLEOyk6gLIc8TkAYLsgtIAmzGvHimswcujlS+DBfMYwf25JxTLUWz+W0cXDnAngzkKm2nalQ/U0Br/ZXkPi9GdwMw0jAXOq/lXeRBk8iXb7iFMLojjjbzZ34JeyVl3bj9jRm9zfgaPdSmau9/SZkXK5KmT5zicB8OYaQBwCdE8=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1767.jpnprd01.prod.outlook.com (52.134.225.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.16; Fri, 1 Mar 2019 10:46:01 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5b0:ac4:6d54:6285]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5b0:ac4:6d54:6285%5]) with mapi id 15.20.1643.022; Fri, 1 Mar 2019
 10:46:01 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Andy Gross <andy.gross@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/5] arm64: defconfig: enable RX-8581 config option
Thread-Topic: [PATCH 4/5] arm64: defconfig: enable RX-8581 config option
Thread-Index: AQHUycpWkLzEjpyZW0ec5TbMFEt9V6X2oUwAgAAB41A=
Date:   Fri, 1 Mar 2019 10:46:00 +0000
Message-ID: <OSBPR01MB2103EC5F538696499211DAEBB8760@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1550742048-28068-1-git-send-email-biju.das@bp.renesas.com>
 <1550742048-28068-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVfaHXPWpTHJNMkNX1hEXBbM_zdbkoTj9NPf4cBNfpiWA@mail.gmail.com>
In-Reply-To: <CAMuHMdVfaHXPWpTHJNMkNX1hEXBbM_zdbkoTj9NPf4cBNfpiWA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12f051c7-33d0-4f42-6894-08d69e331874
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB1767;
x-ms-traffictypediagnostic: OSBPR01MB1767:
x-microsoft-exchange-diagnostics: 1;OSBPR01MB1767;20:I0ewO1qsha4XOe1R+qWZp2ex5iUcGntbkfTqgqrcR8vhs3Gta6IHX3SOGBrPbD7t6QBrxGD0AN9DuLXH+hS21GPkKW8dBp2IYZ3McXh+otRZ3MRGCXZ9VtzZc7sOfb5iooRZpUfVKZBk7++XI/EXHEB5wkVn9tSITZW8Kyx2rlI=
x-microsoft-antispam-prvs: <OSBPR01MB1767896C1DA944CF9404E366B8760@OSBPR01MB1767.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(39860400002)(396003)(376002)(346002)(51914003)(199004)(189003)(44832011)(316002)(11346002)(81156014)(52536013)(6116002)(74316002)(8676002)(66066001)(256004)(4744005)(86362001)(81166006)(26005)(2906002)(446003)(54906003)(8936002)(6916009)(3846002)(7696005)(102836004)(4326008)(6436002)(6506007)(9686003)(6246003)(478600001)(7416002)(55016002)(76176011)(99286004)(97736004)(14454004)(33656002)(105586002)(68736007)(229853002)(186003)(476003)(25786009)(305945005)(5660300002)(53936002)(71200400001)(71190400001)(486006)(7736002)(106356001)(53546011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1767;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NF65Yy+W7zhBSI/2SdXg8lmtAy/k1xfb7evfsH39OAx3XX8ykMmm4dXbReSQ1vfz3dNQm7prvaLDWohbHDd6zL9pzS8Xeem+oFi7e95yBPa/nnd1tZcznD20r3Xp9W3AJUgo5Mr2H2LeMTr16ZVT7GX/VdQaM3mGWVqZ/qv8Zr5yqSZxRp9X8dPW+ZC3U5VurcHG+H2wihrFOr9YBm0hZlbQJDNhJs8mSEOrf1KEGwblv6/a/dMYLiVaqLQ6PecZ3Bkfzdc8Qt9UiM3qLMPdZ5GAFEuKAHrBYuSLMRUIAbosYPl75UR6jkM49wyhEZIqjpnxb3w5sEnqUUb0gO7u/gFyUyvVusoP1kI8gS+CrM4BGGcbBSSSwYlnsitP27HET8z0ZQYET7A/IjADJZwcWq6J5nZT0ZgYnQ+f769Z4wU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f051c7-33d0-4f42-6894-08d69e331874
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 10:46:00.8545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1767
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNC81XSBhcm02NDogZGVmY29uZmlnOiBlbmFibGUgUlgtODU4MSBjb25maWcgb3B0aW9u
DQo+DQo+IE9uIFRodSwgRmViIDIxLCAyMDE5IGF0IDEwOjQ2IEFNIEJpanUgRGFzIDxiaWp1LmRh
c0BicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRW5hYmxlIHN1cHBvcnQgZm9yIFJYLTg1
NzEvUlgtODU4MSBSVEMgYnkgdHVybmluZyBvbg0KPiA+IENPTkZJR19SVENfRFJWX1JYODU4MSBh
cyBtb2R1bGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAu
cmVuZXNhcy5jb20+DQo+DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPg0KPiBQcm9iYWJseSB5b3Ugd2FudCB0byBlbmFibGUgdGhp
cyBpbiAobG9jYWwpIHJlbmVzYXNfZGVmY29uZmlnLCB0b28/DQoNClllcy4gV2lsbCBzZW5kIGFu
b3RoZXIgcGF0Y2ggdG8gZW5hYmxlIHRoaXMgaW4gcmVuZXNhc19kZWZjb25maWcgYXMgd2VsbC4N
Cg0KUmVnYXJkcywNCkJpanUNCg0KDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21i
SCxHZXNjaGFlZnRzZnVlaHJlci9QcmVzaWRlbnQgOiBNaWNoYWVsIEhhbm5hd2FsZCwgU2l0eiBk
ZXIgR2VzZWxsc2NoYWZ0L1JlZ2lzdGVyZWQgb2ZmaWNlOiBEdWVzc2VsZG9yZiwgQXJjYWRpYXN0
cmFzc2UgMTAsIDQwNDcyIER1ZXNzZWxkb3JmLCBHZXJtYW55LEhhbmRlbHNyZWdpc3Rlci9Db21t
ZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVu
dGlmaWNhdGlvbiBuby46IERFIDExOTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46
IERFIDE0OTc4NjQ3DQo=
