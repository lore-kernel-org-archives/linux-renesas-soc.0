Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07954C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 09:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D589220870
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 09:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbfAKJJX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 04:09:23 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:46584 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728943AbfAKJJX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 04:09:23 -0500
Received: by mail-vk1-f193.google.com with SMTP id j23so3116807vke.13;
        Fri, 11 Jan 2019 01:09:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qt6zskZA+p1wMhnOKt8vxLu8Eo4w3/AfDj5WnKkwDN4=;
        b=JOBTo53oQmYQBNbm+7DfSbneMBXa3qmS8XVXhaWzp+cvNQGXmn8zqOLL3tay5C3l+S
         LJGF0Kah+aVayDKR2OSf2jwy+lQGlJSuIOnAUFaeasVQKCs1nALY/hjEaYRO4kkC2auE
         W8V9Avk6g690A4Chb1SNpI6JhzHjJkmmgLrQLofEEK4aSzOqpyFgeUspA+OrOUQlOg/l
         nZkwzO7tUcrBZxZ+fpQBfBO2ut0hfU/9cPMkp4koytIc9RhlKPTpJkYzt4Ym9ZP2Gd0y
         D3hemltoW3wWidoouA/yCY1UEQq8vgg15G4AlUCBpjATXJmZFUHyLQ2NcJBJKZ5CiaR6
         6ocg==
X-Gm-Message-State: AJcUukdYszZcb7MpY3ZV38ZNpOqNLbzq/2PfulmDLxgndxTaiXjd2mMm
        6Vf0YhxCGHfmclxF3pQ+UFQs1pQD5MmhaCQVFgw=
X-Google-Smtp-Source: ALg8bN6HX7NI18UC2RVz+yYrES37MFMX4XO4PqQZGrT2nphEaJQNGZfhfwqY0wfcZ63ZcAS0JI6DIv0mUedlEoS8k4Y=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr5412639vkh.65.1547197762058;
 Fri, 11 Jan 2019 01:09:22 -0800 (PST)
MIME-Version: 1.0
References: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp> <1547197109-637-2-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1547197109-637-2-git-send-email-na-hoan@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jan 2019 10:09:10 +0100
Message-ID: <CAMuHMdUAk004J-06o43yHei10tWCkyztsWUXUyCj36cPwT9D0w@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: sh-msiof: Use DMA if possible
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
> Currently, this driver only supports feature for DMA 32-bits.
> In this case, only if the data length is divisible by 4 to use
> DMA, otherwise PIO will be used. This patch will suggest use
> the DMA 32-bits with 4bytes of words, then the remaining data
> will be transmitted by PIO mode.
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Thanks for your patch, that's a great idea!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
with a small suggestion below.

> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -937,17 +937,13 @@ static int sh_msiof_transfer_one(struct spi_master *master,
>                 unsigned int l = 0;
>
>                 if (tx_buf)
> -                       l = min(len, p->tx_fifo_size * 4);
> +                       l = min(len - len % 4, p->tx_fifo_size * 4);

I think this would be easier to read when written as:

    l = min(round_down(len, 4), p->tx_fifo_size * 4);

>                 if (rx_buf)
> -                       l = min(len, p->rx_fifo_size * 4);
> +                       l = min(len - len % 4, p->rx_fifo_size * 4);

Likewise,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
