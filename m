Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD098FC619D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A62142084C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 12:31:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbfAUMa7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 07:30:59 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38319 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728721AbfAUMa7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 07:30:59 -0500
Received: by mail-vs1-f65.google.com with SMTP id x64so12481956vsa.5;
        Mon, 21 Jan 2019 04:30:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1jyTN7NxdXr3VESH49ZldzZWSC9jXL1FM/yG6zL5p0k=;
        b=a1WI57bThmPrkBq9CAHZuPwAmbNQjpuBEb+qvhO0e10M7Kq0SUBQUNggfLkSdoEFAM
         9NUmtPBW9x/nIM4Og3tsj7aRy//xRAT9+bTNNojcZdAUdHOmKoE3Bf7R7/1hIO2fh4ea
         TgT4tdO5i1bEOO5m6hiNV6RJhzAfStrO/GTHpc0ERnZrmzrTEWOTMsCbQSpCf9JSh8vE
         xgN/zxIGKbDxi2lWcm+/TvgZZxnwPmQNwfdXDtizJ+4bRQMFRyUTstdinobEsC5pQF4p
         5wChvwwzWco8csQuunCY1xLM9xZzgQPPnR+RQQhy8uusZ1K6upcOQE/nPIz4WU+MPEWM
         0q3Q==
X-Gm-Message-State: AJcUukfZ/fBAnyQTgtfnL7Tzq/duISDVegaA+pmtdChB00MVhlpYgs92
        uZhl1gCD4eh9of3xjsa4/ULfbW6Qvx+wvR7mc4k=
X-Google-Smtp-Source: ALg8bN7M8JrB96zxpnmvs/N0JDpP1FyaH5zTL7nbizVwWuJETd7WrMP1ozr2Ais3wU3KA8O7zUqCd3po2DuMKyydGbQ=
X-Received: by 2002:a67:d119:: with SMTP id u25mr11171894vsi.63.1548073857696;
 Mon, 21 Jan 2019 04:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20190111115020.29147-1-geert+renesas@glider.be>
In-Reply-To: <20190111115020.29147-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 13:30:45 +0100
Message-ID: <CAMuHMdUBMxP1LbAtML55L37hq=WL_Gm02T+wBk1vm4B73cTvMA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77995: Fix MOD_SEL bit numbering
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 12:50 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> MOD_SEL register bit numbering was different from R-Car D3 SoC and
> R-Car H3/M3-[WN] SoCs.
>
> MOD_SEL 1-bit      H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'0         b'0
> Set Value = H'1    b'1         b'1
>
> MOD_SEL 2-bits     H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'00        b'00
> Set Value = H'1    b'01        b'10
> Set Value = H'2    b'10        b'01
> Set Value = H'3    b'11        b'11
>
> MOD_SEL 3-bits     H3/M3-[WN]  D3
> ===============    ==========  =====
> Set Value = H'0    b'000       b'000
> Set Value = H'1    b'001       b'100
> Set Value = H'2    b'010       b'010
> Set Value = H'3    b'011       b'110
> Set Value = H'4    b'100       b'001
> Set Value = H'5    b'101       b'101
> Set Value = H'6    b'110       b'011
> Set Value = H'7    b'111       b'111
>
> This patch replaces the #define name and value of MOD_SEL.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 794a67117646 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
> [shimoda: split a patch per SoC and revise the commit log]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> [geert: Use a macro to do the actual reordering]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, queuing in sh-pfc-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
