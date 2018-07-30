Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:39109 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbeG3PZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 11:25:51 -0400
Received: by mail-oi0-f67.google.com with SMTP id d189-v6so21302471oib.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jul 2018 06:50:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180725113000.11014-1-geert+renesas@glider.be>
References: <20180725113000.11014-1-geert+renesas@glider.be>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 14:50:25 +0100
Message-ID: <CAFEAcA8jw0d5BOHx_vMBM32w194mb3rkLmUyo5t1zRhpApgJZQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/sysbus-fdt: Fix assertion in copy_properties_from_host()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Eric Auger <eric.auger@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 25 July 2018 at 12:30, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> When copy_properties_from_host() ignores the error for an optional
> property, it frees the error, but fails to reset it.
>
> Hence if two or more optional properties are missing, an assertion is
> triggered:
>
>     util/error.c:57: error_setv: Assertion `*errp == NULL' failed.
>
> Fis this by resetting err to NULL after ignoring the error.
>
> Fixes: 9481cf2e5f2f2bb6 ("hw/arm/sysbus-fdt: helpers for clock node generation")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied to target-arm.next for 3.0.

-- PMM
