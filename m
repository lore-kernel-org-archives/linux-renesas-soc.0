Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5316DC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:16:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A8902175B
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbfBENQr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 08:16:47 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42606 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbfBENQr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 08:16:47 -0500
Received: by mail-vs1-f68.google.com with SMTP id b74so2078842vsd.9;
        Tue, 05 Feb 2019 05:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XD/GFXutQR88+RNpLDw8WFMlzS1gg+DJxXnlSjSqcy4=;
        b=juidpEBjXVB2TDxwHp6+q6h7xFvbljxsT7SOKSu8c+Uq/P77W/laGSEIzwsrd+aese
         zaZwuefRicMbZ6NPBLHfeFUE55CGn6RLGkGmsOJmwsYp+mivWxjXdo/ltLA+aCgzvUNp
         VmXm9iYMmvefkxP8SHh/AjGfVGTd3IOVTcUsOYKXpxYeU6OkkDPp1/ByHUsK1b2Htf2T
         OwoSDATV6Uh/fIHW6F/8q5AdUFicM1DajNYyHwP6ct85MWKtTkhvl3O7eFFwIyrJi7VB
         xSuS6QLIaZzkdRpunb3tkaYudkp1l7r6J/kpxXknao0UDuoyCx1EC+qWhO8Mt2vbEaMv
         DJhg==
X-Gm-Message-State: AHQUAubXHb8zUd4Wee629o+0P4hIc4T//th/UiLlTnLM2iPX+IDCPShQ
        QoSaqm3p1vIhg3zm9Do2ciz719y3TsE9J0aXamQgJ0b3
X-Google-Smtp-Source: AHgI3IZs2FcK+TEDZHfyBH+3JPWq2qdRg7uLiTcHAiPlNskITJAf4pwHOjdRo5s8i5r0A+a/gh7wXBJwH4qj30S08jc=
X-Received: by 2002:a67:c202:: with SMTP id i2mr2019698vsj.11.1549372605643;
 Tue, 05 Feb 2019 05:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20190204220010.5671-1-wsa+renesas@sang-engineering.com> <20190204220010.5671-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190204220010.5671-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 14:16:33 +0100
Message-ID: <CAMuHMdWp_cJMXpqtwhbziN-E54vGzfp_M2J2_ZogrE41kkFeOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: sh_mobile: use new clock calculation formulas
 for Gen3
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Feb 4, 2019 at 11:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We could finally measure the clock on an Ebisu board. The new formula
> gives way better results, i.e. 100kHz instead of 106kHz and 400kHz
> instead of 387kHz. Switch to these formulas for all Gen3 SoCs.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c
> @@ -806,11 +806,11 @@ static const struct of_device_id sh_mobile_i2c_dt_ids[] = {
>         { .compatible = "renesas,iic-r8a7792", .data = &fast_clock_dt_config },
>         { .compatible = "renesas,iic-r8a7793", .data = &fast_clock_dt_config },
>         { .compatible = "renesas,iic-r8a7794", .data = &fast_clock_dt_config },
> -       { .compatible = "renesas,iic-r8a7795", .data = &fast_clock_dt_config },
> -       { .compatible = "renesas,iic-r8a77990", .data = &fast_clock_dt_config },
> +       { .compatible = "renesas,iic-r8a7795", .data = &v2_freq_calc_dt_config },
> +       { .compatible = "renesas,iic-r8a77990", .data = &v2_freq_calc_dt_config },
>         { .compatible = "renesas,iic-sh73a0", .data = &fast_clock_dt_config },
>         { .compatible = "renesas,rcar-gen2-iic", .data = &fast_clock_dt_config },
> -       { .compatible = "renesas,rcar-gen3-iic", .data = &fast_clock_dt_config },
> +       { .compatible = "renesas,rcar-gen3-iic", .data = &v2_freq_calc_dt_config },
>         { .compatible = "renesas,rmobile-iic", .data = &default_dt_config },
>         {},

I guess you want to make a similar change for R-Car Gen2 (both SoC-specific
and family-specific)?
Currently only R-Car H2 uses the new formula, which should apply to all
R-Car Gen2/Gen3 SoCs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
