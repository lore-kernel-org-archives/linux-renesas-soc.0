Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:44963 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388286AbeGXHvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 03:51:52 -0400
MIME-Version: 1.0
References: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com> <837a23c9-38d6-90af-ed0c-3ee2aaaa20f0@cogentembedded.com>
In-Reply-To: <837a23c9-38d6-90af-ed0c-3ee2aaaa20f0@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jul 2018 08:46:44 +0200
Message-ID: <CAMuHMdW0speMUdxPoT5edoY3PriX_uJjwAzbDN2kkCZwzaH1vw@mail.gmail.com>
Subject: Re: [PATCH 1/5] sh_eth: uninline sh_eth_tsu_get_offset()
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 8:10 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> sh_eth_tsu_get_offset() is called several  times  by the driver, remove
> *inline* and move  that function  from the header to the driver  itself
> to let gcc decide  whether to expand it inline or not...
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
