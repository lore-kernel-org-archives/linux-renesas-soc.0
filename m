Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:35871 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756625AbcLAOsS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 09:48:18 -0500
Received: by mail-wj0-f194.google.com with SMTP id jb2so26651027wjb.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Dec 2016 06:47:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1480602354-1446-1-git-send-email-horms+renesas@verge.net.au>
References: <1480602354-1446-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2016 15:47:57 +0100
Message-ID: <CAMuHMdUHBh-=nu3HqqwNq-f5QauAFAAHRS4TUYW10zP4BJMhvg@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM, arm64: dts: Use usb-phy fallback bindings
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 1, 2016 at 3:25 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> this short series makes use of fallback bindings for Renesas R-Car PHY
> drivers in the DT of SoCs which already use those drivers.
>
> Simon Horman (4):
>   ARM: dts: r8a7790: Use renesas,rcar-gen2-usb-phy fallback binding
>   ARM: dts: r8a7791: Use renesas,rcar-gen2-usb-phy fallback binding
>   ARM: dts: r8a7794: Use renesas,rcar-gen2-usb-phy fallback binding
>   arm64: dts: r8a7795: Use renesas,rcar-gen3-usb2-phy fallback binding

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
