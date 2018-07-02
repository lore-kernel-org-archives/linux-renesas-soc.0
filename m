Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:38072 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753279AbeGBJu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 05:50:59 -0400
MIME-Version: 1.0
References: <20180629142513.20743-1-geert+renesas@glider.be>
 <20180629142513.20743-8-geert+renesas@glider.be> <c3d1884b-baab-241d-e4ee-745ed87dbb3b@landley.net>
In-Reply-To: <c3d1884b-baab-241d-e4ee-745ed87dbb3b@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Jul 2018 11:50:47 +0200
Message-ID: <CAMuHMdUu5Kgq6B3pE8SovP6Kv=gpWF7g8qSFTs2d0hoNo3TrEg@mail.gmail.com>
Subject: Re: [PATCH 4/4] serial: sh-sci: Stop RX FIFO timer during port shutdown
To: Rob Landley <rob@landley.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

On Sun, Jul 1, 2018 at 7:27 PM Rob Landley <rob@landley.net> wrote:
> On 06/29/2018 09:25 AM, Geert Uytterhoeven wrote:
> > The RX FIFO timer may be armed when the port is shut down, hence the
> > timer function may still be called afterwards.
> >
> > Fix this race condition by deleting the timer during port shutdown.
>
> Will any of this make the qemu-system-sh4 serial console work again?

Probably not, as none of these patches touch the qemu source tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
