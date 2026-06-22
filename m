Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAB32BCF4C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149653; cv=none; b=Gj8Q0cy4ZRWdIlwi96i0PHyDinqp4qjFFUEQ7SFWAdOPuy03nl7GaAKNvQK3So7XzZJqYW4uiR1yCsv1WITx1GWQn7ZP+EJMwmGAl5mBoWlK3V/1f6I+m2idszGv4G8/sf+56sm6xagSLQPstXepc39VqbI1ZpMQEOEqPiF3ivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149653; c=relaxed/simple;
	bh=lwFdU43dZ53s2v9ayhYIqbIXwV8sj8ytOjiLYK2MyuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6b/tqvUony3wmQ7rPfx4FBAdcAWiaZkKOUnRJmVdGd23jvBXn7Js+s5zyZkQHCfrWBkcZeeLpaisEv5hBSY2DFAl9uG7rQ0pkRsrhznscUqQmHSlzMfr0poiTAlrrm5U19EP4ZzZKg6ANfysy3Kmsk0FSKjPAZeUz9I1vcaWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrUHCg1K; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrUHCg1K"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84540eb70b2so2553853b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149651; x=1782754451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmvF3IgqnHx2JaIejrSdvjpAyG7yRfqwXqfL7qF+zJ4=;
        b=BrUHCg1K0HliGvCKGi4ygIDC2cA8biziTlVaNezysjN5ZIY70AIEDSPUl5juLDEu/a
         DcaDnq1SoTGZUJavXxeUdY/kHW/KNfqgDbNNxTcFiwak8iCAS9Ou1v+flbdEajxu9ktE
         qGnuJWggRTW1lcI1DgHmQmVye+mqo9NckwaSwHf6hoqoxjGa3VR7UgRacWA8KoUtnIYx
         CtfMU+ONegNUQKpWzxsD5KNLMj2xMESs/NjFWqh7QmuEQmVO9dzoKbnwvuZbWXyce8lS
         4dLaIMciDzIRu9wKwGcUFWwmxTa1sMLzzkRq9PAfuc4ml4LzR+CDSfS3F5kqvNyXuhTC
         oD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149651; x=1782754451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmvF3IgqnHx2JaIejrSdvjpAyG7yRfqwXqfL7qF+zJ4=;
        b=JUFWUoQTUPVtPZ4ZMtAsSisvEvOKGPC5KfVwDDq8+sepWdZi9ZngMu3ZkPPFbF6ioh
         MeFoA7Dy78+pFPX6ZJvsEbgTI9aZjmawPEXCts9Mgb5eBDVNBx+ebuuvXCypaxHUsoT2
         SFsRZal0MMTP+fjCc4Vtnkm5OUvTK2xBUxuV1d/eUvAZGSDWplRf/OuBkYiSWXVZQBIx
         gdLO6iuWhuS7pRzMZSHQ6RnaZWiQ7YHTujFQktWMlvq72WU+sOoFydHel31AGoB42b/S
         m4rhhQJlvvxGAOnKJXKL8sOKdTZw5HKzyRUQNS2h+eQQZ/sWY9LZgbCBdo0Ndhp3p3US
         PJ0A==
X-Forwarded-Encrypted: i=1; AFNElJ9CCZ2AYk31z5YLsZ/sBaMUO1snpWdoki2/DltHOe7BOMXAD99sRSJevTRATthFhduXPz588SDCxqzXi8USNMprCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygyJveMN4NZ83lyG24E1ITQwp79Llmh1Q38duvevWDwmN6zhNd
	v/9gxBtlZyPnrhp8fguLAVjoovYwHknGnSn71A7VNOPJBI2+Z0ltBNBJ
X-Gm-Gg: AfdE7ckz1OoRkLdqdy1rvs+WtrtZJYEHYSg0pMErZFgk6IVfyhZ1fiwunDf9z3CKujp
	rheWCPizr6t1hq7nG4Y4fXaMJ4Uc8LgerI2+YnoM3BOxPuZ7l+RnItlccT0KuXNlMJdhMkg3Q0W
	9I87kJrsCTErqrFkLVOyT19dnJ4gZwEAtcK5fCYdwr2/MqY8DdxTSFTuzUNqakdskQVzxwY9DBx
	aBQAh8xazeXCyoRk9apXGpxaehRhk9a2uK7bn9kejaQWGjDFCqC5p9s4kyZb4brYPzptNNfGFUb
	eTlz4LHglkAaDoZh2+yTxahg3QxvJAuP5OR6s6dcGr6Cjn+q5QzhSqb6EQute4ScTSasleqgeeq
	nJF7xzFtjHrum2HgXPznwYci9x+kE02bwyqT2gmRXkmbpOJSiUJkyVG9ibPiSTjBsbY84sEVt8O
	dpeg9zPBwK5yydpj58uxye8sGRiAa6tl7RBkBVlS3x8OwV7sv0CyWc
X-Received: by 2002:a05:6a00:3d56:b0:842:7476:2376 with SMTP id d2e1a72fcca58-845625b56fcmr11469854b3a.41.1782149651255;
        Mon, 22 Jun 2026 10:34:11 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.34.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:34:10 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:39 +0530
Message-ID: <20260622173334.60491-10-birenpandya@gmail.com>
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

The remove function is missing a call to media_entity_cleanup(). Add it.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..84d4883e2fe7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -312,6 +312,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)

