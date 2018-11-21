Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41436 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbeKUU5M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 15:57:12 -0500
MIME-Version: 1.0
References: <1542626108-61344-1-git-send-email-biju.das@bp.renesas.com> <1542626108-61344-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1542626108-61344-3-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Nov 2018 11:23:08 +0100
Message-ID: <CAMuHMdVpaB0mJq9LmBoHgBY9MNAXYAKN=h8hCX+iph+D_5pY=Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] rtc: pcf85363: Add support for NXP pcf85263 rtc
To: Biju Das <biju.das@bp.renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Mon, Nov 19, 2018 at 12:23 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add support for NXP pcf85263 real-time clock. pcf85263 rtc is compatible
> with pcf85363,except that pcf85363 has additional 64 bytes of RAM.
>
> 1 byte of nvmem is supported and exposed in sysfs (# is the instance
> number,starting with 0): /sys/bus/nvmem/devices/pcf85263-#/nvmem
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/rtc/rtc-pcf85363.c
> +++ b/drivers/rtc/rtc-pcf85363.c
> @@ -311,7 +311,30 @@ static int pcf85363_nvram_write(void *priv, unsigned int offset, void *val,
>                                  val, bytes);
>  }
>
> -static const struct regmap_config regmap_config = {
> +static int pcf85263_nvram_read(void *priv, unsigned int offset, void *val,
> +                              size_t bytes)
> +{
> +       struct pcf85363 *pcf85363 = priv;
> +
> +       return regmap_read(pcf85363->regmap, CTRL_RAMBYTE, val);
> +}

AFAIU without reading the datasheet, the pcf85363 also has this RAMBYTE
register. Would it make sense to expose the contents on both parts?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
