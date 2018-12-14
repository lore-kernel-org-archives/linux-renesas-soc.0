Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F153BC6786C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 10:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F3EA20811
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 10:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="p4CwtPPW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F3EA20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729779AbeLNKlk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 05:41:40 -0500
Received: from mail-eopbgr1300099.outbound.protection.outlook.com ([40.107.130.99]:13872
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729777AbeLNKlk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 05:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6XrYqnOZ/RGEeBd3DRCbWV6Meif+tFKWrDdjzDgZqU=;
 b=p4CwtPPWbF6DLbgJmK+GJMcPoEX3VFME7mO9Ot2WXilYitI2ZpfkbJx0rZ3YC2tMATzjcCKpLSmMi2u4rrRucqHEPwLL0Kn1+xdTfNXOR3Fqr6y091b9CxYHZUC/0GspfRkT6Wffe7zRGZRngVPMZY1sNPsZk3QIssXsd9SOunY=
Received: from TY2PR01MB2297.jpnprd01.prod.outlook.com (52.133.184.14) by
 TY2PR01MB4282.jpnprd01.prod.outlook.com (20.179.168.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.20; Fri, 14 Dec 2018 10:41:33 +0000
Received: from TY2PR01MB2297.jpnprd01.prod.outlook.com
 ([fe80::9545:5575:a99a:a145]) by TY2PR01MB2297.jpnprd01.prod.outlook.com
 ([fe80::9545:5575:a99a:a145%3]) with mapi id 15.20.1404.026; Fri, 14 Dec 2018
 10:41:33 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Subject: RE: [PATCH 2/2] pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
Thread-Topic: [PATCH 2/2] pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
Thread-Index: AQHUkgSJpLjLyl0UOE+KJa6hpYtSy6V8sjSAgAFcViA=
Date:   Fri, 14 Dec 2018 10:41:32 +0000
Message-ID: <TY2PR01MB2297C725388D98E018BA687FD8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1544609975-26477-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1544609975-26477-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <9308781.U9oT2vPqyz@avalon>
In-Reply-To: <9308781.U9oT2vPqyz@avalon>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB4282;20:Rnuh3STrh8xC65Dfz9qc/e6OJtViTSQzmhtmDagYP8Y7EE6rfVFuO/bfuy+uG/h6qKD+t7Bj8l1XLyPrY7Ln9jl2+oNONG32EbeyJIHEGLautwoWRUkHyxA6zm6ln1Xfx4DGRqaw4Gzpebw98s/IFm4Hj5HuwZJ3Fa8UDOzvOwU=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(396003)(346002)(376002)(136003)(366004)(39860400002)(52084003)(199004)(189003)(102836004)(186003)(76176011)(74316002)(5660300001)(26005)(6916009)(305945005)(229853002)(316002)(54906003)(486006)(99286004)(6506007)(345774005)(476003)(11346002)(446003)(86362001)(68736007)(256004)(14444005)(478600001)(66066001)(6246003)(107886003)(105586002)(2906002)(7736002)(7696005)(8676002)(8936002)(81166006)(81156014)(14454004)(4326008)(106356001)(55016002)(3846002)(53936002)(6116002)(71190400001)(33656002)(71200400001)(25786009)(97736004)(9686003)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB4282;H:TY2PR01MB2297.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 33fdef5e-2af5-4ea8-8102-08d661b0b6e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB4282;
x-ms-traffictypediagnostic: TY2PR01MB4282:
x-microsoft-antispam-prvs: <TY2PR01MB42825C7E44BA8177BB4B9A51D8A10@TY2PR01MB4282.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:TY2PR01MB4282;BCL:0;PCL:0;RULEID:;SRVR:TY2PR01MB4282;
x-forefront-prvs: 08864C38AC
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: kzT0zT3HirVrwa1hovharP+vG94OcMJ05XumM9RDycdS/rWKCfR/vnr/NubD7Tr1VOtRRertIcD0EKSJKp0Yg4YuaWkQsKWpp5j8h+oOCcKWV6MlIW97gpHypyXYHzApt6RfCcnk14PpY6kZaoYSOQ7xGDIJBjjHnq9uqZQiRl6BKVsiglPkbbv0E7EVG2amiRmhmBhlqX/3+7Zs7RaBb6HLj1HvF9vlj8uIw+F+oQfLHvQ2ex/tr596y4efVUIy4YlEthClGfSZs26pWCmBjsLRCHZVZVPU7HKV4pnRQKf99JXebRX4zYAkIiJs5xWT
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fdef5e-2af5-4ea8-8102-08d661b0b6e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 10:41:32.8442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4282
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent-san,

> From: Laurent Pinchart, Sent: Thursday, December 13, 2018 10:53 PM
>=20
> Hello Shimoda-san,
>=20
> Thank you for the patch.
>=20
> On Wednesday, 12 December 2018 12:19:35 EET Yoshihiro Shimoda wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > MOD_SEL register bit numbering was different from R-Car D3 SoC and
> > R-Car H3/M3-[WN] SoCs.
> >
> > MOD_SEL 1-bit      H3/M3-[WN]  D3
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D
> > Set Value =3D H'0    b'0         b'0
> > Set Value =3D H'1    b'1         b'1
> >
> > MOD_SEL 2-bits     H3/M3-[WN]  D3
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D
> > Set Value =3D H'0    b'00        b'00
> > Set Value =3D H'1    b'01        b'10
> > Set Value =3D H'2    b'10        b'01
> > Set Value =3D H'3    b'11        b'11
> >
> > MOD_SEL 3-bits     H3/M3-[WN]  D3
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D  =3D=3D=3D=3D=3D
> > Set Value =3D H'0    b'000       b'000
> > Set Value =3D H'1    b'001       b'100
> > Set Value =3D H'2    b'010       b'010
> > Set Value =3D H'3    b'011       b'110
> > Set Value =3D H'4    b'100       b'001
> > Set Value =3D H'5    b'101       b'101
> > Set Value =3D H'6    b'110       b'011
> > Set Value =3D H'7    b'111       b'111
> >
> > This patch replaces the #define name and value of MOD_SEL.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Fixes: 794a67117646 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
> > [shimoda: split a patch per SoC and revise the commit log]
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Per Geert's request I've tested this patch on the Draak board with pwm-
> backlight, and it doesn't seem to make any difference.

Thank you for testing this patch!
The result seems strange to me. So, I'll investigate it in next week.

Best regards,
Yoshihiro Shimoda

