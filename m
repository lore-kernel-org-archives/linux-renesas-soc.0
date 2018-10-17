Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44856 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbeJQU1g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 16:27:36 -0400
MIME-Version: 1.0
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017103208.GA1589@kunai> <8db1b1a0-6669-0d4e-7511-6fb44e309a4c@axentia.se>
 <20181017121607.GB3813@kunai> <20181017122141.GC3813@kunai>
In-Reply-To: <20181017122141.GC3813@kunai>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Oct 2018 14:31:54 +0200
Message-ID: <CAMuHMdWQnNArCYOiq_BQ101SDL1iQODFz0=k2PstvhYeqdajKw@mail.gmail.com>
Subject: Re: Delay between stop condition and start condition
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Peter Rosin <peda@axentia.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Oct 17, 2018 at 2:21 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > be fixed in its driver. It probably could be a generic driver, or?
>
> Wishful thinking. Setting the passthrough mode is probably not default,
> so it is device specific.

According to the block diagram in
https://www.semiconductorstore.com/pdf/newsite/siliconimage/SiI9022a_pb.pdf,
it has "Registers & Config Logic", and a separate internal "I²C Master".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
