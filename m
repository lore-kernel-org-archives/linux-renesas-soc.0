Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:36502 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752298AbcL1Adz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2016 19:33:55 -0500
Received: by mail-qk0-f172.google.com with SMTP id n21so227826893qka.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2016 16:33:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161208173228.16835-3-niklas.soderlund+renesas@ragnatech.se>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se> <20161208173228.16835-3-niklas.soderlund+renesas@ragnatech.se>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2016 01:33:54 +0100
Message-ID: <CACRpkdaH18FiG2aduYJVprKjwTqkuXiwzywHwWAhdY6Ta6Y8Uw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Fine-grained Runtime PM support
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 8, 2016 at 6:32 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:

> From: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Currently gpio modules are runtime-resumed at probe time. This means the
> gpio module will be active all the time (except during system suspend,
> if not configured as a wake-up source).
>
> While an R-Car Gen2 gpio module retains pins configured for output at
> the requested level while put in standby mode, gpio register cannot be
> accessed while suspended.  Unfortunately pm_runtime_get_sync() cannot be
> called from all contexts where gpio register access is needed. Hence
> move the Runtime PM handling from probe/remove time to gpio request/free
> time, which is probably the best we can do.
>
> On r8a7791/koelsch, gpio modules 0, 1, 3, and 4 are now suspended during
> normal use (gpio2 is used for LEDs and regulators, gpio5 for keys, gpio6
> for SD-Card CD & WP, gpio7 for keys and regulators).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> [Niklas: s/gpio_to_priv(chip)/gpiochip_get_data(chip)/]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Patch applied.

Yours,
Linus Walleij
