Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9709FC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61F062083E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:07:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="fXf7A4jn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfDIKHL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:07:11 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:27232
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726062AbfDIKHK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 06:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhxkm/hX99/izn94nlTuCn8K0mpTw8PRMWVcdGYjRPQ=;
 b=fXf7A4jn8uIH7hsfQ7SH0LyDSVVVQIInHkXgHdwrd7FuRU/ziNf85Cv1s/Uk6VBc8Z2U1eWqVACuG/PNKlsmjDc9idV0O391maUECq4bas/CGkzp10/lRiuhwl2MTRk38U2FNj4/EXjFdguKBL9g5NmfKLgSPDhfyuU0wuGA1N4=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB2510.jpnprd01.prod.outlook.com (20.177.103.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Tue, 9 Apr 2019 10:07:06 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 10:07:06 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH V3 01/13] dt-bindings: phy: rcar-gen2: Add r8a77470
 support
Thread-Topic: [PATCH V3 01/13] dt-bindings: phy: rcar-gen2: Add r8a77470
 support
Thread-Index: AQHU6gjtgWVRX+2TSEuj9Kb1doyUwqYzo3wA
Date:   Tue, 9 Apr 2019 10:07:06 +0000
Message-ID: <TYAPR01MB42719D7CCC82B48BF87A6D2CD82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-2-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d404d9b5-97c9-47f5-9d84-08d6bcd31efb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2510;
x-ms-traffictypediagnostic: TYAPR01MB2510:
x-microsoft-antispam-prvs: <TYAPR01MB25101D2F73706A685A875240D82D0@TYAPR01MB2510.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(66066001)(2906002)(14454004)(26005)(6116002)(81166006)(446003)(3846002)(486006)(8676002)(256004)(476003)(106356001)(105586002)(9686003)(55016002)(81156014)(4326008)(11346002)(53936002)(52536014)(86362001)(6246003)(6862004)(68736007)(478600001)(25786009)(71200400001)(99286004)(7736002)(6506007)(4744005)(186003)(71190400001)(7696005)(97736004)(8936002)(6436002)(76176011)(316002)(5660300002)(229853002)(305945005)(102836004)(74316002)(54906003)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2510;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cNb911hTCMjs+adW+oRNlH0/BkX1Q0vlxT2FpIXRyTS+lY85OhZZC0IWxZGD0MJKvD/8LE7E5+gST1J2GiCKr6e6LzIf7PAm3wrR34zs2gDh7wumYbifwKlWWJu08ErHAXIcXgGetl4it1WlGHJYFDZSccpQ2KK41m3A3oa0UiOYwPtXzLP4qrOLixskOhPXenPy43WWg4UWuNXh5junXLWd6bXl+avcsJZwCY7pSg5MsXrm/G/LTPWd2f3fyrtHTtEMy2rMEpPCQejyaVM/jPwM9HYB8Om6UDIy150WVqhGWVFuzTFlIH7O47W4Loe/+/4n4U1loat1qDVQk6BQwJEOjdJ6yzKS80RBgR4ldA7W9Ma6mLmh14UldzoJcqPMbTT5nnRiDIQ2nQP66at/an9b2RLOF4vs9Y21d+briw0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d404d9b5-97c9-47f5-9d84-08d6bcd31efb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 10:07:06.1109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2510
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Wednesday, April 3, 2019 7:29 PM
>=20
> Add USB PHY support for r8a77470 SoC. Renesas RZ/G1C (R8A77470)
> USB PHY is similar to the R-Car Gen2 family, but has the below
> feature compared to other RZ/G1 and R-Car Gen2/3 SoCs
>=20
> It has a shared pll reset for usbphy0/usbphy1 and this register
> reside in usbphy0 block.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

