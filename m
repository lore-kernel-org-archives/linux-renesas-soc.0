Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42327 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbeJ3WIw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 18:08:52 -0400
Received: by mail-lj1-f196.google.com with SMTP id f3-v6so11299881ljk.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Oct 2018 06:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20181021200002.1472-1-wsa+renesas@sang-engineering.com> <20181021200002.1472-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200002.1472-4-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Oct 2018 14:15:14 +0100
Message-ID: <CACRpkdb0fkqK5fVKhN4+QDbO=6ex4V0kwXgERVCua7NSOjfWqw@mail.gmail.com>
Subject: Re: [PATCH 3/6] gpio: gpio-mxc: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

Patch applied for v4.21.

Yours,
Linus Walleij
