Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23350C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 12:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6741218D8
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 12:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbfCUM26 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 08:28:58 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34231 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbfCUM26 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 08:28:58 -0400
Received: by mail-vs1-f68.google.com with SMTP id e126so3543485vse.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2019 05:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OMtP/wdFkJ/vOaqCK33yxC9gIj2Xjvalv8I7Ir34oXM=;
        b=niQuUiTCtHK4y/WYnAXG8Q6dM/F8VS5Z3kTuZJmvQsW8FLaeCTQZ+m4hAkaalLdrPk
         INVCO8zJccslCIfhcALmdNJbK0HZwM9ME4EwPxQ7thTt0Py7/vZxEUumQlQSbAmY6LjR
         60gZUEt/xF8v9wrf1gyJug7XeUgA0tOs/3ne7wKP7VWmA/6f+QQAL9EBW+kzZuE2X/fg
         9kfnFtm9F7StH/RifgKjo0fq1NPcYbbq/ZkDsqusRpq/2gkTFhhsXhy0GvJGJU7yLZ5E
         3GRoz/Le3gPT2MdUWBghIfUth+r+pcW0rG1NiSLDxjTvQRLE0cxQOleNvgZkbnMV2fgX
         5shg==
X-Gm-Message-State: APjAAAU4TTZ7oT883EU28CUUoZ8kv0qNB5U+m9lHWp0C1TIoHkXcVEru
        ReYnPnj2EAx4I+KM8/xdBY5bDrSGdgFpvW/Vl24=
X-Google-Smtp-Source: APXvYqy6umFwRW065KPE6xKsEhKfe2dIaQuZRo8DyI8KFH75DYz9TaUfBcCzF7OWNZ4OVjvG/VcwlaaPF0cQAOBnwJg=
X-Received: by 2002:a67:8317:: with SMTP id f23mr1653600vsd.63.1553171336605;
 Thu, 21 Mar 2019 05:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <TY1PR01MB15627B138E7BE709BC483E2A8A410@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdXG2wD9sbZY-1LY3d+AVA3BBjpjsn3zd3dJEi2r2BVEfg@mail.gmail.com> <TY1PR01MB156269186D28360C36DAED0B8A420@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB156269186D28360C36DAED0B8A420@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Mar 2019 13:28:44 +0100
Message-ID: <CAMuHMdX-BY6L37Mr6ZaD3KStX1PMdxCb3G1MTH=CtWEoC4i98g@mail.gmail.com>
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

On Thu, Mar 21, 2019 at 1:16 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> Look what fun you are having with an RZ/A1 board!
> You might have even more fun with a RZ/A2 board ;)
>
> > However, that also doesn't work, as the PL390 GIC supports rising edge
> > and high-level interrupts only.  Falling edge and low-level interrupts
> > on the IRQ pins seem to be an RZ/A1-specific GIC extension,
>
> Yes. I get this question a couple times a year.
>
> And no one wants rising or level high, so the GPIO interrupts would not
> work for them anyway.
>
> So, as you found:
>
> > I've just discovered commit 207c10b54ca81129 ("irq-gic: add support for
> > pins IRQ0-IRQ7") in rza_linux-4.14, but when using that, the system
> > locks up when pressing a switch :-(
>
> It might be because the interrupt routine needs to go in and clear the
> interrupt by writing to the 'IRQ Interrupt Request Register' (IRQRR).
> From the HW manual:
>
> "IRQRR is a 16-bit register that indicates interrupt requests from
> external input pins IRQ7 to IRQ0. If edge detection is set for the IRQ7 to
> IRQ0 interrupts, writing 0 to the IRQ7F to IRQ0F bits after reading IRQ7F
> to IRQ0F = 1 cancels the retained interrupts."

OK.

> > What am I doing wrong?
> > Do you have a better solution?
> > The IRQx support looks most promising, but needs some work (separate
> > compatible value, small driver with a custom .irq_set_type, deferring
> > the rest to the normal GIC driver).
>
> I not sure about a 'better' solution...just the one I tell people
> (although I need to make some App Note someday).
>
> Basically, I tell people they need to describe the IRQ in the Device
> Tree somewhere (so it can get allocated an interrupt ID).
> Then, they can call request_irq() from inside a custom driver if they
> want to.
> Or, they just make a very simple shim-driver in their board-xxx.c file
> that registers the interrupt and has a simple interrupt routine. Many
> times all people want to do is simply wire up an interrupt that the
> application can wait on. Or, use an IRQ pin to start an ADC conversion. Pretty
> simple stuff.
>
> Of course they can also use a UIO driver to do these kinds of things as
> well.
> As you know, the UIO subsystem will automatically turn of the interrupt
> each time, but users still need to write to the IRQRR register before
> turning the interrupt back on if using edge interrupts.
>
> I always thought what I really need to do is instead just make a
> separate driver like you suggested above because technical, the "IRQ" block is
> not really part of the GIC, it is a separate block that feeds interrupts
> into the GIC just like all the other peripherals, so it should be
> represented as a separate piece of hardware (ie, its own driver and
> capability string).

Right, that makes sense: a small irqchip driver, with 8 inputs, and 8 outputs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
