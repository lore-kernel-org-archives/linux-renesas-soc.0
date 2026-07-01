Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA04266AE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907552; cv=none; b=f3pHuqbu6Ohuu8q+bXom5eKkF3NgPT7afUvSwPqa1qjRDPU0OUn235De+nJEkyPwA/QPQLkgVDJzYMUEHbsiHZxlkahcDXlsrQjVZglzgepUxmJEVozQvGUIQb8UOPOTHtxcFjY3Uftda58DcnitcAz82uCBszz3QiOM+sndIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907552; c=relaxed/simple;
	bh=+PvaMvHmrjTxXj2G9sbXthRtJKm2Zbtqg12poiGP4eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MGHne7lpz1cScZZ0uMz62OBtYCLOttWBrmID/8kx/dn8MfuTzNJXLn0No2ohnI+w9CHQwI9nIddp05vg1aZfZ0+ggCUziJ6pILO40VOTbmmvTumCClqzaYhj5y1iL1w0Bshp4L+iCPA+2rb8vZaG2AYXNiLZ0Z6UKPOd2uq2lVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5020F1F000E9;
	Wed,  1 Jul 2026 12:05:50 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.2-rc1
Date: Wed,  1 Jul 2026 14:05:46 +0200
Message-ID: <bb081f7fe646a83c9b59764267f67116db7aa052.1782907421.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable HiSilicon Hip09 erratum 162100125 support (not applicable).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8341dab1cf1c023a..45cc9f0f3ca34bd5 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -47,6 +47,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_FUJITSU_ERRATUM_010001 is not set
 # CONFIG_HISILICON_ERRATUM_161600802 is not set
 # CONFIG_HISILICON_ERRATUM_162100801 is not set
+# CONFIG_HISILICON_ERRATUM_162100125 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1003 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_1009 is not set
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
-- 
2.43.0

