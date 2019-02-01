Return-Path: <SRS0=i8oE=QI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A9AC282D8
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 14:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B8D8218AC
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Feb 2019 14:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbfBAOS4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Feb 2019 09:18:56 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:38535 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfBAOS4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Feb 2019 09:18:56 -0500
Received: by mail-vk1-f193.google.com with SMTP id w72so1608608vkd.5;
        Fri, 01 Feb 2019 06:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IJtIDlcUlGCeS7tbnQbh8TScvo60+HDOEoSDb8fTwCo=;
        b=eLWv4uLElUFQFXnpx57iEpaYPBdu9HW+7MpYdpXuFC6vqaGhnL+iy3lU3Wgnf1qC/x
         /qf8LwCF1D/Z1yeqTBoGmf6/NOXHxl63Uo+CLDptl7LP909Kepv5S1BmOZ2RKEL596QQ
         3xOnB7VKdrSyE4I+MwRSLwRs9BnUTAuWkgpjP3WjTv3rTORQtooCRv8CrT/fb613d0g/
         B+5466DMXnQws4w+8QjmzrFpV2iM0DMi0QE36nJ4XY4vFSWS7fk9BJNL438MTlxmsGKg
         bTi0IcNsU5ubHryc6JCG+UKOG8YL+kjb9kl1LWuXxkAr7aonC+aC3kDYXL1kW9PDs9O8
         OpfQ==
X-Gm-Message-State: AJcUukfcd959E9mVDi0ixIn8G46sN9RG/2UtijmpAyiTGhEtxu0SLWDn
        UUsADyM+9KPRi82V8exQELOK9MhRZWCjpk+oiJ1Xfpzm
X-Google-Smtp-Source: ALg8bN6APTa3postWHDEflqfWvq6Azx+24zt1dllXjevADoI/MGdl46VhWyB/zalScv/TFKeF8qG2XwedlqqrOzuRtQ=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr16904587vkh.65.1549030735572;
 Fri, 01 Feb 2019 06:18:55 -0800 (PST)
MIME-Version: 1.0
References: <20190128182556.34359-1-chris.brandt@renesas.com>
In-Reply-To: <20190128182556.34359-1-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Feb 2019 15:18:43 +0100
Message-ID: <CAMuHMdVE=ibQ3PFiwwKKS8LFfSq_6yH=Yqgm01D2VrUHuc=SvA@mail.gmail.com>
Subject: Re: [PATCH v2] serial: sh-sci: Do not free irqs that have already
 been freed
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Mon, Jan 28, 2019 at 7:26 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Since IRQs might be muxed on some parts, we need to pay attention when we
> are freeing them.
> Otherwise we get the ugly WARNING "Trying to free already-free IRQ 20".
>
> Fixes: 628c534ae735 ("serial: sh-sci: Improve support for separate TEI and DRI interrupts")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c

> @@ -1952,6 +1952,13 @@ static void sci_free_irq(struct sci_port *port)
>                 if (unlikely(irq < 0))
>                         continue;
>
> +               /* Check if already freed (irq was muxed) */
> +               for (j = 0; j < i; j++)
> +                       if (port->irqs[j] == irq)
> +                               j = i + 1;
> +               if (j > i)
> +                       continue;
> +
>                 free_irq(port->irqs[i], port);
>                 kfree(port->irqstr[i]);

I think the error path in sci_request_irq() needs similar handling, also for
SCIx_IRQ_IS_MUXED().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
