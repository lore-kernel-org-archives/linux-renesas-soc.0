Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39561 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752419AbcLLOjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 09:39:53 -0500
Date: Mon, 12 Dec 2016 15:39:44 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH renesas/devel 10/13] ARM: dts: r8a7790: Use R-Car Gen 2
 fallback binding for i2c nodes
Message-ID: <20161212143942.GA31172@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX3QR00t-QwCv+AFqMmWvFZ-wuvVAa5S2p0Cnu3mWB9CQ@mail.gmail.com>
 <0db5b88e-41fb-03db-fa61-48e754356901@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 12, 2016 at 01:28:30PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 12/12/2016 12:11 PM, Simon Horman wrote:
> 
> >Use recently added R-Car Gen 2 fallback binding for iii nodes in
> 
>    s/iii/iic/?

Yes, thanks for noticing that.

> >DT for r8a7790 SoC.
> >
> >This has no run-time effect for the current driver as the initialisation
> >sequence is the same for the SoC-specific binding for r8a7790 and the
> >fallback binding for R-Car Gen 2.
> >
> >Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> [...]
> 
> MBR, Sergei
> 

On Mon, Dec 12, 2016 at 02:42:29PM +0100, Geert Uytterhoeven wrote:
> Hi SImon,
> 
> On Mon, Dec 12, 2016 at 10:11 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Use recently added R-Car Gen 2 fallback binding for iii nodes in
> 
> As Sergei already pointed out: s/iii/iic/.
> 
> You may also want to s/i2c/iic/ in the one-line summary, to avoid having
> multiple different patches with the same one-line summary (initially I was a
> bit confused by this, as Gmail grouped them together).

Yes, I meant to differentiate the subjects as you suggest.
I'll fix things up.

> These two comments apply to all iic DT patches in this series.

Got it.
