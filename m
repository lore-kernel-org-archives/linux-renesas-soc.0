Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:36530 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbeFZQTI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jun 2018 12:19:08 -0400
MIME-Version: 1.0
References: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com> <e67e6256-4ae9-4527-d482-cf3bb50921cf@cogentembedded.com>
In-Reply-To: <e67e6256-4ae9-4527-d482-cf3bb50921cf@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Jun 2018 18:18:56 +0200
Message-ID: <CAMuHMdWo2GCYDhuHaprvjBS2q0UH0b9SVbfck2nMn9mONBSYYg@mail.gmail.com>
Subject: Re: [PATCH net-next] sh_eth: fix *enum* {A|M}PR_BIT
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 26, 2018 at 5:43 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The *enum* {A|M}PR_BIT were declared in the commit 86a74ff21a7a ("net:
> sh_eth: add support for  Renesas SuperH Ethernet") adding SH771x support,
> however the SH771x manual  doesn't have the APR/MPR registers described
> and the code writing to them for SH7710 was later removed by the commit
> 380af9e390ec ("net: sh_eth: CPU dependency code collect to "struct
> sh_eth_cpu_data""). All the newer SoC manuals have these registers
> documented as having a 16-bit TIME parameter of the PAUSE frame, not
> 1-bit -- update the *enum* accordingly, fixing up the APR/MPR writes...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
