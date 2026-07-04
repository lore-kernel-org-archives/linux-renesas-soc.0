Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30A42820A9
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196121; cv=none; b=oL/P7nbILmspMG2hk9HZHEFpLXH6YXOOTyzF8xmbRw8SF2ZthR+NppA+7MC7nd9j9i3qDYuGWmiOXmbhFoCuHR8aUP62+Lv4sCYATRmdtCydcLZYJt3Krg1eZNr+O+EAPumbbhA6bfVl8V6A3+6SWFxibLigjT3sF7Jn+hyMD0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196121; c=relaxed/simple;
	bh=0JRk+d2LpJKV3BQZ420No6tFZDOzeY0N6zRr9YnAA14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYU0NHz0YjLuWZmeWL0/vow8bkzrOGUeB08263MtuqaOVQBxqDX6ZWwBqe6D5SiqmpzykQqJ9N7WFoKzIbdW869bxbA9EWVBaKdbcfJJHAM92F9SOCgtGTIReVNOsvcZmbGJeKxtHQmEqSFfufSS/IjtustL1l/3NdsR7Rpk9Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hbu8YL9y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hbu8YL9y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso17067135ad.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196120; x=1783800920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0sHvkZhuGKPit0f3TXdP2d62dGPnBf4J3Peajwi+Rw=;
        b=Hbu8YL9yt4bSDfT7Xtat+ztnQx1LV2+re0qxPifV2auELdLjUqzMVKq/z0ok5l3c0i
         DYPh4zjdlr1WTmbzWhyAqMgVNDo2ofRNy6XHHcCjvT8I586NSfdKzpzLCsw7xyBu0k6o
         Sxo+HYXNOPLcchZLYiE9AmxkUFqxj0Psucv6snzN0SDl2vPp9SJFpG7L/tTMdWhpm9iZ
         Suwm5fwcmoGqagchUIjmIZcCcrkaNxm7loctQx0XDMtY57jmxNW1dGi16tJVxZFqIJKl
         9uq184AvS0w46nKQhj0Iqq1kN6q5eABmtxa5RbbPZD6oc2CIXhpglOH9yReQyHkhHWGM
         xPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196120; x=1783800920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b0sHvkZhuGKPit0f3TXdP2d62dGPnBf4J3Peajwi+Rw=;
        b=RNgdJyYzusT3doFDMX7JCESMrqCb0ykkiSWxyWniR957rz9LWa5FiznTC+yf7SCjx6
         5frRYDjZ0L1uIRoI4+pPbWYpYXBymyCv8ZxepxnTtFdAMY7RyCkw92hvU5rHZ643aWuY
         F/jtBt9HTWOWSJxqrIZ/hYkaJhfDSiYBn57mqnrWNQJf166kIT9ho7xPoP5iBfHBb2Wi
         ojGnAT15RRGvarHasdp6xMXC4LIoS1daDsZYUJC735g5+Ba7p9FDZ6RyoI8WjuLQPzvy
         TFByErlOLDq49JXVkZKbg1Ix8W0x/1ianRgic4/BOGzEYg16EBMrMdUBpEP7xzUC5NW8
         Ui2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqKo7gOhXrUpcrrwEStvFAi8DWs7Adz2QuEnJ3eg+5YMDwRd2Jbf67gbn1Is5EGeSbqTgxhEIQtnGu82wVXJpsxEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ337qldeFowEw4uudpx6X+kQj/cOWQ1FJbVlJuJ6hnr5vkYlr
	0qBU1PO5no3/Nw68LKh2Z9DTS8UQg71A/vegQGcAZlYYe71jq+EIAQEQ
X-Gm-Gg: AfdE7cl839032vHlmA6DhEEkdSlVLJpE2IDe1eWiuDUkvhmZwI+ilCa7l4ZTWRUWO/9
	V7RA+ywOdlbnGh5avsELJDxe1KueqmwuJEtnWJwUvMiir7JWY6lQaMT5sm81ns1i1y0pMXzo2Pt
	accFWktKRERwlDJw6HqPHWxLhKW//N20P1XjVxsG318rfaOsEP6F4hg+xo9gtdVgesSYYbA7ai4
	pgmEy9AQnNm6iQnjexcrCwE1/e/Ku1tv50fnXm6TKJyH1TOW3L6i3VzpSFL23q4ZH7Jl988wGsB
	w3HMG6eTK5e5o3DjZT3pQ5rYrW4BVC9wnRz0LIora9wsJql+P0jN2GeM5HOVJ2ZlhMUMeW8tLsP
	w79CPR6yWfwvXUn2+5BqIIt2+m6YJcmpc4DVULq8agao/kHJUU/H44cT5Ft90kp8I8oONfEwR4w
	9SnMfhNq7Vxm2Ey91FxkHkRbBUmkTvlrVyeUrbG6eZz4g=
X-Received: by 2002:a17:90b:4a46:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-3829ef0092dmr4578458a91.18.1783196119898;
        Sat, 04 Jul 2026 13:15:19 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm6341930eec.2.2026.07.04.13.15.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:15:19 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v4 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Sun,  5 Jul 2026 01:45:08 +0530
Message-ID: <20260704201506.82524-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704201506.82524-6-birenpandya@gmail.com>
References: <20260704201506.82524-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb1..f9c818b0faf7e 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2631,6 +2631,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

