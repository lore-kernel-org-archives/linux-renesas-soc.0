Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:32928 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933265AbcK2NbV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 08:31:21 -0500
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1cBiVD-0007Fb-81
        for linux-renesas-soc@vger.kernel.org; Tue, 29 Nov 2016 14:31:19 +0100
Received: from geert by ramsan with local (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1cBiVF-0000Xf-UZ
        for linux-renesas-soc@vger.kernel.org; Tue, 29 Nov 2016 14:31:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2016-11-29-v4.9-rc7
Date: Tue, 29 Nov 2016 14:31:21 +0100
Message-Id: <1480426281-2049-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2016-11-29-v4.9-rc7 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging branches with driver code
submitted or planned for submission to maintainers into the development
branch of Simon Horman's renesas.git tree.

As we are currently focusing on a stable v4.9, no for-next branches
of various subsystem trees have been included.

Today's version is based on renesas-devel-20161128-v4.9-rc7.

Included branches with driver code:
  - clk-renesas-for-v4.11
  - sh-pfc-for-v4.11
  - topic/rcar-secondary-booting-in-debug-mode-v1-rebased1
  - topic/r8a7796-ravb-v1-rebased1
  - topic/r8a7796-dmac-driver-v2-rebased1
  - topic/r8a7796-dmac-dts-v2-rebased3~3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/sdr104-driver-v8
  - topic/vin-gen2-driver-v1-rebased2
  - topic/rcar-du-lvds-mode-selection-v1
  - topic/rcar-gen3-usb2-role-swap-v5
  - topic/dma-map-resource-v1
  - git://linuxtv.org/pinchartl/media.git#vsp1/histogram
  - https://git.ragnatech.se/linux#for-renesas-drivers
  - topic/ipmmu-multi-arch-v6
  - topic/r8a7795-ipmmu-v2-rebased4
  - topic/r8a7796-ipmmu-v1-rebased4
  - topic/r8a7795-ipmmu-integration-v1
  - topic/vin-gen2-dts-v1-rebased5
  - topic/vsp1-pa-improvements-v1-rebased1
  - topic/vsp1-writeback-v2-rebased2
  - git://linuxtv.org/pinchartl/media.git#drm/r8a7796/next
  - git://linuxtv.org/pinchartl/media.git#drm/next/lvds
  - topic/iommu-devel-du-rebased1
  - git://github.com/uli/kernel.git#r8a7795-hdmi-out-driver-v1
  - git://github.com/uli/kernel.git#r8a7795-hdmi-out-dts-v1
  - topic/r8a7795-es2-v1-rebased5
  - topic/r8a7796-64b-mem+ravb-prototype-v1-rebased4~1

As we're getting close to the opening of the merge window for v4.10, I
have also pushed renesas-drivers-next-2016-11-29-v4.9-rc7 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree does include the following for-next branches of various
subsystem trees:
  - git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git#linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git#clk-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git#for-next
  - git://git.infradead.org/users/dedekind/l2-mtd-2.6.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git#tty-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#i2c/for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git#usb-next
  - git://people.freedesktop.org/~airlied/linux#drm-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git#next
  - git://linuxtv.org/mchehab/media-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc.git#mmc-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git#for-next
  - git://git.linaro.org/people/daniel.lezcano/linux.git#clockevents/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git#testing/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/djbw/dmaengine.git#next
  - git://git.infradead.org/users/vkoul/slave-dma.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git#staging-next
  - git://git.armlinux.org.uk/~rmk/linux-arm.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git#for-next
  - git://git.infradead.org/users/jcooper/linux.git#irqchip/for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata.git#for-next
  - git://git.infradead.org/battery-2.6.git#master
  - git://www.linux-watchdog.org/linux-watchdog-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git#for-next/core
  - git://anongit.freedesktop.org/drm-intel#topic/drm-misc
  - git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal.git#next

Included fixes:
  - net: phy: Fix use after free in phy_detach()

Included branches with driver code:
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/thermal-on-4.10-next

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
