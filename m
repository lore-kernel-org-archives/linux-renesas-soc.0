Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:36016 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936258AbdD1Htk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Apr 2017 03:49:40 -0400
Received: by mail-io0-f172.google.com with SMTP id p80so53326776iop.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Apr 2017 00:49:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170425183210.30594-3-marek.vasut+renesas@gmail.com>
References: <20170425183210.30594-1-marek.vasut+renesas@gmail.com> <20170425183210.30594-3-marek.vasut+renesas@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Apr 2017 09:49:37 +0200
Message-ID: <CACRpkdbpQ=Q6zt8uzfDCvOUU40S5aEvbvNd4OP4uVwBzQJhzQQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 25, 2017 at 8:32 PM, Marek Vasut <marek.vasut@gmail.com> wrote:

> Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
> This block is pretty trivial and supports setting GPIO direction
> as Input/Output and in case of Output, supports setting value.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> V2: Use linux/gpio/driver.h instead of linux/gpio.h

I applied this for v4.12 to bring down the number of deps in
v4.13. The guarding symbol makes it not compile until the MFD
patch is there, the MFD_BD9571MWV is unlikely to change,
and Marek will certainly go through with the driver submission.

Yours,
Linus Walleij
