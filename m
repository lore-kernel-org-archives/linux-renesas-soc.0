Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5F3E8C6A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 12:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796996; cv=none; b=CM/usIOkDPYkWjeA3/1QOgBLM4DZ53SUFhU4+IOyWQStQL7YbfrP8+w2uMLIJljjryvD7QMvsjFweEyswJkkW6Ou5r2MnImQNViYTaOyAhioygE9WDCGYBsa7tO8YBNl1YlF2Bw+OvO7pLCm4y2lVYcv6QQ+hpbkfhENl9cV/h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796996; c=relaxed/simple;
	bh=60FLVjS6344cww7v7mVjQdFT8z1gUGwaOUCCd0QViBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDr+NoOsBXZIkq1/6u2NQwGxrkE+cR5gp94XkLyEq6xFYkr092VTm9IGuxKmaN9LEWaKQkHZ5g7afpqcq5ZkjwtIUuRwtEQb9HgpvMYbLHufx2g5PEqR015qhKslJCkJ6hYpTG+Xpa9QADqDBhO2WHue4yj+w/5E4PEIcNjlJJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gw5wnDqs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw5wnDqs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so54679735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779796991; x=1780401791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ey2Ry8WOYcw1uJXmD55b4eg3Hgx3KA8mNUuxhqVi/k=;
        b=gw5wnDqsZ1nZQ2/ZcXg6le+S4PlH0mZjZ5M+o6A07D/TFfWIDOlThgUnb2SMtP79Ci
         ylnxMbDH8ObncPN6nhsU05TuDH73ynNBzumHWg8IPMeLYNJqD9dIUjzRgM88vkmq+ePZ
         bBszP2W2TQYhWdQQON+A7156UVk5i1TRixPB+3PRal4/MOL7lE8L9apVBBazfab4jyck
         RAhy//XBmXMZ1Q+jQGWZoZifkgc8o6LVBkvc39nLbYtQXdG/L6GSHjs98s0tzAQApDFS
         PDK9DjRV/l83iXNcKbx2Byw6BJi6SaWkjvnnPnzvFx7tO3owHnA19SYdR5K/YGij+JJV
         o/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796991; x=1780401791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ey2Ry8WOYcw1uJXmD55b4eg3Hgx3KA8mNUuxhqVi/k=;
        b=oiR5F12i2Lwkf8EtREv33SiiqTxtEx9F9i3oSeeg89AMXx+iKkPeHA/Lj6mSmjQ0Kk
         S8RmxDre1RAt5bxXgBOu2xIUKIBcQT3Y74+Xs7QD/O2MvkYCmEp31deFf4eEEHTbPMeC
         unk+CwXItlgyJLMolU9bi9UI+8KiqqZW73edkqrVsTj7LT70cfJW0KHxztHxbrCVbWdh
         CvbTBrjM4PeQ2PJanFrK5pQVPcFrFJDv1TksoeUD2H2VDbGByL14MoM80fmFAomtVOMm
         8pUkcbRipQQE10L+/og4/cBoh9SHwCVpSHLbiZuvBKDz8YFMPq4UDXZkKlmzudZOUKQZ
         hu2g==
X-Forwarded-Encrypted: i=1; AFNElJ8h1a/6NDUwYYAy+10kE/n0ZlgT43gVCQydU6UlW8O7OC3/bROt4eVRreStl7S4peKTcexBiJfBvSi7g7LSN/5GoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb/Iq7Yk4Im2xh2YxVuLjqAz+9FZvH+MpaLSx0WISl4wE3wWAq
	CK4kPByIsdKAv2QxsEdgrpkZ8auVuJ8wlYCeq7G1Ej8Kcg94Jd0FNXBR
X-Gm-Gg: Acq92OHYCcKXEbBZMfGzaAraCKyTeOQdiZSH2uktj3SZxs0pNXGIkAtke+7/zFPJYq+
	vFXOJBuoJG/WsNE2LRoKCy6cEXzFeQinPinUC7yVMknV8Qbdy0XsOSpQsXMv7aC5+T4FT3IBHfZ
	nqNmnRcBrvJNPqwfIM0SbG7EoWGZkiIl4+UnjTXrwwhe4ApaPIYhpQecyWcM4KhHFKjDJoE/439
	JZoP2ZMfae7kxMGI2N7JNJPnU3dIl/oaJAVdBQJO8ULIAgIYGvf4SCsy82x3jfYeAk523d52p2o
	KpJ+eNm92eODFv7nUO/6C0TdlMNimtlTy7i52V7lmc4fY1EskDBqbwocsWK5VP9LySA6sRwu3AZ
	Bq5/Dzts2ZgbE54C/uqXCRw1QXcC2J/LEoYmegWrUghSHMB5U2f237h4KgfErp0syGVYFYI7mhw
	iDIpshoVMMno+n0E18gzLiApU+V2Z18ZxjNKUENG6PkKFSfwvg
X-Received: by 2002:a05:600c:a402:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490426d3f95mr215913035e9.24.1779796989573;
        Tue, 26 May 2026 05:03:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:e748:e762:2da6:e1a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49041787932sm144370845e9.1.2026.05.26.05.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:03:09 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] Revert "driver core: Use mod_delayed_work to prevent lost deferred probe work"
Date: Tue, 26 May 2026 13:03:04 +0100
Message-ID: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent lost
deferred probe work") introduced below regression on Renesas SMARC RZ/G2L
EVK:
 class_for_each_device called for class 'devlink' before it was registered
 WARNING: drivers/base/class.c:415 at class_for_each_device+0x12c/0x13c, CPU#1: kworker/1:1/26
 class_for_each_device+0x12c/0x13c (P)
 fw_devlink_probing_done+0x58/0xa0
 deferred_probe_timeout_work_func+0x5c/0xb8
 process_one_work+0x150/0x290
 worker_thread+0x18c/0x300
 kthread+0x114/0x120

Reverting the commit fixes the issue.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/base/dd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 172a02a438a2..5799a60fd058 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -323,10 +323,12 @@ void deferred_probe_extend_timeout(void)
 	 * If the work hasn't been queued yet or if the work expired, don't
 	 * start a new one.
 	 */
-	if (mod_delayed_work(system_wq, &deferred_probe_timeout_work,
-						 driver_deferred_probe_timeout))
+	if (cancel_delayed_work(&deferred_probe_timeout_work)) {
+		schedule_delayed_work(&deferred_probe_timeout_work,
+				driver_deferred_probe_timeout * HZ);
 		pr_debug("Extended deferred probe timeout by %d secs\n",
 					driver_deferred_probe_timeout);
+	}
 }
 
 /**
-- 
2.43.0

