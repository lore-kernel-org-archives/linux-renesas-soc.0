Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B33C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F7CC206A3
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="uOuefVbR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfDXJoU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:44:20 -0400
Received: from mail-eopbgr1400124.outbound.protection.outlook.com ([40.107.140.124]:25120
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726238AbfDXJoT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 05:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt1aIk1gQ/n9eN1xGT4eN3Vqgjwc5Xut5F9mzs9bcB4=;
 b=uOuefVbRCXkYUuUj9PZufa+OEieaeaKg8BIRNCszQrxKiLtwgnoY7DunAeIVcDFB+33xuUbYabGhXpSk8tNrji82eG1siZSXlgHrxQI3TaJxPsCWeUX8ERRwfNDUlHbqyDIRl8svfsxR3WQSCpI+fJBXc1DeAlsvlTccKY+78aQ=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB5174.jpnprd01.prod.outlook.com (20.179.184.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Wed, 24 Apr 2019 09:44:12 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1813.017; Wed, 24 Apr 2019
 09:44:12 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
Thread-Topic: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
 shmobile_defconfig
Thread-Index: AQHU+ddL3t53bMGTbU+yfoQdpsVeB6ZK5lsAgAAncoCAAAIFQA==
Date:   Wed, 24 Apr 2019 09:44:11 +0000
Message-ID: <OSBPR01MB210316C686F7DFABE8013357B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1556025203-59961-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVzMt0Bq6Nyky2sSRKn8pB7srG1BTeweERFNJtrTUj+ow@mail.gmail.com>
 <20190424093315.6jg7muf56d2toxl5@verge.net.au>
In-Reply-To: <20190424093315.6jg7muf56d2toxl5@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad9f270f-89a5-451e-151d-08d6c8996804
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB5174;
x-ms-traffictypediagnostic: OSBPR01MB5174:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB51744756E10D00A81794561DB83C0@OSBPR01MB5174.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(396003)(39860400002)(136003)(346002)(51914003)(189003)(199004)(13464003)(7736002)(486006)(3846002)(44832011)(6116002)(26005)(305945005)(316002)(102836004)(97736004)(2906002)(54906003)(53546011)(110136005)(6436002)(6506007)(478600001)(74316002)(476003)(446003)(11346002)(966005)(186003)(229853002)(107886003)(9686003)(8936002)(4326008)(6246003)(76176011)(66556008)(71190400001)(86362001)(14454004)(52536014)(66476007)(53936002)(68736007)(73956011)(66066001)(81156014)(66946007)(5660300002)(64756008)(25786009)(76116006)(55016002)(33656002)(8676002)(99286004)(6306002)(7696005)(256004)(66446008)(81166006)(71200400001)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB5174;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TB9v8cX9BoXiGizqGIyee22ToSbhqfYakoBlRx3A2VW+N6kB6rlLhPPTCajQMDbPCdqOucgYV0nsakuG5eFt34neaJ9L0c0yguFuu40+tTIa9RR2v+AJC6Hfw753EMQrxu9ziXewdcbAiTEdnDB40inUPBbAYkl0nytL113QUVTxy7otZRe/mIeDKVrwyJDNHnq+hsh7KR6yfS6dqBqhOW8zUDc9cyKOcf+tZekozyhV82BB/VjcDpBaSTP7tsZiimTR8ECkQjyM5v5VaJYrA8qUY9OZYBm0ldd//0Xdq28y9nu4eYtPT6S+i7K2r/6/rUELdoNHtk+VN194T0F98ZQEjrMGNv4KRtTEMZffY9YJ15xL3AYirffYv1r+nNHlmuXlHYcpZwqH7CqOcmtppMetsD55+2G078QOFzGXBBI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9f270f-89a5-451e-151d-08d6c8996804
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 09:44:11.8682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5174
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for the feedback.

I missed to add the dependency for this patch.

This patch has dependency on
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
?h=3Dnext-20190424&id=3D5d8042e95fd471d0e342cf14f127194f1a867a01


regards,
Biju

> -----Original Message-----
> From: Simon Horman <horms@verge.net.au>
> Sent: 24 April 2019 10:33
> To: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Biju Das <biju.das@bp.renesas.com>; Magnus Damm
> <magnus.damm@gmail.com>; Russell King <linux@armlinux.org.uk>; Linux-
> Renesas <linux-renesas-soc@vger.kernel.org>; Linux ARM <linux-arm-
> kernel@lists.infradead.org>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
> shmobile_defconfig
>=20
> On Wed, Apr 24, 2019 at 09:12:04AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Apr 23, 2019 at 3:20 PM Biju Das <biju.das@bp.renesas.com>
> wrote:
> > > Remove the GENERIC_PHY config option from shmobile_defconfig, as it
> > > is selected by PHY_RCAR_GEN3_USB2.
> > >
> > > PHY_RCAR_GEN3_USB2 is enabled by the commit
> > > 0cd4f4f10245d1d9616e00245
> > > ("ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
> shmobile_defconfig").
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> This does not seem to work as expected when applied on top of renesas-
> devel-20190423-v5.1-rc5.
>=20
> Without this patch I see both CONFIG_GENERIC_PHY and
> CONFIG_PHY_RCAR_GEN selected. With this patch I see neither selected, I
> expected both.
>=20
> --- .config.old	2019-04-24 11:31:12.480520934 +0200
> +++ .config	2019-04-24 11:31:34.732852122 +0200
> @@ -4272,7 +4272,7 @@
>  #
>  # PHY Subsystem
>  #
> -CONFIG_GENERIC_PHY=3Dy
> +# CONFIG_GENERIC_PHY is not set
>  # CONFIG_BCM_KONA_USB2_PHY is not set
>  # CONFIG_PHY_CADENCE_DP is not set
>  # CONFIG_PHY_CADENCE_DPHY is not set
> @@ -4282,7 +4282,6 @@
>  # CONFIG_PHY_PXA_28NM_USB2 is not set
>  # CONFIG_PHY_CPCAP_USB is not set
>  # CONFIG_PHY_MAPPHONE_MDM6600 is not set -
> CONFIG_PHY_RCAR_GEN2=3Dy  # CONFIG_PHY_RCAR_GEN3_PCIE is not set  #
> CONFIG_PHY_RCAR_GEN3_USB3 is not set  # CONFIG_POWERCAP is not set
