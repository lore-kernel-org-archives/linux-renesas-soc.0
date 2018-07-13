Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:52673 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbeGMJKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 05:10:08 -0400
Received: by mail-it0-f65.google.com with SMTP id p4-v6so10580353itf.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jul 2018 01:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180712091501.22344-1-geert+renesas@glider.be>
In-Reply-To: <20180712091501.22344-1-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 13 Jul 2018 10:56:14 +0200
Message-ID: <CACRpkdZOfS39Aw2gAOjji7-H43H29NcsWmWm=S=MetUoBrj7Sw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Implement .get_direction() callback
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 12, 2018 at 11:31 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Allow gpiolib to read back the current I/O direction configuration by
> implementing the .get_direction() callback.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied with the tags!

Yours,
Linus Walleij
