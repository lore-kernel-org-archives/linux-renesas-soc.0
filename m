Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:35114 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753074AbeDQNLL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 09:11:11 -0400
MIME-Version: 1.0
In-Reply-To: <20180417085030.32650-2-horms+renesas@verge.net.au>
References: <20180417085030.32650-1-horms+renesas@verge.net.au> <20180417085030.32650-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 15:11:09 +0200
Message-ID: <CAMuHMdUdgSr5+rWijSmsg8DWGO8AXvD59D7YDT-wDyutHcS5Ww@mail.gmail.com>
Subject: Re: [PATCH/RFC net-next 1/5] ravb: fix inconsistent lock state at
 enabling tx timestamp
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masaru Nagai <masaru.nagai.vx@renesas.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Apr 17, 2018 at 10:50 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
>
> [   58.490829] =================================
> [   58.495205] [ INFO: inconsistent lock state ]
> [   58.499583] 4.9.0-yocto-standard-00007-g2ef7caf #57 Not tainted

Can this be triggered on contemporary kernels, too?

> [   58.505529] ---------------------------------
> [   58.509904] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
