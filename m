Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AEF4EDCC1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898610; cv=none; b=WxekcYhoisMet6cX9m/nOOkfyKfpBQ55vNkMaQ4Y2qtp8BT9Jq7JY7wSm4g64opcd0HkCsDzO1Ee2/Mcc4eXNEFLPBupOM7G8fzOgOJs1Osel7gy5qosYbNG6mj6ZHAMPRzL8nkO+feHc9CElqC+SdeLQLkvm2U3RXEwjCwiqgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898610; c=relaxed/simple;
	bh=10DcI15JaMCpCwZsO4u6fC4IR3slvevgOqhU/6D7fGo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SeroHt9sQwtRMMBASaVI2np41aJOYVNBCS8FPu7etVllOFvMOfD97JulBy6pCN75KB+84YQVNvqaPAi9bu+8sh9FHT6nGEbri0HGXpSGEK7g/yXSuaSUDt8xMVdV/BjUMxp/1To+YVg4j9et6hIoaw7tL4dxAtF5zivoSUZU2Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D301F000FF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Oct 2026 13:36:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2026-10-13-v7.3-rc7
Date: Tue, 13 Oct 2026 15:36:47 +0200
Message-ID: <20261013133647.2449616-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have pushed renesas-drivers-2026-10-13-v7.3-rc7 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM and RISC-V SoCs.  It is created by merging (a) the
for-next branches of various subsystem trees and (b) branches with
driver code submitted or planned for submission to maintainers into the
master branch of my renesas-devel.git tree.

Today's version is based on renesas-devel-2026-10-12-v7.3-rc7.

Included branches with driver code:
  - renesas-clk-for-v7.4
  - renesas-pinctrl-for-v7.4
  - topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-wip

Included fixes:
  - libata: Fix up semantic conflict in ata_scsi_set_sense()
  - perf/renesas: Remove remaining RISCV_ALTERNATIVE references
  - [TEST] soc: renesas: rcar-rst: Enable WDT reset on early R-Car V4M
  - ARM: shmobile: defconfig: Update for renesas-drivers
  - [LOCAL] arm64: renesas: defconfig: Update for renesas-drivers
  - [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

Included subsystem trees:
  - git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git#linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git#clk-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git#gpio/for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#mtd/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git#main
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git#tty-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git#i2c/i2c-fixes
  - git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git#i2c/i2c-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git#i3c/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git#usb-next
  - https://gitlab.freedesktop.org/drm/kernel.git#drm-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git#next
  - git://linuxtv.org/media_tree.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#pwm/for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux.git#timers/drivers/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git#staging-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#irq/core
  - git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#irq/drivers
  - git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git#watchdog-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git#for-next/core
  - https://gitlab.freedesktop.org/drm/misc/kernel.git#for-linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git#thermal/linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git#for-mfd-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git#master
  - git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git#driver-core-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux.git#for-next
  - https://git.pengutronix.de/git/pza/linux#reset/next
  - git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git#fixes
  - git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git#next
  - git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git#for-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git#char-misc-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git#togreg
  - git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git#for-linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git#kbuild-for-next

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
