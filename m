Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:34443 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751078AbdEBH6l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 03:58:41 -0400
Received: by mail-io0-f179.google.com with SMTP id a103so146948061ioj.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 May 2017 00:58:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170501143736.GA5814@w540>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
 <1493282548-27673-2-git-send-email-jacopo@jmondi.org> <2468637.9LR39KYxFA@avalon>
 <20170501143736.GA5814@w540>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 May 2017 09:58:39 +0200
Message-ID: <CAMuHMdV-G0aSadWKDs=3aXRhhkLYQaR8k+-5w0PNywiUBgy8=Q@mail.gmail.com>
Subject: Re: [RFC v2 1/2] media: platform: Add SH CEU camera interface driver
To: jmondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Mon, May 1, 2017 at 4:37 PM, jmondi <jacopo@jmondi.org> wrote:
>> > +   struct sh_ceu_fmt **active_fmts;
>> > +   struct sh_ceu_fmt *current_fmt;
>>
>> These two should be const.
>>
>
> Why both of them? I understand the list of active formats is built
> during driver initilization, but the "current_fmt" is set during
> "set_fmt" and can change at run time, right?

I guess Laurent meant:

    const struct sh_ceu_fmt *current_fmt;

This means the current_fmt pointer is not const, and thus can be changed,
while the data pointed to is const, and cannot be changed (through this
pointer).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
