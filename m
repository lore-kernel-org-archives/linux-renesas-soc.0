Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:45661 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751982AbeFZHZw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jun 2018 03:25:52 -0400
MIME-Version: 1.0
References: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com> <d2b67329-7bed-80e2-76e8-d0514f8545ae@cogentembedded.com>
In-Reply-To: <d2b67329-7bed-80e2-76e8-d0514f8545ae@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Jun 2018 09:25:41 +0200
Message-ID: <CAMuHMdWJLR1FKtmLKAU-1omFui3fb_kSsm7M1minvRYEKYQVwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] sh_eth: remove sh_eth_cpu_data::rpadir_value
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 25, 2018 at 10:38 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> If RPADIR exists, the value written to it is always the same for all SoCs
> (and derived from NET_IP_ALIGN), so there has not  been any need to store
> it in the *struct* sh_eth_cpu_data...
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
