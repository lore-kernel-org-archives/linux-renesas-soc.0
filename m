Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:35995 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751589AbeD3Gl2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 02:41:28 -0400
Received: by mail-io0-f173.google.com with SMTP id d73-v6so9111302iog.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Apr 2018 23:41:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180429184104.6680-1-wsa+renesas@sang-engineering.com>
References: <20180429184104.6680-1-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Apr 2018 08:41:27 +0200
Message-ID: <CACRpkdZ2A3dc_T9k3=Vrc29Rhi2M7o2jSb+3y91sTEOfx6zLCA@mail.gmail.com>
Subject: Re: [PATCH] i2c: busses: remove superfluous ignoring of children for RPM
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Apr 29, 2018 at 8:41 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> These days, the I2C core ensures that the embedded adapter device
> ignores the PM states of its children already. Because the adapter
> device is an opaque logical device, there is no need for drivers to
> repeat that again.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
