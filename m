Return-Path: <SRS0=YxuQ=RH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8E4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8626C206B8
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  4 Mar 2019 10:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbfCDKfN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 4 Mar 2019 05:35:13 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:38427 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfCDKfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Mar 2019 05:35:13 -0500
Received: by mail-ua1-f65.google.com with SMTP id d4so3946158uap.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2019 02:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F5whef2h4+/kouGMAnV00js/+W6ORMLLekuCTU4PUX8=;
        b=bUF1OpqYpXQpkHtCS2+2inBYO8NSSHJAsoamwZRk3mwcQr8SEa3pA+dp1o0qTXNPPk
         9YuwN+nlkmD8n1m/STWOEW5k35mPYZoXT5ziGS7YI//l9dZ+N1Z9pTOTuqYQJccpk0f0
         1OwGWrm+5NWws3jfTICrDxfGKyH6Rdq0pHGKC1Dv7nZ2WbQ0zyFYZIolXz9q9ObZ7gqU
         ZsI5wOuCzCd/tb6qyVxwJy/Jw+kYZcEz5dyZDXHCbZp0N9QLpdO+utyzxHrmn+f03vV4
         nqJ3672pESSCN+crSJyafR6irjnxpFRZquuulwG+dsiWb2YHyH+2ck5iOHD3+QM3FMcs
         JCow==
X-Gm-Message-State: APjAAAWpJgwSuwnxUvorvy+VkmNkSN35cDR14aWwIXjuZAQVRcoyXMWf
        ezZvCJ6AqOUYPs7BE9JqsZUtq24+2C7B3cPwIys=
X-Google-Smtp-Source: APXvYqyVom/11llDFz+Fdc29/u65Qy2+rdrdLbtLSOz0gU+VuOEt2IyYmYAfFP9LMybWbn0Hd6PqfsCBHttxxGAUs64=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr9168583vsc.152.1551695711828;
 Mon, 04 Mar 2019 02:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20190303190059.31155-1-marek.vasut@gmail.com>
In-Reply-To: <20190303190059.31155-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Mar 2019 11:35:00 +0100
Message-ID: <CAMuHMdWStD+on70-e1p0SXbe2igNJxDM1RzeYsdXW+80SA9+sw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: alt: Add DA9063 PMIC node
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sun, Mar 3, 2019 at 8:01 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Add DA9063 PMIC node to the I2C bus.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r8a7794-alt.dts
> +++ b/arch/arm/boot/dts/r8a7794-alt.dts
> @@ -377,6 +377,27 @@
>         pinctrl-names = "i2c-exio4";
>  };
>
> +&i2c7 {
> +       status = "okay";
> +       clock-frequency = <100000>;

According to the DA9063 datasheet, the PMIC supports up to 400 kHz.
It looks like there are no other devices on the bus.

Wolfram, what's your stance on this?

> +
> +       pmic@58 {
> +               compatible = "dlg,da9063";
> +               reg = <0x58>;
> +               interrupt-parent = <&gpio3>;
> +               interrupts = <31 IRQ_TYPE_LEVEL_LOW>;
> +               interrupt-controller;
> +
> +               rtc {
> +                       compatible = "dlg,da9063-rtc";
> +               };
> +
> +               wdt {
> +                       compatible = "dlg,da9063-watchdog";
> +               };
> +       };
> +};
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
