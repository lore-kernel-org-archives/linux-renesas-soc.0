Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:51230 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751782AbcFNMJu (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 08:09:50 -0400
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
	by ayla.of.borg with esmtp (Exim 4.82)
	(envelope-from <geert@linux-m68k.org>)
	id 1bCnAC-0003iT-5B
	for linux-renesas-soc@vger.kernel.org; Tue, 14 Jun 2016 14:09:48 +0200
Received: from geert by ramsan with local (Exim 4.82)
	(envelope-from <geert@linux-m68k.org>)
	id 1bCnAC-0005Sy-SV
	for linux-renesas-soc@vger.kernel.org; Tue, 14 Jun 2016 14:09:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2016-06-14-v4.7-rc2
Date: Tue, 14 Jun 2016 14:09:48 +0200
Message-Id: <1465906188-20978-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2016-06-14-v4.7-rc2 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the development branch of
Simon Horman's renesas.git tree.

Today's version is based on renesas-devel-20160613-v4.7-rc3.

Included branches with driver code:
  - clk-renesas-for-v4.8
  - sh-pfc-for-v4.8
  - topic/rcar-dmac-residue-v1
  - topic/rcar-dmac-hamza-v3
  - topic/ipmmu-multi-arch-v4
  - topic/r8a7795-ipmmu-v2-rebased1
  - topic/r8a7796-ipmmu-v1-rebased1
  - topic/salvator-x-ipmmu-rfc-v3-rebased4
  - topic/scif-hwflow-v3
  - topic/scif-fifo-v1
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/r8a7796-v3
  - topic/r8a7796-sysc-dt-v1
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git#topic/sdr104-v3
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#staging/ks7010
  - git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git#renesas/topic/pretimeout
  - topic/h3-pfc-set-voltage-v1-rebased1
  - https://git.ragnatech.se/linux#rcar-vin-for-renesas-drivers
  - git://linuxtv.org/pinchartl/media.git#for/renesas-drivers
  - git://linuxtv.org/pinchartl/media.git#vsp1/functions
  - topic/fcpf-v1-rebased2

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
  - git://git.linaro.org/people/ulf.hansson/mmc.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git#for-next
  - git://git.linaro.org/people/daniel.lezcano/linux.git#clockevents/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git#testing/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/djbw/dmaengine.git#next
  - git://git.infradead.org/users/vkoul/slave-dma.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git#staging-next
  - git://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-arm.git#for-next
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
