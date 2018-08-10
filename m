Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33922 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbeHJQSs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 12:18:48 -0400
Received: by mail-wm0-f68.google.com with SMTP id l2-v6so1544167wme.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Aug 2018 06:48:47 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Fri, 10 Aug 2018 15:48:44 +0200
To: jacopo mondi <jacopo@jmondi.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 09/14] dt-bindings: arm: Document Renesas R-Car
 M3-N-based ULCB board
Message-ID: <20180810134844.GB27396@x230>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-10-erosca@de.adit-jv.com>
 <20180805081543.GH4528@w540>
 <20180805224002.GA15682@x230>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180805224002.GA15682@x230>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi again Jacopo,

On Mon, Aug 06, 2018 at 12:40:02AM +0200, Eugeniu Rosca wrote:
> Hi Jacopo,
> 
> Thanks for your comments. Please, find my replies below.
> 
> On Sun, Aug 05, 2018 at 10:15:43AM +0200, jacopo mondi wrote:
> > Helle Eugeniu,
> > 
> > On Sun, Aug 05, 2018 at 01:11:09AM +0200, Eugeniu Rosca wrote:
> > > In harmony with ATF and U-Boot outputs [1] and [2], the new board is
> > > based on M3-N revision ES1.1 and the amount of memory present on SiP
> > > is 2GiB, contiguously addressed.
> > 
> > Not sure why the amount of installed system memory is relevant for
> > this commit..
> 
> To be honest, I don't know precisely what's encoded in the board string
> (particularly the one documented in this commit RTP0RC77965SKBX010SA00).
> 
> The only thing unmistakenly present there is the SoC model 77965 (i.e.
> M3-N), but I am quite clueless about the rest.
> 
> What I can say for sure is that the end-user experience of a R-Car Gen3
> reference board clearly depends on below parameters:
>  - [A] SoC (model, revision) including SRAM and on-chip peripherals
>  - [B] DRAM (amount, linear/2ch/4ch split) 
>  - [C] Hyperflash (amount)
>  - [D] board's PCB (revision)
>  - [E] board's off-chip peripherals (model, revision)
> 
> I don't know how many of these parameters are embedded in the board
> string, but since you are suggesting that RAM amount is not (IOW
> Renesas will potentially release several RTP0RC77965SKBX010SA00
> boards with different amounts of memory), I will happily update
> the commit description.

Since I found two H3-ES2.0 Starter Kit samples with different amount of
RAM (4 vs 8 GiB) each having a unique board id [1], I take this as
evidence that Renesas encodes the amount of RAM in the board id.
Therefore, I will not change the description of this patch in v2,
unless you comment/NAK. Thank you.

[1] https://patchwork.kernel.org/patch/10555957/#22169325

Best regards,
Eugeniu.
