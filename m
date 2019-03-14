Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBE1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AF5520854
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Vf/GbGzt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfCNKIM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 06:08:12 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49029 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfCNKIL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 06:08:11 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F0F5025B7A1;
        Thu, 14 Mar 2019 21:08:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552558090; bh=nzF9Ch2Xb0i3YObTMYhYxjNqD2pgqb4E3qBOsUoHHSo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vf/GbGztg7IMi0qJzbAil6Yrmmi5qnKgtbtey1lPfRQD7m40GWG6MRUz01DdZ6VHa
         JDb396j9f26Vr0SdSQnL04dUNqvi1jj0a73wu57uowqU06acHhdnJjxCwV+hZBUcjT
         EJwvquOFqg5AlB0fa8nUt6/jyz0Rhn+2u1zx6SzA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 350189403F2; Thu, 14 Mar 2019 11:08:08 +0100 (CET)
Date:   Thu, 14 Mar 2019 11:08:08 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: renesas: ebisu: support S2RAM
Message-ID: <20190314100807.vqywwkqosv4dfpij@verge.net.au>
References: <20190313105816.8592-1-horms+renesas@verge.net.au>
 <CAMuHMdXsGTzsOUvYU_dgdcrj391vBYMZ446nT2M9Veu9hAPj8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXsGTzsOUvYU_dgdcrj391vBYMZ446nT2M9Veu9hAPj8Q@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 13, 2019 at 01:14:33PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Mar 13, 2019 at 11:58 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > this short series supports S2RAM on R-Car E3 (r8a77990) / Ebisu by:
> >
> > * Upporting description of  BD9571 PMIC in DT from BSP v3.9.2
> > * Adding DDR0 backpo power configuration to that description
> >
> > Simon Horman (1):
> >   arm64: dts: renesas: ebisu: Add PMIC DDR0 Backup Power config
> >
> > Takeshi Kihara (1):
> >   arm64: dts: renesas: r8a77990-ebisu: Add BD9571 PMIC
> >
> >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 27 ++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > Tested using the following procedure with patches applied
> > on renesas-devel-20190308-v5.0 and kernel compiled using
> > renesas_defconfig.
> >
> > 1. Add no_console_suspend to kernel command line
> > 2. Boot system
> > 3. # echo on > /sys/bus/i2c/drivers/bd9571mwv/8-0030/bd9571mwv-regulator.0.auto/backup_mode
> > 4. Toggle SW23 to off position
> 
> I think one step is missing here:
> 
>     # echo mem > /sys/power/state

Yes, indeed.

> >    System suspends with following displayed on console
> >
> >    [   91.486537] PM: suspend entry (deep)
> >    [   91.490281] PM: Syncing filesystems ... done.
> >    [   91.500460] Freezing user space processes ... (elapsed 0.001 seconds)
> >    done.
> >    [   91.509392] OOM killer disabled.
> >    [   91.512679] Freezing remaining freezable tasks ... (elapsed 0.001
> >    seconds) done.
> >    [   91.531235] ravb e6800000.ethernet eth0: Link is Down
> >    [   91.670747] Disabling non-boot CPUs ...
> >    [   91.676106] CPU1: shutdown
> >    [   91.678932] psci: CPU1 killed.
> >
> > 5. Toggle SW23 to on position
> >    System resumes with the following output to the console
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
