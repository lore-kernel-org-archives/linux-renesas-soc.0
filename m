Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5A4AEBED
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857696; cv=none; b=vFSaKJTTHHFvKZJsw7IqtVm7jieW5KzGps56zcVOVfonDuTh10DsdI6zGPowfPXWa7u/XekfflInwE9kgMIuHlYniZKWNgpnm7zDxJ6hxjeTSJ2dNi5kPRoUrWsJKqE4NX8Ev1uoZSlvoJlKMCThIvWGrbCcGhqcuGB0kGcjrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857696; c=relaxed/simple;
	bh=oO8bAkglH30dCujrlfNM86fkvfFLOlAwnfru+KydF3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=frYxsPlsZiy6KEIFQoTGncgZTw0vYTaS985jRclEjRM/PEJtEc/lAFTvrEOfPvlay26ZgD1q99ow1z37Z3Uyi/OnxlgOzbRO/DvknC76iWrsb/rxjIf/JBLkPejAr5nszAe6GNwoCWSllPWGt0PYxmZr2+ZtGEptJIqmEWnNUP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833421F00A3A;
	Tue,  8 Sep 2026 08:54:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL] arm64: renesas: defconfig: Increase NR_CPUS to 32
Date: Tue,  8 Sep 2026 10:54:35 +0200
Message-ID: <75f583a7ffc9896d2f3a3b1bdf48d79897629d4c.1788857660.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car X5H has 32 ARM Cortex-A720AE CPU cores.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index b8a1307c45930b31..8e9d8e41ddf10ba4 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -58,7 +58,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_ROCKCHIP_ERRATUM_3588001 is not set
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
 CONFIG_ARM64_VA_BITS_48=y
-CONFIG_NR_CPUS=8
+CONFIG_NR_CPUS=32
 CONFIG_XEN=y
 CONFIG_COMPAT=y
 # CONFIG_ARM64_PTR_AUTH is not set
-- 
2.43.0

