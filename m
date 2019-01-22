Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8F4C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 18:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B404F21726
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 18:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbfAVSbW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 13:31:22 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:45005 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfAVSbW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 13:31:22 -0500
Received: by mail-vs1-f66.google.com with SMTP id u11so15307132vsp.11;
        Tue, 22 Jan 2019 10:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ISQURE+o76BG5vT6C2YBWn8B3gLYvuNU2PUsO+faQyI=;
        b=g/e5G8v+4LRdBFai/ubRCEKZWjD70ynLT1PceZwUTD+v6UbdswGdcGmUnSSKPIyKkK
         RNUCq/pVylRaRrAxUStqfZvMWaMa1ixZKVemihHH9wEWcFvXWqSgUS8owCpe7RM4QRLe
         nUbkiSAIdrMbQ1VyHNeqR9qNU12hHjOb76JI+4rsIM4YVPZw7sarBN+vYJQppMjhjw+w
         yppPdaYPR/ZWjIyc2Lrps+ATcABD1YMU4SdlYPjuM8CJpq1PZCK7ejatcS5QgNGhoNCN
         i714RGzHjaOpS5g+K5rYB+pxC2+J5NiprziSv/Urz0WMXANYQeYJhnXk6HO+MC0GffHV
         u++A==
X-Gm-Message-State: AJcUukcNZ7uOOjpTZ71TMC3LhlqeXipEpv1Tgjt5NPAA7fj88E+8C2at
        qIc4GDeSMqiPAShirEGWsA8FFBhfXfbHYlWeyhU=
X-Google-Smtp-Source: ALg8bN6qWyIS1OgGdw50E30D+lWCmO0VKYd3WI5T2pTPt9eg0qfWXTkShc9+TfN0LieIElF2G2+X6KBpvNqyHrMjnlY=
X-Received: by 2002:a67:3885:: with SMTP id n5mr12623413vsi.96.1548181880857;
 Tue, 22 Jan 2019 10:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20190118085343.32553-1-vladimir_zapolskiy@mentor.com>
In-Reply-To: <20190118085343.32553-1-vladimir_zapolskiy@mentor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jan 2019 19:31:08 +0100
Message-ID: <CAMuHMdUGOeAVvXGAObYiNbFbqYn7a0fiav6Dr-58A976RKAH_Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: rcar: select General Output Register to set
 output states
To:     Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 9:54 AM Vladimir Zapolskiy
<vladimir_zapolskiy@mentor.com> wrote:
> R-Car GPIO controller provides two interfaces to set GPIO line output
> signal state, and for a particular GPIO line the selected interface is
> determined by OUTDTSEL bit value.
>
> At the moment the driver supports only one of two interfaces, namely
> OUTDT General Output Register is used to control the output signal.
>
> While this selection is the default one on reset, it is not explicitly
> configured on probe, thus it might be possible that kernel and userspace
> consumers of a GPIO won't be able to set the wanted GPIO output signal.
>
> Below is a simple test case to reproduce the described problem and
> verify this fix in the kernel on H3 ULCB by setting non-default OUTDTSEL
> configuration from a bootloader:
>
>   u-boot    > mw.l 0xe6055440 0x3000 1
>   ...
>   userspace > echo default-on > /sys/devices/platform/leds/leds/led5/trigger
>   userspace > echo default-on > /sys/devices/platform/leds/leds/led6/trigger
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

FTR (already applied on gpio/for-next)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
