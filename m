Return-Path: <SRS0=uxQs=OU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DEBC07E85
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 08:16:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9037E20811
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 11 Dec 2018 08:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9037E20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbeLKIQR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 03:16:17 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:45402 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbeLKIQR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 03:16:17 -0500
Received: by mail-vk1-f195.google.com with SMTP id n126so3168107vke.12;
        Tue, 11 Dec 2018 00:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfSZshF7QXOuFixHzpRe7Lq+mgC2sfTfPe/PgvSpbx4=;
        b=HjpzcyZ4bIxyoTozDkKhz6oT5hrqZjilF+wGumu2Zni4YBwjrXcA4aR74WN2jHsbtu
         10zxeMKyThaylLabF/leI2jf0tefdWIYvvhIvgkTNZTssIUmZ10D1XNc2tZP8h/U8yYT
         GFsG9lQMeMqPT4Y7LKchxP77yjwJJi0hTO1LSPfRgahzaChQasj6Q4lvL3lAKDG/pdfY
         k6bmP2f0WAOQlPPK8Bt1yFqKpWaJlqhV16TdC+UtFm008qRTWIGTkewAhJNcNViNq/Ie
         WNEQ/d16F5eoVq4BYXda0jgKuB6xiH7UPPD0UHor/ZJeEeUhvrMC4J+7wcR9ON+qFYab
         tWMQ==
X-Gm-Message-State: AA+aEWbkcmaSk+wJASzFPLp0FdI82feS7ghu6UHh1YHcIr5gpf5XqTQN
        Y5XaA2DvWNUprjCrMbV9rcGu7iYlWdCBBAj1qcU=
X-Google-Smtp-Source: AFSGD/V4V79VsXnehSMqsvRnysPVFJLjksxgffI36NK9hUsDAkth6be5uVa5pbkl/q5G73+SGlnLU/9MvHCLpbln3F0=
X-Received: by 2002:a1f:1881:: with SMTP id 123mr6623394vky.40.1544516174917;
 Tue, 11 Dec 2018 00:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20181210182154.20357-1-geert+renesas@glider.be>
 <20181210182154.20357-4-geert+renesas@glider.be> <20181210190052.admylepukreo23j3@ninjato>
In-Reply-To: <20181210190052.admylepukreo23j3@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 11 Dec 2018 09:16:03 +0100
Message-ID:
 <CAMuHMdUXUz8+2Mher9_-x4F04qdP+o39a89t+QiwnyS8OSk1AQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] serial: sh-sci: Resume PIO in sci_rx_interrupt()
 on DMA failure
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, uli+renesas@fpond.eu,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181211081603.BQ0DjQy029t7wUW1_LMDAthZpBH2tv5F1xXhUA3vvBY@z>

Hi Wolfram,

On Mon, Dec 10, 2018 at 8:00 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> >       if (!port_lock_held)
> >               spin_unlock_irqrestore(&port->lock, flags);
> > +     return -1;
>
> -Esomething here...
>
> >               } else {
> > +                     if (sci_submit_rx(s, false))
> > +                             goto handle_pio;
>
> and 'sci_submit_rx() < 0' here? I think it makes it more readable that
> this is an error case then. 'if sci_submit_rx() do_something' sounds a
> bit like the good case if boolean logic was used.

Thanks, will update for v4, using -EAGAIN.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
