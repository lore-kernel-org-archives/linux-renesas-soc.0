Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8431C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 12:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A9B020879
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 12:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rOn/mYTb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728672AbfAJM6o (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 07:58:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:48798 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbfAJM6n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 07:58:43 -0500
Received: from avalon.localnet (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23DB84F8;
        Thu, 10 Jan 2019 13:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1547125122;
        bh=eKgYNIRCdGZ96kGbVKvxwC2xBfHGCdPlyQJh8PXRySI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rOn/mYTbbx3bnEE9siRfKo/Klgp8U0O7Q1OoRlsAEPIaPOSYpyTwPwU93SNaHmGhX
         E8GaeMipU6KH1QSArm3esWx0oXIVL7UxdAqZgOhglBzo2146BpAfFP+8e68r7yHVac
         eC9wDenN2RRDmFpMS1n0GaTi4ooMtwNr/DAkPCO8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix backlight regulator numbering
Date:   Thu, 10 Jan 2019 14:59:51 +0200
Message-ID: <1690279.yngTTxF0vm@avalon>
Organization: Ideas on Board Oy
In-Reply-To: <20190109165822.tmj7qbho46f7clvg@verge.net.au>
References: <20190109140045.17449-1-marek.vasut@gmail.com> <CAMuHMdX3bP_WCYNRRMmVRPwV52e72NOZMtW8cf29Fo+E9_CvcQ@mail.gmail.com> <20190109165822.tmj7qbho46f7clvg@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wednesday, 9 January 2019 18:58:23 EET Simon Horman wrote:
> On Wed, Jan 09, 2019 at 04:26:25PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Jan 9, 2019 at 3:01 PM <marek.vasut@gmail.com> wrote:
> > > From: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > 
> > > There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
> > > the eMMC and one 12V for the backlight. This causes one to be
> > > overwritten
> > > by the other, ultimatelly resulting in inoperable eMMC, which depends on
> > > the former. Fix this by renumbering the backlight regulator to
> > > regulator2.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Cc: Simon Horman <horms+renesas@verge.net.au>
> > > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Cc: linux-renesas-soc@vger.kernel.org
> > > Reported-by: Simon Horman <horms+renesas@verge.net.au>
> > > Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add
> > > backlight")
> > 
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > > @@ -191,7 +191,7 @@
> > > 
> > >                 clock-frequency = <24576000>;
> > >         
> > >         };
> > > 
> > > -       reg_12p0v: regulator1 {
> > > +       reg_12p0v: regulator2 {
> > > 
> > >                 compatible = "regulator-fixed";
> > >                 regulator-name = "D12.0V";
> > >                 regulator-min-microvolt = <12000000>;
> > 
> > Perhaps the node name should get a more descriptive suffix
> > (e.g. "regulator-12p0v"), like is already done for some of the other
> > regulators?
> 
> I think I would prefer that addressed in a follow-up patch.

Agreed, but it would still be a very good idea. I think we need to standardize 
names for regulators, otherwise this is bound to happen again in the future.

-- 
Regards,

Laurent Pinchart



