Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36292 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752521AbdHNJpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 05:45:44 -0400
MIME-Version: 1.0
In-Reply-To: <20170717204512.7075-1-marek.vasut+renesas@gmail.com>
References: <20170717204512.7075-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2017 11:45:43 +0200
Message-ID: <CAMuHMdV3d-0GHaZ4x8u20niHYjf3UiPow88K7wSW3rtrdjrpSQ@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] mfd: Add ROHM BD9571MWV-M PMIC DT bindings
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marek,

You forgot to CC Lee (added ;-)

On Mon, Jul 17, 2017 at 10:45 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Add DT bindings for the ROHM BD9571MWV-M PMIC. This PMIC has
> the following features:
> - multiple voltage monitors for 1V8, 2V5, 3V3 voltage rail
> - one voltage regulator for DVFS
> - two GPIOs
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-renesas-soc@vger.kernel.org
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> V2: - Drop the compatible = "regulator-fixed" from the binding example,
>       it should not be there.
>     - List the VD09 regulator
> V3: Replace bd9571@30 with pmic@30
> V4: No changes
> ---
>  .../devicetree/bindings/mfd/bd9571mwv.txt          | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt

Anyway, as there were no changes in V4, Lee can just apply V3, for which he
was CCed.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
