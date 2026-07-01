Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256E42EEAD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907626; cv=none; b=YVCcreQgOgrCohxlbYvnd8nV/m6VYt2/C6rFyNHO7ne01w0mmi2YnfA39FoaGufihiLvfEN0s5j92rH5EaYvkaEU0guxwGPEd6WpUZ9efoI8o2xIoe68uqbbbht+UF3Vubtnd2Q/3jepVHtIWMSklTszYWPm02Dqo01elklS1rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907626; c=relaxed/simple;
	bh=J6RTNHwr3LO/NPFjvUK1VOdZpBRpvePFzGraNI7bUdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pWdkCRW+9Tp8ZOrVN945iQrSEO+3rJHC19aaoWrobJxqGCuOsZXnWljDJz7s92DYUyUq/bGwEtLZUFX0pANgqEAeDus0p6xhRxybWa7gM+ZmshGkTmZ9/Dz6z5A2GSlMZd4dEELs/RPuMZ8ibdNzxS+bltkilV2IDDTKM9dbt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7541F000E9;
	Wed,  1 Jul 2026 12:07:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v7.2-rc1
Date: Wed,  1 Jul 2026 14:07:00 +0200
Message-ID: <acdb2c6320865c24bbd3bf7a83c35db21cefd21b.1782907423.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Drop CONFIG_CRYPTO_SHA1=y (auto-enabled since commit
    bf8672b99402abd8 ("SUNRPC: Add Kconfig dependency on CRYPTO_KRB5")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/riscv/configs/rzfive_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index a07c75d5f5aea719..a5d9622c47a00146 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -204,7 +204,6 @@ CONFIG_SECURITY_SELINUX=y
 CONFIG_SECURITY_APPARMOR=y
 CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO=y
-CONFIG_CRYPTO_SHA1=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
-- 
2.43.0

