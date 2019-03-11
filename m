Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA26C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 10:08:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13A8D20657
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 10:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfCKKI0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 06:08:26 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39677 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfCKKI0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 06:08:26 -0400
Received: by mail-ua1-f65.google.com with SMTP id s15so1312242uap.6;
        Mon, 11 Mar 2019 03:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V5CrJAR3f2YrKwqTj6RKoLNNFjGqlBbTTM6ZrZKBdFE=;
        b=aHINz2UiIRMO9E61jLKk/CsDMfnqgJFetmlQJ51aoU88fPX+ZSUGY3q3lxirMr8yKU
         p2ftYaA5B5OET8StQsNS//WGO8nr1zQ56tYQo/ke1rK1nhaMUTwMzcUQWx075XAM7R1k
         Y7eKxf+ibN9Boh4eQChe0wGpt2C4tVy7QdPOibczYuExUzCNZpT8gTSYKHtLMaL3dxvb
         Lrvb5bNluQkL4Q/+MOhokq8kWsd6ArXKI4/IejOKi5uUR1AvET4/d+dlM7OycNYLRnZ4
         7XL7ggvxRNFrDxAjyUUi09oFIV0pffRSWo6+ns48cYpw3GQKsemZ9LoKsgOmkhHGa1AR
         xyFQ==
X-Gm-Message-State: APjAAAXEQyeC1wT+pNBq4tk4gtsY5070i3pc/r5ZsGTMSgL32e2F6n1E
        p8LFd7gj9SuH4O8dI3mevSz1GVxsC6JQ0xIFzD0=
X-Google-Smtp-Source: APXvYqxP5WCYB9TuSYD1Mno83HFrfuVx2l2uPTEipYLBW/VT1EiNh4UaE5mZLRSJ/e+/5UpzrD/OPXEbHtdPAgJvPf4=
X-Received: by 2002:a9f:30dc:: with SMTP id k28mr16615902uab.75.1552298905142;
 Mon, 11 Mar 2019 03:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190305175434.13107-1-wsa+renesas@sang-engineering.com> <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190305175434.13107-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Mar 2019 11:08:13 +0100
Message-ID: <CAMuHMdWsChk1i36u_dDAxMV3j64sHputH5jmGyLxsfjAbeK6sw@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: rcar: sanity check for minimal DMA length
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

On Tue, Mar 5, 2019 at 7:52 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Use a macro for the hardcoded value and apply a build check. If it is
> not met, the driver logic will not work anymore.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rcar.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 3ce74edcd70c..925858915569 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c

> @@ -921,6 +922,9 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         struct i2c_timings i2c_t;
>         int irq, ret;
>
> +       /* Otherwise logic will break because some bytes must always use PIO */
> +       BUILD_BUG_ON_MSG(RCAR_MIN_DMA_LEN < 3, "Invalid min DMA length");

Given patch 3/3, it should still work with RCAR_MIN_DMA_LEN == 2, right?

> +
>         priv = devm_kzalloc(dev, sizeof(struct rcar_i2c_priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
