Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C1DC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 10:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E20E1205C9
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 10:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3Fap8JH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbfDDKDH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 06:03:07 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41730 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbfDDKDH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 06:03:07 -0400
Received: by mail-lf1-f65.google.com with SMTP id 10so1318463lfr.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Apr 2019 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kB0pW83Wfd87F2zNEfu+hir2IavZaEEYeVfUgfDdx7E=;
        b=E3Fap8JHugYjevR6easa7XPuP6W3c6tTkEjJAuy0wT5ZMrqIzZGOV6OKBOHmeEszRo
         4t/Vfz7ANHpyCA4ythE+IrIsMZXIr1hI85xuLwCzIlXYry0qMNdAHvo+VP4L/56BB+Yd
         TCMXL+DYj3zSz1XhJQVJIVXdu1X9xlTE+BfYpQqQz9TwkN5svOy7c4yj4FD6S12YzNev
         h2DNGmHXPhqUILdmtwuj+oOduyw46UMdbbK920cpsfYfydoB1m4MIJd/cS2fL+hJdo1K
         WVBA8P8oWoph4DgkTKp24Uck8LvbcOC72rz1HhDdlII3wTXjKeoKkRZbihUttYpqXkn2
         xaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kB0pW83Wfd87F2zNEfu+hir2IavZaEEYeVfUgfDdx7E=;
        b=IRo3LuHE9f5aV8gphlE2/Xa5L5Ir28X0Sl1ckZ3/e308tO8O3VhoJLSw79/qUIVtOx
         5f3HwKhbDdCLdeUvOqkab+DMH87TKaZBVoNNIlLB1sDa7FceQxQ90pTmDAcNA5rm2z4b
         a4siMz832vfj3tBET4eNVIwMRIJok1ZGGJIaSSRMt9pHgU+xjWZipJZCQIjbAo2uW/9a
         M9w6l96/55kbtw/pg6Mccwmin+AOCKUhNjtVoARRiPzOt6YTHyBqPzpyHB4YVdjSnsuA
         USKqxHZR5uV+z2elMH9RyMoAdK2AjuZmCjWYFy9uSJytzhj5Qc2cAQ2ki7NR6KMWgLEX
         dy0g==
X-Gm-Message-State: APjAAAUxd2HsCz98mu8TldfA7pPtD85qxGvgODvcyCYYnhLzXklEzTaZ
        vazC713Cn6Tkdp3YjRHrM0PMjuRGLWhShGm9iR4ljA==
X-Google-Smtp-Source: APXvYqwkhjC4GfMhjSxOzTwV49f/tWFCzIF94aiSj2yfqvNHjoj8NdKsjQ6zrxkSQYojpiJJ6YVByS6usIDkAcCCpaU=
X-Received: by 2002:ac2:491a:: with SMTP id n26mr2621099lfi.122.1554372185139;
 Thu, 04 Apr 2019 03:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190403150852.8002-1-geert+renesas@glider.be>
In-Reply-To: <20190403150852.8002-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Apr 2019 17:02:53 +0700
Message-ID: <CACRpkdY-hgGAnLexxurTVJaHarmXUrN24YJTCFJcue5h5gnzkg@mail.gmail.com>
Subject: Re: [PATCH] spi: sh-msiof: Convert to use GPIO descriptors
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 3, 2019 at 10:08 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Convert GPIO chip selects in the Renesas MSIOF SPI driver from legacy
> GPIO numbers to GPIO descriptors.
>
> Notes:
>   - The board file for the SH7724-based Ecovec24 development board now
>     registers a GPIO descriptor lookup, instead of passing a GPIO number
>     through controller_data,
>   - sh_msiof_get_cs_gpios() must release all GPIOs, else
>     spi_get_gpio_descs() cannot claim them during SPI controller
>     registration.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I saw Mark already applied the patch, just wanted to say thanks :)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
