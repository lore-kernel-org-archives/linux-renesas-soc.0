Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946DFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 10:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E7D0218B0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 10:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbfCUKDO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 06:03:14 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46475 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfCUKDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 06:03:14 -0400
Received: by mail-ua1-f67.google.com with SMTP id j8so1712483uae.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2019 03:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I5hsmbrik4f3cPuh+XJTTFeU/RYTQCl0uHsHOQW/byA=;
        b=smeLAKdUzsDjEW0T/xY/BWwTxe5uHfdyv4ru6b3jK/fk879gRtG8UHDX+n189OcmbB
         pzYoY9CDjzeKUgsPNt0LecOWVQ3Y5UlFeZymRtPbzOmpLoNARBI2ujKxlw2NdVq6mbSE
         +0tHFc0ueh+AHTkjmT98coonKna6akrX0C9v29dzGb6CiwjgZHQ5tdwDQlo1UTptQKNg
         t4HzlDEX47+Aglg9Zv7WZOeor5fbEC5iKWKZY8WLieO/8xQzAdl8N2RjKHAQP78gwMyX
         WfJpREDf9zUfG0MTkxNI8S9NN7Jx+CkaV4X1TYy62kN0DKgEx8WA/95d+KJYWNvyi75M
         NJSQ==
X-Gm-Message-State: APjAAAXvT3I9Ldw3M8v6TPyrAxgiybqnjrdQzSGjMGAkaROKKaHh/Y9h
        It2uwUB+SXvAGMb7IZFop1ME2RIaQpCyJ7CaS+g=
X-Google-Smtp-Source: APXvYqzVkYXrlF6lSNuMOnhF89CJPjdE4nZNNcf9hInHgVNVPxAn4HU0kFdSAwnclPD6AHLANPrgNPFMCkylsPyWUvk=
X-Received: by 2002:ab0:348a:: with SMTP id c10mr1206828uar.25.1553162592240;
 Thu, 21 Mar 2019 03:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190320194410.14870-1-geert+renesas@glider.be> <TY1PR01MB15627B138E7BE709BC483E2A8A410@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15627B138E7BE709BC483E2A8A410@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Mar 2019 11:02:59 +0100
Message-ID: <CAMuHMdXG2wD9sbZY-1LY3d+AVA3BBjpjsn3zd3dJEi2r2BVEfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Wed, Mar 20, 2019 at 9:41 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Wed, Mar 20, 2019, Geert Uytterhoeven wrote:
> > This patch series adds support for devices on the I2C bus on the RSKRZA1
> > board, including the GPIO expander that drives 3 LEDs.
>
> Very cool.
>
> I figured there was a more graceful way of turning on/off those LEDs
> than what I was doing...which was just writing to the I2C bus in my LED
> heartbeat kernel thread.
> https://github.com/renesas-rz/rza_linux-4.19/blob/master/arch/arm/mach-shmobile/board-rskrza1.c#L145

Yeah, I've seen that code. Not fit for upstream ;-)

I also wanted to add support for the switches, as I prefer to have a
remote wake-up source before I move a board to my board farm (sh_eth in
RZ/A1 does not seem to support wake-on-LAN). However, that doesn't
work yet.

The usual approach would be:

    #include <dt-bindings/input/input.h>

        keyboard {
                compatible = "gpio-keys";

                key-1 {
                        gpios = <&port1 9 GPIO_ACTIVE_LOW>;
                        linux,code = <KEY_1>;
                        label = "SW1";
                        wakeup-source;
                };
        };

But that doesn't work, as RZ/A1 GPIO does not support interrupts.

The GPIOs connected to the switches can also be used as IRQ lines
with (pseudo patch)

        keyboard {

+               pinctrl-names = "default";
+               pinctrl-0 = <&keyboard_pins>;

                key-1 {

-                       gpios = <&port1 9 GPIO_ACTIVE_LOW>;
+                      interrupt-parent = <&gic>;
+                      interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_BOTH>;

                }
        }

+       keyboard_pins: keyboard {
+               pinmux = <RZA1_PINMUX(1, 9, 3)>;        /* IRQ3 */
+       };

However, that also doesn't work, as the PL390 GIC supports rising edge
and high-level interrupts only.  Falling edge and low-level interrupts
on the IRQ pins seem to be an RZ/A1-specific GIC extension, which
requires programming the non-standard registers (ICR0, ICR1, IRQRR).
Nevertheless, even with the plain supported interrupt modes I didn't
receive interrupts when using the switches.

I've just discovered commit 207c10b54ca81129 ("irq-gic: add support for
pins IRQ0-IRQ7") in rza_linux-4.14, but when using that, the system
locks up when pressing a switch :-(

Finally, I tried using the pin interrupts, which are the closest to GPIO
interrupts we seem to have.  As these support high-level and rising-edge
interrupts only, while the switches are active-low, this means only
key-up events are detected:

                interrupt-parent = <&gic>;
                interrupts = <GIC_SPI 401 IRQ_TYPE_EDGE_RISING>;

What am I doing wrong?
Do you have a better solution?
The IRQx support looks most promising, but needs some work (separate
compatible value, small driver with a custom .irq_set_type, deferring
the rest to the normal GIC driver).

Thanks!



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
