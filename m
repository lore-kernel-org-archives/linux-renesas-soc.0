Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from newton.telenet-ops.be ([195.130.132.45]:57839 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753904AbcHWNh5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2016 09:37:57 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by newton.telenet-ops.be (Postfix) with ESMTP id 3sJWg91xJqzMrBrX
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2016 15:36:21 +0200 (CEST)
Received: from ramsan.of.borg ([192.168.97.29] helo=ramsan)
        by ayla.of.borg with esmtp (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1bcBrK-0003xY-0Q
        for linux-renesas-soc@vger.kernel.org; Tue, 23 Aug 2016 15:35:18 +0200
Received: from geert by ramsan with local (Exim 4.82)
        (envelope-from <geert@linux-m68k.org>)
        id 1bcBrM-0004Py-DQ
        for linux-renesas-soc@vger.kernel.org; Tue, 23 Aug 2016 15:35:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2016-08-23-v4.8-rc3
Date: Tue, 23 Aug 2016 15:35:20 +0200
Message-Id: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I have pushed renesas-drivers-2016-08-23-v4.8-rc3 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM SoCs. It is created by merging (a) the for-next branches
of various subsystem trees and (b) branches with driver code submitted
or planned for submission to maintainers into the development branch of
Simon Horman's renesas.git tree.

Today's version is based on renesas-devel-20160823-v4.8-rc3.

Included branches with driver code:
  - clk-renesas-for-v4.9
  - sh-pfc-for-v4.9
  - topic/r8a7796-pfc-v3
  - topic/ipmmu-multi-arch-v4
  - topic/r8a7795-ipmmu-v2-rebased1
  - topic/r8a7796-ipmmu-v1-rebased1
  - topic/salvator-x-ipmmu-rfc-v3-rebased4
  - topic/spi-slave-v1-rebased1
  - git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git
  - topic/sdr104-v4
  - topic/i2c-demux-v3-rebased3
  - topic/sdhi-gen3-dma-v3-rebased2
  - topic/r8a7796-sdhi-v2-rebased1
  - topic/pretimeout-v1-rebased1
  - topic/h3-pfc-set-voltage-v1-rebased2~1
  - https://git.ragnatech.se/linux
  - for-renesas-drivers
  - git://linuxtv.org/pinchartl/media.git
  - iommu/devel/du
  - git://linuxtv.org/pinchartl/media.git
  - vsp1/hgo
  - topic/fcpf-v1-rebased7
  - topic/fdp1-v2-rebased2

Included fixes:
  - [media] fdp1: vb2_queue dev conversion
  - [media] rcar-fcp: Make sure rcar_fcp_enable() returns 0 on success

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
