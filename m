Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:49584 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932168AbeDCNJi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Apr 2018 09:09:38 -0400
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1f3Lgv-0002da-25
        for linux-renesas-soc@vger.kernel.org; Tue, 03 Apr 2018 15:09:37 +0200
Received: from geert by ramsan with local (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1f3Lgv-0001tI-0A
        for linux-renesas-soc@vger.kernel.org; Tue, 03 Apr 2018 15:09:37 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2018-04-03-v4.16
Date: Tue,  3 Apr 2018 15:09:36 +0200
Message-Id: <1522760976-7221-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2018-04-03-v4.16 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the development branch of
Simon Horman's renesas.git tree.

Today's version is based on renesas-devel-20180330-v4.16-rc7.

Included branches with driver code:
  - clk-renesas
  - sh-pfc
  - topic/rcar-genpd-wakeup-v4
  - topic/rcar-gen2-wdt-v6
  - topic/bd9571-ddr-backup-mode-driver-v2
  - topic/bd9571-ddr-backup-mode-dt-v2
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/cpufreq-automatic
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-driver-v6
  - git://linuxtv.org/pinchartl/media.git#drm-du-iommu-v1-20171115
  - git://linuxtv.org/pinchartl/media.git#tags/vsp1-discom-v1-20171215
  - git://linuxtv.org/pinchartl/media.git#tags/drm-next-colorkey-v1-20171215
  - git://git.ragnatech.se/linux#for-renesas-drivers
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#tags/vsp1/tlb-optimise/v7
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#d3/i2c-conflict/drm
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#d3/i2c-conflict/media
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#tags/vsp1/du/interlaced/v2

Included fixes:
  - dmaengine: rcar-dmac: Fix too early/late system suspend/resume callbacks
  - [LOCAL] arm64: defconfig: Update renesas_defconfig

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
