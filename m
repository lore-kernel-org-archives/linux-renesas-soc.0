Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBF6C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:27:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05A8220828
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:27:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfCSK07 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:26:59 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41411 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfCSK07 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 06:26:59 -0400
Received: by mail-vs1-f66.google.com with SMTP id z25so10037635vsk.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2019 03:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GgMHmonpklsSY3Cbeg61RGRSWQulKrH22B3PVp9moQo=;
        b=b7qDTETCYfvfukaZKArIs3jV2g9ViC8aIwC6Dt7+zT8Zixw+QLmHLW3zl9n5+mgUwo
         bZECvyJB0mC73KFPLflGPDM+pL4ZXHPjtIVkhQK3QMqEYRInuuJldAJNRRkTXLw8JYTg
         XiSRrgsiGc2T+DU930lrfWGHRp6t7BopuEwxqM9u6tl5YX7i+WPMj8fIP+TW/SMIerGs
         Zq06kQsa9FhnqZJrBPInvYBTzqwA+4wqwNadkLMOPEwGuDxVXmOTcc6iihASnj/hLfl8
         XIaD9TDLdfvrSXM2r0DD0C3ai4f7DoMANC0xYrORow+YpHxt3aRmUXyj2MELNHGwSDIe
         koIg==
X-Gm-Message-State: APjAAAXYH8H8FzlG1Dew9feYuqKA2geH5jjZai6RJzg9pQ0Hg4RqoZh1
        TvYBEB9NTssM07D8dygEpELCzhU4CTQM8h027qE=
X-Google-Smtp-Source: APXvYqz0ygHoRA/YwCKzRCowi/T3l9rOGGq1dDRI7Pt7MYUkdwvAodbpJEm56R4qHeDSeCj1zUrllIoar/09iRRLt1c=
X-Received: by 2002:a67:d011:: with SMTP id r17mr78490vsi.96.1552991218196;
 Tue, 19 Mar 2019 03:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190304195958.8383-1-marek.vasut@gmail.com>
In-Reply-To: <20190304195958.8383-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Mar 2019 11:26:46 +0100
Message-ID: <CAMuHMdV1K+0yCbdDD37oeOCQRs7n2-06SQi=6pX_NY0cVcPcWw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7792: blanche: Add IIC3 and DA9063 PMIC node
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Mon, Mar 4, 2019 at 9:00 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Add IIC3 node to R8A7792 SoC device tree and a DA9063 PMIC node
> to V2H Blanche board device tree.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm/boot/dts/r8a7792-blanche.dts
> +++ b/arch/arm/boot/dts/r8a7792-blanche.dts
> @@ -308,6 +308,26 @@
>         };
>  };
>
> +&iic3 {
> +       status = "okay";
> +
> +       pmic@58 {
> +               compatible = "dlg,da9063";
> +               reg = <0x58>;
> +               interrupt-parent = <&irqc>;
> +               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;

I've just realized none of the R-Car Gen2 boards configure pinctrl for the
IRQC2 line (intc_irq2/intc), so they all rely on the boot loader doing that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
