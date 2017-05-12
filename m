Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33126 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753603AbdELL6h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2017 07:58:37 -0400
Received: by mail-it0-f65.google.com with SMTP id l145so4837401ita.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 May 2017 04:58:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lgq39bt4.wl%kuninori.morimoto.gx@renesas.com>
References: <87o9uz9bv5.wl%kuninori.morimoto.gx@renesas.com> <87lgq39bt4.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2017 13:58:35 +0200
Message-ID: <CAMuHMdWL+eXnrQggiY6PxW5ryOVb9X_8D_5_NFgq5h1vgH+qCw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pinctrl: sh-pfc: r8a7796: add Audio SSI pin support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Fri, May 12, 2017 at 2:13 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But before I queue it in sh-pfc-for-v4.13, I would like to have a
clarification.

> +static const unsigned int ssi34_ctrl_pins[] = {
> +       /* SCK, WS */
> +       RCAR_GP_PIN(6, 5), RCAR_GP_PIN(6, 6),
> +};
> +static const unsigned int ssi34_ctrl_mux[] = {
> +       SSI_SCK34_MARK, SSI_WS34_MARK,
> +};

I'm a bit confused by this group: in the R-Car M3 Pin Function Rev. 0.54
sheet, these are named SCK349 resp. WS349. According to the history, the
change from {SCK,WS}34 to {SCK,WS}349 was made at the same time as the
change from {SCK,WS}0129 to {SCK,WS}01239.
However, the former change is not reflected in the PFC section of the
Hardware User's Manual.

So which is correct: {SCK,WS}34 or {SCK,WS}349?

Can you please enlighten me?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
