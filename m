Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:35425 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbeINShl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 14:37:41 -0400
Received: by mail-vk1-f195.google.com with SMTP id w193-v6so1531606vke.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Sep 2018 06:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <87bm9aqdvs.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bm9aqdvs.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Sep 2018 15:22:59 +0200
Message-ID: <CAMuHMdVeWxyOAeFTA=U_EvJjdsMsmBfOLa9etnPR3h8AZ9_9NQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: renesas: convert to SPDX identifiers
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 7, 2018 at 5:02 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text on Renesas related headers.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20, with "clock: " added to the oneline
summary.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
