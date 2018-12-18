Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7EBC43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 08:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1723A214C6
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 08:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbeLRIQZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 03:16:25 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46809 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbeLRIQZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 03:16:25 -0500
Received: by mail-vs1-f67.google.com with SMTP id n10so9424696vso.13;
        Tue, 18 Dec 2018 00:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L9tlFVAWeeANVhzOewMpUACDIWWa3R1jveHlyrJBWj8=;
        b=WcAXvQha4fTjEP5lzgp7GKfIA+kUqWCc0wwYiIHPWqdxUWQMbRZJaU74tDchI3pqMR
         fJErgdeAPs4d72sCYmsWk8K+LRHCVHgjEMB6NCEuxgO8n08s5uqbdkQEO5HsFtTjz1p7
         WpUxzdh0M6ycw2Et8B9r/9SAduGr8dg7gNBklmQ63kF0Opl4V+Uoi+KOcoKuB0pp9B4p
         m9AXcjSc7ebx9CkVcHmOGZzuDvWiwESzaFItsPx8SFaRkZc+cpfakIU8IEO1fPkeKspP
         uCf0UU4G4v+1Gd026NNyQA0/fp1UNmjSgI2eETy3hrQFVoHWAJwmX9mvNA0bSsGVVa2t
         4p2g==
X-Gm-Message-State: AA+aEWaFmTWPFBCIXEWLtCevwFxMoAw02B5pcfwrvWVaKZ+on5uPilms
        GCL9FbHMduUx80aCK28LAFD7j1dI1cahdqf0CB/Thdbsrkw=
X-Google-Smtp-Source: AFSGD/UpRh6fEeGAoaocbguUm4T+Tf5PrZi9T2T1MngtiC8Bbk8evNS9ftmU3bD9Q26660/VTI0nUgXb0/6mZldLj8o=
X-Received: by 2002:a67:d119:: with SMTP id u25mr7410275vsi.63.1545120984585;
 Tue, 18 Dec 2018 00:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20181213162855.14190-1-geert+renesas@glider.be> <20181213162855.14190-7-geert+renesas@glider.be>
In-Reply-To: <20181213162855.14190-7-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Dec 2018 09:16:12 +0100
Message-ID: <CAMuHMdW+0qqPoHF1786jn64t94QVBv9QwSWh8Wu8U9TuFCS+bQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] pinctrl: sh-pfc: Validate pins/marks in pin group at
 build time
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 5:29 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add a build-time check, to ensure the number of pins and pin marks in a
> pin group matches.  This helps catching bugs early.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> index 78dc342d7b390e02..a2c5d530aaa1c0b3 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -41,7 +41,8 @@ struct sh_pfc_pin {
>                 .name = #alias,                         \
>                 .pins = n##_pins,                       \
>                 .mux = n##_mux,                         \
> -               .nr_pins = ARRAY_SIZE(n##_pins),        \
> +               .nr_pins = ARRAY_SIZE(n##_pins) +       \
> +               BUILD_BUG_ON_ZERO(!(sizeof(n##_pins) == sizeof(n##_mux))), \

Obviously the above can be written as

        BUILD_BUG_ON_ZERO(sizeof(n##_pins) != sizeof(n##_mux)), \

too.

The "ZERO" applies to the return value, not to the condition, which initially
mislead me, but I still got the actual code right ;-)

>         }
>  #define SH_PFC_PIN_GROUP(n)    SH_PFC_PIN_GROUP_ALIAS(n, n)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
