Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:44633 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751559AbeBSIj5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:39:57 -0500
MIME-Version: 1.0
In-Reply-To: <0531592f-d845-d6b6-dbd4-bf01515b308c@cogentembedded.com>
References: <0531592f-d845-d6b6-dbd4-bf01515b308c@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 09:39:56 +0100
Message-ID: <CAMuHMdW+oJgOMxV7D8gaPminy8S+eA4mWMo9KTvZzQtC4Hd73Q@mail.gmail.com>
Subject: Re: [PATCH] sh_eth: simplify sh_eth_check_reset()
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Feb 18, 2018 at 4:21 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The *while* loop in this function  can be turned into a normal *for* loop.
> And getting rid  of the  single return point saves us a few more LoCs...
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
