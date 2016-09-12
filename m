Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36012 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756592AbcILIgA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2016 04:36:00 -0400
MIME-Version: 1.0
In-Reply-To: <1473421394-9745-6-git-send-email-bd-phuc@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp> <1473421394-9745-6-git-send-email-bd-phuc@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Sep 2016 10:35:59 +0200
Message-ID: <CAMuHMdWLtcHHw+nmKKN3j4yqkncsh3YwDu-yGEwqg3Du4-kncg@mail.gmail.com>
Subject: Re: [PATCH 5/8] clk: renesas: r8a7796: Add CMT clocks
To: PhucBui <bd-phuc@jinso.co.jp>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 9, 2016 at 1:43 PM,  <bd-phuc@jinso.co.jp> wrote:
> From: Bui Duc Phuc <bd-phuc@jinso.co.jp>
>
> This patch adds CMT module clocks for r8a7796 SoC.
>
> Signed-off-by: Bui Duc Phuc <bd-phuc@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

(will queue in clk-renesas-for-v4.9)

> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -97,6 +97,10 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
> +       DEF_MOD("cmt3",                  300,   R8A7796_CLK_R),
> +       DEF_MOD("cmt2",                  301,   R8A7796_CLK_R),
> +       DEF_MOD("cmt1",                  302,   R8A7796_CLK_R),
> +       DEF_MOD("cmt0",                  303,   R8A7796_CLK_R),

BTW, I've dropped the spaces before the TABs (also in the r8a7795 patch).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
