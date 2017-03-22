Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:36493 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752276AbdCVI7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2017 04:59:03 -0400
Received: by mail-wm0-f49.google.com with SMTP id n11so30285534wma.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Mar 2017 01:58:08 -0700 (PDT)
Subject: Re: [PATCH] ASoC: rcar: ssi: don't set SSICR.CKDV = 000 with
 SSIWSR.CONT
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
References: <87zigenerc.wl%kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4764a887-edbc-efa3-881b-3edfb1175d01@cogentembedded.com>
Date: Wed, 22 Mar 2017 11:48:50 +0300
MIME-Version: 1.0
In-Reply-To: <87zigenerc.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 3/22/2017 7:02 AM, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> R-Car Datasheet is indicating "SSICR.CKDV = 000 is invalid when
> SSIWSR.WS_MODE = 1 or SSIWSR.CONT = 1".
> Current driver will set CONT, thus, we shouldn't use CKDV = 000.
> This patch fixup it.
>
> Reported-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> ---
>  sound/soc/sh/rcar/ssi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
> index 9594d44..d0602c1 100644
> --- a/sound/soc/sh/rcar/ssi.c
> +++ b/sound/soc/sh/rcar/ssi.c
> @@ -245,6 +245,15 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
>  	for (j = 0; j < ARRAY_SIZE(ssi_clk_mul_table); j++) {
>
>  		/*
> +		 * It will set SSIWSR.CONT here, but SSICR.CKDV = 000
> +		 * with it is not allowed. (SSIWSR.WS_MODE with
> +		 * SSICR.CKDV = 000 is not allowed either).
> +		 * Skip it. See SSICR.CKDV
> +		 */
> +		if (j == 0)
> +			continue;

    Why not change the *for* statement itself to start with j = 1?

[...]

MBR, Sergei
