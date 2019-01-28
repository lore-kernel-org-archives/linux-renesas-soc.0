Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2E7C282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 16:36:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62BEC20811
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 16:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="hLVVHeEs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390248AbfA1Qgn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 11:36:43 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34470 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390192AbfA1Qgm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 11:36:42 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1F00225B7BA;
        Tue, 29 Jan 2019 03:36:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548693401; bh=2sLAV7iyLNGcktOzcHf+SyLx6Xh84dfZei/gxoWwa+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hLVVHeEsX/SoVAqxzDxHLr00BMACtVlbYZK/NVdbPUBGUhLUtwIkLCT4JvuVko85T
         PtDrGta3QrlbS+A4gDMZ4k8m9wUuSg1RBD9ioh7xtf84lYkFpStTIr0wO8dbpjg6OS
         nm8rZ4WhG2rqpUsSYzOxuTCSWqhUI0uu2uzCEfh0=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 538979403E0; Mon, 28 Jan 2019 17:36:39 +0100 (CET)
Date:   Mon, 28 Jan 2019 17:36:39 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add OPPs table for
 cpu devices
Message-ID: <20190128163639.kv77wczde7d7lntv@verge.net.au>
References: <1547553762-4467-1-git-send-email-ykaneko0929@gmail.com>
 <20190128140519.wfbnpgznbkx3msft@verge.net.au>
 <CAMuHMdW2j4e4yc2ZkeJ71uqGz7FS2Kb2141tyZp9y3zTrJ21_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW2j4e4yc2ZkeJ71uqGz7FS2Kb2141tyZp9y3zTrJ21_g@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 04:15:30PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Jan 28, 2019 at 3:05 PM Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Jan 15, 2019 at 09:02:42PM +0900, Yoshihiro Kaneko wrote:
> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > >
> > > This patch define OOP tables for all CPUs.
> > > This allows CPUFreq to function.
> > >
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > > ---
> >
> > Thanks, I have tested CPUFreq with this tested that with this patch and
> > "[PATCH] clk: renesas: r8a77990: Add Z2 clock"
> > (https://patchwork.kernel.org/patch/10783723/) applied on top of
> > renesas-devel-20190128-v5.0-rc4.
> >
> > Geert, or others, is it expected that z2 does not scale
> > in this test?
> 
> Given your patch adds the Z2 clock as a fixed clock, this is expected ;-)
> 
> Note that the BSP adds this clock as a programmable clock of type
> CLK_TYPE_GEN3_Z2.

Thanks, understood.
