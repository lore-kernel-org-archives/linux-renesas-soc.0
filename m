Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA44AC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:33:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1CD820878
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfDXJdT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:33:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35156 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbfDXJdT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 05:33:19 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6D54325AE8A;
        Wed, 24 Apr 2019 19:33:17 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6502394041B; Wed, 24 Apr 2019 11:33:15 +0200 (CEST)
Date:   Wed, 24 Apr 2019 11:33:15 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig
Message-ID: <20190424093315.6jg7muf56d2toxl5@verge.net.au>
References: <1556025203-59961-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVzMt0Bq6Nyky2sSRKn8pB7srG1BTeweERFNJtrTUj+ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVzMt0Bq6Nyky2sSRKn8pB7srG1BTeweERFNJtrTUj+ow@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 24, 2019 at 09:12:04AM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 23, 2019 at 3:20 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Remove the GENERIC_PHY config option from shmobile_defconfig, as it is
> > selected by PHY_RCAR_GEN3_USB2.
> >
> > PHY_RCAR_GEN3_USB2 is enabled by the commit 0cd4f4f10245d1d9616e00245
> > ("ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig").
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

This does not seem to work as expected when applied on top of
renesas-devel-20190423-v5.1-rc5.

Without this patch I see both CONFIG_GENERIC_PHY and CONFIG_PHY_RCAR_GEN
selected. With this patch I see neither selected, I expected both.

--- .config.old	2019-04-24 11:31:12.480520934 +0200
+++ .config	2019-04-24 11:31:34.732852122 +0200
@@ -4272,7 +4272,7 @@
 #
 # PHY Subsystem
 #
-CONFIG_GENERIC_PHY=y
+# CONFIG_GENERIC_PHY is not set
 # CONFIG_BCM_KONA_USB2_PHY is not set
 # CONFIG_PHY_CADENCE_DP is not set
 # CONFIG_PHY_CADENCE_DPHY is not set
@@ -4282,7 +4282,6 @@
 # CONFIG_PHY_PXA_28NM_USB2 is not set
 # CONFIG_PHY_CPCAP_USB is not set
 # CONFIG_PHY_MAPPHONE_MDM6600 is not set
-CONFIG_PHY_RCAR_GEN2=y
 # CONFIG_PHY_RCAR_GEN3_PCIE is not set
 # CONFIG_PHY_RCAR_GEN3_USB3 is not set
 # CONFIG_POWERCAP is not set
