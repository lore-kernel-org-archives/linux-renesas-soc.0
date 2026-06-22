Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B68F31691A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149641; cv=none; b=saqKgYK4S+2daprWq8IX/vtIEPERpQY0osJR6BJBjUPkrchWIQmlDxW4jraysmecBSL+pN9Y506JcHVKtKeKdT7rmWHrWsgFnmg04cUZdSUzDQoYULqed83VB4cAdpddGpHCa3OkZx0EHCJ0JhOjiu0a1IhQ015NrCBSW8Knukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149641; c=relaxed/simple;
	bh=UjydWJTnjoNwo9kAGxNP0B/6s8GOyWnsdWeFfHK6i1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPTV5Oe562b7OgtxxL09LrewV0bsl0MX0IwX1HIzfUbFA2r78aurBGV8uO99cEpeCbOaFwkv6aVzkJ5ah+cuTqOL1wtwR8JEQEv1IDE+QHYXQ8UtsLWRScf/OO5bdwGG/TFIq8fnmJYxHw9y0iYTIkfukuS1afwLtosM389PNbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g16M9nbw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g16M9nbw"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8424b00710aso3220525b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149638; x=1782754438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVefTgxybW9Azg7V+xbe9aantY3oFHiG1LZ9aj3W154=;
        b=g16M9nbwdC9Wj+cELrNW4F9vBfYMEYyGsbY2d/WeHz6vxp4vSVSzE16giYwXe4RQ3Y
         ekiGJNty/P9KlyfUfEad550Gj1cIazScqsrgbSDO8narABBjtjmWnwa/Ai6t3ScvnLt3
         IS3YG0Sj6pJfd5UHinrPDUvM9c4vKFYmCaKf6BS0Ty6PIgCnEk5giN6TYx/rYZO/91YH
         Q/79t6ysCBJFvHKvhwPegg45EKAaS6L6MD3dA8JpRuFNxrnWJzMX1t505UH8Z0NLG6+u
         Ppg5CsehgRl8hhKIgvTkdBChdDaChQph+1bSSCzWOWeaA82wKSQG6ErODuuLk36szSsO
         cvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149638; x=1782754438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVefTgxybW9Azg7V+xbe9aantY3oFHiG1LZ9aj3W154=;
        b=FuA80Jz2Y1RcdjzjNbV7+WATjZUZ7E9L4wF0dGLRBCRkkq4NMDXshg6FBgnvhqDg4h
         8ueKAosbu+RezIHSUf5EJgMk/0IXnDT7mN+9SrvcQTu+VB/+5ifm+YsdvVlU1d2avhge
         bFaT2p4oD+Cj3yNm1dj7pgypCh0VWzJQEsSB9tsyupkoDM7NJ9/Wx6iiKSaie8yi/+yb
         H0WjlhLUJJbOdvrIKuodiUyfWeXRwFQVLTGOb3Q98vmlmDLpIIsI0Ft/Ln6qoCH9Ehx+
         xUK73Hcf5uvW1VVJQZbQQQox8mcwI8oDfXp5LyFKAf+uKKYh/drFxOOHpt7m9lgQiY0F
         JDsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YZNSfJTPiLQR6yJakV14GvLKEvgtVB/diR4m666Dm2uWMjWlBu3IFUhKer/+6hIg0Zv7kZSoHf4SKsQEuGHZ66w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNFFKgzcvA6qQgWZo5H321KI2bunV66OsvaGn8uuAh1rLIb0S
	LhexIR7UjNXw7uMmJQateNv9Uab/Fl2/5TG96vmkceZaYOt/hMwz6Xdx
X-Gm-Gg: AfdE7clwXGRpaaH07nGot72XcHdRG/NCWetgJtQcRwHtuPosG4L3DSmfsvTkvIitPsE
	jLPuyO75NvWoqjRJg/uEKALgR7ninufpiQFmQYUyggBHX4+WGTIBqzBHHF+C8t7EIucsp1x2kvH
	Hel6qyoE3lB0hhEZa5+iTfVYISPKa3KYJxy7lo3g8Mh+yd8juRhbL6ffOEF9tcEgEAcW8FDBQUq
	qGyNjhX6K1Eb9vRZjTWalAVPG/6dJ/a0snV4ISvdsj+5NP6bcUJppX41mipZeSM+yBViKKvrKUs
	L/Lns0dAxsvTFTJkpQn611Ae66uWhPriV4a0RtXAp2YqFMjKO8uS8HgX9VDdk4nO2wc1NbJTT2E
	RkbKjNr75uY6OkBBb55lW9FzTPv4FfnXTTGt5RrPob9V9mvO6b8MCHbSmZPprUkobfh94RstWLp
	qQfDogzOrbhnFe+LPxMnk/avxZYsOl3LqwKLnp7KZU2XnJi0wblcov
X-Received: by 2002:a05:6a00:b4c:b0:843:2ac9:80f0 with SMTP id d2e1a72fcca58-8455087bf24mr17184836b3a.23.1782149638557;
        Mon, 22 Jun 2026 10:33:58 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.33.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:33:57 -0700 (PDT)
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
Subject: [PATCH v3 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:37 +0530
Message-ID: <20260622173334.60491-8-birenpandya@gmail.com>
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

The probe error path and remove function are missing calls to
media_entity_cleanup(). Add a dedicated error_entity label so the
cleanup is only invoked when media_entity_pads_init() has actually
succeeded. This ensures that the teardown logic properly mirrors
initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b5650..61558a71ee35 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,8 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +571,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

