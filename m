Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35933 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752273AbeABIfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 03:35:08 -0500
Received: by mail-qt0-f196.google.com with SMTP id a16so61922123qtj.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jan 2018 00:35:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171231100431.563efrm5pcd72rmw@ninjato>
References: <20171214223101.16450-1-wsa+renesas@sang-engineering.com>
 <20171214223101.16450-5-wsa+renesas@sang-engineering.com> <CAMuHMdXnY-zAc-=mBrrDy1XAxZcmvmsVA52D-EeZJT1Ff4Pdyw@mail.gmail.com>
 <20171231100431.563efrm5pcd72rmw@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jan 2018 09:35:07 +0100
Message-ID: <CAMuHMdUEG01Hp+eDprXz=8Q0BcTi5e14+anwVzosmQXB=WGTSg@mail.gmail.com>
Subject: Re: [PATCH 4/9] ARM: dts: koelsch: use demuxer for I2C4
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Sun, Dec 31, 2017 at 11:04 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
> BTW, we also have this on Koelsch:
>
> sh-pfc e6060000.pin-controller: pin GP_7_23 already requested by ee090000.pci; cannot claim for e6590000.usb
>
> because pci0 and hsusb use the same pinctrl-0. Known issue?

commit fc4a00b78c7f8a770b9608164c0c9cdd0e4e68c2
Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date:   Fri Oct 24 19:45:07 2014 +0900

    ARM: shmobile: koelsch: enable HS-USB

    Enable HS-USB device for the Koelsch board, defining the GPIO that
the driver
    should check when probing (which is the ID output from MAX3355 OTG chip).

    Note that there will be pinctrl-related error messages if both internal PCI
    and HS-USB drivers are enabled but they should be just ignored.

    Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
    [Sergei: added pin function/group and prop, moved device node, fixed summary
,
    added changelog]
    Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
    Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
