Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A8DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 10:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED79820872
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 10:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731543AbfAKKFf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 05:05:35 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44470 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730832AbfAKKFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 05:05:35 -0500
Received: by mail-vs1-f67.google.com with SMTP id z23so8852519vsj.11;
        Fri, 11 Jan 2019 02:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YVzt+1p2ayNvIQaajcq27pXwb1Tr7fR+ppCuFS0fMWw=;
        b=SmT/iEFNV1ds+O6651hoDF7AJ1sSMMJMYvyMIHg9GrbMzIcH0eBoZ4669xvxn9KGWj
         6Zmclf0JjdaGkL2K80jvkudecW4kw9HPQLn0fzhdT9EpwiIKmVFa6d8x5wM8RF8CrF2g
         oTtDuyaWAo+/k+369ubjqloTH4fhVEEt1LZedpKUpfK6eU4Ov4RbJ6Lb19/j6wDJSh7V
         Kc4nWIUZ/E6aFCXyKcmCNhkhLTDssCO+FuBsTtOZfMesM39/mD0SP+zA7d9iLQCtlr1v
         yv60c0rZbmZ6eK7Uj4ubq5UlgD4ZbJAlz0aLq4V7sVuyxQHbNVhJd1SmJUNHe1JGzhyz
         cnXg==
X-Gm-Message-State: AJcUukctET1IW2Pmni9s0tjUwWnfOfuFoUedfo1GaD+6mheMCw8yEreQ
        f6mDXHZlOkA3DAzjGkVSTnJOXhLg/p9rPEyviVM=
X-Google-Smtp-Source: ALg8bN67ZozVmlWsqlGUxfOrqZ30laovJuhyD/NEu4CdGbtg8KDiadtJzxssW635bbqVUZoZO5Hx8YgB3vGQ4tBWZtA=
X-Received: by 2002:a67:d119:: with SMTP id u25mr5242197vsi.63.1547201134221;
 Fri, 11 Jan 2019 02:05:34 -0800 (PST)
MIME-Version: 1.0
References: <1547197109-637-1-git-send-email-na-hoan@jinso.co.jp>
 <1547197109-637-2-git-send-email-na-hoan@jinso.co.jp> <CAMuHMdUAk004J-06o43yHei10tWCkyztsWUXUyCj36cPwT9D0w@mail.gmail.com>
 <b8844c87-5642-aea6-c90e-670e8c544884@jinso.co.jp>
In-Reply-To: <b8844c87-5642-aea6-c90e-670e8c544884@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Jan 2019 11:05:21 +0100
Message-ID: <CAMuHMdWFmfXVOkq0vVQ=yJx_9KyEXvkTvkEjMTfkaFa7s8uH3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: sh-msiof: Use DMA if possible
To:     Hoan <na-hoan@jinso.co.jp>
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

Hi Hoan,

On Fri, Jan 11, 2019 at 10:27 AM Hoan <na-hoan@jinso.co.jp> wrote:
> On 2019/01/11 18:09, Geert Uytterhoeven wrote:
> > On Fri, Jan 11, 2019 at 9:59 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> >> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> >>
> >> Currently, this driver only supports feature for DMA 32-bits.
> >> In this case, only if the data length is divisible by 4 to use
> >> DMA, otherwise PIO will be used. This patch will suggest use
> >> the DMA 32-bits with 4bytes of words, then the remaining data
> >> will be transmitted by PIO mode.
> >>
> >> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> > Thanks for your patch, that's a great idea!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > with a small suggestion below.
> Currently, I only test the transmit-receive spi with AT25C eeprom,
> because the maximum length of data I test with eeprom is only 18 bytes,
> so with this patch, there will be times when clock timing time and pulse
> of data transmission (I Observed by  sigrock logic analyzer) will not be
> beautiful compared to PIO mode.
> I worry if other devices using this driver also limit the maximum length
> of transmission/reception to 18bytes.

One other issue is that MSIOF drops the hardware chip select in between
transfers.  Before, transfers that fully fit in the FIFO were sent in a
single transfer, keeping the hardware chip select asserted during the
full transfer.
If transfers are split, and you need the chip select to be asserted
during the full transfer, you have to use a GPIO chip select instead.
I believe the split can already happen since your commit 916d9802e4b0723c
("spi: sh-msiof: Reduce the number of times write to and perform the
transmission from FIFO")?

However, for most SPI slave devices (e.g. AT25), that issue is moot, as
they need a GPIO chip select anyway, to avoid dropping the chip select
in between transfers belonging to the same message.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
