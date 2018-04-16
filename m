Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35513 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754633AbeDPJLL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Apr 2018 05:11:11 -0400
Received: by mail-wr0-f194.google.com with SMTP id w3so7163477wrg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Apr 2018 02:11:10 -0700 (PDT)
Date: Mon, 16 Apr 2018 10:11:06 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] backlight: pwm_bl: don't use GPIOF_* with
 gpiod_get_direction
Message-ID: <20180416091106.lg7nesbqvfeehuzq@dell>
References: <20180114210711.13863-1-wsa+renesas@sang-engineering.com>
 <20180114210711.13863-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180114210711.13863-4-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, 14 Jan 2018, Wolfram Sang wrote:

> The documentation was wrong, gpiod_get_direction() returns 0/1 instead
> of the GPIOF_* flags. The docs were fixed with commit 94fc73094abe47
> ("gpio: correct docs about return value of gpiod_get_direction"). Now,
> fix this user (until a better, system-wide solution is in place).
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Only build tested!
> 
>  drivers/video/backlight/pwm_bl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied with Daniel and Simon's Acks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
