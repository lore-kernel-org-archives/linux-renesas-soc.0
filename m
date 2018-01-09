Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:37486 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756670AbeAIOf5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jan 2018 09:35:57 -0500
Received: by mail-io0-f172.google.com with SMTP id n14so18739216iob.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jan 2018 06:35:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180109113554.4337-1-wsa@the-dreams.de>
References: <20180109113554.4337-1-wsa@the-dreams.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jan 2018 15:35:56 +0100
Message-ID: <CACRpkdZoVogFA+xHruC_cD5==NBgndeTAE5-v2vyaEQGMeajGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: correct docs about return value of gpiod_get_direction
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 9, 2018 at 12:35 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> The use of the GPIOF_* flags is deprecated, so don't advertise them
> here. Document the plain numbers for now until we have a better
> solution.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Patch applied.

Yours,
Linus Walleij
