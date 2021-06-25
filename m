Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1433C2B9F4
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jun 2021 15:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7A2261450
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jun 2021 15:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhFYPTb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jun 2021 11:19:31 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:34550 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhFYPTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 11:19:31 -0400
Received: by mail-vs1-f51.google.com with SMTP id x1so5643327vsc.1;
        Fri, 25 Jun 2021 08:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=80Qo9g10/ASfttX0U6SsQ/6GolLHiWmJw0XcmB2Dl0I=;
        b=IeAyYJgxlRseQnaywPIZOijkW89BQC8K2wrRy2RwLdEKGgBYBhRTf+1g6r+PGKXZ68
         biLtsHk6B49eYJONvqoNQdFz2JB/o1LhxVf6DwK4kzxyeN26KYhP6uW36g5rLERy6jKZ
         08AdrQr4ktZ5clwiTWNXTpNV9FuLa7tbFPyfVnPT8NVpKm52qBXkeYJgz+2SQCycIhJi
         7N0IKLBpvdT4bRtwo5c+Op7CGCnm2R1nDHbSUbWeecPj6AhP6PL9xv2YQTQTV2tVEZzO
         OMPrdzaHRIwUCMobukPuOA+2vXgYYXR8cRXDKjfta1CDFrZgOxDKfPdhXU0SqpFsSolO
         XqbA==
X-Gm-Message-State: AOAM531JssWq94jFxCiAN26GpscoJ+mN9XzjsPuSRZ8hP1AA4WamMA3A
        94s3XBBrAQ2sBZn5G8h2aWYzvNWNWQHTNjqbdxc=
X-Google-Smtp-Source: ABdhPJyjF2fuzLKHbz4pBmzAz/ClnXxlRRWFC4ecBZHRjTrin3DpIe0lUxyMZf2a9b8ABekKxIA2TWJQ7AOPSDGDtms=
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr9413975vsn.40.1624634222523;
 Fri, 25 Jun 2021 08:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-12-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 17:16:51 +0200
Message-ID: <CAMuHMdUy7_in8HPfwB5MyX4Uh2poUMf6oT7X6w0cOCujUD+a0A@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] arm64: dts: renesas: r9a07g044: Add I2C nodes
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 24, 2021 at 3:03 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add I2C{0,1,2,3} nodes to RZ/G2L (R9A07G044) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -89,6 +89,86 @@
>                         status = "disabled";
>                 };
>
> +               i2c0: i2c@10058000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       compatible = "renesas,riic-r9a07g044", "renesas,riic-rz";
> +                       reg = <0 0x10058000 0 0x400>;
> +                       interrupts = <GIC_SPI 350  IRQ_TYPE_LEVEL_HIGH>,

There's a double space after the first interrupt number (in each i2c node).

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
