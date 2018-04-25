Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:33103 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbeDYJNY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Apr 2018 05:13:24 -0400
Received: by mail-ua0-f194.google.com with SMTP id i2so697784uah.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Apr 2018 02:13:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1524644410-12465-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524644410-12465-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524644410-12465-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Apr 2018 11:13:23 +0200
Message-ID: <CAMuHMdUZ7p+9Qb9F37EdOz_C4HaMzVkW1ahHtaKUDAD4iw8nQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77990: Revise the cache
 controller node
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 25, 2018 at 10:20 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> The cache controller node should not have unit-addresses and reg
> properties. So, this patch revises them.
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
