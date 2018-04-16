Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f173.google.com ([209.85.217.173]:42375 "EHLO
        mail-ua0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753016AbeDPIBF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Apr 2018 04:01:05 -0400
MIME-Version: 1.0
In-Reply-To: <20180413172825.3y6ah3tyx4vw4sf5@ninjato>
References: <1523638908-21924-1-git-send-email-ulrich.hecht+renesas@gmail.com> <20180413172825.3y6ah3tyx4vw4sf5@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Apr 2018 10:01:04 +0200
Message-ID: <CAMuHMdWnMQLQuZu_=r05MGbApWGDZUMm-tJ48cr+YeDvFfR=Dw@mail.gmail.com>
Subject: Re: [PATCH] spi: sh-msiof: Add spi_master_suspend/spi_master_resume
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gaku Inami <gaku.inami.xw@bp.renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 13, 2018 at 7:28 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> +     struct platform_device *pdev = to_platform_device(dev);
>> +     struct sh_msiof_spi_priv *p = platform_get_drvdata(pdev);
>
> struct sh_msiof_spi_priv *p = dev_get_drvdata(dev);

With Wolfram's comment taken into account:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
