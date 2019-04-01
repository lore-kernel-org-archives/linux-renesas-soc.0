Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EEDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 15:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EADD20880
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 15:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Vc0Mz0VL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbfDAPgI (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 11:36:08 -0400
Received: from mail-eopbgr1410097.outbound.protection.outlook.com ([40.107.141.97]:57632
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726514AbfDAPgI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 11:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reyU91OMQNyvWyb/HWl9+VkZ1L8PAh5TLTHBTVdnDHk=;
 b=Vc0Mz0VLkio0XlU3OLUcvjqhRtx5Un+3H2wE7ZCBcBl+Fa96qXcVe6GjwTTyeNWg2fBjhcVQ+8GNluvEcFh4LDwrEGZkoXPp892US9sXUDfZs/j3rQ34l3JJN5wXMBwG72SlhQgHGoqwaibGhZhZ6E1yuL1hkDsGQYE1bF53fyM=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2710.jpnprd01.prod.outlook.com (20.176.240.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.16; Mon, 1 Apr 2019 15:36:04 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f9a1:af9d:75cf:5fd5]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f9a1:af9d:75cf:5fd5%5]) with mapi id 15.20.1750.021; Mon, 1 Apr 2019
 15:36:04 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jianguo Sun <sunjianguo1@huawei.com>,
        Avi Fishman <AviFishman70@gmail.com>,
        Ofer Heifetz <oferh@marvell.com>,
        Lubomir Rintel <lkundrak@v3.sk>, Ran Wang <ran.wang_1@nxp.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Thread-Topic: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
 Renesas RZ/G1C devices
Thread-Index: AQHU6IrkveTjmRhPkUqnbMZJThSNPKYnTIMAgAAimDA=
Date:   Mon, 1 Apr 2019 15:36:03 +0000
Message-ID: <OSBPR01MB2103EF2DD350AB9574E050D0B8550@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
 <1554123232-58942-5-git-send-email-biju.das@bp.renesas.com>
 <20190401132832.GA21551@kroah.com>
In-Reply-To: <20190401132832.GA21551@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5e21ca4-8865-4131-ba59-08d6b6b7c04a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2710;
x-ms-traffictypediagnostic: OSBPR01MB2710:
x-microsoft-antispam-prvs: <OSBPR01MB27102FE69DF377A1590ABD2CB8550@OSBPR01MB2710.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0994F5E0C5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(366004)(136003)(396003)(376002)(51914003)(199004)(189003)(6116002)(9686003)(68736007)(25786009)(86362001)(105586002)(54906003)(476003)(106356001)(33656002)(8936002)(99286004)(5660300002)(7696005)(316002)(52536014)(8676002)(81166006)(305945005)(6246003)(53936002)(486006)(11346002)(256004)(44832011)(102836004)(7736002)(26005)(71200400001)(71190400001)(76176011)(55016002)(81156014)(446003)(3846002)(6506007)(7416002)(74316002)(66066001)(97736004)(186003)(2906002)(6436002)(6916009)(478600001)(229853002)(14454004)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2710;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3tONG2MydKWpS3s0WUN1jJ2yhNXQrvcgI6kAhXoQHq8uw4T9MselX1WhQbCAEKcg4V379izXecN3tnyZOMXLMwDjpb4GqcmCqsO87UfOv9OdonQuMQI7NCwft6WOVLR5WXd9Iq68c/40218cfAO5hcJrzAAA1xdIjIstaKB1PaTF6May9ClEhZfEiyrv5GKLaclmbwPsiIkqNdUfqcjf+oeVxxuvOEWo+SxOXI0mcnigbDIW9uow/8VqPTSVSURXjm7D33luVreO0Xj+dvDaAOtxnF+NgkKbu+oeaf8uxJHMEW5U+Fu6uOtIeCzyv+g74nUPegRWtuBP3dpafccjQ4HAZ6uG5PgKQGqKqWNu3u1ul17vdU93PcT/Qw/SBSVD+2dJS0wiH1b+LwdVHjqIPIaLOoEb9SirrwGvzOMjIdw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e21ca4-8865-4131-ba59-08d6b6b7c04a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2019 15:36:04.0166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2710
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Thanks for the feedback.

> Subject: Re: [PATCH 04/12] usb: host: ehci-r8a77470: Add EHCI support for
> Renesas RZ/G1C devices
>=20
> On Mon, Apr 01, 2019 at 01:53:44PM +0100, Biju Das wrote:
> > This patch adds the glue code required to ensure the on-chip EHCI
> > controller works on RZ/G1C(a.k.a R8A77470) SoC's from Renesas.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > V1-->V2
> >   * New patch
> > ---
> >  drivers/usb/host/Kconfig         |   9 ++
> >  drivers/usb/host/Makefile        |   1 +
> >  drivers/usb/host/ehci-r8a77470.c | 327
> > +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 337 insertions(+)
> >  create mode 100644 drivers/usb/host/ehci-r8a77470.c
> >
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig index
> > d809671..a474aa9 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -237,6 +237,15 @@ config USB_EHCI_HCD_STI
> >  	  Enable support for the on-chip EHCI controller found on
> >  	  STMicroelectronics consumer electronics SoC's.
> >
> > +config USB_EHCI_HCD_R8A77470
> > +	tristate "Support for Renesas R8A77470 on-chip EHCI USB controller"
> > +	depends on ARCH_R8A77470 && OF
>=20
> COMPILE_TEST so that others can also test-build this to ensure that we do
> not break anything over time?

OK.  Will send V3 with below changes

depends on (ARCH_R8A77470 && OF) || COMPILE_TEST

regards,
Biju
