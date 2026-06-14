Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2232EEE88
	for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jun 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456248; cv=none; b=KUa4RUbwQ5a+EK7j08hkTRDXEqtp9eeHClpz9AqtktY0xQ1S8x2H8e1t7u5hh3tjNccbft/OJkSFSAF7uTWztOUeMQBgitj1VtRnittHLQiDI98/ty3oWzLeGt6wVmptYrLrbTKp9dVNvNnjDgVhcseNXyosAfvu/WkyISJ127Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456248; c=relaxed/simple;
	bh=nCYCPVMm7UiRnt72HgVaO88SMofkYM4zDJXXTr6L3Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYDimOicmzjGhQe/k1l2H9FDDo+JStQjacrC98Ox4VDmJGpgS0HJZm1Ex4g44DTCghyJ0cHsnz/TgGxPTH0pHr0m+BGSve05MILnISyJI1rE/tWHMhiEniXMZXxarKqwrlDA/OOxBpgTzrngat5vYdLN7I9CLuJF89ve9VXvqS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBSTNb2y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBSTNb2y"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0a5354da1so20423055ad.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jun 2026 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456247; x=1782061047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikv7Eqa2s2Mrx2CW5Hi2avcXl63yH6FHKP5OPXB/6lg=;
        b=hBSTNb2yMrWRrDKTsDwkUpoMX79fxS0Zg+gJ+RMFciNY5vIrC2LJhzv9uoxaGklkcX
         C39bQGLP9TItXqE95fwCP61uEaxXWE88NWR+zhlAyzSttQK0VBgFdpYZdB7jMXa24zH7
         JAEGtUVRBzpoJFeywGvrBOAxFayLfZRDz1nJG8Aod/Zdaz3AC++LxnN9D1Cs3l0AuFMu
         7oK6SozqpJ7C9hy6eq/j1umXeEosCZRUXKnay4bvc2jK9dSUdKC05wCaVW1iUySzr3X9
         H/NMcwFqTMd0uoAJ7Yt18XlKvvzm7DwIpgZ7LLohVbtTa1OCSb3CZRbhYH74jRVwK2C5
         kr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456247; x=1782061047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikv7Eqa2s2Mrx2CW5Hi2avcXl63yH6FHKP5OPXB/6lg=;
        b=hC1E+EBAYHbfu0GRMamZbBc9hHHBejjvkxk96T15T2SJhTXj3Xa70YO+MipYvfqaUD
         4IfXXN7jYwex6Pr8xAyqkVW/UGUyk/xDowCdS7Ivgxp3S+zyjNmteYfYJIOfSTrKLsKY
         QwtLQ4DerFgr04auMQL3DVpuALtQisslYrmAStyroLzxpk0+YjASZ0TDP8Z5MXkq6VZN
         Q71o3lvLQwQAim4xuTJQnjJrSuhXZVbMw3UzGC1UgX3hlE6CvFCMxM66jR4Qj0ipn5AA
         XKs0c5+SMM/J+aqSoAdwTZ3i0v7mQRnw2M0NUXgt4W8E7siA8b9h8W7ZZwl+UftuRbzy
         6ZTw==
X-Forwarded-Encrypted: i=1; AFNElJ9+2s36SOaDKrBWrlJbER9WzL5UF2mKI0Ffn8C6EzxRDAJOdIjD56sfEH6OtZ66lQVcvTnLe1rT42gDWL7bkadQHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgg0XDwu7F0KIjG3jZojtUNNBsAGzOxRqcplBi+CN077QiUan4
	N2DBMEdttpyZeHYAi3TgWV0RLG1YQUAxwYVaXrqRCPC2ySt/+zsB+ZZB
X-Gm-Gg: Acq92OF1tAPRJK7MyVPbaOMqhTggSjcP6MlD9xNXzpXojVsktdb8NH9ZKTEy7bXxpsU
	QpTB+420l4ZpqkkjjkQgd8EdvpVOsNHovKY8Y0L2dLguUJIuJMDQEdvjcY8lmD19XcKpLdWUZ3O
	CVEm5dm4Gp4zpsDop5+Ygkx+LyqsiVqmPapLjxLcUpZoGnxJ5qx3ZjuO5by2BHUtuZSSwA/gYnL
	HwtVeKL2gT24Pg6wCctNw4U7yXqUZjTB7GR96XMUeE2UMoZczvYQl5efTbcD+3CuPuj6/1UKxgA
	zhZjlWHReCv4Xo4E6LnsnLduT9BHLffw6yGQxTUnxJZEhGgb0b+aCQOuj4unC9q0Tr+tzKPFDxm
	ARE+4H34W4FGx4QWwyDRo8DOWZ6Fn09pcsv789O5LiAxccK2y7B79fW6Vxd/Nlg/iVEIMouxKUj
	o8//xxRuM37gSyHWVXFxTR2wnxh2Cnu8Q2OFq4uHOAL1rTf+MGhYGO
X-Received: by 2002:a17:903:1a70:b0:2bf:367b:f46f with SMTP id d9443c01a7336-2c3fdfc2b12mr84794015ad.30.1781456247354;
        Sun, 14 Jun 2026 09:57:27 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/22] media: platform: csisp: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:48 +0530
Message-ID: <20260614165630.3896-12-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..51db5ad25c47 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -556,6 +556,7 @@ static int risp_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&isp->notifier);
 error_pm:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	return ret;
 }
@@ -569,6 +570,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

