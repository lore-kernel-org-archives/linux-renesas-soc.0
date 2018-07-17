Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:35118 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728288AbeGQJHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 05:07:02 -0400
MIME-Version: 1.0
References: <20180711144131.73552-1-chris.brandt@renesas.com>
 <20180711144131.73552-3-chris.brandt@renesas.com> <CAMuHMdVCA0MrD4QRZb7VPR_Dqmghfd83j4WY_oZnfqVyx++rEw@mail.gmail.com>
In-Reply-To: <CAMuHMdVCA0MrD4QRZb7VPR_Dqmghfd83j4WY_oZnfqVyx++rEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jul 2018 10:35:21 +0200
Message-ID: <CAMuHMdWdOoEbwPOzOfEAHH0MXNr-Wf_-37i8Qj6WdphgyKLe7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: sh-sci: Document r7s9210 bindings
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Jul 13, 2018 at 5:50 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jul 11, 2018 at 4:42 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Add R7S9210 (RZ/A2) support
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Sorry, I spoke too soon.
It seems the bindings were never updated for the use of multiple interrupts
on RZ/A1.  As RZ/A2 adds one new interrupt, can you please document which
interrupts are required?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
