Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B67B4156ED
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346738; cv=none; b=hUd+SxGzYZQrxuXTYngsAcKKUMQXUFZeNrCePXfdro7oYN88vip1YDgQGC7Iy4i+8PLFOSnkER3cF3WyKVHzFfMqhHomLFLxybTZmvx/FOKknjSchY9GYn66JeQ1ru3/n3U/C6oPMcrDBSLxmUb6aXcgXMS7ynhMBYdRwdWy/8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346738; c=relaxed/simple;
	bh=bqLMPVulyGO3uPN192UU8p/Ih7Y6Dwy6WAN72JRYMms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqLHR/kisFJrtVebh84wLK+r+eyomS1vSJgAyHt4DOZgTUgNRpl8lsWqaROw1GfPBazprMGOOoCt8msev5zXEkPgnfdatwHQHfDgz/XIFDrL99ioRp5lZCp5N+k3RX3TKzsi7y8g4H93edW+BBTpCe/QX3f0+GPTEcGJAUZVOhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtMVtVPp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtMVtVPp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cca0c5799eso13924865ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346736; x=1787951536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VufRgxSYxCIl2Jf8aNb9F7AHOcOxi7eWJscZy8FNEAY=;
        b=NtMVtVPpv6sFBmmpadwMhaDkNClKtuRnsUWJCPTpRdcO7aI43sjb9LBnfz0ZgQs3Y/
         9xitwiV7e+ygIMZ+RUQzv6nXq2ZMiI+19j3W5opcspf7gTZWn5HR6qI160amrqH+IiOV
         zkijTG4EAcLnzfjCg6H562c7CPstvOJAQfeCiu+mBmRYB8Y15E+P7JX+F44OTaeb+tO+
         ydFFc2QTd3GxZYV92tOqTd5lKto3vG2E4p3S/xEutS++m69Q686qLsWhWoehpHyMwRCG
         H8MkhzyltAAup5Xu+lPQtGcUIKTLIjkN+aweTkyzoIOncH08gUlk0vaqxzmc7pFVLP0u
         8hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346736; x=1787951536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VufRgxSYxCIl2Jf8aNb9F7AHOcOxi7eWJscZy8FNEAY=;
        b=tY9ba5tTRS0H3PePH0Y8bs3rADBy+FR2z/AAwLZuAQMY/VHyuAOpSR4w8Qy+H0UNV/
         oLfLSdolSZdt4YIJvgHSXWhdnKEL/gKdu+u+OopVQ+opUDGA4SOe8zbQfHdfVW2I6iYn
         71UOG1dSDjS1MmqafgMU279a7MmG5wj6R2KcA3D30U9I6v6nZmivngUPAIagu1Map+dY
         fmPEaFERrWEOty/DXBs4N9LTWxb6hywn4p1IjporXwhee0DKpDtT73nFO2T2kcsgyksl
         Ho9aDtGDX7A0w9PexsutnhbJFL/CywwuKkilt/+pbcPzVwY4bFnT1/02Km/iycYATVaF
         7y/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrOSj7h1Ib3EcKRCCWOsT/aTlSd6g6ho83kSJLeiwUCJtIpN7FjihkZ8zlf7x5+jNQuAGFj61Y2PQKYPUWdZcKcpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++knce89BM6+b2k37vQC8x8O8vN2TuQ4zTfgsTOSCDQE5S/8eaHS
	Xz+H/RoIL3lW5ZB7QUNABnZXeBInc7AMBN+qktcbmAnFjBwK92YOx2+h
X-Gm-Gg: AR+sD11krRCf60yP3uVSm6vK5myrIIbimuisoPJClycrQp5xFskFQbSXpscWpKF7HnV
	bzGUPncUqdNsi77igJ15PdgKENchwvik2cikkd7cIbpr2MqCAltnJm6VSqQCscEtC9anGwiaNwi
	UmeQ7dQy7dyxA10VBwW4gJGGT55NCuzcy+Z8ijDABIdtadoiokODYhqWshX3FQidaDFGAkQ+Iow
	i4LE/3kMf9apKPuJdUj+0HO9nh3Hj7UHnTtf9OH1HD9V99cBLEp//7bhO3X70F6Nk7ek2nDncnp
	0bxit1pqfKFPxiW/VgtB7N7BM0RGj+GhVskeFhQiXI2hOMRciN91eyx5Mc8W5duwhT2SuFZ1IQp
	zJK8eg3A9+MlABxCnaeauEOA/WVNQ7Fr3Y4d9DY8nqoqkQGMj9GY/h2wvXsibofxKO9Lw2rIiO7
	IF5OxkpGtOCMlWwdchxBxuUs5SeJhXZomzlYQSj75Opn70Oo3kFu/8TsL5K+FBA5lf/yCYwyB5k
	ssyhNhZvLGm82NiLqgxeYRnVp9KksJAk1C3nQqND9xcCX9O70PA7cNnsAns2orQ3aMunuBG
X-Received: by 2002:a17:903:1a30:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d64adce8e3mr179152855ad.6.1787346735900;
        Fri, 21 Aug 2026 14:12:15 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:12:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 13/17] rtc: rzn1: Consistently use dev_err_probe()
Date: Fri, 21 Aug 2026 22:10:28 +0100
Message-ID: <20260821211032.13554-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- No change

v4->v5:
- Added Tested-by tag from Wolfram.

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
index 7598efc31e09..9fc93afee1e5 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -485,10 +485,8 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
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

