Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60325 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750825AbdLNIR3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 03:17:29 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: rcar-du: calculate DPLLCR to be more small jitter
Date: Thu, 14 Dec 2017 10:17:34 +0200
Message-ID: <2071409.IhY2XtxFIN@avalon>
In-Reply-To: <871sjyqd99.wl%kuninori.morimoto.gx@renesas.com>
References: <87374oz9f9.wl%kuninori.morimoto.gx@renesas.com> <4708231.IEM7dkWZuQ@avalon> <871sjyqd99.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Thursday, 14 December 2017 04:10:27 EET Kuninori Morimoto wrote:
> Hi Laurent
> 
> Thank you for your feedback
> 
> >> +	 * NOTES
> >> +	 *	N = (n + 1), M = (m + 1), P = 2
> >> +	 *	2000 < fvco < 4096Mhz
> > 
> > Are you sure that the fvco constraint is really 2kHz, and not 2GHz ? 2kHz
> > - 4GHz would be a surprisingly large range.
> 
> It is 2kHz. This is came from HW team, and indicated
> on HW design sheet (?)

OK, it's a surprising VCO, no issue with that :-)

> >> +	 *	Basically M=1
> > 
> > Why is this ?
> 
> This is came from HW team, too.
> They are assuming M=1, basically.
> But yes confusable, let's remove it from comment.
> m is started from 0 (= M=1), no need to explain.

Sounds good to me.

> >> +	for (m = 0; m < 4; m++) {
> >> +		for (n = 119; n > 38; n--) {
> >> +			unsigned long long fvco = input * 2 * (n + 1) / (m + 1);
> > 
> > This code runs for Gen3 only, so unsigned long would be enough. The rest
> > of the function already relies on native support for 64-bit calculation.
> > If you wanted to run this on a 32-bit CPU, you would likely need to
> > do_div() for the division, and convert input to u64 to avoid integer
> > overflows, otherwise the calculation will be performed on 32-bit before a
> > final conversion to 64-bit.
> 
> (snip)
> 
> >> +			if ((fvco < 2000) ||
> >> +			    (fvco > 4096000000ll))
> > 
> > No need for the inner parentheses, and you can write both conditions on a
> > single line. Furthemore 4096 MHz will fit in a 32-bit number, so there's
> > no need for the ll.
> 
> Yes, but compiled by 32bit too, right ?
> Without this "ll", 32bit compiler say
> 
> 	warning: this decimal constant is unsigned only in ISO C90

That's right. How about 4096000000UL then, to force unsigned integer types ? 
Or possibly even better, 4096 * 1000 * 1000UL to make it more readable ?

> # anyway, I will add this assumption (= used only by 64bit CPU)
> # on comment to avoid future confusion
> 
> > I think you can then drop the output >= 4000000000 check inside the inner
> > fdpll loop, as the output frequency can't be higher than 4GHz if the VCO
> > frequency isn't.
> 
> I think code has
> 
> 	if (output >= 400000000)
> 
> This is 400MHz, not 4GHz

You're right, my bad. Maybe I should write it 400 * 1000 * 1000 :-)

> >>  			for (fdpll = 1; fdpll < 32; fdpll++) {
> >>  				unsigned long output;
> > 
> > The output frequency on the line below can be calculated with
> > 
> > 	output = fvco / 2 / (fdpll + 1)
> > 
> > to avoid the multiplication by (n + 1) and division by (m + 1).
> 
> It is nice idea to avoid extra calculation.
> I will use this idea, and add extrate comment to avoid confusion

Thank you.

-- 
Regards,

Laurent Pinchart
