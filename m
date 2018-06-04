Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:35212 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750866AbeFDJBE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 05:01:04 -0400
MIME-Version: 1.0
In-Reply-To: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
References: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Jun 2018 11:01:03 +0200
Message-ID: <CAMuHMdXLKnjcHsGt5XS-XZLEXi8WprZvwHmYvUpFXmtq8XjOsw@mail.gmail.com>
Subject: Re: [PATCH 0/3] sh_eth: fix & clean up sh_eth_soft_swap()
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Sat, Jun 2, 2018 at 9:32 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Here's a set of 3 patches against DaveM's 'net-next.git' repo. First one fixes an
> old buffer endiannes issue (luckily, the ARM SoCs are smart enough to not actually
> care) plus couple clean ups around sh_eth_soft_swap()...
>
> [1/1] sh_eth: make sh_eth_soft_swap() work on ARM
> [2/3] sh_eth: uninline sh_eth_soft_swap()
> [3/3] sh_eth: use DIV_ROUND_UP() in sh_eth_soft_swap()

Does the swapping actually work?
In sh_eth_rx(), it's called before dma_unmap_single(), without calling
dma_sync_single_for_cpu() first.
Shouldn't it be called after the unmap instead?

In addition, why is it passed the dma_addr converted to virt, while the skb
address is available?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
