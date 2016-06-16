Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41063 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbcFPFTW (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 01:19:22 -0400
Date: Thu, 16 Jun 2016 14:19:18 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC] ARM: shmobile: rcar-gen2: Correct arch timer
 frequency on R-Car V2H
Message-ID: <20160616051918.GD10590@verge.net.au>
References: <1465813872-11937-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465813872-11937-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 13, 2016 at 12:31:12PM +0200, Geert Uytterhoeven wrote:
> According to the datasheet, the frequency of the ARM architecture timer
> on R-Car V2H depends on the frequency of the ZS clock, just like on
> R-Car E2.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Against renesas-devel-20160613-v4.7-rc3 with "ARM: shmobile: rcar-gen2:
> Obtain extal frequency from DT" applied.
> 
> Untested due to lack of hardware.

Sergei, could you test this?

> ---
>  arch/arm/mach-shmobile/setup-rcar-gen2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> index ea092d5dd475042d..afb9fdcd3d9084e2 100644
> --- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
> +++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
> @@ -76,7 +76,8 @@ void __init rcar_gen2_timer_init(void)
>  	void __iomem *base;
>  	u32 freq;
>  
> -	if (of_machine_is_compatible("renesas,r8a7794")) {
> +	if (of_machine_is_compatible("renesas,r8a7792") ||
> +	    of_machine_is_compatible("renesas,r8a7794")) {
>  		freq = 260000000 / 8;	/* ZS / 8 */
>  		/* CNTVOFF has to be initialized either from non-secure
>  		 * Hypervisor mode or secure Monitor mode with SCR.NS==1.
> -- 
> 1.9.1
> 
