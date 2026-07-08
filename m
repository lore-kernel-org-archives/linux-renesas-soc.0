Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1C54A3411
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 17:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530542; cv=none; b=i9hUjePQeUsZPaO8HywidSyOYHXYZu8rd9vzxkXT63FmRisMD4JapXz3TJ/3rcJVF/8E8Cb4Pss8KoQMyr5waZEwl8X3SkkTh4KBvEgLKJzENh43C7SfVfAdnvKS4crRevJr7rXJbL/Gi8EyCFpsmcr9t8ONwtT2wNghJxNpbqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530542; c=relaxed/simple;
	bh=y63ibAfHhnDr1Nb6JXOTDq6pLbKYjiGMy0A0OM/Ki28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1jPE5luolkKRA8ASmIHyVLF8Lay2tpw5SU2S0b5HCz1J4baAACKCvVv9RX2XZS7B9gBFXytDv2TZ9g/Fq1W4ZU88Dqz4xmsolQTgSjxsPuskjWT8DNFw5vIkftgbBUjvcMUY9sTZbFLcjWOUT6aT1TOnOpDke/5OsS8Jp8wKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsEIKxTI; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsEIKxTI"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so640673a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530538; x=1784135338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md8EBppxz0EdBnJSTmOs+nL5kWFSgGuR0a6y3m6iXcY=;
        b=jsEIKxTIzHd9UzrlOcaTD4grkq56mokb51cwuFciJVNYLGmBp8y5xPfctVUtHTWfs4
         CUQ4n+sJb2jZO9KHiTGmlRGvaSRwQRyn32ECwcCI/E6ILwwjbmyBGP18QAqVYkQrsDQZ
         TFbsXcvFtwr2NuIzmAHtqUppHXpAaAPhuVBsZErzF2ZOk1/GOElnpAb/f73X7Nog2Tjl
         z40ON3nPstQY409rplKusrhbS5vUI5tQ+t3IATOzM93l4zdqxwW8vGqEW1PJFNCdwrK5
         iJXQFwSOXENOMiF0VsZZareXptnuKhZRo0kEf1SPfuQwReFhQKn1Myzz5Ov84SC6ut/P
         tMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530538; x=1784135338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=md8EBppxz0EdBnJSTmOs+nL5kWFSgGuR0a6y3m6iXcY=;
        b=sFhJIE0z15hlrDN71Fv5TjSF95ZbaKVHbGUK9F6wyVhZZd+EfzqQWgJsYzlrNZGRqy
         nk/my1w8iR/DmcuWUUpkVEqORYaeVfQRdRLfImPH7wUgidBwGWE1Ge2wITVnEkfcwUS2
         6VufZUKZNp2q3uS3O8Hiu9kHehNjg4I1fg+O+Lm3pJ0NJgSbf7LwcPD+mfGDx+je9PJr
         j1AK5DmDHeOKTwvSu8dnIp/sybX77eIjmRnpn1CUQzmKmpHmb21XdWBAS3mF2WHqSpaf
         mbUI24BLFSPBs8QTmL9q6tM5W2/JzZ3Hnqaiz4hAyB19CLVrydjsRy2sfIUKqXxxuaIS
         MJaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVbFkWEwpJ2AVkX0s24u3M8qbhv0NDlXJyrd8+rGAEB0WFAbiMEh17shtBM+PJMBNZJNnb26wzx5adY8OKZukGog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Dc23JcpJA9+q9RWGM7YU7PDvSrOyxhp9+UrEyAHCtD3phTKM
	g582cevw1t3T76istTveBmEEaW/OfFFpmJ9LGHshrAPluGaU8lMcuZKT
X-Gm-Gg: AfdE7cl8ZE+hyJlhffZPmGPnG+JpPXLyiGbf9bFXzUVItHdPdaSVphglmAaPe44TkRt
	o8U2Drg4j7F/DZPgHXEVdpq6XbCc/UsTd2Tks4ht0GWZAxwabAl/3KGPpPHZNg3xBDyZjmfkEJ/
	lasEXwRqXtX4fePuCh9cdcUCHz0lMj04IMRATd/KEV78QqOw48BEt0h+KH9xGdVvmuV55rPJRyh
	z8n17eS5L8+9ib5KBaNklteF32h3f3DZ1iYRNp5de0NKuMptv011YOJKtq13tQOvaT70/niGH4W
	qUB7VBPhWoIRv2gWermHRseyPy/RxCdOYMa4QEl7AGCJPWS30atIKMZ4PZ3i5WigEjXqbPuHl1m
	GiEMF+H+Fat8yqR9ThD9uObaplEIu8TmJl1UNYqZ2iQKv2PNsf9pRk4ug9jL1juU4IVfqP6GCPN
	2Aa8VaDJz+oFIWTCFtHnHkq2dc110HtUcbJHVJTuM/P2g=
X-Received: by 2002:a05:6a20:939a:b0:3bd:1db1:380c with SMTP id adf61e73a8af0-3c0bd06fe1fmr4009155637.34.1783530537702;
        Wed, 08 Jul 2026 10:08:57 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.08.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:08:57 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v5 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:45 +0530
Message-ID: <20260708170843.55076-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708170843.55076-6-birenpandya@gmail.com>
References: <20260708170843.55076-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error paths and the remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init()
to prevent memory leaks.

Add the missing media_entity_cleanup() calls.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
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

