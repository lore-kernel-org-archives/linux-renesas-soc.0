Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:63932 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbeJYKyj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Oct 2018 06:54:39 -0400
Subject: Re: [v2 PATCH] thermal: rcar_gen3_thermal: Fix init value of IRQCTL
 register
To: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
Cc: wsa@sang-engineering.com,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        h-inayoshi@jinso.co.jp,
        "nv-dung@jinso.co.jp" <nv-dung@jinso.co.jp>, na-hoan@jinso.co.jp,
        DongCV <cv-dong@jinso.co.jp>
References: <1540433621-24114-1-git-send-email-na-hoan@jinso.co.jp>
From: Hoan <na-hoan@jinso.co.jp>
Message-ID: <8cc28537-7adb-af11-1f05-4241460a6f20@jinso.co.jp>
Date: Thu, 25 Oct 2018 11:23:58 +0900
MIME-Version: 1.0
In-Reply-To: <1540433621-24114-1-git-send-email-na-hoan@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Geert-san, Wolfram-san

I am very sorry for not being re-test for this patch v1 with H3ES1.*.

Although I tested with M3-N, M3W H3ES2.0 and did not test

with H3ES1.1.  I  discarded v1 and updated v2.

Thank you! Hoan.


On 2018/10/25 11:13, Nguyen An Hoan wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> Fix setting value for IRQCTL register. We are setting the last 6 bits
> of (IRQCTL) to be 1 (0x3f), this is only suitable for H3ES1.*, according
> to new Hardware manual values 1 are "setting prohibited" for Gen3!
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> ---
>   drivers/thermal/rcar_gen3_thermal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> index 7aed533..fde3fd8 100644
> --- a/drivers/thermal/rcar_gen3_thermal.c
> +++ b/drivers/thermal/rcar_gen3_thermal.c
> @@ -306,7 +306,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
>   
>   	usleep_range(1000, 2000);
>   
> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
>   	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>   	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
>   
