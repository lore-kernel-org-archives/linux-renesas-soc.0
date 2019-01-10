Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,URI_HEX,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66217C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:02:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38D1C206B6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:02:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="EPwZVIgL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfAJKCH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 05:02:07 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:36196 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbfAJKCG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 05:02:06 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BCF5425B78D;
        Thu, 10 Jan 2019 21:02:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547114525; bh=Evv6/kUZM2BXEO4ID4kHm9U6pi6UaWggfSKsaCs7c7M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EPwZVIgLNQ3mAUE3y4DWNM7bFN+1AUHGqF5+XB7zc8f85SWpA5gMjdAAV/c66Jf2x
         vItbhyAtUueachhAMG4KI2NnFLCoKkZS4qHdqnPRtW+m4rYvi9S7FU1D614OFOO4bU
         fI12whi5V/eEX5xrd2KdWy9stsF3fzybJgPjApDU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F0FCB940462; Thu, 10 Jan 2019 11:02:02 +0100 (CET)
Date:   Thu, 10 Jan 2019 11:02:02 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix backlight
 regulator numbering
Message-ID: <20190110100202.4eqyge7vadlmodsy@verge.net.au>
References: <20190109140045.17449-1-marek.vasut@gmail.com>
 <CAMuHMdX3bP_WCYNRRMmVRPwV52e72NOZMtW8cf29Fo+E9_CvcQ@mail.gmail.com>
 <20190109165822.tmj7qbho46f7clvg@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190109165822.tmj7qbho46f7clvg@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 09, 2019 at 05:58:23PM +0100, Simon Horman wrote:
> On Wed, Jan 09, 2019 at 04:26:25PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jan 9, 2019 at 3:01 PM <marek.vasut@gmail.com> wrote:
> > > From: Marek Vasut <marek.vasut+renesas@gmail.com>
> > >
> > > There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
> > > the eMMC and one 12V for the backlight. This causes one to be overwritten
> > > by the other, ultimatelly resulting in inoperable eMMC, which depends on
> > > the former. Fix this by renumbering the backlight regulator to regulator2.
> > >
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Cc: Simon Horman <horms+renesas@verge.net.au>
> > > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > Reported-by: Simon Horman <horms+renesas@verge.net.au>
> > > Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add backlight")
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > > @@ -191,7 +191,7 @@
> > >                 clock-frequency = <24576000>;
> > >         };
> > >
> > > -       reg_12p0v: regulator1 {
> > > +       reg_12p0v: regulator2 {
> > >                 compatible = "regulator-fixed";
> > >                 regulator-name = "D12.0V";
> > >                 regulator-min-microvolt = <12000000>;
> > 
> > Perhaps the node name should get a more descriptive suffix
> > (e.g. "regulator-12p0v"), like is already done for some of the other
> > regulators?
> 
> I think I would prefer that addressed in a follow-up patch.

Thanks for this patch.

I have now tested it and it looks good to me.
I can now access eMMC as a block device.

Tested-by: Simon Horman <horms+renesas@verge.net.au>

I plan to apply this for v5.1 as the problem appears to
be introduced in a patch queued-up for v5.1.



# dmesg | egrep "(ee160000.sd|mmc0|mmcblk0|backlight)"
[    0.893760] pwm-backlight backlight: Linked as a consumer to regulator.3
[    2.901953] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.2
[    2.910262] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.1
[    2.967591] renesas_sdhi_internal_dmac ee160000.sd: mmc0 base at 0xee160000 max clock rate 200 MHz
[    3.049943] mmc0: new HS200 MMC card at address 0001
[    3.055843] mmcblk0: mmc0:0001 BGSD3R 29.1 GiB 
[    3.064414] mmcblk0boot0: mmc0:0001 BGSD3R partition 1 16.0 MiB
[    3.074888] mmcblk0boot1: mmc0:0001 BGSD3R partition 2 16.0 MiB
[    3.081522] mmcblk0rpmb: mmc0:0001 BGSD3R partition 3 4.00 MiB, chardev (243:0)

# dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512 iflag=direct
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 14.7343 s, 36.4 MB/s
# dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512 iflag=direct
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 8.46809 s, 63.4 MB/s
# dd if=/dev/mmcblk0 of=/dev/null bs=1M count=512 iflag=direct
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 14.6945 s, 36.5 MB/s

# dd of=/dev/mmcblk0 if=/dev/zero bs=1M count=512 oflag=direct
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 19.1677 s, 28.0 MB/s
# dd of=/dev/mmcblk0 if=/dev/zero bs=1M count=512 oflag=direct
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 21.3139 s, 25.2 MB/s
# dd of=/dev/mmcblk0 if=/dev/zero bs=1M count=512 oflag=direct
512+0 records in
512+0 records out
536870912 bytes (537 MB) copied, 19.9205 s, 27.0 MB/s
