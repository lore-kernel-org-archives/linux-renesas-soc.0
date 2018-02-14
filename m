Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:36036 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967060AbeBNKFp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 05:05:45 -0500
MIME-Version: 1.0
In-Reply-To: <1518589412-7330-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1518589412-7330-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1518589412-7330-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2018 11:05:44 +0100
Message-ID: <CAMuHMdXPopMWM5DGUOG+A8XpE5ZYGds70HXXzkfx-eAbu2=eGQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: defconfig: Enable USB 3.0 peripheral for R-Car
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Feb 14, 2018 at 7:23 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Enable the R-Car's USB 3.0 peripheral controller.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
