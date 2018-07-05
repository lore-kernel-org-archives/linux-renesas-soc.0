Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:44720 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753828AbeGEKzN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jul 2018 06:55:13 -0400
Received: by mail-ua0-f194.google.com with SMTP id v15-v6so5117962ual.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Jul 2018 03:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20180614113550.g7fwz3klcwvxfdlv@verge.net.au>
In-Reply-To: <20180614113550.g7fwz3klcwvxfdlv@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jul 2018 12:55:00 +0200
Message-ID: <CAMuHMdXBMpHdKpAfP_R-QRzS8KZMzeiJ89Becz=7uodMmAyvow@mail.gmail.com>
Subject: Re: [GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.17
To: Simon Horman <horms@verge.net.au>
Cc: ltsi-dev@lists.linuxfoundation.org,
        Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

CC Laurent, Wolfram, Greg.

On Thu, Jun 14, 2018 at 1:36 PM Simon Horman <horms@verge.net.au> wrote:
> This series is comprised of backports to v4.14 of the following
> components from their standard as of v4.16 to that of v4.17:
> * at24
> * cpg
> * dw-hdmi
> * gen3
> * gpio-rcar
> * i2c-rcar
> * i2c-sh-mobile
> * ipmmu-vmsa
> * irq-renesas-irqc
> * m25p80
> * mach-shmobile
> * pci-rcar-gen2
> * pcie-rcar
> * phy-micrel
> * ravb
> * rcar-can
> * rcar-dmac
> * rcar-du
> * rcar-snd
> * rcar-thermal
> * rcar-vin
> * renesas-sdhi
> * renesas-soc-id
> * sata-rcar
> * sh-drivers
> * sh-eth
> * sh-flctl
> * sh-mmcif
> * sh-mobile-ceu-camera
> * sh-msiof
> * sh-pfc
> * sh-sci
> * smsc911x
> * sysc
> * usb3-peri
> * usbhs
> * vsp1
> * watchdog
> * xhci-plat
> * xhci-rcar
>
> And limited backport of the following to provide dependencies for the above:
> * drm-tilcdc-compat
> * of-overlay
>
> This is intended as part of a dry-run for backporting components used by
> Renesas SoCs from v4.15, v4.16, v4.17 and beyond to v4.14.
>
> In posting this work I am not implying anything about
> decisions on the base of the LTSI release will be.
>
> There are 381 patches.
>
> This is based on similar backports of components to their standard as of
> v4.16, posted as "[GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to v4.16"
> and tagged as backport/v4.14.48/snapshot-to-v4.16-flattened.
>
> As this work is for informational purposes I do not expect these patches
> to be imported to quilt by Greg at this time. However, if you would like to
> do so and rebasing would help please feel free to ask me to do so.
>
>
> The following changes since commit 6485613bce7106b963ce9a9dd8b6d434c26b1bfd:
>
>   tty: serial: sh-sci: Add default for number of ports for compile-testing (2018-06-14 10:31:17 +0200)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.14.48/snapshot-to-v4.17-flattened

Thank you!

I subjected it to the same testing I do for each renesas-drivers release.

Regressions from v4.14.48:

  - Armadillo800EVA: rtc-s35390a is no longer detected

        -i2c-gpio i2c-2: using pins 208 (SDA) and 91 (SCL)

        -rtc-s35390a 0-0030: clock needs to be set
        -rtc-s35390a 0-0030: rtc core: registered rtc-s35390a as rtc0

        -rtc-s35390a 0-0030: setting system clock to 2000-01-01
00:59:36 UTC (946688376)
        +hctosys: unable to open rtc device (rtc0)

    Commit 8a3e7dbfff3e7ecf ("ARM: dts: armadillo800eva: Convert to named
    i2c-gpio bindings") refers to the following two commits, that haven't
    been backported yet:

        7d29f509d2cfd807 dt-bindings: i2c: i2c-gpio: Add support for named gpios
        05c74778858d7d99 i2c: gpio: Add support for named gpios in DT

    However, the second one depends on:

        b2e63555592f8133 i2c: gpio: Convert to use descriptors
        f926dfc112bc6cf4 gpio: Make it possible for consumers to
enforce open drain
        7bb75029ef348386 i2c: gpio: Enforce open drain through gpiolib
        b9ab0517efc0111b i2c: gpio: Local vars in probe

    So you need to backport those, too.
    In addition, you want the bugfix for 7bb75029ef348386 in v4.18-rc3:

        12b731dd46d9ee64 i2c: gpio: initialize SCL to HIGH again

    and (untested):

        326345f995a83e32 MIPS: pb44: Fix i2c-gpio GPIO descriptor table
        f59c303b59b7404e ARM: Fix i2c-gpio GPIO descriptor tables
        d82e99a6f9b38cb1 ARM: sa1100: simpad: Correct I2C GPIO offsets

    The alternative is to drop 8a3e7dbfff3e7ecf. And all other commits
    using "sda-gpios" and "scl-gpios":

        7c7e63e46cd82723 ("ARM: dts: lager: Convert to named i2c-gpio bindings
        32ece1c70f53ed4c ("ARM: dts: koelsch: Convert to named i2c-gpio bindings
        43f0cad95985dc0b ("ARM: dts: alt: Convert to named i2c-gpio bindings
        a892ce4316028a72 ("ARM: dts: lager: use demuxer for IIC2/I2C2
        fcf4d437ff187c69 ("ARM: dts: koelsch: use demuxer for I2C2
        834871be58b3a223 ("ARM: dts: koelsch: use demuxer for I2C4
        d24106e3ef0bb765 ("ARM: dts: porter: use demuxer for I2C2
        84ae7ad42449c06a ("ARM: dts: alt: use demuxer for I2C1
        239ed9e9f50e7f04 ("ARM: dts: silk: use demuxer for I2C1
        07599c77e3701606 ("ARM: dts: gose: use demuxer for I2C2
        d156ad234e1f92a5 ("ARM: dts: gose: use demuxer for I2C4

    Note that I didn't notice any ill effects on Koelsch (e.g. the ADV7180
    is still detected).  Presumably i2c-demux-pinctrl can handle the
    missing i2c-gpio instances.


  - Koelsch, Salvator-X (R-Car M3-W), Salvator-XS (R-Car H3 ES2.0):

        +rcar-du feb00000.display: no connector for encoder
/soc/lvds@feb90000, skipping

    Laurent: do you know what's missing?


Other failures (no regressions from v4.14.48):

  - Salvator-XS: No network after s2ram wakeup:

        +nfs: server 192.168.97.29 not responding, still trying

    v4.14.28 already had commit 4df57c45f762d43f ("arm64: dts: renesas:
    salvator-common: Add EthernetAVB PHY reset"), but that doesn't work
    without commit ee7e16b66a766e8f net: mdio: Only perform gpio reset for
    PHYs").  To make it work, you need to backport the following dependency
    and fixes:

        096457b5523bbbb3 macb: Kill PHY reset code
        bafbdd527d569c82 phylib: Add device reset GPIO support
        ee7e16b66a766e8f net: mdio: Only perform gpio reset for PHYs
        a56c69803f5a2c1c net: phy: Handle not having GPIO enabled in the kernel

    The second commit causes a minor (add-add) conflict in include/linux/phy.h.


Other sporadic warnings:

    ravb e6800000.ethernet: DMA-API: cpu touching an active dma mapped
cacheline [cln=0x0000000000936ca0]

    I assume this is a false positive, to be fixed by backporting commit
    3aaabbf1c39effa2 ("lib/dma-debug.c: fix incorrect pfn calculation").

    Greg: I guess this applies to v4.14LTS, too.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
