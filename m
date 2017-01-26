Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50041 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753114AbdAZPYX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 10:24:23 -0500
Date: Thu, 26 Jan 2017 16:24:15 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170126152413.GA12534@verge.net.au>
References: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana>
 <20170126140643.GA11104@verge.net.au>
 <20170126141656.GD2718@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170126141656.GD2718@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 03:16:57PM +0100, Wolfram Sang wrote:
> 
> > I have tested with "the new mmc/next" and things seem better.
> 
> Good. The issue you saw is expected when you have not the enablement
> patches in place.
> 
> > I am still of a mind to drop the M3-W patch of this series because unless
> > we can control the order that things are merged into Linus's tree
> > there will be a temporary regression there. Moreover I'm not very excited
> > about renesas-next having regressed.
> 
> I have not heard of a regression. Geert, did you report that? Did I miss
> that? As you can see, I did test the patches with M3 as well:
> 
> http://elinux.org/Tests:eMMC-HS
> 
> and Jinso test team (Duc-san) confirmed it works for them with H3 and
> M3-W. In private communication, though.

The problem I see is the following logged to the console
(which makes the console semi-unusable).

sh_mobile_sdhi ee140000.sd: timeout waiting for hardware interrupt (CMD13)

I'm on IRC if you'd like to chat there.
