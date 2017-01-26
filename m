Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48855 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752480AbdAZOGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 09:06:53 -0500
Date: Thu, 26 Jan 2017 15:06:43 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170126140643.GA11104@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 02:54:53PM +0100, Wolfram Sang wrote:
> 
> > > Do you already fetch from Ulf's kernel.org tree? He switched away from
> > > the Linaro tree for MMC for a while. I only realized when he complained
> 
> "since a while" not "for a while", of course.
> 
> > Thanks, I had not realised that. I've pulled the kernel.org tree.

I have tested with "the new mmc/next" and things seem better.
The problem does not appear to manifest in light testing.

> So, there is hope for the patches to be in v4.11? :)

On Thu, Jan 26, 2017 at 02:58:58PM +0100, Geert Uytterhoeven wrote:
> Hi Wolfram,
> 
> On Thu, Jan 26, 2017 at 11:03 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> > On Thu, Jan 26, 2017 at 11:01:17AM +0100, Simon Horman wrote:
> >> On Fri, Jan 13, 2017 at 09:39:28AM +0100, Wolfram Sang wrote:
> >> > > Sorry for missing these.
> >> > > I have queued them up for v4.11.
> >> >
> >> > Thank you!
> >>
> >> On my r8a7796/salvator-x I see the following with this series applied:
> >>
> >> sh_mobile_sdhi ee140000.sd: timeout waiting for hardware interrupt (CMD13)
> >
> > Do you have the HS200 enablement patches in that branch? They are
> > currently in -next.
> 
> I saw the same thing with renesas-devel last week, only on M3-W.
> The same kernel on H3 didn't spew such messages.
> According to Shimoda-san, it was due to different eMMCs on H3 and M3-W.

Thanks, my interpretation of that is that the H3 patch of this series is fine.

I am still of a mind to drop the M3-W patch of this series because unless
we can control the order that things are merged into Linus's tree
there will be a temporary regression there. Moreover I'm not very excited
about renesas-next having regressed.
