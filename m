Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:40026 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754211AbdKNO27 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2017 09:28:59 -0500
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1eEcCv-0001wi-67
        for linux-renesas-soc@vger.kernel.org; Tue, 14 Nov 2017 15:28:57 +0100
Received: from geert by ramsan with local (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1eEcCv-0005zY-0h
        for linux-renesas-soc@vger.kernel.org; Tue, 14 Nov 2017 15:28:57 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2017-11-14-v4.14
Date: Tue, 14 Nov 2017 15:28:56 +0100
Message-Id: <1510669736-22991-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2017-11-14-v4.14 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging branches with driver code
submitted or planned for submission to maintainers into the development
branch of Simon Horman's renesas.git tree.

As we are currently focusing on a stable v4.14, no for-next branches
of various subsystem trees have been included.

Today's version is based on renesas-devel-20171113-v4.14.

Included branches with driver code:
  - clk-renesas-for-v4.15
  - sh-pfc-for-v4.15
  - topic/r8a7794-smp-v3-rebased
  - topic/cmt-binding-rework-driver-v3
  - topic/cmt-binding-rework-dt-v3-rebased
  - topic/rcar-genpd-wakeup-v3-v4.14
  - topic/phy-reset-v3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/rcar-gen3-z-clk-v3
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/cpufreq-automatic
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/rcar-gen3-cpufreq-dts-v2
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/topic/i2c-fault-injection
  - topic/vsp1/tlb-optimise-v2-rebased1
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git#tags/vsp-du/du-suspend-resume/v1

Included fixes:
  - clk: renesas: rcar-gen3: Fix Z and Z2 clock frequency
  - clk: renesas: rcar-gen3: Fix Z2 clock frequency calculation
  - [LOCAL] arm64: defconfig: Update renesas_defconfig


I have also pushed renesas-drivers-next-2017-11-14-v4.14 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree does include the for-next branches of various subsystem trees,
and more branches with driver code.

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

Included branches with driver code:
  - sh-pfc
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-driver-v5
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-bindings
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-dt-r8a7795-v5
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-dt-r8a7796-v2
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-dt-r8a77970-v2
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/ipmmu-dt-r8a77995-v2
  - git://git.ragnatech.se/linux#for-renesas-drivers

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
