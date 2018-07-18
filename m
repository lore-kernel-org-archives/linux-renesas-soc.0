Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:42228 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbeGRJ3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 05:29:47 -0400
Received: by mail-vk0-f65.google.com with SMTP id t4-v6so2074429vke.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jul 2018 01:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <1531889654-24918-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1531889654-24918-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jul 2018 10:52:42 +0200
Message-ID: <CAMuHMdX0fQazP=qFdMey+Xdw1QDBLAK=onti5CfN_6SjZQJYOQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Enable USB3.0 host for
 Ebisu board
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 18, 2018 at 6:55 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds and USB3.0 host device node and enable it for
> R-Car E3 Ebisu board.
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
