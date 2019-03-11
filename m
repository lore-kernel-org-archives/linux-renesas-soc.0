Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41CDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 09:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C1A4206BA
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 09:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfCKJ7g (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 05:59:36 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37588 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbfCKJ7g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 05:59:36 -0400
Received: by mail-vs1-f68.google.com with SMTP id y19so2306765vsc.4;
        Mon, 11 Mar 2019 02:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kdZpQLT+a578Z5amAEXXRzf2jU4R9Gb48BFyIM+BwlQ=;
        b=C2IGwkRd1LEbtuwms2uD5AuTct33t6pQu6Ewb6/FFRCdCsCKd9I9DYJ1G0wu/kNqOh
         N/rrfesqZ7xq0GCus21mb2ypbyKBkikomlzBg7Sk2UH8BSmpYP2IXpSGJTMpFhsMK1x4
         h6sJJgiOxbjS2ffoaNvjIsCJVto4p2sUZr+1ALDYf2oDLInvne4R4OFyV+Vm3ErntZME
         msAlxG/oHGAbt4pp4rKP6GCPfNR+x2HhzAgJvuWZOo+sxOKVY2LDH9IqyGnkCEQ8jE10
         30fvEECOS9xbMBjLoUKJ0ToeMrsZFjPYPLLavWB0/ScOxkxUfd0gK2PqZktlnkQRVLBs
         vWCg==
X-Gm-Message-State: APjAAAUz9w7/9kRa/gYbi+FAu7MUfeddPXkodr1Rb4GPzw27RG8wxQt2
        +FNTBF5dt4KyXaWR78/eyeqL314kQzFY2Aca9vE=
X-Google-Smtp-Source: APXvYqyjkoTMrxn3JYkTmN23HWadNUbwFuHLhbc7WZPqHTOTtdRtVehg7+Hn4kGQaAw5GK53NqZGz4cGntVxG0RLaFs=
X-Received: by 2002:a67:ead0:: with SMTP id s16mr15787453vso.63.1552298375032;
 Mon, 11 Mar 2019 02:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com> <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190305175434.13107-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Mar 2019 10:59:23 +0100
Message-ID: <CAMuHMdWtNiLcOB_0vTa2nNM+tkdiTfYWP=VAe3GsfjRbxkgYvg@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: wait for data empty before starting DMA
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

On Tue, Mar 5, 2019 at 7:11 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When sending with DMA, the driver transfers the first byte with PIO (as
> documented). However, it started DMA right after the first byte was
> written. This worked, but was not according to the datasheet which
> suggests to wait until data register was empty again. Implement this.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -480,6 +480,10 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
>         if (!(msr & MDE))
>                 return;
>
> +       /* Check if DMA can be enabled and take over */
> +       if (priv->pos == 1 && rcar_i2c_dma(priv))

Shouldn't you check if MSR.MAT is set?

> +               return;

Hence ICMCR.ESG is not cleared, violating 57.3.8 (Master Transmit
Operation), Step 3?

> +
>         if (priv->pos < msg->len) {
>                 /*
>                  * Prepare next data to ICRXTX register.
> @@ -490,13 +494,6 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
>                  */
>                 rcar_i2c_write(priv, ICRXTX, msg->buf[priv->pos]);
>                 priv->pos++;
> -
> -               /*
> -                * Try to use DMA to transmit the rest of the data if
> -                * address transfer phase just finished.
> -                */
> -               if (msr & MAT)
> -                       rcar_i2c_dma(priv);
>         } else {
>                 /*
>                  * The last data was pushed to ICRXTX on _PREV_ empty irq.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
