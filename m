Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B40C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 09:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B19020657
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 09:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfAKJCJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 04:02:09 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34084 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfAKJCJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 04:02:09 -0500
Received: by mail-vs1-f65.google.com with SMTP id y27so8805727vsi.1;
        Fri, 11 Jan 2019 01:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OcWtbJTaOBJj1aFVMfwwSv+QrBhpuY4z+/TiiSr+ghs=;
        b=MpBuzZPm3TUw8WeS2wdkoq/6lLTKdlE72gxLjKfoP09paNjZ1V7PHMwqUM7hhTOQfO
         Fbhe9pg6/jS7xiRySideyP/Nyjmrb4fPpkeOQBQlvO3cfrT555xawwHs4kppAb0jftMq
         ClAydSocQkwbCgsI6WYicFs/MRyY7Rj5ccPzyoUR7KqREzbhBwPU0OeRw97rNCEmrwT1
         dq+AmKFiYb579j8fMM7p9DUYEF21BWBdLP7kXa6/olJpZlHGUqKzf9NsObDsbeC/d/T7
         J5WzEzVTdGfdEdX5ilhkY7kpmyLZUko++3dahG4verxjkKbVLscrk+yLXaykgX3otLAi
         AbWw==
X-Gm-Message-State: AJcUukduUv2QJXrw+HQDXTkjckAENXpoMBBjo56um/B1iTY65/htWF16
        xnN8p9DQL7uTcbcQPP8vFEVbFynuX1ozUoDEDfc=
X-Google-Smtp-Source: ALg8bN6B3jDJuhmMBV5VDd4kWCDS5kAbtXvNkxjt56gzosajrFwkWpS+iXAU4yo8mmjCzR/pUwpyNLGdV1OjgTT9x+g=
X-Received: by 2002:a67:d119:: with SMTP id u25mr5177243vsi.63.1547197328383;
 Fri, 11 Jan 2019 01:02:08 -0800 (PST)
MIME-Version: 1.0
References: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jan 2019 10:01:56 +0100
Message-ID: <CAMuHMdWeEncj3LjxBX1eDgMJFoZqW9MukNxMe0HG=pDqwggmmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] spi: sh-msiof: fix *info pointer in request_dma()
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hoan-san,

On Fri, Jan 11, 2019 at 9:59 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> msiof_spi_infor struct pointer was initialized in the probe() function,
> no need to get back and keep consistency.
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
One nit below.

> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -1206,7 +1206,7 @@ static int sh_msiof_request_dma(struct sh_msiof_spi_priv *p)
>  {
>         struct platform_device *pdev = p->pdev;
>         struct device *dev = &pdev->dev;
> -       const struct sh_msiof_spi_info *info = dev_get_platdata(dev);
> +       const struct sh_msiof_spi_info *info = p->info;
>         unsigned int dma_tx_id, dma_rx_id;
>         const struct resource *res;
>         struct spi_master *master;
> @@ -1469,3 +1469,4 @@ MODULE_DESCRIPTION("SuperH MSIOF SPI Master Interface Driver");
>  MODULE_AUTHOR("Magnus Damm");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:spi_sh_msiof");
> +

This change is unrelated, please drop it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
