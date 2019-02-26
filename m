Return-Path: <SRS0=APCG=RB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B39C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 10:01:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 994492173C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 10:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbfBZKBZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Feb 2019 05:01:25 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46026 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727631AbfBZKBY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Feb 2019 05:01:24 -0500
Received: by mail-ua1-f65.google.com with SMTP id u1so10538378uae.12;
        Tue, 26 Feb 2019 02:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=DZu9KPXfw9d7nB7cKyBfBMuGpm84QdV3pmCGRek7WuU=;
        b=SyZDn3gwdTtkZj3TAdfKMFceBEwNJGgUaRDUiaBtgo5oiJCT2iZ7aGPJem0g4LWBSl
         yvChITUCz3HxieFoIMFVRV6A+9By2izIy0ao7myytCkDE6Jyba0YPNzLdqcX6swBSRlW
         HlALIMCMlXREUQgH8bPOblBFQrbk/gyd/Xsq/ZHfjMv6EUTS6zumuyJYPXtzybW704DT
         Ev+oUn6BY0N+1pDJQv76M5NzT0q6EfEtRpy9XCgYETylJruZ+IWMHJdCcFikYIuDbD2t
         ylh+OrbK3F8TsaHJRbAurXa1qZ7SYzA/igRoutdgLJjyiSoAFb0vdeLzJm+/RXxXP9F8
         SFIA==
X-Gm-Message-State: AHQUAuZ8S+eE2NqUIVXJfXQgcj3yCKVcPIFzVSGe84dz17A2feIWrGq8
        cRZFbR1EnxcO7xQDUK8Ku6HzV7OtrlHin8NA8YZKUXtT
X-Google-Smtp-Source: AHgI3IYARBggDHWGfWUff/05w/Hd2shOCn9/1kurZmcVEWHDIWZdL2qkv/Hm8P8oqjjBt5cTrnwI5zxlW2YWCGtbyTU=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr11566649uao.20.1551175283476;
 Tue, 26 Feb 2019 02:01:23 -0800 (PST)
MIME-Version: 1.0
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Feb 2019 11:01:12 +0100
Message-ID: <CAMuHMdVXsLDPiGw81LVuoOpOnnRX_gswkqB--6mGodP06UqHmw@mail.gmail.com>
Subject: Requesting false output GPIO as IRQ
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Linus, Bartosz,

If request_irq() is called on an otherwise unused GPIO that was
incorrectly configured for output by the firmware, this fails with:

    gpio gpiochip2: (e6052000.gpio): gpiochip_lock_as_irq: tried to
flag a GPIO set as output for IRQ
    gpio gpiochip2: (e6052000.gpio): unable to lock HW IRQ 22 for IRQ
    genirq: Failed to request resources for 0-0020 (irq 142) on
irqchip e6052000.gpio

This happens since commit ad817297418539b8 ("gpio: rcar: Implement
.get_direction() callback"), as the (default) input state is changed to
output by reading the hardware state.  Without that callback, the code
just continues.

While I strongly agree the firmware should be fixed not to configure
random GPIOs as outputs, shouldn't Linux just override this, if the GPIO
is not marked in use (has not been requested)?

What is your opinion on this?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
