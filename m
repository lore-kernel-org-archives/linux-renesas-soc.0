Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41178 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394486AbeKWU2W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 15:28:22 -0500
MIME-Version: 1.0
References: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com> <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
In-Reply-To: <8cca22f7-dbd7-2da0-2f58-e490982d2f6c@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Nov 2018 10:44:37 +0100
Message-ID: <CAMuHMdXd0MXVYOPtxh0BVueDm7sU4P=YtKQogmeY4t=b-zwTQw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 22, 2018 at 7:39 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> There's quite often repeated sequence of a CPG register read-modify-write,
> so it seems worth factoring it out into a function -- this saves 68 bytes
> of the object code already (AArch64 gcc 4.8.5) and will save more with the
> next patches...
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
