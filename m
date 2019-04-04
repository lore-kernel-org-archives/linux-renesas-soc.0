Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F81C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 07:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67E51206DF
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 07:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbfDDH3r (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 03:29:47 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:34921 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbfDDH3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 03:29:47 -0400
Received: by mail-ua1-f66.google.com with SMTP id a46so575173uae.2;
        Thu, 04 Apr 2019 00:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uaKTrJ7NOkjBDOSQAIcNmYaVDtXu9/sTG0E7c+dYUU4=;
        b=gvHH5WNcybjAUnKuC97sNp7+bueti5D1vNPwTeavEPWbxkq6HwYy14lQHVBzc0DLLh
         f+QnEfEsYfKKCKif0aIRSlVIsV1mFC+X0QfE4Kvp5Zjic9+WKVjl10FytArx3EumwGZ5
         5POUpfNYTNLBS6aBR7AanvOe63b/EF1iJ6HWb6KhJeNxAjLtNyQmuLo9LFOvtMYkOJDI
         g2GQ/idqycgfUMSuE3i4lBxaTtJr8ADK4kEWAUCjMX85oiAT+7WYKfCN/CiqnYqp/lJv
         V9vqJWLCFQS98d0K/9uG1VYAgsh4dJTubc3XkJfi+u9b73v0XwD05eJC2CdQnn8pPOdj
         wirQ==
X-Gm-Message-State: APjAAAUV8sxYJfKhW2rVV8Mq/6/jJeIA+zwni9ecc9J2OXnFpy4/Mk75
        gmJuIk6GWUtocEZCpZiHpCX7kzFfjBbqbL3anqiJoBOv
X-Google-Smtp-Source: APXvYqwZFF8nnpOmWLc76Pi5pCFrjbUUemfg+Xwjhe4VtHlydnZxKNnoXLnNzYoUKBPVYWBXSe+9D1/yfi3QEYXTzUE=
X-Received: by 2002:ab0:2341:: with SMTP id h1mr2812315uao.127.1554362986435;
 Thu, 04 Apr 2019 00:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <1554283043-9206-1-git-send-email-na-hoan@jinso.co.jp>
 <CAMuHMdX6XJitza1J3TRs_YBHCQp_yvXyZVZErE6v4OtoSwQ1RQ@mail.gmail.com> <18f28cec-7804-c27a-b461-8f0c694f97a5@jinso.co.jp>
In-Reply-To: <18f28cec-7804-c27a-b461-8f0c694f97a5@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 4 Apr 2019 09:29:35 +0200
Message-ID: <CAMuHMdXjBVZ+Rjs78wO3KNpba9_BVL+wuGk-2FjOG3_3eGP=NA@mail.gmail.com>
Subject: Re: [PATCH] spi: sh-msiof: Fix the limit of data length when
 calculating the length of words
To:     Hoan <na-hoan@jinso.co.jp>
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

On Thu, Apr 4, 2019 at 2:48 AM Hoan <na-hoan@jinso.co.jp> wrote:
> On 2019/04/03 18:24, Geert Uytterhoeven wrote:
> > On Wed, Apr 3, 2019 at 11:17 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> >> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> >>
> >> We can use each word (data length) of 32bits (4 bytes),
> >> so that if the length is greater than 3bytes, we can
> >> align it with 4bytes of words.
> >>
> >> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > Thanks for your patch!
> >
> >> ---
> >>   drivers/spi/spi-sh-msiof.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> >> index e2eb466..1552c14 100644
> >> --- a/drivers/spi/spi-sh-msiof.c
> >> +++ b/drivers/spi/spi-sh-msiof.c
> >> @@ -930,7 +930,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
> >>          if (!spi_controller_is_slave(p->ctlr))
> >>                  sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
> >>
> >> -       while (ctlr->dma_tx && len > 15) {
> >> +       while (ctlr->dma_tx && len > 3) {
> > This check is here to avoid using DMA (which incurs DMA setup overhead)
> > for short transfers.
> > Have you measured the performance impact of your change?
> >
> > Perhaps the code should be changed to:
> >
> >      #define DMA_MIN_LEN     16
> >
> >      while (ctlr->dma_tx && len >= DMA_MIN_LEN) {
> >
>
> Here the DMA feature for this driver has been initialized with the
> probe() function,
> which means that DMA will, if possible, use default.
> But when you add a patch to support DMA, You said DMA is only effective
> with 32 bits, so that DMA here serves data as multiples of 32 bits.
> I don't think the data length causes a cost for DMA when it's always
> used by default
> if possible (was initialized with the probe () function) and if the data
> is a 32bits
> multiple. In the opposite direction, have you measured the performance
> of using DMA
> if the data is greater than or equal to 16 bytes instead of 4 bytes?

commit b0d0ce8b6b91a0f6f99045b6019fc4c824634fb4
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Mon Jun 30 12:10:24 2014 +0200

    spi: sh-msiof: Add DMA support

    Add DMA support to the MSIOF driver using platform data.

    As MSIOF DMA is limited to 32-bit words (requiring byte/wordswapping for
    smaller wordsizes), and the group length is limited to 256 words, DMA is
    performed on two fixed pages, allocated and mapped at driver initialization
    time.

    Performance figures (in Mbps) on r8a7791/koelsch at different SPI clock
    frequencies for 1024-byte and 4096-byte transfers:

                       1024 bytes           4096 bytes
      -  3.25 MHz: PIO  2.1, DMA  2.6 | PIO  2.8, DMA  3.1
      -  6.5  MHz: PIO  3.2, DMA  4.4 | PIO  5.0, DMA  5.9
      - 13    MHz: PIO  4.2, DMA  6.6 | PIO  8.2, DMA 10.7
      - 26    MHz: PIO  5.9, DMA 10.4 | PIO 12.4, DMA 18.4

    Note that DMA is only faster than PIO for transfers that exceed the FIFO
    size (typically 64 words / 256 bytes).

    Also note that large transfers (larger than the group length for DMA, or
    larger than the FIFO size for PIO), should use cs-gpio (with the
    appropriate pinmux setup), as the hardware chipselect will be deasserted in
    between chunks.

    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Signed-off-by: Mark Brown <broonie@linaro.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
