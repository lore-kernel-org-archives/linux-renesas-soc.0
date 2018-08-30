Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45860 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbeH3Nkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 09:40:36 -0400
Received: by mail-lf1-f68.google.com with SMTP id r4-v6so6647971lff.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 02:39:19 -0700 (PDT)
Subject: Re: [PATCH] thermal: rcar: reduce inaccuracy in calculate rounding
To: Nguyen An Hoan <na-hoan@jinso.co.jp>, broonie@kernel.org,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
Cc: wsa@sang-engineering.com, niklas.soderlund+renesas@ragnatech.se,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        magnus.damm@gmail.com, h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp,
        cv-dong@jinso.co.jp
References: <1535596744-16598-1-git-send-email-na-hoan@jinso.co.jp>
 <1535596744-16598-2-git-send-email-na-hoan@jinso.co.jp>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1be52c7a-9e3b-59f9-f71d-420fe0056652@cogentembedded.com>
Date: Thu, 30 Aug 2018 12:39:18 +0300
MIME-Version: 1.0
In-Reply-To: <1535596744-16598-2-git-send-email-na-hoan@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 8/30/2018 5:39 AM, Nguyen An Hoan wrote:

> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> About the formula for temperature calculation
> [reg] = [temp] * a + b <=> [temp] = ([reg] - b) / a
> 
> Using "(mcelsius * tsc-> coef.aX) / 1000" instead of "DIV_ROUND_CLOSEST(mcelsius, 1000) * tsc-> coef.aX"
> to avoid and reduce inaccuracy due to rounding the integer division.
> 
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>   drivers/thermal/rcar_gen3_thermal.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 7aed533..dbb31b8 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -185,11 +185,10 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
>   static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
>   					      int mcelsius)
>   {
> -	int celsius, val1, val2;
> +	int val1, val2;
>   
> -	celsius = DIV_ROUND_CLOSEST(mcelsius, 1000);
> -	val1 = celsius * tsc->coef.a1 + tsc->coef.b1;
> -	val2 = celsius * tsc->coef.a2 + tsc->coef.b2;
> +	val1 = (mcelsius * tsc->coef.a1)/1000 + tsc->coef.b1;
> +	val2 = (mcelsius * tsc->coef.a2)/1000 + tsc->coef.b2;

    Please be consistent and enclose / in sopaces the same as you do for other 
operators.

[...]

MBR, Sergei
