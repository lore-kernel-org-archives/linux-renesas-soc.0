Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35988 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbeJ3Tew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 15:34:52 -0400
Received: by mail-lj1-f193.google.com with SMTP id s15-v6so10854741lji.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Oct 2018 03:41:55 -0700 (PDT)
Subject: Re: [PATCH] thermal: rcar_gen3_thermal: Fix does not have interrupts
 counting
To: Nguyen An Hoan <na-hoan@jinso.co.jp>, broonie@kernel.org,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
Cc: wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1540890601-20126-1-git-send-email-na-hoan@jinso.co.jp>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <74fb1972-bb10-5d91-ce6d-c30d1d4bfe76@cogentembedded.com>
Date: Tue, 30 Oct 2018 13:41:51 +0300
MIME-Version: 1.0
In-Reply-To: <1540890601-20126-1-git-send-email-na-hoan@jinso.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/30/2018 12:10 PM, Nguyen An Hoan wrote:

> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> This patch fixes thermal interrupts that did not happen when temprature changed.

   Temperature.

> Add the function rcar_gen3_thermal_update_threshold(), this function is used to
> calculate the value written to the threshold registers REG_GEN3_IRQTEMP1 and
> REG_GEN3_IRQTEMP2.
> 
> This patch is based on renesas-bsp/rcar-3.5.4.rc2 !
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>  drivers/thermal/rcar_gen3_thermal.c | 45 +++++++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 7aed533..009c0db 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -185,37 +185,39 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
>  static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
>  					      int mcelsius)
>  {
> -	int celsius, val1, val2;
> +	int val1, val2;
>  
> -	celsius = DIV_ROUND_CLOSEST(mcelsius, 1000);
> -	val1 = celsius * tsc->coef.a1 + tsc->coef.b1;
> -	val2 = celsius * tsc->coef.a2 + tsc->coef.b2;
> +	val1 = (mcelsius * tsc->coef.a1)/1000 + tsc->coef.b1;
> +	val2 = (mcelsius * tsc->coef.a2)/1000 + tsc->coef.b2;

   Need spaces around /.

[...]

MBR, Sergei
