Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:51292 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731902AbeG2XFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Jul 2018 19:05:30 -0400
Received: by mail-it0-f67.google.com with SMTP id e14-v6so14667937itf.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Jul 2018 14:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
 <20180712155152.lbpsbd6b5ai73bd6@ninjato> <20180725202005.lflrjvz4aubqskq7@tetsubishi>
In-Reply-To: <20180725202005.lflrjvz4aubqskq7@tetsubishi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 29 Jul 2018 23:33:08 +0200
Message-ID: <CACRpkdY2OyDqCOvwr_oPRdrh1VMnvD2e=eawyaKCNbQHfFAq4g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not available
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 25, 2018 at 10:20 PM Wolfram Sang <wsa@the-dreams.de> wrote:

> > That all being said, I think this patch is still useful as is.
>
> Linus, do you have time to comment on this?

This looks like a good solution to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
