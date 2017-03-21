Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59825 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756404AbdCUIW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2017 04:22:27 -0400
Date: Tue, 21 Mar 2017 09:15:38 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: r8a7795: Correct SATA device size to 2MiB
Message-ID: <20170321081538.GD20866@verge.net.au>
References: <148999976116.21495.8298900753704826597.sendpatchset@little-apple>
 <CAMuHMdWS7J8taujfNXZ6e-qNbw8xPi0Q4JyqNcAXobw6EvzzMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWS7J8taujfNXZ6e-qNbw8xPi0Q4JyqNcAXobw6EvzzMg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 20, 2017 at 11:57:55AM +0100, Geert Uytterhoeven wrote:
> Hi Magnus,
> 
> On Mon, Mar 20, 2017 at 9:49 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Update the r8a7795 SATA device node to use a 2MiB I/O space as specified
> > in the "72. Serial-ATA" section of R-Car-Gen3-rev0.52E.pdf
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

...

Thanks, applied.
