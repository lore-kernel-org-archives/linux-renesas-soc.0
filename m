Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35575 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbeH1M4m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 08:56:42 -0400
Received: by mail-ua1-f68.google.com with SMTP id m26-v6so535030uap.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Aug 2018 02:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <1535086349-10657-1-git-send-email-na-hoan@jinso.co.jp> <1535086349-10657-3-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1535086349-10657-3-git-send-email-na-hoan@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Aug 2018 11:05:49 +0200
Message-ID: <CAMuHMdUuJb3JS1VoiMp2VoifYuYJoexYQMKTpp8+7LmxS0891Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r8a77965: Add FDP clock
To: Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hoan,

On Fri, Aug 24, 2018 at 6:52 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>
> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
> @@ -112,6 +112,7 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
> +       DEF_MOD("fdp0",                 119,    R8A77965_CLK_S0D1),

In the datasheet, and in drivers for other SoCs, this clock is called fdp1-0.

>         DEF_MOD("scif5",                202,    R8A77965_CLK_S3D4),
>         DEF_MOD("scif4",                203,    R8A77965_CLK_S3D4),
>         DEF_MOD("scif3",                204,    R8A77965_CLK_S3D4),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue in clk-renesas-for-v4.20, with the clock name fixed, and a commit
message added (stolen from the r8a7796 commit ;-).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
