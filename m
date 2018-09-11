Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:38755 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbeIKNNp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 09:13:45 -0400
Received: by mail-vk0-f67.google.com with SMTP id h200-v6so1415376vke.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Sep 2018 01:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-6-git-send-email-jacopo+renesas@jmondi.org>
 <20180910130115.z6qwfzrimg3ceyup@verge.net.au> <20180911074448.GQ28160@w540>
In-Reply-To: <20180911074448.GQ28160@w540>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Sep 2018 10:15:23 +0200
Message-ID: <CAMuHMdXbdm4=TzAkoc2KmS+m69ppOM6GXCgHTCoDS1-1MZ=RgQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups
 and functions
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <damm+renesas@opensource.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Tue, Sep 11, 2018 at 9:44 AM jacopo mondi <jacopo@jmondi.org> wrote:
> On Mon, Sep 10, 2018 at 03:01:15PM +0200, Simon Horman wrote:
> > On Wed, Sep 05, 2018 at 05:29:42PM +0200, Jacopo Mondi wrote:
> > > This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.

> Currently there are two open questions on this PFC patch:

> 2) VIN5 synchronism signals (V/HSYNC, CLKENB, FIELD) are marked as
>    "_A" only, while VIN4 ones have not _A or _B extensions and are
>    shared between _A and _B group. The VIN5_#_A extension is an
>    indication that synchronism signals for group _B are not
>    multiplexed but active be default according to Morimoto-san, that
>    is about to confirm this with HW team. In that case, we need to
>    decide if to provide an 'vin5_sync_b' group anyway to let user
>    select it from DTS. Otherwise it won't be possible to select
>    synchronism pins for VIN5_B group (which is maybe fine if they're
>    not multiplexed at all).

If the a "B" sync group exists, the pins are probably configurable as GPIOs,
too, so we probably do need a group for them in the driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
