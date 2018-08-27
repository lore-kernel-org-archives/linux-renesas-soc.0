Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:55023 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbeH0Xh5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 19:37:57 -0400
Date: Mon, 27 Aug 2018 21:49:46 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Simon Horman <horms@verge.net.au>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: renesas: r8a77965: Add HSCIF0 device
 node
Message-ID: <20180827194946.GD18631@vmlxhi-102.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-6-erosca@de.adit-jv.com>
 <20180822111247.qwqypumngefqmwmv@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180822111247.qwqypumngefqmwmv@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Wed, Aug 22, 2018 at 01:12:47PM +0200, Simon Horman wrote:
> On Sun, Aug 12, 2018 at 03:31:48PM +0200, Eugeniu Rosca wrote:
> > Fix below DTC error:
> > Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:36.1-8 Label or path hscif0 not found
> > 
> > The DTC error occurs *after* the addition of r8a77965-m3nulcb-kf.dts.
> > Fix it beforehand.
> > 
> > Inspired from v4.12-rc1 commits:
> >  - commit 68cd16107260 ("arm64: dts: r8a7796 dtsi: Add all HSCIF nodes")
> >  - commit 6d50bb893504 ("arm64: dts: r8a7796: Enable HSCIF DMA")
> >  - commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")
> > 
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > ---
> > Changes in v2:
> >  - Slightly improved the commit description.
> >  - Note that this commit could be replaced by
> >    https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git/commit/?h=b8e3c8e17611
> 
> That commit has been accepted for upstream so it should be used.

Thanks for the explanation. No further questions/concerns.

Best regards,
Eugeniu.
