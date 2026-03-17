Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B111DFF0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 20:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777859; cv=none; b=inqfiOoD8Lg8Gjm8PcF4N/keORUHUnFHnHhA60/UfI3WRHpHw5mRSJ7+vJ0oN0jOp86xeBsOnejBcpjm+bze27/WAV89rF4JBYDa5jpgWo9HICOwPtDDsZp5o/BrgvPymVs94Xx3xR9Edi+JPOacnhl4S6kxSFXj+4HTSKSGPG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777859; c=relaxed/simple;
	bh=GOaKeYCkQSCUCIe69X+6yPfwYYLpg5qt80hjNzmy3Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHLE3Vgp/sRJfTbv5kSJF6Lq2AOobzuYxej3dGX3Oc/bPgM4uTQewlXNZLlgjzvFwZUkLOs1ua/MIxqJcUjsaa9PvYyK+6+E6UHyTFFzzntPVOofEKYOMVFIHMDIBU4VwNwEvIp578UYor7snV7I47T4zpYORdH0RTTknoXkAIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ElIA+L7f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ElIA+L7f"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A8A1EA30;
	Tue, 17 Mar 2026 21:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773777784;
	bh=GOaKeYCkQSCUCIe69X+6yPfwYYLpg5qt80hjNzmy3Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ElIA+L7fNBPn10uuOdHA7Iz+eLeEE5kUCvrYmBH9SzXwfLqoAZ/ALYJNmwCHuGTui
	 PvyIF9f9YDydvRq3EMP88VRnLyuaA+ZA+On5rZ5Ns1sD1bdKR4S2BIg21gvJUmYFVS
	 adLTv/GVuWg1fZLcdcB5ZLRpfvhComf4MyQS4mjo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [vsp-tests] [PATCH 1/2] vsp-lib: Drop unused variable
Date: Tue, 17 Mar 2026 22:04:12 +0200
Message-ID: <20260317200413.433722-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317200413.433722-1-laurent.pinchart@ideasonboard.com>
References: <20260317200413.433722-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsp_runner variable is set to point to the vsp-runner.sh script,
which has been removed in commit 306c53b308c2 ("vsp-lib: Replace
vsp-runner script with a function from vsp-lib"). The variable is
unused, drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 scripts/vsp-lib.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
index 85f3fdef69d1..2cabb9b96cde 100755
--- a/scripts/vsp-lib.sh
+++ b/scripts/vsp-lib.sh
@@ -1105,8 +1105,6 @@ test_init() {
 
 	# Reset any rotation or flipping controls
 	vsp1_reset_controls wpf.0
-
-	vsp_runner=./vsp-runner.sh
 }
 
 test_start() {
-- 
Regards,

Laurent Pinchart

