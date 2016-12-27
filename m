Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:55256 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932573AbcL0Qr2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2016 11:47:28 -0500
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1cLuuM-0002BS-P0
        for linux-renesas-soc@vger.kernel.org; Tue, 27 Dec 2016 17:47:26 +0100
Received: from geert by ramsan with local (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1cLuuX-0006QP-B9
        for linux-renesas-soc@vger.kernel.org; Tue, 27 Dec 2016 17:47:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2016-12-27-v4.10-rc1
Date: Tue, 27 Dec 2016 17:47:37 +0100
Message-Id: <1482857257-24662-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2016-12-27-v4.10-rc1 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the development branch of
Simon Horman's renesas.git tree.

As v4.9 has been released, we're back to normal mode.

Today's version is based on renesas-devel-20161220-v4.9.

Note that arm64/defconfig kernels have become too big to be bootable on
Salvator-X with the v2120 firmware.  Disable e.g. CONFIG_ARCH_SUNXI to
reduce kernel size to make it fit again.

Included branches with driver code:
  - clk-renesas-for-v4.10
  - clk-renesas-for-v4.11
  - sh-pfc-for-v4.11
  - topic/r8a7791-pfc-adi
  - topic/r8a7796-dmac-dts-v2-rebased4~1
  - topic/vin-gen2-dts-v1-rebased6
  - git://linuxtv.org/pinchartl/media.git#vsp1/histogram
  - https://git.ragnatech.se/linux#for-renesas-drivers
  - topic/ipmmu-multi-arch-v6
  - topic/r8a7795-ipmmu-v2-rebased4
  - topic/r8a7796-ipmmu-v1-rebased4
  - topic/r8a7795-ipmmu-integration-v2
  - topic/vsp1-pa-improvements-v1-rebased1
  - topic/vsp1-writeback-v2-rebased2
  - topic/iommu-devel-du-rebased1
  - topic/r8a7795-es2-v1-rebased6
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/thermal-on-4.10-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#vsp1/suspend-resume-race
  - topic/drm-r8a7796-next-v1-rebased1
  - git://linuxtv.org/pinchartl/media.git#drm/du/lvds-panel
  - git://linuxtv.org/pinchartl/media.git#drm/du/lvds-encoder
  - git://linuxtv.org/pinchartl/media.git#drm/du/hdmi

Included fixes:
  - arm64: don't pull uaccess.h into *.S
  - smp/hotplug: Undo tglxs brainfart

Included subsystem trees:
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

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
