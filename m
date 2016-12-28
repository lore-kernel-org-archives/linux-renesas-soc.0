Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:34078 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752395AbcL1Ab6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2016 19:31:58 -0500
Received: by mail-qk0-f171.google.com with SMTP id h201so93338120qke.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2016 16:31:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se> <20161208173228.16835-2-niklas.soderlund+renesas@ragnatech.se>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 28 Dec 2016 01:31:56 +0100
Message-ID: <CACRpkdanbF844hBqSTArUUkR+=DqyAt5TE7ee+KxNGOqKiqyrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: rcar: set IRQ chip parent_device
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 8, 2016 at 6:32 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:

> This enables Runtime PM handling for interrupts.
>
> By setting the parent_device in struct irq_chip genirq will call the
> pm_runtime_get/put APIs when an IRQ is requested/freed.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Patch applied with the ACKs.

Yours,
Linus Walleij
