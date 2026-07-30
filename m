Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B85435A9D;
	Thu, 30 Jul 2026 17:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431617; cv=none; b=NbCExkdlUh2RulWwJfMa/4AHReK6QlgKfkgPaBvTFEq0nb/oUtYLbn9mTfMfwYuVNTMxFY1HNr6+4gCpEc9BzI9VkktAnzhSaCoxqFjri5acNrQw15z9Dxfjwal42N7qNepaT7t55f7/ju/Q/I7VR4Y4M15Y9WES4t0GtD/S3kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431617; c=relaxed/simple;
	bh=96BXf4Pv/kVHveUTp+aWLfXKP5a48IvNbVnlVnEB1A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LO8FvEvlo6MvVe7l7tI8YRNr9ngXqm6kFZ1FZfNv3bJclNuxUAUPkMyPAMT7mqIcHHXzDuGdknlbkC2VRNO1ZuKHh7am9+MnzsBO08svKEPGbOY509ipYIVDhUaKScZg/zeJ0abopSCgZVHIByKJQY5P96wz9n0bNsD0bbFNyXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=4seIBOlH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gWmQKnkc; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="4seIBOlH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gWmQKnkc"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3C423140011B;
	Thu, 30 Jul 2026 13:13:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 30 Jul 2026 13:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785431611;
	 x=1785518011; bh=qFVl3t8Au+yEUaMhkq44FDPNQYRW02T/EXa3KaWafXc=; b=
	4seIBOlHtsldWFRi2L8/OkipvXM5L3/OY9D08dCUN2uxS8PSJMPuv8S539eH1lAh
	Q68pCbNcH2V+vfI59CBAV85Bf2uKTiGj2sA0K8x8pmnKy4j4ANMCBkMeg6xP3+aD
	PpgEkv44xxWSi+hXZecVfNH2Y5q/ZO7kFJTpFfFcXXYoVMYzPXrNZVlxkqFadhqI
	ACn5wws+ZwYPX+S7ourU8USlPSVrP0Hyg/JAoLJRe3cX+PetyU2rPh/PWLnz+d9I
	rKxRUGfKkecbJNR5WXcwGW64478f1WncAcclpD/DLHyAAbOJDOJBZtK8aVBVS2ag
	E9mFM9mg1QWAKIQFHZGI6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785431611; x=
	1785518011; bh=qFVl3t8Au+yEUaMhkq44FDPNQYRW02T/EXa3KaWafXc=; b=g
	WmQKnkcIGbB0+efciibwJkLQwz8fKzEpyRKMSJaDn7tng8zCmXql6FB+MjavHTxw
	8tVNdbcwS4DgX5SLVoOsioFelq3b9zrEvlk+LLEfUBvB2W5Lyhr8XIN97kdnu81z
	Dbudc2O5gJWE6lVc8hFz1FgAGXsZBh/BRdTmetqu4UbnM5kalOeMJ56VN1BkTZWU
	Vwf7cDzuAkhhhyjYziV0FNnrvboojFo3gbeCQhAlim7g9ZQDrbHpy3wqqzuTy4tV
	PmvSEfeHdsbEE+Vll4TrjPJ3tTzgZCZobWR6RyQjbi07n7UCL8sjZqPYyrurpOlP
	M/wNhvwLcTMRqsSKo75qw==
X-ME-Sender: <xms:OoZratMNjpd-iFWGscQkjtvZVtOKK_jWeOgUXAhQU3fAg2AtV_3xFg>
    <xme:OoZrar1HUNeqEO6B-sh2Hud8yU8x-lJEI5DigjIdcFArmKx6IUk4FBrE3DqR3rBKb
    d7c84Bh1iYEeZBDPuYrOJtSYS-CssfouNwZ4oKSxQBI09NSnwZ1Zvw>
X-ME-Received: <xmr:OoZrapR0qaVEz9MQoPsgbH_OAVuv7ThWP_L0IK2Voe8EX-GgJJlGo1Z10HTyIMViWrCu7s9MZo3aV6m4FZcG-PJAfW13be4>
X-ME-Proxy-Cause: dmFkZTEp17bnltZ0BqVQuE2TjGZ913lmgoEZowDgYVfEF0bmk+Nf4bVQU2UbYwROKQhrn/
    qcIe040zDcfvVSwy1oVNygs2AACIeBIJd78xMxQZZvRWl1wbWpY4RYjLJX18fxwA3+qGqe
    t3X+SD6D/6CFj+JrVJDWRB4UqNr/IwgpgjI9zKe/HW5YjgaEwvOqobkV9OFZUH/dTvVSA2
    6NX2iVtB/K7FLHLE0Oau2LbkgZAeJS3xgh02VerIdxk1rNKmKGPKg+DHxR8xBql4aZcnJG
    neyHcG0wstkqwtqtOMnG8cQmBQFyzEmZ3FNoYsu+SqsyoB/8KywxMXAXlxwXUnD6zJxrc1
    RPeJWdZ8cNM4gsUSh6YZzKWiwnq6tXdOMlxj++Xom0teJkgzhOTqMtXLnJjwRa9DzicMOB
    1lTrVRIdJhoB7gYDfTWbjZEcqxUVkIEeqFnXqiGTXnus0PNLztGL4qRqAjvCy0qeLzGucv
    zanehr+BBfvujwOhLwsjXytCi4W1M2Ox6UCyrText0ro9La8jxy4RGQV7H8GETLmwSsC+t
    4ezWi6k7GuXtsJHLq5ZN6DkherTX7anWlieOr7Sso90Chpe3KHY/sim77xJBGngpmnqTUi
    ibWVV8EIpNYY1lyV+yWgCqjQWVWwjfm8PE7SumcQ3eiorMe4SohzfiMXJ6Lg
