Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92018C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5463E2133D
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="LsnZS3wA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfDIKRC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:17:02 -0400
Received: from mail-eopbgr1400132.outbound.protection.outlook.com ([40.107.140.132]:52777
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726939AbfDIKRB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 06:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnhahGbvIDIQTG+hqEZZlc9PVHINDv1qEMnzNi36F5Q=;
 b=LsnZS3wADX0frHSMtveJgTYXVlEjRzKEWO9P0lyFgZSfdZaGo6c3Jpxt7jpHAlXRPjuGdOuAkSCsSgnZPRWHkwSY8USIGZK2uqzM4WNvut1KwfxCHo7gg3CsMDh39WlObumNiyeHNIACziqglCeBr6wKyJyi9onVzrMS6jtQnT4=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB1952.jpnprd01.prod.outlook.com (52.133.177.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.15; Tue, 9 Apr 2019 10:16:58 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 10:16:58 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: RE: [PATCH V3 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Topic: [PATCH V3 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Index: AQHU6gjvf4EO+GEsZk2G6SPoiB3jg6YzpiUw
Date:   Tue, 9 Apr 2019 10:16:57 +0000
Message-ID: <TYAPR01MB427195858D60D9A228A0EF47D82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-3-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ed6a8ae-7b77-49f1-d54f-08d6bcd47fa9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB1952;
x-ms-traffictypediagnostic: TYAPR01MB1952:
x-microsoft-antispam-prvs: <TYAPR01MB1952D1B5948746AFFF6FD6DDD82D0@TYAPR01MB1952.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(305945005)(55016002)(7736002)(6436002)(2906002)(256004)(25786009)(8676002)(68736007)(53936002)(8936002)(229853002)(9686003)(74316002)(5660300002)(316002)(4744005)(6246003)(478600001)(54906003)(81166006)(33656002)(476003)(97736004)(99286004)(14454004)(86362001)(106356001)(66066001)(71190400001)(486006)(4326008)(11346002)(3846002)(105586002)(71200400001)(102836004)(6116002)(186003)(6862004)(446003)(6506007)(76176011)(7696005)(26005)(52536014)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB1952;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s/Ginm9/uPFk39OADvMuuMrEa23p7nR8TORaFUBDuDphatVBSPQjB8qV2gX+HSI4uLGNH/0GGnQqIHhNF5uwPYXjebDw5vdyh0fITLmqvaOrPPL5umXQvHsLxTkqhHhjeiBgStLjj5GfowvIzGbRrS0OboAmAu+ifvK2ctPSzsbBmCNI4/Ub3qQYjT80No2LGj0b0cV3PdmJyrkOHuGL3oB3B7Ovmhzwdac6FszVml+A9dzfolLLLLkaE+G5f65AWgjt5RTrHk1Ijssne2/VUTtlr62A1ySFR/x9RgwC+2c9kFNA/rvQqfxZe5mf5p4PY31HgS3CVHVTNFEbmDqWUoQOmkaZmmJtqrpQXCFMFote1TyslBy4xBsWpCkSAnnAUNKlwYYnLxvytO046wZ8lRUQ9fR9nwvWdPL0XHwkJvg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed6a8ae-7b77-49f1-d54f-08d6bcd47fa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 10:16:57.7767
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
> This patch adds support for RZ/G1C (r8a77470) SoC. RZ/G1C SoC has a
> PLL register shared between hsusb0 and hsusb1. Compared to other RZ/G1
> and R-Car Gen2/3, USB Host needs to deassert the pll reset.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

