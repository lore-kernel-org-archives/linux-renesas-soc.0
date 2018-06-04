Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:39242 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751787AbeFDIu3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 04:50:29 -0400
MIME-Version: 1.0
In-Reply-To: <a1eb21c8-ab44-3022-b239-0b5c33691d3b@cogentembedded.com>
References: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com> <a1eb21c8-ab44-3022-b239-0b5c33691d3b@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Jun 2018 10:50:27 +0200
Message-ID: <CAMuHMdWYSRin9OkTbbvABJkp++o8xkWkfWzq=jQXvKPeVV6h1Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] sh_eth: uninline sh_eth_soft_swap()
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jun 2, 2018 at 9:38 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> sh_eth_tsu_soft_swap() is called twice by the driver, remove *inline* and
> move  that function  from the header to the driver itself to let gcc decide
> whether to expand it inline or not...
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
