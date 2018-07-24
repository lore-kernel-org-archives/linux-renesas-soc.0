Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:33465 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388293AbeGXHxQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 03:53:16 -0400
MIME-Version: 1.0
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com> <ccec4eaa-89e8-76be-e5c2-874fcde0b223@cogentembedded.com>
In-Reply-To: <ccec4eaa-89e8-76be-e5c2-874fcde0b223@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jul 2018 08:48:08 +0200
Message-ID: <CAMuHMdX4G_Q9TCrc4yGAj0H7W7ymU8HSkT_d=AzN=D6tZi81Dw@mail.gmail.com>
Subject: Re: [PATCH 2/5] sh_eth: make sh_eth_tsu_get_offset() match its name
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 8:11 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> sh_eth_tsu_get_offset(), despite its name, returns a TSU register's address,
> not its offset.  Make this  function match its name and return a register's
> offset  from the TSU  registers base address instead.
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