X-ME-Proxy: <xmx:O4ZraukFhVUKBbpXftnThIuyHu-Mt0RHEzZIxw8R6UOVs-FS7PLBsA>
    <xmx:O4ZraqMTEDb_V9FsTbUU_NkhpJ6gunzliJG2xdHZO_MBNjsQnvw-8A>
    <xmx:O4ZraqgLbx1Yw5l_fubcRJTu_qwIChivDk6d9RH4LWpQRuqH29eRAA>
    <xmx:O4Zragh9KwKuNqeVfRqj3jo5I2BgM9_7hxhiZ9cKHq4QSTP2Z3eHWg>
    <xmx:O4Zrag6sWRzG-nenU6QsPSMNPKARCoFQQQzS22Lamc10DJfqFU0M7Api>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:13:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v11 02/13] media: uapi: Add extensible param and stats blocks for RPPX1
Date: Thu, 30 Jul 2026 19:12:30 +0200
Message-ID: <20260730171241.483870-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730171241.483870-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260730171241.483870-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jai Luthra <jai.luthra@ideasonboard.com>

Add the scaffolding for the parameters and statistics buffers for
Dreamchip RPPX1. The parameters for each ISP function block will be
added together with the logic for it.

In addition to the scaffolding add a common struct that describes the
measurement window. This struct is not specific to any block and will
used by many of them.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
[Niklas: Commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
* Changes since v9
- Drop linux/types.h include.
---
 .../uapi/linux/media/dreamchip/rppx1-config.h | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 include/uapi/linux/media/dreamchip/rppx1-config.h

diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
new file mode 100644
index 000000000000..1f2548db73ad
--- /dev/null
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Dreamchip RPP-X1 ISP Driver - Userspace API
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ * Copyright (C) 2026 Ideas on Board Oy
+ * Copyright (C) 2026 Ragnatech AB
+ */
+
+#ifndef __UAPI_RPP_X1_CONFIG_H
+#define __UAPI_RPP_X1_CONFIG_H
+
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * struct rppx1_window - Measurement window
+ *
+ * RPP-X1 measurement window. Different blocks use a window or multiple
+ * windows for measurement purposes. This defines a common type for all of
+ * them. The number of relevant bits depends on the block where the window is
+ * used and is specified in the per-block description
+ *
+ * @h_offs: horizontal offset from the left of the frame in pixels
+ * @v_offs: vertical offset from the top of the frame in pixels
+ * @h_size: horizontal size of the window in pixels
+ * @v_size: vertical size of the window in pixels
+ */
+struct rppx1_window {
+	__u16 h_offs;
+	__u16 v_offs;
+	__u16 h_size;
+	__u16 v_size;
+};
+
+/* ---------------------------------------------------------------------------
+ * Parameter Structures
+ *
+ * The same ISP block might be instantiated in multiple pipeliness and operate
+ * on a different bitdepth/precision. For fields of varying length among
+ * different instances of the same block, use a data type that can accommodate
+ * the larger bitdepth/precision.
+ */
+
+/**
+ * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
+ *
+ * Some types are reported twice as the same block might be instantiated in
+ * multiple pipes.
+ */
+#define RPPX1_PARAMS_MAX_SIZE 0
+
+/* ---------------------------------------------------------------------------
+ * Statistics Structures
+ *
+ * The same ISP block might be instantiated in multiple pipeliness and operate
+ * on a different bitdepth/precision. For fields of varying length among
+ * different instances of the same block, use a data type that can accommodate
+ * the larger bitdepth/precision.
+ */
+
+/**
+ * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
+ *
+ * Some types are reported twice as the same block might be instantiated in
+ * multiple pipes.
+ */
+#define RPPX1_STATS_MAX_SIZE 0
+
+#endif /* __UAPI_RPP_X1_CONFIG_H */
-- 
2.55.0

