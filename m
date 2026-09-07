Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1082149365C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784407; cv=none; b=sSraeIviqnr2q2LEhJ/djT5K05Sj5t3+gVgfoGh1pIMlw/0/B4RXzFFFwhlPVZ2MK/aIouRQeUEMcBSVD0dmrWExQdBDKtG7I/gqDSH7N+6xamYgFKdEDD0NpwU6pfF/cZqMGyvQmMOADriCOGew2RFGRn+/fh04bW+D2TVCKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784407; c=relaxed/simple;
	bh=5Q/TIBCGUtEkJ1kvw8RQuaEsvV+RCKKnOnD0H5voIXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lkDklKyP0JWdYmuqJGE/pwaJU/jn1QgXVvu9tcb5uTj57ATvzgNGZtJelRmt5K3mUpfg598bBBDk6sZSqx5XO32LljdeAa7M8DASRXLUgLG4CQydtMeblAle9ZxzWbR1AzgCje+yckI6LbVUZ8A0KpbR/fqzLXxNRSzSok5sQ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFF41F00A3A;
	Mon,  7 Sep 2026 12:33:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v7.3-rc1
Date: Mon,  7 Sep 2026 14:33:22 +0200
Message-ID: <6aa72dc7c7d5f9e7a1e38b4247c202db0bd190f7.1788784378.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM systems:
  - Move CONFIG_EEPROM_AT24=y (moved in commit cf09b7a05618bea9
    ("eeprom: move nvmem EEPROM drivers to drivers/nvmem/")),
  - Disable 8250/16550 Moxa PCIe device support (not applicable).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.4.
---
 arch/arm/configs/shmobile_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 6f9696e9fe17ddcc..cb7eddd4eb22f945 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -48,7 +48,6 @@ CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_SATA_RCAR=y
@@ -79,6 +78,7 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
 # CONFIG_SERIAL_8250_EXAR is not set
+# CONFIG_SERIAL_8250_MOXA_PCIE is not set
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_8250_EM=y
 # CONFIG_SERIAL_8250_PERICOM is not set
@@ -209,6 +209,7 @@ CONFIG_PWM_RENESAS_RCAR=y
 CONFIG_PWM_RENESAS_TPU=y
 CONFIG_PHY_RCAR_GEN2=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
+CONFIG_EEPROM_AT24=y
 # CONFIG_DNOTIFY is not set
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
-- 
2.43.0

