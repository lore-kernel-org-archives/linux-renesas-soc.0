Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:39084 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753107AbdEPPv1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2017 11:51:27 -0400
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1dAekv-000501-J6
        for linux-renesas-soc@vger.kernel.org; Tue, 16 May 2017 17:51:25 +0200
Received: from geert by ramsan with local (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1dAekv-0007yr-GB
        for linux-renesas-soc@vger.kernel.org; Tue, 16 May 2017 17:51:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2017-05-16-v4.12-rc1
Date: Tue, 16 May 2017 17:51:25 +0200
Message-Id: <1494949885-30638-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2017-05-16-v4.12-rc1 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the development branch of
Simon Horman's renesas.git tree.

Today's version is based on renesas-devel-20170515v3-v4.12-rc1.

Included branches with driver code:
  - clk-renesas-for-v4.13
  - sh-pfc-for-v4.13
  - topic/rza1-pfc-gpio-v5
  - topic/ipmmu-multi-arch-v7
  - topic/r8a7795-ipmmu-v3
  - topic/r8a7796-ipmmu-v3
  - topic/r8a7795es2-dt-v4
  - git://git.ragnatech.se/linux#for-renesas-drivers
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/topic/sdhi-cmd23
  - topic/suspend-to-idle-v1
  - git://linuxtv.org/pinchartl/media.git#drm/next/du-vsp
  - topic/spi-slave-v3
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#tags/submissions/vsp-drm-race/v4
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#tags/submissions/vsp1/suspend-resume/v5
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#tags/submissions/vsp1/writeback/v3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/sdhi-refactor-v2

Included fixes:
  - iommu/ipmmu-vmsa: Fix pgsize_bitmap semicolon typo
  - serial: sh-sci: Fix race condition causing garbage during shutdown
  - iio: adc: max9611: Fix attribute measure unit

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

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
