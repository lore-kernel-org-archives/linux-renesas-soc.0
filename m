Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33146 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbeJ3WSf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 18:18:35 -0400
Received: by mail-lf1-f65.google.com with SMTP id i26so4521909lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Oct 2018 06:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com> <20181021200032.1833-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200032.1833-6-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Oct 2018 14:24:46 +0100
Message-ID: <CACRpkdYVa=0JOkRT=sm-eB+NSMGjHyWAzzZrc6UY8jdYRpuOtw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: pinctrl-at91-pio4: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 21, 2018 at 10:00 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch applied with the acks.

Yours,
Linus Walleij
