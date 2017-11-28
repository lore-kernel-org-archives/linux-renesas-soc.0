Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:58338 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752923AbdK1NUV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Nov 2017 08:20:21 -0500
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1eJfoB-0004Db-Ag
        for linux-renesas-soc@vger.kernel.org; Tue, 28 Nov 2017 14:20:19 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1eJfoB-0001na-4g
        for linux-renesas-soc@vger.kernel.org; Tue, 28 Nov 2017 14:20:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2017-11-28-v4.15-rc1
Date: Tue, 28 Nov 2017 14:20:18 +0100
Message-Id: <1511875218-6871-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2017-11-28-v4.15-rc1 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the development branch of
Simon Horman's renesas.git tree.

Today's version is based on renesas-devel-20171127-v4.15-rc1.

Included branches with driver code:
  - clk-renesas
  - sh-pfc
  - topic/r8a7794-smp-v4
  - topic/cmt-binding-rework-dt-v4
  - topic/rcar-genpd-wakeup-v3-rebased1
  - topic/phy-reset-v3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/rcar-gen3-z-clk-v3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/cpufreq-automatic
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/rcar-gen3-cpufreq-dts-v2
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-driver-v5
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-bindings
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-dt-r8a77970-v2
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-dt-r8a77995-v2
  - git://linuxtv.org/pinchartl/media.git#drm-du-iommu-v1-20171115
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/topic/i2c-fault-injection
  - git://git.ragnatech.se/linux#for-renesas-drivers
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#tags/vsp-du/du-suspend-resume/v1
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#tags/vsp1/tlb-optimise/v4

Included fixes:
  - clk: renesas: rcar-gen3: Fix Z and Z2 clock frequency
  - clk: renesas: rcar-gen3: Fix Z2 clock frequency calculation
  - [LOCAL] arm64: defconfig: Refresh renesas_defconfig
  - [LOCAL] arm64: defconfig: Update renesas_defconfig

Included subsystem trees (the last one is new):
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
