Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35849 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdIMJMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Sep 2017 05:12:51 -0400
MIME-Version: 1.0
In-Reply-To: <1505285329-6881-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1505285329-6881-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2017 11:12:50 +0200
Message-ID: <CAMuHMdUana3UV90L3ShVUjWRpsW1qtrAD+EvN-9BLjsRfZ2rzg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Add r8a77995 (R-Car D3) support
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 13, 2017 at 8:48 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds binding for r8a77995 (R-Car D3). This SoC can use
> "renesas,rcar-gen3-gpio" fallback compatibility. So, this patch
> doesn't modify the gpio-rcar driver.
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
