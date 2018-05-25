Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:43993 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935866AbeEYIMB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 04:12:01 -0400
MIME-Version: 1.0
In-Reply-To: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 May 2018 10:11:59 +0200
Message-ID: <CAMuHMdWNFH2SFFmpD-eGpCSgRTyWpgM7_acTgCbxbq+KagtsOA@mail.gmail.com>
Subject: Re: [PATCH 0/6] ravb/sh_eth: fix sleep in atomic by reusing shared
 ethtool handlers
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vladimir,

On Thu, May 24, 2018 at 1:11 PM, Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
> For ages trivial changes to RAVB and SuperH ethernet links by means of
> standard 'ethtool' trigger a 'sleeping function called from invalid
> context' bug, to visualize it on r8a7795 ULCB:
>
>   % ethtool -r eth0
>   BUG: sleeping function called from invalid context at kernel/locking/mutex.c:747

[...]

> Please note that sh_eth patches from the series were built-tested only.

Thanks you very much!

I've tested this on both R-Car M2-W (sh_eth) and R-Car H3 ES2.0 (ravb),
and the BUG disappeared.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
