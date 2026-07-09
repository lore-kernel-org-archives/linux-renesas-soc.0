Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24893FFFA7
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 09:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588720; cv=none; b=jVpiX79by7rb0mU5sZVpfiwimupNVyFmfnC7tsT87W+Gc9tmy+OxPqTC9ygWotFju2+fl61VEArQgZiPoQG52FFRaLE1Nomxlglze5sQ1LbeDeqZNcWXne/FVEpVttdkEZlM+pwMrfg4AnbtDSVCy2203iD6dxUm4hffBjbvhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588720; c=relaxed/simple;
	bh=fomlgJtN7/DM/6e6tsm3A1Z5+yYizONNR/sGauOKjvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9Rx58SB4zysEFDS6eAyeFKbi9sJ5z5QoDS93oPWjOa0qC1vwKeXuL9qtsuDFLR3XRk9n+Mh8pjujvFpH/TL2V4P8NOKqXNSNmaVHvyaUg5Bp/F/CtXThJ96ftFNvsUaJVJ7143q3rmlmAzxpijWt8btiODmQnEABYWHbevc5RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzQ5qhgJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzQ5qhgJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cad225673bso14357625ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783588716; x=1784193516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zBE3Wy8IbVvVmFetXIyFuvkOVDnb/jlrhawxTziiV74=;
        b=FzQ5qhgJyAJa48dNR2TFZNjx6n/2SUbcB0Hhq6VTsZG+tynROCmK5k57BQHVEv6zKh
         xySEgDZgzMHaeZFU4D4FRAmHiUbpWaLyZ4vMxBqorHSRXDl7krahxu0Tg/JU2eHxGhN/
         c/ZeguO3nvg3LiBYu9zrFJN5YAfMhvopGUfazZG4fwINMh3YtjwW3AUdVbbT/A+6GdBE
         WxfTG2AntTP31a/OSqU+o7MjkvD1geyP4rwVNCFBX6q5+OJJiA+/9IL6xTFwaHGeHl2o
         3mNbhp6Dh0HREMXNU9Q+I1hSyFTQv17Gj4ZH840sOPdwMgdyF1KdYZij+fRc9y7KQOwK
         SR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783588716; x=1784193516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBE3Wy8IbVvVmFetXIyFuvkOVDnb/jlrhawxTziiV74=;
        b=CLGYA9JK6ilO3QL1yoCdoTlF1LwYyv1uriDR1sg4bWm6HLwpQzkUD/ZNhx4C2EbNXD
         Hd/mtb/VUsrhA9yPnUcxXir3C9MAO/2fTKsGEWGu/GHYUpU5+x30tclfhPDm32Z7bADp
         vexkdghBV6/iitDWIFAcn0w5Bt2lSZEzYPJTY2cuftx3Wl2Ox1EURoqYxJzwTsXOwIin
         ASqERpCARmG0vggdo+4pUbRp8KygCzG1G4RXZ5ZmFPkEMWbRHip3RatXaeaAzt1Ewxoi
         zksgtoKWtrxplro66+GtmM+jcBlrOAOmPy+lkJlzc6/Fo7eARb3X+VC778ymKxVij7mW
         XfFw==
X-Forwarded-Encrypted: i=1; AHgh+RrkZWvBbBOprOEeochyeilNNoH5QeUtq0VX5NB+I89WjAdjuZo/cfvQuFN9b+SBBs/FfjmMH0eGryPvUZKFOd6BCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9Q+58PLdRa7Eg3mwp7rG4lsTMyygKgc62U06eKLPhGbC0cPm
	WxoH8Jq9XR9BKmXMpxSXt0SprQo3tOaUQKyFTglQvV80Pk92NBjsqGWY
X-Gm-Gg: AfdE7cmhssi/kZ0Q5qsNPcGmCDVmGtGqF5IZdnFK65chcwCLTSDbBQHAfANnwdeuPev
	0MxYgVKAATximVPOIvB0j9ApltfoT8xkJybqzdsnUz8C7bItCUnrldLR7lyGYcn18rhBnC2sjNh
	IZvji9uqEx5CvvhjJHGbq2K799bbZs0USkf3uNeLgnmK2llfDB7iTxkDXxN1bBlcFUa3qnEF68A
	SFIPJ678ZNaFcSs0A0Qmx9ak2Fw0MsVmW6AdTwNvjxHU19pr9O0ZJMsc+0Bt9pzdUu4Y1a3rcze
	wUS0Up2CABiC1tZqe1CqH2jcSZ4p5Gs1qkfi2UluwA/YPcpTngb7NEpgRt2ELvTuNVZhHhKjIZB
	ukQjnquDpUxFO7A2Ipu6HXykRkrDWefC+m1ZUpVQ7WLfnQOSDmBT2FJqDjYwxEaDewm8xbUfnka
	6E7MIVh2xxaVCssPcCqOxmm99p32w1TTIeH4wsWneg3hU=
X-Received: by 2002:a05:6a20:d495:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3c0bcf162edmr8106101637.14.1783588716037;
        Thu, 09 Jul 2026 02:18:36 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f6a9sm29682728c88.5.2026.07.09.02.18.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Jul 2026 02:18:35 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jacopo.mondi+renesas@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v6 3/4] media: renesas: rcar-core: Add missing media_entity_cleanup()
Date: Thu,  9 Jul 2026 14:48:17 +0530
Message-ID: <20260709091813.67081-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260709091813.67081-6-birenpandya@gmail.com>
References: <20260709091813.67081-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe error path and remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init() to prevent memory leaks.

Add a dedicated error_entity label so the cleanup is only invoked when
media_entity_pads_init() has actually succeeded. This ensures that the
teardown logic properly mirrors initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba8..5bae8eb0ee19b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1211,7 +1211,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	ret = rvin_create_controls(vin);
 	if (ret < 0)
-		goto err_id;
+		goto err_entity;
 
 	switch (vin->info->model) {
 	case RCAR_GEN3:
@@ -1246,6 +1246,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 err_ctrl:
 	rvin_free_controls(vin);
+err_entity:
+	media_entity_cleanup(&vin->vdev.entity);
 err_id:
 	rvin_id_put(vin);
 err_dma:
@@ -1270,6 +1272,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_group_put(vin);
 
 	rvin_free_controls(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	rvin_id_put(vin);
 
-- 
2.50.1 (Apple Git-155)

