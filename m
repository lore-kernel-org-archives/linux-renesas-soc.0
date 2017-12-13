Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37578 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752259AbdLMJJP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 04:09:15 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm: rcar-du: calculate DPLLCR to be more small jitter
Date: Wed, 13 Dec 2017 11:09:18 +0200
Message-ID: <4708231.IEM7dkWZuQ@avalon>
In-Reply-To: <87374oz9f9.wl%kuninori.morimoto.gx@renesas.com>
References: <87374oz9f9.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Morimoto-san,

Thank you for the patch.

On Wednesday, 6 December 2017 08:05:38 EET Kuninori Morimoto wrote:
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
> (1) + (2) indicates, fclkout = fin * N / M / FDPLL
> In this device, N = (n + 1), M = (m + 1), P = 2, thus
> 
> 	fclkout = fin * (n + 1) / (m + 1) / FDPLL
> 
> This is the datasheet formula.
> One note here is that it should be 2000 < fvco < 4096MHz
> To be smaller jitter, fvco should be maximum,
> in other words, N as large as possible, M as small as possible driver
> should select. Here, basically M=1.
> This patch do it.
> 
> Reported-by: HIROSHI INOSE <hiroshi.inose.rb@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 
>  - tidyup typo on git-log "fout" -> "fclkout"
>  - tidyup for loop terminate condition 40 -> 38 for n
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 36 ++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index b492063..57479c9 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -125,8 +125,40 @@ static void rcar_du_dpll_divider(struct rcar_du_crtc
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
> +	 *	N = (n + 1), M = (m + 1), P = 2
> +	 *	2000 < fvco < 4096Mhz

Are you sure that the fvco constraint is really 2kHz, and not 2GHz ? 2kHz - 
4GHz would be a surprisingly large range.

> +	 *	Basically M=1

Why is this ?

> +	 * To be small jitter,
> +	 * N : as large as possible
> +	 * M : as small as possible
> +	 */
> +	for (m = 0; m < 4; m++) {
> +		for (n = 119; n > 38; n--) {
> +			unsigned long long fvco = input * 2 * (n + 1) / (m + 1);

This code runs for Gen3 only, so unsigned long would be enough. The rest of 
the function already relies on native support for 64-bit calculation. If you 
wanted to run this on a 32-bit CPU, you would likely need to do_div() for the 
division, and convert input to u64 to avoid integer overflows, otherwise the 
calculation will be performed on 32-bit before a final conversion to 64-bit.

> +			if ((fvco < 2000) ||
> +			    (fvco > 4096000000ll))

No need for the inner parentheses, and you can write both conditions on a 
single line. Furthemore 4096 MHz will fit in a 32-bit number, so there's no 
need for the ll.

> +				continue;
> +

I think you can then drop the output >= 4000000000 check inside the inner 
fdpll loop, as the output frequency can't be higher than 4GHz if the VCO 
frequency isn't.

>  			for (fdpll = 1; fdpll < 32; fdpll++) {
>  				unsigned long output;

The output frequency on the line below can be calculated with

	output = fvco / 2 / (fdpll + 1)

to avoid the multiplication by (n + 1) and division by (m + 1).

If we wanted to optimize even more we could compute and operatate on fout 
instead of fvco, that would remove the * 2 and / 2.

This patch seems to be a good first step in case of multiple possible exact 
frequency matches. However, when the PLL can't achieve an exact match, we 
might still end up with a high M value when a lower value could produce an 
output frequency close enough to the desired value. I wonder if this function 
should also take a frequency tolerance as an input parameter, and compute the 
M, N and FDPLL values that will produce an output frequency within the 
tolerance with M as small as possible. This can be done as a separate patch.

And while we're discussing PLL calculation, the three nested loops will run a 
total of 10044 iterations :-/ That's a lot, and should be optimized if 
possible. With the outer loop operating on N an easy optimization would have 
been to compute fin * N in a local variable to avoid redoing the 
multiplication for every value of M, but that's not possible anymore with the 
outer loop operating on M.

-- 
Regards,

Laurent Pinchart
