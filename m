Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34357 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753042AbcKOO2X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2016 09:28:23 -0500
Received: by mail-it0-f66.google.com with SMTP id o1so265151ito.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2016 06:28:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4011173.GR855PE2mA@avalon>
References: <1479128837-30985-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1579044.36Kjjoy1H1@avalon> <CAMuHMdW8CNrP0peCHxaqA4Yj7DEmbH9L0Qai+TMpfgbyVMn3Nw@mail.gmail.com>
 <4011173.GR855PE2mA@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Nov 2016 15:28:21 +0100
Message-ID: <CAMuHMdUtwCQAqd3XpxLst8f1U1zV1UE34MOWts4B1LGOr20mgA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Salvator-X: Add GPIO keys support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linus Walleij <linux.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 15, 2016 at 3:26 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> > disabling the I/O interrupt (or just ignoring it).
>>
>> IIRC, the R-Car GPIO block will send interrupts in output mode only.
>
> Do you mean input mode only ?

Yes, sorry (still suffering a bit from my cold).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
