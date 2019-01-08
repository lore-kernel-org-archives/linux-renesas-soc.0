Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98236C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 08:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72A5D20665
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 08:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbfAHIWL convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 03:22:11 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39079 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfAHIWL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 03:22:11 -0500
Received: by mail-ua1-f65.google.com with SMTP id c12so1000235uas.6;
        Tue, 08 Jan 2019 00:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mvwy8T1NcDtxjdTBgHspF16pd210Pyn5bGcEuSRmbkU=;
        b=L54+eVNzMveUfHNgwlwTz+t52sMVIftw04x/j0IOViC3AFt4Y1LCEXROsG76bZwZby
         7KscqsHd0TTCxF6APT55Ni5us5mWzmiyEKqFDOXdZ0eRr6qYtVtEoSGBkB2IoAKNBW1T
         sITqd4CaCuTvJ+V0z/ukN2RUHy1q4yGCrK7r9fCtP9gVLgBIyBsxg9HQhK+NwaDq/fMn
         12IeOuYHDL3JC7pJSEQqI//IfidmeXDrCdexWJC16fqCgJA1Go5j15Lzjl3ZPpJR7x2I
         mzdArllD/SaK86sXoAfklNkJgWfdFIyyQF1CdFfNxK11CYuI3QrWWIE9u6sJztFA6r8i
         4Azg==
X-Gm-Message-State: AJcUukfB1/2DbGAanbGnl18p6DZS3AWIMsrBhaDkOJFLql+cvvP9SV2E
        +5k6rFGsWhR5KMQ7nvcl4MAQYT9OH5sKD61ocac=
X-Google-Smtp-Source: ALg8bN4uDnyfx2hiBqTxTifuV8XL4Ix4WkXRaLT1l3URnHG8rioie7vF6n/gEf9wjNFyla9KWW2y3kMgg7EZjUyh/GI=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr254426uad.78.1546935729582;
 Tue, 08 Jan 2019 00:22:09 -0800 (PST)
MIME-Version: 1.0
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1546918094-13960-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 8 Jan 2019 09:21:57 +0100
Message-ID: <CAMuHMdVZXjFoY7J-1_WfL3xz1cO5XUEi8YnFK9W8gGfMdLDnhw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pwm: rcar: improve calculation of divider
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Jan 8, 2019 at 4:31 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The rcar_pwm_get_clock_division() has a loop to calculate the divider,
> but the value of div should be calculatable without a loop. So,
> this patch improves it.
>
> This algorithm is suggested by Uwe Kleine-König and Laurent Pinchart.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pwm/pwm-rcar.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pwm/pwm-rcar.c b/drivers/pwm/pwm-rcar.c
> index 6dbb70c..0498a93 100644
> --- a/drivers/pwm/pwm-rcar.c
> +++ b/drivers/pwm/pwm-rcar.c
> @@ -8,6 +8,8 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/log2.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -68,19 +70,15 @@ static void rcar_pwm_update(struct rcar_pwm_chip *rp, u32 mask, u32 data,
>  static int rcar_pwm_get_clock_division(struct rcar_pwm_chip *rp, int period_ns)
>  {
>         unsigned long clk_rate = clk_get_rate(rp->clk);
> -       unsigned long long max; /* max cycle / nanoseconds */
> -       unsigned int div;
> +       u64 div, tmp;
>
>         if (clk_rate == 0)
>                 return -EINVAL;
>
> -       for (div = 0; div <= RCAR_PWM_MAX_DIVISION; div++) {
> -               max = (unsigned long long)NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE *
> -                       (1 << div);
> -               do_div(max, clk_rate);
> -               if (period_ns <= max)
> -                       break;
> -       }
> +       div = NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE;

As we have:

    #define NSEC_PER_SEC    1000000000L
    #define RCAR_PWM_MAX_CYCLE      1023

NSEC_PER_SEC is 64-bit on arm64, and 32-bit on arm32.

Hence you should use

    div = (u64)NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE;

to avoid overflow on arm32.

> +       tmp = (u64)period_ns * clk_rate + div - 1;
> +       tmp = div64_u64(tmp, div);
> +       div = ilog2(tmp - 1) + 1;
>
>         return (div <= RCAR_PWM_MAX_DIVISION) ? div : -ERANGE;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
