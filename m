Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35838 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753573AbdBMPhW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 10:37:22 -0500
Received: by mail-oi0-f67.google.com with SMTP id x84so7884934oix.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2017 07:37:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1486999144-23537-1-git-send-email-horms+renesas@verge.net.au>
References: <1486999144-23537-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Feb 2017 16:37:21 +0100
Message-ID: <CAMuHMdXrhGpg7eQ1JyfnKsSWH5MVrSpDwQoHAzGMBLQU4LkXCw@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] ravb: Support 1Gbps on R-Car H3
 ES1.1+ and R-Car M3-W
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Feb 13, 2017 at 4:19 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> this series adds support for gigabit communication to the Renesas EthernetAVB
> controller when used in conjunction with  R-Car Gen3 H3 ES1.1+ and M3-W SoCs.
> Gigabit is already supported with R-Car Gen 2 SoCs.
>
> These patches are now include in net-next and expected to appear in v4.11.

Doh, at first I missed the line above...

> The base of the series is the head of next-next at the time the patches
> were submitted for inclusion there.
>
>
> The following changes since commit 158f323b9868b59967ad96957c4ca388161be321:
>
>   net: adjust skb->truesize in pskb_expand_head() (2017-01-27 12:03:29 -0500)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/ravb-gigabit-driver-v2
>
> for you to fetch changes up to 3c409b068cdc2e9f59982b735b081aaa98f648c9:
>
>   ravb: Support 1Gbps on R-Car H3 ES1.1+ and R-Car M3-W (2017-01-27 20:44:19 +0100)

So this is a no-op for me, as net-next is part of renesas-drivers anyway.
Good ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
