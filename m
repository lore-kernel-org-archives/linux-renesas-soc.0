Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36144 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbdEPI0h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 04:26:37 -0400
Received: by mail-it0-f66.google.com with SMTP id z15so12767505ite.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2017 01:26:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87r2zpw7xt.wl%kuninori.morimoto.gx@renesas.com>
References: <87r2zpw7xt.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2017 10:26:35 +0200
Message-ID: <CAMuHMdXz17MnKPrkL03AGHgOOS=if5WrhU=SKSdtkekUezGMYw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795-es1: SSI_{WS/SCK}34 -> SSI_{WS/SCK}349
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Tue, May 16, 2017 at 10:01 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> R-Car Gen3 is using SSI_{WS/SCK}_349 instead of SSI_{WS/SCK}_34.
> But, current code is based on old datasheet which had typo.
> This patch fixes this typo.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

You forgot to change the string in ssi_groups[], like below?

@@ -4509,7 +4509,7 @@ static const char * const ssi_groups[] = {
        "ssi2_ctrl_a",
        "ssi2_ctrl_b",
        "ssi3_data",
-       "ssi34_ctrl",
+       "ssi349_ctrl",
        "ssi4_data",
        "ssi4_ctrl",
        "ssi5_data",

Without that change, it won't work.

If you care about backwards compatibility (I thought you didn't?),
you have to keep the string "ssi34_ctrl", and add "ssi349_ctrl",
and add an open-coded entry in pinmux_group[]  like:

    {
        .name = "ssi34_ctrl",
        .pins = ssi349_pins,
        .mux = ssi349_mux,
        .nr_pins = ARRAY_SIZE(ssi349_pins),
    }

Or add a new macro SH_PFC_PIN_GROUP_ALIAS(n, alias).

The same comment applies to pfc-r8a7796.c.

If the intention was to change the string, I can make that change myself,
no need to resent.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
