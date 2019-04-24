Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6FAC282E3
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 11:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED5172175B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 11:07:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbfDXLHK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 07:07:10 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38418 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728675AbfDXLHJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 07:07:09 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5AA5F25AE99;
        Wed, 24 Apr 2019 21:07:07 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2CD1694041B; Wed, 24 Apr 2019 13:07:05 +0200 (CEST)
Date:   Wed, 24 Apr 2019 13:07:05 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
Message-ID: <20190424110700.4q7ymsj6y62pvbji@verge.net.au>
References: <1556025203-59961-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVzMt0Bq6Nyky2sSRKn8pB7srG1BTeweERFNJtrTUj+ow@mail.gmail.com>
 <20190424093315.6jg7muf56d2toxl5@verge.net.au>
 <OSBPR01MB210316C686F7DFABE8013357B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB210316C686F7DFABE8013357B83C0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 24, 2019 at 09:44:11AM +0000, Biju Das wrote:
> Hi Simon,
> 
> Thanks for the feedback.
> 
> I missed to add the dependency for this patch.
> 
> This patch has dependency on
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20190424&id=5d8042e95fd471d0e342cf14f127194f1a867a01

Thanks, but I see the same result with this patch applied on top of

5d8042e95fd4 phy: rcar-gen3-usb2: Add support for r8a77470

> > -----Original Message-----
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 24 April 2019 10:33
> > To: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Biju Das <biju.das@bp.renesas.com>; Magnus Damm
> > <magnus.damm@gmail.com>; Russell King <linux@armlinux.org.uk>; Linux-
> > Renesas <linux-renesas-soc@vger.kernel.org>; Linux ARM <linux-arm-
> > kernel@lists.infradead.org>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Chris Paterson
> > <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>
> > Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from
> > shmobile_defconfig
> > 
> > On Wed, Apr 24, 2019 at 09:12:04AM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Apr 23, 2019 at 3:20 PM Biju Das <biju.das@bp.renesas.com>
> > wrote:
> > > > Remove the GENERIC_PHY config option from shmobile_defconfig, as it
> > > > is selected by PHY_RCAR_GEN3_USB2.
> > > >
> > > > PHY_RCAR_GEN3_USB2 is enabled by the commit
> > > > 0cd4f4f10245d1d9616e00245
> > > > ("ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
> > shmobile_defconfig").
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >
> > > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > This does not seem to work as expected when applied on top of renesas-
> > devel-20190423-v5.1-rc5.
> > 
> > Without this patch I see both CONFIG_GENERIC_PHY and
> > CONFIG_PHY_RCAR_GEN selected. With this patch I see neither selected, I
> > expected both.
> > 
> > --- .config.old	2019-04-24 11:31:12.480520934 +0200
> > +++ .config	2019-04-24 11:31:34.732852122 +0200
> > @@ -4272,7 +4272,7 @@
> >  #
> >  # PHY Subsystem
> >  #
> > -CONFIG_GENERIC_PHY=y
> > +# CONFIG_GENERIC_PHY is not set
> >  # CONFIG_BCM_KONA_USB2_PHY is not set
> >  # CONFIG_PHY_CADENCE_DP is not set
> >  # CONFIG_PHY_CADENCE_DPHY is not set
> > @@ -4282,7 +4282,6 @@
> >  # CONFIG_PHY_PXA_28NM_USB2 is not set
> >  # CONFIG_PHY_CPCAP_USB is not set
> >  # CONFIG_PHY_MAPPHONE_MDM6600 is not set -
> > CONFIG_PHY_RCAR_GEN2=y  # CONFIG_PHY_RCAR_GEN3_PCIE is not set  #
> > CONFIG_PHY_RCAR_GEN3_USB3 is not set  # CONFIG_POWERCAP is not set
> 
