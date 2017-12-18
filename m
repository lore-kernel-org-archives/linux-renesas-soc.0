Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38073 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750813AbdLRIVu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 03:21:50 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        David Airlie <airlied@linux.ie>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-Kernel <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/2] drm: rcar-du: calculate DPLLCR to be more small jitter
Date: Mon, 18 Dec 2017 10:21:58 +0200
Message-ID: <2409831.iIlgTMgqFv@avalon>
In-Reply-To: <87o9mwridk.wl%kuninori.morimoto.gx@renesas.com>
References: <87r2rsrifu.wl%kuninori.morimoto.gx@renesas.com> <87o9mwridk.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Morimoto-san,

On Monday, 18 December 2017 02:35:56 EET Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> In general, PLL has VCO (= Voltage controlled oscillator),
> one of the very important electronic feature called as "jitter"
> is related to this VCO.
> In academic generalism, VCO should be maximum to be more small jitter.
> In high frequency clock, jitter will be large impact.
> Thus, selecting Hi VCO is general theory.
> 
>    fin                                 fvco        fout      fclkout
> in --> [1/M] --> |PD| -> [LPF] -> [VCO] -> [1/P] -+-> [1/FDPLL] -> out
>              +-> |  |                             |
>              |                                    |
>              +-----------------[1/N]<-------------+
> 
> 	fclkout = fvco / P / FDPLL -- (1)
> 
> In PD, it will loop until fin/M = fvco/P/N
> 
> 	fvco = fin * P *  N / M -- (2)
> 
> (1) + (2) indicates
> 
> 	fclkout = fin * N / M / FDPLL
> 
> In this device, N = (n + 1), M = (m + 1), P = 2, FDPLL = (fdpll + 1).
> 
> 	fclkout = fin * (n + 1) / (m + 1) / (fdpll + 1)
> 
> This is the datasheet formula.
> One note here is that it should be 2kHz < fvco < 4096MHz
> To be smaller jitter, fvco should be maximum,
> in other words, N as large as possible, M as small as possible driver
> should select. Here, basically M=1.
> This patch do it.
> 
> Reported-by: HIROSHI INOSE <hiroshi.inose.rb@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v3 -> v4
> 
>  - 2000 -> 2kHz
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 58 ++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 6820461f..574854a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -125,13 +125,63 @@ static void rcar_du_dpll_divider(struct rcar_du_crtc
> *rcrtc, unsigned int m;
>  	unsigned int n;
> 
> -	for (n = 39; n < 120; n++) {
> -		for (m = 0; m < 4; m++) {
> +	/*
> +	 *   fin                                 fvco        fout       fclkout
> +	 * in --> [1/M] --> |PD| -> [LPF] -> [VCO] -> [1/P] -+-> [1/FDPLL] -> out
> +	 *              +-> |  |                             |
> +	 *              |                                    |
> +	 *              +-----------------[1/N]<-------------+
> +	 *
> +	 *	fclkout = fvco / P / FDPLL -- (1)
> +	 *
> +	 * fin/M = fvco/P/N
> +	 *
> +	 *	fvco = fin * P *  N / M -- (2)
> +	 *
> +	 * (1) + (2) indicates
> +	 *
> +	 *	fclkout = fin * N / M / FDPLL
> +	 *
> +	 * NOTES
> +	 *	N	: (n + 1)
> +	 *	M	: (m + 1)
> +	 *	FDPLL	: (fdpll + 1)
> +	 *	P	: 2
> +	 *	2kHz < fvco < 4096MHz
> +	 *
> +	 * To be small jitter,

Nitpicking, I would write this "to minimize the jitter".

> +	 * N : as large as possible
> +	 * M : as small as possible
> +	 */
> +	for (m = 0; m < 4; m++) {
> +		for (n = 119; n > 38; n--) {
> +			/*
> +			 * NOTE:
> +			 *
> +			 * This code is assuming "used" from 64bit CPU only,
> +			 * not from 32bit CPU. But both can compile correctly

Nitpicking again, I would write this "This code only runs on 64-bit 
architectures, the unsigned long type can thus be used for 64-bit computation. 
It will still compile without any warning on 32-bit architectures."

> +			 */
> +
> +			/*
> +			 *	fvco	= fin * P *  N / M
> +			 *	fclkout	= fin      * N / M / FDPLL
> +			 *
> +			 * To avoid duplicate calculation, let's use below
> +			 *
> +			 *	finnm	= fin * N / M

This is called fout in your diagram above, I would use the same name here.

> +			 *	fvco	= finnm * P
> +			 *	fclkout	= finnm / FDPLL
> +			 */
> +			unsigned long finnm = input * (n + 1) / (m + 1);
> +			unsigned long fvco  = finnm * 2;
> +
> +			if (fvco < 2000 || fvco > 4096 * 1000 * 1000U)
> +				continue;

How about

		if (fvco < 1000 || fvco > 2048 * 1000 * 1000)

to avoid computing the intermediate fvco variable ?

If you agree with these small changes there's no need to resubmit the patch, 
I'll modify it when applying, and

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			for (fdpll = 1; fdpll < 32; fdpll++) {
>  				unsigned long output;
> 
> -				output = input * (n + 1) / (m + 1)
> -				       / (fdpll + 1);
> +				output = finnm / (fdpll + 1);
>  				if (output >= 400 * 1000 * 1000)
>  					continue;

-- 
Regards,

Laurent Pinchart
