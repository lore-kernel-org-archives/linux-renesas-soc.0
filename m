Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E6C1C84BB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149635; cv=none; b=re7hrAm9uQ6FYbHPP9wTmyIMKzn5mf4MUoK7m2VUXE1mFMP7a5bunHXQQ/huP16SzTyaD0ZYKUhC2/y6lCVNWFK1S4HhpUm0QJ3u24E1tIdiOelKbJ2pKLedQGgEmP0ZfHZ1u3vqvQ0sXzzKpq1+S4NJrVchXR70sKgnhSse8K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149635; c=relaxed/simple;
	bh=fc7u07+lcuLtI+CRLC7h9T0Fi15Z8tpXfuYWPX2izWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaZXIYrSGnI97/xqYKEopSiYIbUEu84ILP3EWPCrXXuvch8nhX7DDudzeWl7ATtZRjcZZman2JhLHgRrlTnlebn0+6btepqd1NRq+6nBgNG6UsVMT6mWo9OMA6Fa5/xIxH6IONxMYKWT4F14ZsklqpBcvNvuqzG2E5fZ86mgEBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFsFXUXO; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFsFXUXO"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4202957b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149634; x=1782754434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmuTEP0ouXc+LTtnjqut6HItOODcSSwQn0gYNTFF0hM=;
        b=ZFsFXUXOl64hMfueMbwLHQVEMHyMOpM2YO+IIYV29A0nAzE3rpTiviCdqdP/F3kEjP
         NTetWDOBWTJUih0Pi5DJpcOZFfIWKf66cfgIb8/EJCnJm2wS4EV2nNcwQNMPlN7XXgpV
         aiwm43ykpGRqndX8nXbgwEX22uqCdi47oSiVNr1oGz99L6abvbPa4FUa42vDPJD29QVN
         KV0esp4xqTN+BDBKTn4DYxD7f/694Yf3PI9blu9SLlWFCko2Mp1bqRRzmq2Xik+ALB4g
         Xap1PN382k7VNnrotZwSTIGc5moyZGLjB+7lPLys1UFYkMw+l9vgamqV1GspYo+uLa+3
         8Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149634; x=1782754434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rmuTEP0ouXc+LTtnjqut6HItOODcSSwQn0gYNTFF0hM=;
        b=fMGPjsVNyRNJcDdZVC9OQeAB08xLHaKgTtu23cFftiyBBH7tx73UzwtBxdiHtYoSuf
         nzlBdrh3pcGMY56bhi3gi/UiSwA4KGFauAmU1DyM4eTl1ole3/bTixxljFZPoeAQToOY
         Q5xrg9AUgtUZHZtXBRTg9JzeOXvaQGyuCRwbPHb3RUOdVxJ4of6wOKrM9yGy1QVNZXND
         lSOLVF6fPYxxqms5j/SAFhMfnGF9cE2C4Mpm9vsbZdZDcgblTfZpjRYQdPEVqh0ktfeS
         Rrgamrs2q6622TIeloLgUEjc5Q/+19VG5K+FlSNgRio7uVWEu2k82JMDHw18pPxEncf1
         /xyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/eHY6qMXd6kGS6l1mc8jIpuA7dCcf2aQ08Vgstm/1T4G8bMqwwXCUcORaZ15F3hYpNuRNwuruIbDhsSKZ0oWYjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLvD2xlP2fqlwz/dR0GsehX9PWf/S2AHu+E5RvFISW6LCMpAxy
	rrGXNULjqp36w98+Qgp8vX9BYnvT1Wor/1q4kFapWQUJokerWv0wl+tg
X-Gm-Gg: AfdE7cmuoONJJj0DpukE/OhN0L/FKX87KGbkTMe+c6cly8nyQOUuaajdRcDNgeO2RS+
	L5050FSsye7QoJXAvpWDDLoLd8jBT+uR8gQwiogxxjoRI8MChoWSWeIW/Maz2znrQYXXdmsEbEq
	rchc5h3cGVa8/xp5KONkWeNHbWL+yCFbtfQoPVVf4V/ey3xoQawz/KIKSNowipXzSWrwgKhmLjE
	cgF/V29/eEjAOPDNaSa2SvjQ80NAb5OlvnB2wtYAIuaHcmqCVFJPqbw8NC4NJIOOetfXaEzeB8G
	zBvhhCsL5kBbtBj32GLpB5CSUA8oAvFTtG+n/ghLmGypXKO01htvMQ2FYe20Ud9ZVI6yQAwYcRJ
	FqJXDBS6Tv0l8aUvLvxbx0BnjVFKoU9JwzXKSqrs+zS+R260sWw9RRHWCkoR/hWmGio9A00sCl7
	UJPc8PhecvNyAHfMUnvnPGfJS9BC/sNE+5V5uXMuxAAfT7PLG7eqvo
X-Received: by 2002:a05:6a00:cc3:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-84550866614mr16965833b3a.27.1782149633707;
        Mon, 22 Jun 2026 10:33:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.33.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:33:53 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:36 +0530
Message-ID: <20260622173334.60491-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622173334.60491-6-birenpandya@gmail.com>
References: <20260622173334.60491-6-birenpandya@gmail.com>
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
index 7305cc4a04cb..f9c818b0faf7 100644
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

