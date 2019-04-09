Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43CCC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:18:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 930A72084F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="WjO/DvOh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfDIKS3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:18:29 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:57152
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726001AbfDIKS3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 06:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIHpVftCqyaZyTI0jN9yc6TIrWpFqOv7xtEcpBFs2Ew=;
 b=WjO/DvOhbFWby44l2MoR6nNdhcYeMn1vKScRQPAOp+80QCp6aj4CFKq/RzAVgrOJYIcLHElz2UF/AYnQTy1XqxqlBlNJvCXXOuEswz/aeNXqtUnm6KaQR7mt+fqiYOZOzhaD1uRUYsWIZAvUlpnkKxAJkYfUIPXyXEGZbl63Bcs=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB1952.jpnprd01.prod.outlook.com (52.133.177.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.15; Tue, 9 Apr 2019 10:18:26 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 10:18:25 +0000
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
Subject: RE: [PATCH V3 03/13] dt-bindings: rcar-gen3-phy-usb2: Add r8a77470
 support
Thread-Topic: [PATCH V3 03/13] dt-bindings: rcar-gen3-phy-usb2: Add r8a77470
 support
Thread-Index: AQHU6gjw7NjthBLBtUKWST5lXcIQkaYzprYw
Date:   Tue, 9 Apr 2019 10:18:25 +0000
Message-ID: <TYAPR01MB4271DD74C0A095F55181EBD3D82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-4-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2445a69-037c-400f-1847-08d6bcd4b416
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB1952;
x-ms-traffictypediagnostic: TYAPR01MB1952:
x-microsoft-antispam-prvs: <TYAPR01MB195278575FECCA3B60D3448BD82D0@TYAPR01MB1952.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(305945005)(55016002)(7736002)(6436002)(2906002)(256004)(25786009)(8676002)(68736007)(53936002)(8936002)(229853002)(9686003)(74316002)(5660300002)(316002)(4744005)(6246003)(478600001)(54906003)(81166006)(33656002)(476003)(97736004)(99286004)(14454004)(86362001)(106356001)(66066001)(71190400001)(486006)(4326008)(11346002)(3846002)(105586002)(71200400001)(102836004)(6116002)(186003)(6862004)(446003)(6506007)(76176011)(7696005)(26005)(52536014)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB1952;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n5dWq1QSW4QGeXnGPFqrF83Vc5VAgQ6pXKiXErCo1ggwvO0DCidg0GMN94/Chmb7A0bj1FG8i+q4KN71khiwT4BGNxi9Xv+ENgyjoeA64/0cGVTMF2J+tZ5cp8s0kisZkQC1XcdpoEnhJa+DsgVknuyLTYtPnoygWaseRJ2FIz7Ht5YXEu1mJIaehM5/hkcSspRHCmZlJw/u1FPwBa7VEshjKdbIfQ0Dq8qDZEsBm0WNlRUtKkaviz4FsHCIy0nGwcHdoYiwt0dui8NgRO5KuDz+0kVS09+XS4zuRyhWsCBVdOCH7Y2IYuDtNQVYUCaMvBe9ENGf3pgMi1p2FMG/mm8ozRkH886dNcpQw97m7wjsQ25l33JxIL6Fi2Hs7SaBKWEmQEiPLEFhi23nZEv31IMzDWXx2YazxnZYlf+hMQ0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2445a69-037c-400f-1847-08d6bcd4b416
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 10:18:25.7547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB1952
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Wednesday, April 3, 2019 7:29 PM
>=20
> Document RZ/G1C (R8A77470) SoC bindings.
>=20
> For RZ/G1C, this driver is used to enable interrupt generation and
> initializing timing registers which is part of phy_init code.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

