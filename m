Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D403E1208
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 13:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849711; cv=none; b=cMCC4ZhJnQSBcVTeNfUQrp9ai7nRT57bKk7L+22sTZ6FxMNrw+wptn3kw9rXkhfPdAv1fVGqJBxiNEjRELi8A8l/yY5tC6zPl58OYwzHUdpVrb9P90IkBQnf60ioZkmB6b9ini6LebFXu7vVv23auJdg2fqSPD8ihnUsBVEkqzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849711; c=relaxed/simple;
	bh=mVfhGOrc5iMF8zLeSSoh7ZnhqWvgbEMT3+OM4jXa7wA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WcjPD9Nxn95RnkLTsIdtFQTtPC4XJ2YufiJ4UI/Winj+TdkVaTdboFnsXv0WvsJXaUsxSDv6WeSOmGHD9v9jxVPCv+rB4wkLYt/W83YKmH4pQJLFqQyzM5goqgOvEiog1VGw8l+uEvED5RJFs2GphaduVtYXPns1EEZU6En4FJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D1E1F000E9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 13:21:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2026-08-04-v7.2-rc6
Date: Tue,  4 Aug 2026 15:21:47 +0200
Message-ID: <20260804132147.2216549-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have pushed renesas-drivers-2026-08-04-v7.2-rc6 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM and RISC-V SoCs.  It is created by merging (a) the
for-next branches of various subsystem trees and (b) branches with
driver code submitted or planned for submission to maintainers into the
master branch of my renesas-devel.git tree.

Today's version is based on renesas-devel-2026-08-03-v7.2-rc6.

Included branches with driver code:
  - renesas-clk-for-v7.3
  - renesas-pinctrl-for-v7.3
  - topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2

Included fixes:
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
  - https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git#for-linux-next

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
