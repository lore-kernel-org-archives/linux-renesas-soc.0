Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39111 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbeJ3WFy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Oct 2018 18:05:54 -0400
Received: by mail-lj1-f196.google.com with SMTP id a28-v6so8271940ljd.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Oct 2018 06:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20181021200002.1472-1-wsa+renesas@sang-engineering.com> <20181021200002.1472-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181021200002.1472-2-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Oct 2018 14:12:17 +0100
Message-ID: <CACRpkdaU8_0G5zmiXHpjLzvKQXUuqY_A0XUkGV0jOWaCfok8zg@mail.gmail.com>
Subject: Re: [PATCH 1/6] gpio: gpio-dwapb: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hoan Tran <hotran@apm.com>,
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
