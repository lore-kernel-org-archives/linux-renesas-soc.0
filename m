Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:41868 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932083AbeEWM1C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 08:27:02 -0400
MIME-Version: 1.0
In-Reply-To: <20180523122140.6275-1-marek.vasut+renesas@gmail.com>
References: <20180523122140.6275-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 May 2018 14:27:00 +0200
Message-ID: <CAMuHMdV3xNeDc8sQBfQ0ybhMYZYjXWMc8sbemGdb-kkvQDSs9g@mail.gmail.com>
Subject: Re: [PATCH V2] mfd: dt: Add bindings for DA9063L
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 23, 2018 at 2:21 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> Add device tree bindings for the Dialog DA9063L. This is a
> variant of the DA9063 chip with smaller package, with less
> LDO regulators and without RTC block. The other properties
> of the chip are the same, including the content of the chip
> ID register.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

(again)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
