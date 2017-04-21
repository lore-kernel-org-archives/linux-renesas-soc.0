Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35086 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S947979AbdDUAtr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 20:49:47 -0400
Received: by mail-wm0-f65.google.com with SMTP id d79so1822364wmi.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Apr 2017 17:49:47 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: rsnd: Fix possible NULL pointer dereference
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
References: <87k26ewq8c.wl%kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c4b08e6e-4ce1-92c8-d9e7-42e35c945a59@gmail.com>
Date: Fri, 21 Apr 2017 02:49:44 +0200
MIME-Version: 1.0
In-Reply-To: <87k26ewq8c.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/21/2017 02:41 AM, Kuninori Morimoto wrote:
> 
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> 25165f79adc76b812bfb4d8f2ab120aafb28d0e6
> ("ASoC: rsnd: enable clock-frequency for both 44.1kHz/48kHz")
> supports both 44.1kHz/48kHz clock-frequency settings for ADG
> which will be used for AUDIO_OLKOUTn.
> But some board doesn't need it, thus, it is not mandatory.
> 
> But, above patch didn't care about the case of "clock-frequency" DT
> property was not present.
> This patch ignores ADG settings if AUDIO_OLKOUTn was not used.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> [Kuninori: tidyup not to break non AUDIO_OLKOUTn case]
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> 
>> Marek
> 
> I think this patch solves your issue

Yep, looks OK, thanks !

>  sound/soc/sh/rcar/adg.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
> index 96fef91..277774c 100644
> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -453,13 +453,18 @@ static void rsnd_adg_get_clkout(struct rsnd_priv *priv,
>  		[CLKI] = 0x2,
>  	};
>  
> -	of_property_read_u32(np, "#clock-cells", &count);
> +	ckr = 0;
> +	rbga = 2; /* default 1/6 */
> +	rbgb = 2; /* default 1/6 */
>  
>  	/*
>  	 * ADG supports BRRA/BRRB output only
>  	 * this means all clkout0/1/2/3 will be same rate
>  	 */
>  	prop = of_find_property(np, "clock-frequency", NULL);;
> +	if (!prop)
> +		goto rsnd_adg_get_clkout_end;
> +
>  	req_size = prop->length / sizeof(u32);
>  
>  	of_property_read_u32_array(np, "clock-frequency", req_rate, req_size);
> @@ -472,6 +477,9 @@ static void rsnd_adg_get_clkout(struct rsnd_priv *priv,
>  			req_48kHz_rate = req_rate[i];
>  	}
>  
> +	if (req_rate[0] % 48000 == 0)
> +		adg->flags = AUDIO_OUT_48;
> +
>  	/*
>  	 * This driver is assuming that AUDIO_CLKA/AUDIO_CLKB/AUDIO_CLKC
>  	 * have 44.1kHz or 48kHz base clocks for now.
> @@ -481,9 +489,6 @@ static void rsnd_adg_get_clkout(struct rsnd_priv *priv,
>  	 *	rsnd_adg_ssi_clk_try_start()
>  	 *	rsnd_ssi_master_clk_start()
>  	 */
> -	ckr = 0;
> -	rbga = 2; /* default 1/6 */
> -	rbgb = 2; /* default 1/6 */
>  	adg->rbga_rate_for_441khz	= 0;
>  	adg->rbgb_rate_for_48khz	= 0;
>  	for_each_rsnd_clk(clk, adg, i) {
> @@ -528,6 +533,7 @@ static void rsnd_adg_get_clkout(struct rsnd_priv *priv,
>  	 * this means all clkout0/1/2/3 will be * same rate
>  	 */
>  
> +	of_property_read_u32(np, "#clock-cells", &count);
>  	/*
>  	 * for clkout
>  	 */
> @@ -557,13 +563,11 @@ static void rsnd_adg_get_clkout(struct rsnd_priv *priv,
>  				    &adg->onecell);
>  	}
>  
> +rsnd_adg_get_clkout_end:
>  	adg->ckr = ckr;
>  	adg->rbga = rbga;
>  	adg->rbgb = rbgb;
>  
> -	if (req_rate[0] % 48000 == 0)
> -		adg->flags = AUDIO_OUT_48;
> -
>  	for_each_rsnd_clkout(clk, adg, i)
>  		dev_dbg(dev, "clkout %d : %p : %ld\n", i, clk, clk_get_rate(clk));
>  	dev_dbg(dev, "BRGCKR = 0x%08x, BRRA/BRRB = 0x%x/0x%x\n",
> 


-- 
Best regards,
Marek Vasut
