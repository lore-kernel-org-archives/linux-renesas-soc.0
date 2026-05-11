Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A6B37B3F6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502176; cv=none; b=BlRcKwNK5wx4zPEbfzZWv3X92n4KlEfxE4g2QGTPySqiauVPVy31x3UlOJ4Id4UCnt+t52Pb6lakVQ6u2YUaC99WSPQFGS6n3aBOBqnYf1EiA1pVzl3XWpqXqsIzgUbtXSG/hPebiiqcoR7sCI2IjYTVrl0gGr+E2efBw3bBwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502176; c=relaxed/simple;
	bh=KBUChl4XRf16bOkf6V6U0wsXT+WF9QFU7IYawomblPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgVEG6jALvXeEW5Sn1mJFT/6mv/dvzn4ik9NOcMdo0HJ8BS9fumNgtc1pufGv53iRoIxq+dBRq2qAIvkwm9MwBM0YTep4Cl37R9gBzewcNWnYsozDKywDkHuyi8nUfsezzJMLkpD5NQlIOjHVLfn+8FWKBCemYYjFRozsfLxNyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ISer/pmr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ISer/pmr"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0082D2886;
	Mon, 11 May 2026 14:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778502159;
	bh=KBUChl4XRf16bOkf6V6U0wsXT+WF9QFU7IYawomblPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ISer/pmrlZP7CzFK68Kq7odAqiI01G3atW9dFRZCINrq+b2F14K2B3f9I3KbSVDeE
	 K18GbNWMM28+Re+3FGb5dQoQ0fNEdSmvJaAcnMZgocsvc2gJBfinve4HOwUEcofJeA
	 EWKR+ykawTrFAeWAEnfuIR5kjrjRKo/kbxV8Ljhc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [kms-test] [PATCH v1 5/5] kmstest: Fix typo in comment
Date: Mon, 11 May 2026 15:22:37 +0300
Message-ID: <20260511122237.3084426-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
References: <20260511122237.3084426-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix incorrect grammar in comment.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-brxalloc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index 3ccd6995b449..04d4029a8c54 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -19,7 +19,7 @@ class BRxAllocTest(kmstest.KMSTest):
     def main(self):
         # This test requires usage of two CRTCs connected to the same VSPDL
         # instance to test dynamic assignment of the BRU and BRS to pipelines.
-        # This is only occurs on H3 ES2.0 and M3-N. Check the SoC model through
+        # This only occurs on H3 ES2.0 and M3-N. Check the SoC model through
         # sysfs as we can't detected it through the DRM/KMS API.
         soc = open('/sys/devices/soc0/soc_id', 'rb').read().strip().decode()
         if soc not in ['r8a7795', 'r8a77965']:
-- 
Regards,

Laurent Pinchart

