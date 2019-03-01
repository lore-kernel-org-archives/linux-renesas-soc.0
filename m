Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1043CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:28:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4FD52087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:28:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfCAJ2e (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 04:28:34 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39132 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbfCAJ2d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 04:28:33 -0500
Received: by mail-ua1-f65.google.com with SMTP id s15so21823460uap.6;
        Fri, 01 Mar 2019 01:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3lvW29jHQG6xfy2Bkm34C5NH0jqaA2eERQC99JVihuk=;
        b=eH2+UhOWB+h/TV3+RjnABL0EN3sFj+xKBHsNJcALjyQGGF6vo1lpK41GwuRm2TDpRs
         W7FiWpS7mwOe+FpYLPjyurD61uL3W89czSTRIbN6Ho1qT68+b1em4y0PJmyPduOoHArS
         +d9VozUYWS7FHLa8yayP7p16cXme+/9+QI2lhtvsadK5QLcKZDQpMnetSR9xH+ppH4nl
         UXHaorX3rLu9LSDOUcRtxdqL7K0Xi9pX0bWdoZhmpkkuT4H5lb3O07VwHJU4rmLP4BRE
         suulhnxCgdqNUeVXqs+uJloNdKGP1TidbITrp6OGPTqVghfKmlLX9hV1JjhBGsrn0U6x
         F+gg==
X-Gm-Message-State: APjAAAWj93p1xcRrp6EDAc53c/+eaufe1iY4xm5piNsbZ8c26fZnhbs7
        UE09GYBngtHao7HKg9b1mWniCCJSykfrNbd+8jY=
X-Google-Smtp-Source: APXvYqzPJHuj/w7EdI0nT8b+sJtEMi099YAF0kvOcAROFxprnrBovRRie1v3PplrFuxl2KS9s+bvXxnlGkgQPSxaGqc=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr2112179vsc.152.1551432512614;
 Fri, 01 Mar 2019 01:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20190228110215.1657-1-geert+renesas@glider.be> <20190301092454.elhpld6q2ucaql5v@verge.net.au>
In-Reply-To: <20190301092454.elhpld6q2ucaql5v@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 10:28:21 +0100
Message-ID: <CAMuHMdX_LdNnMikRb1osO8ii4Mpi7ZsPpgvavQ6Qu-s9M4goHg@mail.gmail.com>
Subject: Re: [PATCH] spi: sh-msiof: Add reset of registers before starting transfer
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Mar 1, 2019 at 10:25 AM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Feb 28, 2019 at 12:02:15PM +0100, Geert Uytterhoeven wrote:
> > From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> >
> > In accordance with hardware specification Ver 1.0, reset register
> > transmission / reception setting before transfer.
> >
> > Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

> > --- a/drivers/spi/spi-sh-msiof.c
> > +++ b/drivers/spi/spi-sh-msiof.c
> > @@ -130,6 +130,8 @@ struct sh_msiof_spi_priv {
> >  #define CTR_TFSE     0x00004000 /* Transmit Frame Sync Signal Output Enable */
> >  #define CTR_TXE              0x00000200 /* Transmit Enable */
> >  #define CTR_RXE              0x00000100 /* Receive Enable */
> > +#define CTR_TXRST    0x00000002 /* Transmit Reset */
> > +#define CTR_RXRST    0x00000001 /* Receive Reset */
>
> nit: can we start using the BIT() macro here?

Sure, if you want to convert the whole driver... ;-)
Note that many of them are multi-bit fields.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
