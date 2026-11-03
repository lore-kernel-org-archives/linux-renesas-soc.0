Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730636;
	b=zlbAtEm8yZgOtSXb4lNGxymQW12Ey2kEiJBOjYw7OhEKizZUof9xTh2F/mXHf/BU+13l
	 7nDNRD1SHYs8rCy1Pm0/UbA+y5wc4IyiL6xJwJ57H5ZhEbFhAZQ3fPGFxa/JtE6BtFPHc
	 UDVX36oYNuOIqNpFpOQ1epkGu/iEN4A5I1ZeteLz9JfBgFvXn3v4PgSg0dcl9hhcCVrVB
	 lUmhN4si0v5W6aBugCrXmXXT1ZxuoXeHK40yWokHu1o0TbrS3hfvwhxI0+3L8Bj4rT5m4
	 1S4CWUGz3R7zcIwyOstMG2xjG+dj/FG3qe52GQFl9x9eKweGC57bA3xQKlw8k8UGVgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730636;
	h=Received:From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3gB2pJzhV0TeIzsYFtibCoaIxQakvsr54/JNYXuRSUc=;
	b=My+s20TRsxw3l11UjukeW4bo9adoQWkdB/neZTDgLmLmqr1YEDMW/Ksgoe1ELnOGAD0a
	 spQdl2zfwta6clulKD0IufQkbHFNiZKZEyfKQ3zMhPENNFxdKU4flz5yHh2nNVvmvB/R/
	 hyI5Jn8pf9z0tHBlQ7pPCnO30OBdt/86rA2zhG3lcxCcqRlBbn3JI1qXPVXRZ2v+YSiuE
	 7ht2VwblhbsAqdS9iurrYJbwOxCRqAt5XWp5FJEcZrsC6UeUSSLU+pxtaqdSLcK0YRSJa
	 pz+zCvuWdYmBa1GnAVjkpzBTYM8AlCPzayERSlK/z4R1wSjLpFshG6lju4J/lEztjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F9606A328
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 18:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0201C1F0093A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 18:30:34 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Subject: renesas-drivers-2026-11-03-v7.4-rc1
Date: Tue,  3 Nov 2026 19:30:33 +0100
Message-ID: <20261103183033.1937138-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have pushed renesas-drivers-2026-11-03-v7.4-rc1 to
https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git

This tree is meant to ease development of platform support and drivers
for Renesas ARM and RISC-V SoCs.  It is created by merging (a) the
for-next branches of various subsystem trees and (b) branches with
driver code submitted or planned for submission to maintainers into the
master branch of my renesas-devel.git tree.

Today's version is based on renesas-devel-2026-11-02-v7.4-rc1.

Included branches with driver code:
  - renesas-clk-for-v7.5
  - renesas-pinctrl-for-v7.5
  - topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased

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
  - git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git#for-linux-next
  - git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git#kbuild-for-next

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
