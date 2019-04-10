Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEE4C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:44:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEF8F20830
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="P5kGLCMH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729629AbfDJJol (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:44:41 -0400
Received: from mail-eopbgr1410092.outbound.protection.outlook.com ([40.107.141.92]:52800
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727184AbfDJJol (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQTeQlTR/Ke2nZAQfwEdRaQLtPlKk/4QwVZFtETSIl0=;
 b=P5kGLCMHpl7B5ywc9Swv6eY8kJfr2JGNyBGMUcTYJt8JiEs4vFO/YhTTfWUKtIiz5McNK/gbPuw5kd4deh0wkne+SZcNLYGog0WunsZpgPM7q8ta87AweD6WB4UbQR+URvFymT1WdirQJYXsDEf4Xs1hl3n2+5xH4J0MIfeUHm8=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB4175.jpnprd01.prod.outlook.com (20.178.140.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Wed, 10 Apr 2019 09:44:36 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Wed, 10 Apr 2019
 09:44:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH V4 06/13] dt-bindings: usb: renesas_usbhs: Add support for
 r8a77470
Thread-Topic: [PATCH V4 06/13] dt-bindings: usb: renesas_usbhs: Add support
 for r8a77470
Thread-Index: AQHU73WO3JQ6Qew1R02cFHOuPBihjqY1JNnQ
Date:   Wed, 10 Apr 2019 09:44:36 +0000
Message-ID: <TYAPR01MB4271FC4678F2810C13A856D0D82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
 <1554883715-41725-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554883715-41725-7-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7830913-f195-4792-2b33-08d6bd9924c8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4175;
x-ms-traffictypediagnostic: TYAPR01MB4175:
x-microsoft-antispam-prvs: <TYAPR01MB4175AEE1088C42B4E2DA0567D82E0@TYAPR01MB4175.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(376002)(346002)(396003)(366004)(189003)(199004)(7736002)(97736004)(316002)(305945005)(229853002)(6116002)(3846002)(54906003)(99286004)(7696005)(74316002)(186003)(86362001)(6506007)(446003)(102836004)(76176011)(476003)(26005)(11346002)(105586002)(66066001)(8936002)(106356001)(4326008)(5660300002)(33656002)(68736007)(6436002)(256004)(55016002)(71200400001)(2906002)(71190400001)(81166006)(9686003)(6862004)(14454004)(8676002)(81156014)(25786009)(52536014)(6246003)(53936002)(558084003)(478600001)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4175;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OS+QHJeaScuX3aKuPUlT/2nNolEY1Dqw9IkcFOBNhq1EK+soOm/737qG5jsxbZke6vICOpOyyBJ1tlzH6BCIf/EoHWwgHaZbsyra5WoR6n8pkrxhaXD0ZtJuqR7qOaZl2F2Aw0jQ3u7/THrwODKx3e0KW2PzEquaKNRyMPeFdFt2oBQ1c08Lfr7g8f+LnFw7oBagixgG4CMQJP+aNwbRTcDwpgeRWk+4OB+3ToMi2A60EfaWzNX0phJ52veGB5OHn1P5HuUwvg7v9y5/c0hQGdMRsFnO1I0PEJj8l2lHlbJHBoAt+oLd0wjGuWT8+dsjA8b3ktMFVzPZARocttZyffIwuVbTvrfRfh7p4qBfAR2/ZqCahlTmxY+P3Uq+rLVIHUcEjGD+lV7PKKkoIw60jbDO9vSrZ2zU0EGQMIWj3WU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7830913-f195-4792-2b33-08d6bd9924c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 09:44:36.2396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4175
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Wednesday, April 10, 2019 5:08 PM
>=20
> Document support for RZ/G1C (R8A77470) SoC.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

