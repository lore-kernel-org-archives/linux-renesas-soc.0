Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34062 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752282AbdHPJSu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 05:18:50 -0400
MIME-Version: 1.0
In-Reply-To: <1502281187-24068-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1502281187-24068-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2017 11:18:49 +0200
Message-ID: <CAMuHMdVRWa9uRLHoABXsYbTMke7sEX_bkT8mXFw2CRFnaXQpxA@mail.gmail.com>
Subject: Re: [PATCH 1/8] pinctrl: sh-pfc: Add PORT_GP_{10,2[01]} helper macros
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Wed, Aug 9, 2017 at 2:19 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This follows the style of existion PORT_GP_X macros and
> will be used by a follow-up patch for the r8a77995 SoC.

Apparently PORT_GP_20 won't be used by the follow-up patches ;-)
But I don't care...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
