Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41201 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbeLJLrc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 06:47:32 -0500
Date: Mon, 10 Dec 2018 12:47:28 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] soc: renesas: rcar-sysc: Fix power domain control
 after system resume
Message-ID: <20181210114727.patvtrdtpzobzqgt@verge.net.au>
References: <20181205153945.13767-1-geert+renesas@glider.be>
 <20181205153945.13767-5-geert+renesas@glider.be>
 <20181205212112.2ls6ta27ok3yiyco@verge.net.au>
 <CAMuHMdW9kt3QyoJRkKA6c8OpCB7N-jEAo=qcxjhmy3nD2a0A9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW9kt3QyoJRkKA6c8OpCB7N-jEAo=qcxjhmy3nD2a0A9Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 06, 2018 at 09:22:24AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Dec 5, 2018 at 10:21 PM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Dec 05, 2018 at 04:39:45PM +0100, Geert Uytterhoeven wrote:
> > > To control power to a power domain, the System Controller (SYSC) needs
> > > the corresponding interrupt source to be enabled, but masked, to prevent
> > > the CPU from receiving it.
> > >
> > > Currently this is handled in the driver's probe() routine, and set up
> > > for every domain present, even if it will not be controlled directly by
> > > SYSC (CPU domains are powered through the APMU on R-Car Gen2 and later).
> > >
> > > On R-Car Gen3, PSCI powers down the SoC during system suspend, thus
> > > loosing any configured interrupt state.  Hence after system resume, power
> > > domains not controlled through the APMU (e.g. A3IR, A3VC, A3VP) fail to
> > > power up.
> >
> > I corrected the spelling of losing when applying this patch.
> 
> Checkpatch complained about that as well, so I did some investigation, and
> decided to keep it... Was I wrong?

I will not claim to be an expert but  at the time I thought
checkpatch was right.
