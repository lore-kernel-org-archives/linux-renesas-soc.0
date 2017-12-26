Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:51502 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750705AbdLZNeX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Dec 2017 08:34:23 -0500
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1eTpN7-0007Pd-PA
        for linux-renesas-soc@vger.kernel.org; Tue, 26 Dec 2017 14:34:21 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1eTpN7-0004E0-K2
        for linux-renesas-soc@vger.kernel.org; Tue, 26 Dec 2017 14:34:21 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2017-12-26-v4.15-rc5
Date: Tue, 26 Dec 2017 14:34:21 +0100
Message-Id: <1514295261-16198-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2017-12-26-v4.15-rc5 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the development branch of
Simon Horman's renesas.git tree.

Today's version is based on renesas-devel-20171222-v4.15-rc4.

Included branches with driver code:
  - clk-renesas
  - sh-pfc
  - topic/rcar-genpd-wakeup-v3-rebased1
  - topic/25lc040-dt-v2
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/rcar-gen3-z-clk-v3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/cpufreq-automatic
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/rcar-gen3-cpufreq-dts-v2
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-driver-v5
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-bindings
  - git://linuxtv.org/pinchartl/media.git#drm-du-iommu-v1-20171115
  - git://linuxtv.org/pinchartl/media.git#tags/vsp1-discom-v1-20171215
  - git://linuxtv.org/pinchartl/media.git#tags/drm-next-colorkey-v1-20171215
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/topc/ip-switch-rework-2017
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/topic/rcar-i2c-recovery
  - git://git.ragnatech.se/linux#for-renesas-drivers

Included fixes:
  - clk: renesas: rcar-gen3: Fix Z and Z2 clock frequency
  - clk: renesas: rcar-gen3: Fix Z2 clock frequency calculation
  - clk: renesas: rcar-gen3: Fix using z-clock mask value
  - [LOCAL] arm64: defconfig: Update renesas_defconfig
  - ARM: dts: koelsch: Correct pin group for I2C4

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
  - git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git#for-next
  - git://git.linaro.org/people/daniel.lezcano/linux.git#clockevents/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git#testing/next
  - git://git.infradead.org/users/vkoul/slave-dma.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git#staging-next
  - git://git.armlinux.org.uk/~rmk/linux-arm.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git#for-next
  - git://git.infradead.org/users/jcooper/linux.git#irqchip/for-next
  - git://github.com/bzolnier/linux.git#fbdev-for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git#for-next
  - git://www.linux-watchdog.org/linux-watchdog-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git#for-next/core
  - git://anongit.freedesktop.org/drm/drm-misc#for-linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git#for-mfd-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git#for-next

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
