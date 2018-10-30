Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36440 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbeJ3WQk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 18:16:40 -0400
Received: by mail-lf1-f66.google.com with SMTP id h192so8855227lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Oct 2018 06:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com> <20181021200032.1833-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200032.1833-2-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Oct 2018 14:22:59 +0100
Message-ID: <CACRpkdai_bEJ8K=Bo0KeARS=KF5BP4C8B0fGGAJQFZ6RMZRRsw@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: intel: pinctrl-baytrail: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>
for all 3 Intel patches

Andy is collecting Intel pin control patches so he will
pick these 3 up I think, let me know if all works out!

Yours,
Linus Walleij
