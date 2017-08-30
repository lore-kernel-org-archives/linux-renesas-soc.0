Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53857 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751300AbdH3HQr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 03:16:47 -0400
Date: Wed, 30 Aug 2017 09:16:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Biju Das <biju.das@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RESEND] mmc: renesas_sdhi: Add r8a7743/5 support
Message-ID: <20170830071642.GG10398@verge.net.au>
References: <1504014726-17288-1-git-send-email-biju.das@bp.renesas.com>
 <20170829145852.j4epebxsb2j2i3d2@ninjato>
 <TY1PR06MB0702FA2B782E1A29E40EEDCCB79F0@TY1PR06MB0702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB0702FA2B782E1A29E40EEDCCB79F0@TY1PR06MB0702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 29, 2017 at 03:05:53PM +0000, Chris Paterson wrote:
> 
> 
> > From: Wolfram Sang [mailto:wsa@the-dreams.de]
> > Sent: 29 August 2017 15:59
> > 
> > On Tue, Aug 29, 2017 at 02:52:06PM +0100, Biju Das wrote:
> > > Add support for r8a7743/5 SoC.Renesas RZ/G1[ME] (R8A7743/5) SDHI is
> > > identical to the R-Car Gen2 family.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > > DT binding patch for r8a7743/5 SoC is applied for mmc next. But the
> > > driver patch is still not applied for mmc next.So resending the driver patch.
> > 
> > Didn't Chris Paterson volunteer to write a new patch introducing Gen2 generic
> > compatibles? Or did I misunderstand?
> 
> I did :)
> 
> But after some off-ML discussion with Geert/Simon I decided to leave it to Simon as he's been doing a lot of similar work for all of the R-Car related drivers.
> 
> This may not happen immediately, and we already have the bindings/DT patches accepted based on this patch, hence the repost.
> 
> Sorry for the confusion!

I confirm the above conversation.

In my experience rolling out fallback compat strings takes time as there
are often unexpected complications. Perhaps that is not the case here but
in my opinion it would be better if support for these new SoCs didn't have
an extra dependency. After all the goal of the fallback compat strings is
to make adding new SoCs easier not harder.
