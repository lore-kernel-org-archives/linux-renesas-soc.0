Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850AFC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:24:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59C9121473
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfDCJY3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:24:29 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37268 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfDCJY2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 05:24:28 -0400
Received: by mail-vs1-f68.google.com with SMTP id w13so8511139vsc.4;
        Wed, 03 Apr 2019 02:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QhT6czOoaob1yfInNC1AWI3HeE3Sz+1vz4h21O0FSok=;
        b=fWwgUo/q5wNUXAA13UmM+IMZI2rGRXMmsa+i7lurHv4jUazF+IZbUtYvG9yJgtXoH+
         KORMZf124+mMPXTGTrDQKK9aGnVCL/lBNrJx9jJ3r9QuBcOX7wjpQ1iZmuYYToxhB9R+
         ZsEEMbDVEqrdIQVioGN0P+Ik4d27Fyd/R+odApK+AGdHk++qPXplyFFZ9q0fnK1S7s0r
         5ROWiERnPgrOXvIkon3GAcCHOLl8FezRQmS5r8jthhLXiHkMfsGaZlz6hroDJ4Esslrj
         rKA49zihk0FGGaipnnwyQo3sLCe07JsYULLLBo9hxymAymXL5vGrvM1x8rWpCGgaLInD
         +zjQ==
X-Gm-Message-State: APjAAAW8WQtN2of61UkOC6vQ6HXma9hCH8aHVcNHgYVMi8JdVQZibtN+
        aSS1NkqCfEz2Onu4wOk6eGhOyx9ZXwkjSpYQV8M=
X-Google-Smtp-Source: APXvYqxCWhwGxA40tqg6aGIVCzFOnjF4yx9gwHN919P1+eS3wTyxQPiB0pzuapGRXLvEDJoTXkOAPiNW+hRsmAU7lds=
X-Received: by 2002:a67:7cd1:: with SMTP id x200mr18343905vsc.32.1554283467799;
 Wed, 03 Apr 2019 02:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <1554283043-9206-1-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1554283043-9206-1-git-send-email-na-hoan@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 Apr 2019 11:24:15 +0200
Message-ID: <CAMuHMdX6XJitza1J3TRs_YBHCQp_yvXyZVZErE6v4OtoSwQ1RQ@mail.gmail.com>
Subject: Re: [PATCH] spi: sh-msiof: Fix the limit of data length when
 calculating the length of words
To:     Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi <linux-spi@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?= 
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hoan,

On Wed, Apr 3, 2019 at 11:17 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> We can use each word (data length) of 32bits (4 bytes),
> so that if the length is greater than 3bytes, we can
> align it with 4bytes of words.
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Thanks for your patch!

> ---
>  drivers/spi/spi-sh-msiof.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index e2eb466..1552c14 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -930,7 +930,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
>         if (!spi_controller_is_slave(p->ctlr))
>                 sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
>
> -       while (ctlr->dma_tx && len > 15) {
> +       while (ctlr->dma_tx && len > 3) {

This check is here to avoid using DMA (which incurs DMA setup overhead)
for short transfers.
Have you measured the performance impact of your change?

Perhaps the code should be changed to:

    #define DMA_MIN_LEN     16

    while (ctlr->dma_tx && len >= DMA_MIN_LEN) {

>                 /*
>                  *  DMA supports 32-bit words only, hence pack 8-bit and 16-bit
>                  *  words, with byte resp. word swapping.
> @@ -974,7 +974,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
>                         return 0;
>         }
>
> -       if (bits <= 8 && len > 15) {
> +       if (bits <= 8 && len > 3) {

Likewise.

>                 bits = 32;
>                 swab = true;
>         } else {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
