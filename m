Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35703 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750860AbcH2HxZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2016 03:53:25 -0400
Received: by mail-it0-f65.google.com with SMTP id f128so5808183ith.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2016 00:53:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1472219382-22789-1-git-send-email-horms+renesas@verge.net.au>
References: <1472219382-22789-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Aug 2016 09:53:23 +0200
Message-ID: <CAMuHMdW7=XB_-7YvMwBw-7WLaEj8A4=znsvRkTbdf5SCYe00rg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: shmobile: remove label property from led
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

The patch index in the subject should have been 0/4. You're breaking my
script to extract patch series from email threads ;-)

On Fri, Aug 26, 2016 at 3:49 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Remove label property from led nodes. This seems to have little
> value and is used inconsistently amongst Renesas SoCs.
>
> Based on renesas-devel-20160824-v4.8-rc3
>
> Simon Horman (4):
>   ARM: dts: armadillo800eva: remove label property from led nodes
>   ARM: dts: koelsch: remove label property from led nodes
>   ARM: dts: gose: remove label property from led nodes
>   ARM: dts: kzm9g: remove label property from led nodes

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I assume you are aware this is a user-visible change?
The LED name is exposed under /sys/class/leds/.
Fortunately my LED init script is agnostic to the actual names ;-)

if [ -d /sys/class/leds ]; then
        echo -n Enabling LEDs:
        i=-1
        for led in /sys/class/leds/*; do
                case $i in
                -1)
                        echo -n " heartbeat"
                        echo heartbeat > $led/trigger
                        ;;
                *)
                        if grep -qP "^processor.*: $i$" /proc/cpuinfo; then
                                echo -n " cpu$i"
                                echo cpu$i > $led/trigger
                        fi
                        ;;
                esac
                i=$(($i + 1))
        done
        echo
fi

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
