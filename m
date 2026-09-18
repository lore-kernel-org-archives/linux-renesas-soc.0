Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4F836195A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 01:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695397; cv=none; b=nTvnOMM0SfrmI4uUYVYj1Cmdw64oJqqJFF5IifQaW4z4uJK5ZMuMlaR7fnpMZY4XYlYnxZTjNOHMMZ7NOcEoBQgOTRCqdJDklCrdOKF7Cy1Ze3HrCzvLbophFUIS5zSpQkXjARGbf5V1KDQhLkiKnf+VO/MCgdQ+76pYWU+6TTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695397; c=relaxed/simple;
	bh=dntS7yanl78iZm8RJAKu4itCeBTjtAM1ZldhmyYTIXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yp+vbwaUBDyfz/943Ibisd4JzXiN3E9jGO0tHkotO4BesEDoHEsXB7w0xvSZmRSC/54bCVx5H8xDGGrcA/1P2+mmnV0BG6+G249m5Q3q52HiW/BwrZoEhasGnfKnNfkS/FvTCV/uX5m7QTeRnQnyqI1lhkCBKecGi/i/++IMBok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sHkw46pS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sHkw46pS"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71B5E4DC;
	Fri, 18 Sep 2026 03:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789695290;
	bh=dntS7yanl78iZm8RJAKu4itCeBTjtAM1ZldhmyYTIXo=;
	h=From:To:Cc:Subject:Date:From;
	b=sHkw46pS4f/uBE7eFjDInjLpn2f7tBN861tgPTItCuHQvFjA6z0hwbUvzVV9VSmvJ
	 CFrzCvDjwgTWmbprNl/F60UcvPurHm/WPmcECPyEIsyqSPX90p5ck+gyMWrWwmFjpB
	 /lQ8j1uACbDBMOnEkmBUUDOwCch2C9yZwwuC8uSE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>
Subject: [vsp-tests] [PATCH] vsp-tests: Fix location of CLU input data
Date: Fri, 18 Sep 2026 04:36:31 +0300
Message-ID: <20260918013631.735399-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit cd7de9f4e613 ("Install in FHS-compatible locations"), data
files have been moved to datadir and are accessed relatively to the
libexec directory. The vsp-unit-test-0010.sh test hasn't been updated
and still references CLU input data files from the current directory.
Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 tests/vsp-unit-test-0010.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vsp-unit-test-0010.sh b/tests/vsp-unit-test-0010.sh
index 1878e6a809c2..c187b2101715 100755
--- a/tests/vsp-unit-test-0010.sh
+++ b/tests/vsp-unit-test-0010.sh
@@ -27,7 +27,7 @@ test_lut() {
 
 	test_start "$(echo $lut_type | tr [:lower:] [:upper:]) in $format with $config configuration"
 
-	local config_file=frames/${lut_type}-${config}.bin
+	local config_file=${in_frames_dir}/${lut_type}-${config}.bin
 
 	pipe_configure rpf-${lut_type}
 	format_configure rpf-${lut_type} $format 1024x768

base-commit: b7bbca0dd187d85428edaecfc08c948bba72152d
-- 
Regards,

Laurent Pinchart

