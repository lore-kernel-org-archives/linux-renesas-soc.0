Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:43773 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751381AbeBTSBO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Feb 2018 13:01:14 -0500
Received: by mail-qk0-f195.google.com with SMTP id i184so17524987qkf.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Feb 2018 10:01:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1518791104-13928-4-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518791104-13928-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1518791104-13928-4-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 19:01:13 +0100
Message-ID: <CAMuHMdWwBxRiP4PSvY7cPYPcBt9Jf+ADC-UCsyqOdYRy+q4E_w@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL
 register pin assignment for NDFC pins group
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 16, 2018 at 3:25 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch fixes to set IPSR and MOD_SEL when using NFDATA{14,15}_A and
> NF{RB,WP}_N_A pin function is selected. And renamess MOD_SEL2 bit22 value
> definition name to SEL_NDFC.
>
> This is a correction to the incorrect implementation of MOD_SEL register
> pin assignment for R8A7796 SoC specification of R-Car Gen3 Hardware
> User's Manual Rev.0.53E.
>
> Fixes: f9aece7344bd ("pinctrl: sh-pfc: Initial R8A7796 PFC support")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
and queueing in sh-pfc-for-v4.17.

I guess this applies to M3-N, too?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
