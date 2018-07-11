Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:37435 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbeGKMsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 08:48:04 -0400
Received: by mail-vk0-f66.google.com with SMTP id h22-v6so14310343vke.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jul 2018 05:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <1531298906-8363-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1531298906-8363-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jul 2018 14:43:42 +0200
Message-ID: <CAMuHMdVjgxGuOz1HD8CkV4_BTNLd6MMoDcwnT=wufUabx48hvQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Unify the labels for RWDT
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 11, 2018 at 10:49 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The labels for RWDT device node were named as 2 types now:
>
>  - wdt0: r8a7795, r8a7796, r8a77965.
>  - rwdt: r8a77970, r8a77990, r8a77995.
>
> To be made consistent, this patch unifis the labels as the hardware
> name "rwdt".
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
