Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:35954 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751183AbeFDIzt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 04:55:49 -0400
MIME-Version: 1.0
In-Reply-To: <995798f8-69e0-6471-8eca-eefc420dbe21@cogentembedded.com>
References: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com> <995798f8-69e0-6471-8eca-eefc420dbe21@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Jun 2018 10:55:47 +0200
Message-ID: <CAMuHMdVokJND6mCkXVKzHkEg9aSDjyX4=JGvPd1v88vjxdkp2A@mail.gmail.com>
Subject: Re: [PATCH 3/3] sh_eth: use DIV_ROUND_UP() in sh_eth_soft_swap()
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jun 2, 2018 at 9:40 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> When initializing 'maxp' in sh_eth_soft_swap(), the buffer length needs
> to be rounded  up -- that's just asking for DIV_ROUND_UP()!
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
