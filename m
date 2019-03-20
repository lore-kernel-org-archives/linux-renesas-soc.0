Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F83BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 09:43:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CA722175B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 09:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfCTJnE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 05:43:04 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:39386 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbfCTJnE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 05:43:04 -0400
Received: by mail-vs1-f65.google.com with SMTP id g127so1074129vsd.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2019 02:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PrreKQVWQeJDwa1MfePktDIJuYTKCTjTJ01mYEDZNds=;
        b=mdZg925UjLbFs7z5f7XN7VmbN/RqNz+bgOgwbUFjq0/WQnE9qM044fZvlG9+NYMGEo
         Bq76Ojr9Id2vBko/jTE9qR3xnYz8BDMruxPKRWm1ChIWlPZCkxBR6yaT5LjrzhDKC3dT
         sHnLwD28g+38gNYxlWn6wi3Jhg3cJF2Vea44F4Us6/r6e9/z5JK2QLIYN+B3YfWM+KQZ
         OYHnSbhsGPVIwmEtBy8T79/lYleQzZZXAbLHGKs3aYbq0C2BVqz1v/jQrqFYyNC0HPm8
         OQJnbjtwyH7FHdJ57/rvwYlsxQRgTL8oGtl6EIVqFKRRdSAkZ9SC9bXVN8T4yLu+yCyM
         Qpww==
X-Gm-Message-State: APjAAAUKK4UN1rXxbBVF4x6v1T14Gg4biKJQSpdG9JPNuJdmJMGJ5W3n
        9AY7xOaQ6duV/hPIFibfpjrS8AuYakp0El60qJU=
X-Google-Smtp-Source: APXvYqxFGhQo+nrjzmk9vIoJZqePYnMBR9Hp/egDyHKF0tzJFS7y+l3aUnYjWti8f4/erhaUYiDkymzjEbwOBPRJb8k=
X-Received: by 2002:a67:f843:: with SMTP id b3mr4229974vsp.152.1553074983539;
 Wed, 20 Mar 2019 02:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <1552927218-22394-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1552927218-22394-1-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Mar 2019 10:42:51 +0100
Message-ID: <CAMuHMdUOAHRiQ6b2R+yMet8Hf1ZpL=Q=5h=6mwg7YssU0JuowA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77965: Add I2C{0,3,5} pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Mon, Mar 18, 2019 at 5:40 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds I2C{0,3,5} pins, groups and functions to the R8A7796 SoC.
>
> These pins are physically muxed with other pins. Therefore, setup of
> MOD_SEL is needed for exclusive control with other pins.
>
> [takeshi.kihara.df: add blank lines after function declarations]
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [uli: use standard macros PINMUX_IPSR_PHYS and PINMUX_IPSR_PHYS_MSEL]
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c

Shouldn't the following be removed now?

    PINMUX_IPSR_NOGP(0, I2C_SEL_0_1),
    PINMUX_IPSR_NOGP(0, I2C_SEL_3_1),
    PINMUX_IPSR_NOGP(0, I2C_SEL_5_1),

Looks like we forgot to do that in pfc-r8a7796.c, too.

In pfc-r8a7795.c, they were renamed to PINMUX_SINGLE(I2C_SEL_x_1),
and removed when adding I2C[035] support.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
