Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:39269 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbeG3RJT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 13:09:19 -0400
Received: by mail-ua0-f194.google.com with SMTP id g18-v6so8111221uam.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 08:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <1532951531-29188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1532951531-29188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 17:33:35 +0200
Message-ID: <CAMuHMdVEMs6j-GVVQdUN5Hx8ExSHWcyKinLjU8eKCZOfzXBb8g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Enable PWM for Ebisu board
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Mon, Jul 30, 2018 at 1:55 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds PWM device nodes and enables PWM3 and PWM5 for
> R-Car E3 Ebisu board.

Thanks for your patch!

This is used for blacklight control, right?
It may be a good idea to mention that in the comments and/or patch
description.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
