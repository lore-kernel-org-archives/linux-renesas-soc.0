Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38152 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750813AbdLRIjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 03:39:55 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        David Airlie <airlied@linux.ie>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/2] drm: rcar-du: calculate DPLLCR to be more small jitter
Date: Mon, 18 Dec 2017 10:40:04 +0200
Message-ID: <13280569.W4F9EfxE6W@avalon>
In-Reply-To: <87bmiwqw1k.wl%kuninori.morimoto.gx@renesas.com>
References: <87r2rsrifu.wl%kuninori.morimoto.gx@renesas.com> <2409831.iIlgTMgqFv@avalon> <87bmiwqw1k.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Monday, 18 December 2017 10:38:19 EET Kuninori Morimoto wrote:
> Hi Laurent
> 
> Thank you for your feedback
> 
> >> +	 * To be small jitter,
> > 
> > Nitpicking, I would write this "to minimize the jitter".
> 
> (snip)
> 
> >> +			 * This code is assuming "used" from 64bit CPU only,
> >> +			 * not from 32bit CPU. But both can compile correctly
> > 
> > Nitpicking again, I would write this "This code only runs on 64-bit
> > architectures, the unsigned long type can thus be used for 64-bit
> > computation. It will still compile without any warning on 32-bit
> > architectures."
> 
> I will follow your English ;)
> 
> >> +			/*
> >> +			 *	fvco	= fin * P *  N / M
> >> +			 *	fclkout	= fin      * N / M / FDPLL
> >> +			 *
> >> +			 * To avoid duplicate calculation, let's use below
> >> +			 *
> >> +			 *	finnm	= fin * N / M
> > 
> > This is called fout in your diagram above, I would use the same name here.
> 
> Oops indeed. I didn't notice
> 
> >> +			unsigned long finnm = input * (n + 1) / (m + 1);
> >> +			unsigned long fvco  = finnm * 2;
> >> +
> >> +			if (fvco < 2000 || fvco > 4096 * 1000 * 1000U)
> >> +				continue;
> > 
> > How about
> > 
> > 		if (fvco < 1000 || fvco > 2048 * 1000 * 1000)
> > 
> > to avoid computing the intermediate fvco variable ?
> 
> I think you want to say
> 
>  		- if (fvco < 1000 || fvco > 2048 * 1000 * 1000)
>  		+ if (fout < 1000 || fout > 2048 * 1000 * 1000)

Yes, sorry, that's what I meant.

> Actually I notcied about this, but I thought it makes
> user confuse. Thus, I kept original number.
> 
> I'm happy if compiler can adjust it automatically,
> if not, I have no objection to modify it but we want to have such comment ?
> Because above comment/explain mentions about "fvco", not "fout".

Sure, I'll add a comment, it's a good point.

> > If you agree with these small changes there's no need to resubmit the
> > patch, I'll modify it when applying, and
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thank you for your help

Thank you for the code :-)

-- 
Regards,

Laurent Pinchart
