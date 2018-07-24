Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:34857 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388281AbeGXH4F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 03:56:05 -0400
MIME-Version: 1.0
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com> <1b60d8c8-e06f-6bff-df06-9b1cbe953340@cogentembedded.com>
In-Reply-To: <1b60d8c8-e06f-6bff-df06-9b1cbe953340@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jul 2018 08:50:57 +0200
Message-ID: <CAMuHMdV0BPa3GZ+5hyYE7t9w4t9D-nDSoNdyg3UNQaOidkmfAw@mail.gmail.com>
Subject: Re: [PATCH 4/5] sh_eth: make sh_eth_tsu_write_entry() take 'offset' parameter
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 8:15 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> We can add the TSU register base address to a TSU register offset right
> in sh_eth_tsu_write_entry(),  no need to do it in its callers...
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
