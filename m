Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5F337E5D0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136061; cv=none; b=luvW2W4hp59RmmsPF6jni5DLxt7sLHOVNrujt8YT6GnoEEsVlQ/Bu0VjgKof65C95woCdcwCxh4bNHC6VfL5GfBDzWR9dB/4bwhZyHCJahMG6Z35HTtYKG9tdWijOGmUIIhIcoB94y9u/ioEN6yQAv8swFffmNZZrTJMlDxDsRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136061; c=relaxed/simple;
	bh=6VygO8fJq97cv2/LDT6K/RY5WR4BNmBEN9fDoyhwQUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oF6igHP0r1ZoYYnweAIfQplOdiDokqoE3VPfgiAtJz+yRbzoAWPBx79iysmke2867iObbuCWBnLNgzbkUfcuETpvoFy6XIkYh6DCfJNQvBI2j9fuDj0tC46qmOuivd249Broq13Sy8Ex7LsoBQyLUIcwz7UJLiXkbGcg/MtmKUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvRnzely; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvRnzely"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso9706765ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136057; x=1787740857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGNWO1eqT3R5Th3PNhdxmu4ZmPk2gjulxaMorpXLcZA=;
        b=HvRnzely38dTiK+3hNCLddjbcd0Vp+OpOopUkScqRaJk2H2jiw4IV7UQNGgU0szn0V
         b64WllxRGzeQWHauHOi6wrQ6A88xgD1kGqcxt8MjxozbnsIIeJ6Bxyx5sSe2nL3lUwnk
         cZI/V8bwsdWapp+qMjSBQhm3IqJNz9lqgzzrM67BL+moVyGmACtR8jZJYnDwLYTmE2zU
         6InDJ3/1/mhR4KGTHjbj3a+uddWpnzg86rxhXDZTaWILC7qPkDyoIwlLHeA/IGzKVVgh
         dArFs5K2folg6NQuiBKVJt8AVNgof9nulk55SD+0cwBmRelFYjcTbY1OcJ9hp0pztzit
         8V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136057; x=1787740857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGNWO1eqT3R5Th3PNhdxmu4ZmPk2gjulxaMorpXLcZA=;
        b=H1otiphQFbZ7nflrCZ3+iHJ+azR3btgDBBlau9FioqOze5EKmhbXgOPCYxyRigJtiN
         tzB8r0SNJwBByAyybggv6P3FwIlm6MngGJio/fzc2/lXGjh7iXaMqG/iVHw/hygsuw79
         tgLJgUi+VVWkOtXOyaOrYHZcFqsH+19VwSIEjw7j0lbMz+v2oJmgHsX6HNLVULM5pu2R
         baemoxpsbZ0iMW2y5+VY9DcyobZyg1KvnNn0vL4wBDki2zCSrye9O4FuxOJlAF6T8z+r
         GZt0S96IdfDlMhFuSyvi9vbRfrvBFFLU3i2wDXqpyhnhFsP1MibfW/GzEosorgc1P0K0
         L82A==
X-Forwarded-Encrypted: i=1; AHgh+RpjxfRJ4HTxZRb1GeZLJ5/l6+6rGpKKl9CswHmC6ocYy1i2xrs6NdwOxe+GJ9g4n904sFBEjxtumNXWCcPemq1Eew==@vger.kernel.org
X-Gm-Message-State: AFuF++lKFswyC7ERgY6EiLMV9xVOYou5fNc34dYxKulNkHbW9u4Dr8u7
	TC9eWfrGPINh8chLdNtwkMfoSU0bltGl767BpWmygCvSaciVXGTYEvq+
X-Gm-Gg: AR+sD10cDivaWwWEa5O3kg4GbyT4jexpVYl/5SJBlWn1o2o10njI9gnWr+wHwwGv9Ct
	NCq6FrYTwMiaT3NL47isVdMGrnkrdVmlfWeZ9lnx21e5nTmQVV9tQEcV5+fOvI92LqcwJ9QNlvm
	4sP3+HbTxHfA7qIzqC98nzFb/dagzt7+WB7dStc3hhueSy2O1ZRwXSngvOjGSVG1h2eRcAr2Po9
	WFV61OBZBSC3G+WIcyQ1m2nRwpWTm2wdfdnhJCI6FMm/pXD3L2XXjYtBZH817C2++r/C9GdF5Z4
	O5CeMQwC1fsKd2NwuLay/xbMPkSZStJVcNY5t3rsnkPp+Q7H08qgRHdgR3rvRbfX1dZR2AMcT7m
	OwNEDfaSdt7CJDjc260ZC+7MXA9+FszWCUkmwLChH5ftZdowyAV3W+tn0BFJhi6fKvd/Jw0w9ZI
	11461Yjsd8JNxWB3Cu9DU3Y9vHS+dwjliSmOa3nmgaUG8M/ILDRQN3uh32dm3x5CDJ16J4WT0S/
	KxnA8+PsWeYzp2RJbqnjU/oEPbOj8ImSS4l7UE4c2S2yNWNETzB1lr+aC1fgMimv9ueyYer8nBs
	7brKvXw9MA==
X-Received: by 2002:a17:902:ef43:b0:2d5:e9d5:8ae with SMTP id d9443c01a7336-2d5fd62ae4fmr69464095ad.5.1787136057289;
        Wed, 19 Aug 2026 03:40:57 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:40:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 11/15] rtc: rzn1: Consistently use dev_err_probe()
Date: Wed, 19 Aug 2026 11:39:22 +0100
Message-ID: <20260819103926.2136712-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260819103926.2136712-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use dev_err_probe() in the IRQ request error path to make error handling
consistent with the rest of rzn1_rtc_probe().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index e67bc8831cb7..7e2177f46313 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -471,10 +471,8 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	spin_lock_init(&rtc->ctl1_access_lock);
 
 	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
-	if (ret) {
-		dev_err(dev, "RTC alarm interrupt not available\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
 	if (irq == -EPROBE_DEFER)
-- 
2.43.0

