Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35926 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730393AbeGYWGW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 18:06:22 -0400
Received: by mail-it0-f65.google.com with SMTP id p81-v6so10571148itp.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jul 2018 13:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180723202617.15230-1-wsa+renesas@sang-engineering.com> <20180723202617.15230-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180723202617.15230-8-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jul 2018 22:52:46 +0200
Message-ID: <CACRpkda26LhGi3_LBqMjA+oHNNdNa5NHkpvE4Sk6OdP_uH9-gQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] i2c: stu300: use core to detect 'no zero length' quirk
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 10:26 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> And don't reimplement in the driver.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
