Return-Path: <SRS0=BEXM=RC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C069AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Feb 2019 09:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90075213A2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Feb 2019 09:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="OptVRGii"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbfB0J3q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Feb 2019 04:29:46 -0500
Received: from mail-it1-f169.google.com ([209.85.166.169]:36330 "EHLO
        mail-it1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfB0J3q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Feb 2019 04:29:46 -0500
Received: by mail-it1-f169.google.com with SMTP id v83so8866330itf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Feb 2019 01:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=27ZEZ3TqtQr3legt74k3dzceyx9SkeNJ2DvAJAtdtc0=;
        b=OptVRGiit/Lr3tPexTrlSyTr9LzkyiVwd+wpghZb2GT60o3c6+On0+cKDNtcfjJuWN
         mHYIaTXDnanIbFm1nriwnJ57zKmlmE3To87JZFauoBswWXst22OSTV5XMU4HSnMSsmhY
         i8ELmVpqSsJPYFGtFch24PDa7poYqulSlZVZgCFmwHMdWvUeduO8cCJ/ytxBRA922Q1v
         9OpCEs879x82qYpFPrrb7OztD4Ov3lma+fl1vP+cgX0ZG3DTZzuMYEZe5Cfix3lOt9Ky
         82C5BT+8Mxghjny4q9KDW1VNDZvo7/9XEk7FWPbqgIkNMJR5rUQ6CsPYM9np9nxFwYEW
         J3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=27ZEZ3TqtQr3legt74k3dzceyx9SkeNJ2DvAJAtdtc0=;
        b=r8scXg9S+Wbd/OHRsIGyDJFnnelzJq2sWKa6eeIGM3TEh1Xbfr8g6OlqoNDOTs4tCz
         +Y7jabefvI7uiItjPD0IpBfWkYjmIemubP8jPSAsXiPxiFLpEq9PZXu80nNlE+nvftr8
         V+owC8dERJ3Gbfxmzkl2aGTwELBd9uv8I4hiyTXPVj9ISmg0t9anspQLJ6Vm2Jwzo4HL
         5X2rXe+NOri4WWmaLJMP73VwYyY1WZ37LoWn9JLtdqEs0WyEg2vGOMhupPMIFHgXPNU+
         +NqjefLTIzFYUsKUzjiwzSSs0b9N+47lsJMhgCeID2+mHGnWO/OA0dNzoaTSUxgM12Wk
         aEuQ==
X-Gm-Message-State: APjAAAUge4XqNB9a9hjXnyrSS/RTMZcYrP5KTEPDsvufzRuzeZgEwLng
        gO5h+c20S1f3AVkMmha4f2si+BoFD+EakZTWTD4r4w==
X-Google-Smtp-Source: AHgI3IZBgtGODEhydD+t1ECzKd8x4n2LJ9Tv9EX87sT3iSpmEnzCPRVVs+FlP202a35j0TCC20FKLybvxo6gUj8/fA4=
X-Received: by 2002:a24:418c:: with SMTP id b12mr172246itd.74.1551259784637;
 Wed, 27 Feb 2019 01:29:44 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdVXsLDPiGw81LVuoOpOnnRX_gswkqB--6mGodP06UqHmw@mail.gmail.com>
In-Reply-To: <CAMuHMdVXsLDPiGw81LVuoOpOnnRX_gswkqB--6mGodP06UqHmw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Feb 2019 10:29:33 +0100
Message-ID: <CAMRc=MfCn+XeALaF1V71NKLnMWbqiUrt6AFJie9wTeRDQi_MDg@mail.gmail.com>
Subject: Re: Requesting false output GPIO as IRQ
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

wt., 26 lut 2019 o 11:01 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
>
> Hi Linus, Bartosz,
>
> If request_irq() is called on an otherwise unused GPIO that was
> incorrectly configured for output by the firmware, this fails with:
>
>     gpio gpiochip2: (e6052000.gpio): gpiochip_lock_as_irq: tried to
> flag a GPIO set as output for IRQ
>     gpio gpiochip2: (e6052000.gpio): unable to lock HW IRQ 22 for IRQ
>     genirq: Failed to request resources for 0-0020 (irq 142) on
> irqchip e6052000.gpio
>
> This happens since commit ad817297418539b8 ("gpio: rcar: Implement
> .get_direction() callback"), as the (default) input state is changed to
> output by reading the hardware state.  Without that callback, the code
> just continues.
>
> While I strongly agree the firmware should be fixed not to configure
> random GPIOs as outputs, shouldn't Linux just override this, if the GPIO
> is not marked in use (has not been requested)?
>
> What is your opinion on this?
> Thanks!
>

I think you're right about overriding this, because it's not only the
firmware that can change the configuration. Let's imagine user-space
that sets a GPIO, then releases it - it now stays configured as
output. We should probably force input in this case and maybe just
hint it with a pr_debug()?

Bart
