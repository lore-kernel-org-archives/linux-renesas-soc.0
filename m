Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DC1C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 13:44:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A58A21721
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 13:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="bb8w7yA1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728439AbfAVNoB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 08:44:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34316 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbfAVNoB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 08:44:01 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6A8FB25B827;
        Wed, 23 Jan 2019 00:43:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548164639; bh=CK0zwahvSfmj6RT5ohZk+GQg9MOhfp2HeiUj6q2BL38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bb8w7yA1BB/ODQNVnYJUFy7rvYkB0b51NG6XtY5K8ExMXjhgA6ZGAtUbG8gR8W5rY
         +NAk4t+K8KBKiH+aMxtiYGewF1CY1nw4OOBVS5No8aFOPuaVkSlMiw8YhMtOgbUVVh
         boLQUYAKhlfVF4X64Q97r7nanaPHFGvnflgVWmj0=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 94C39E21269; Tue, 22 Jan 2019 14:43:55 +0100 (CET)
Date:   Tue, 22 Jan 2019 14:43:55 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh for v5.0-rc2
Message-ID: <20190122134351.63lubcrccpak5zp4@verge.net.au>
References: <20190118155938.12124-1-geert+renesas@glider.be>
 <20190121165600.2lavtrk2djj4adgb@verge.net.au>
 <CAMuHMdV-AM9GNnDo7W55Mv-uLtWn-nTBtmh3jn30tRSEDLNfTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV-AM9GNnDo7W55Mv-uLtWn-nTBtmh3jn30tRSEDLNfTQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 22, 2019 at 09:25:33AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Jan 21, 2019 at 5:56 PM Simon Horman <horms@verge.net.au> wrote:
> > On Fri, Jan 18, 2019 at 04:59:38PM +0100, Geert Uytterhoeven wrote:
> > >   - Move SoC config options (moved in commit 062887bf5ef73313 ("ARM:
> > >     shmobile: Move SoC Kconfig symbols to drivers/soc/renesas/")),
> > >   - Move PCI config options (moved in commit eb01d42a77785ff9 ("PCI:
> > >     consolidate PCI config entry in drivers/pci")),
> > >   - Drop CONFIG_I2C_MUX=y (auto-enabled since commit ea6b13e9fed0fda9
> > >     ("drm/bridge/sii902x: Add missing dependency on I2C_MUX")),
> > >   - Drop CONFIG_SH_DMAE=y (no longer selectable since commit
> > >     a19788612f51b787 ("dmaengine: sh: Remove R-Mobile APE6 support")),
> > >   - Drop CONFIG_ARM_UNWIND (auto-enabled since commit f9b58e8c7d031b0d
> > >     ("ARM: 8800/1: use choice for kernel unwinders")).
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Would this change be any different if it was a refresh for v5.0-rc1?
> 
> No it wouldn't. Same for rc3.
> 
> > I ask because the ARM-SoC maintainers prefer the oldest possible of
> > the current rc series to be used as a base.
> 
> Hence feel free to s/rc2/rc1/g or s/rc2/rc3/g.

Thanks, I have applied with s/rc2/rc1/g
