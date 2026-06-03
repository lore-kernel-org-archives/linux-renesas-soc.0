Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181B346AEF5
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484494; cv=none; b=MeS8iDStPOg2EN1+CKKckip9YkcnviUwdxWkFdDkfbjaRpYXP2b8zAa956tPhas7xTraDuHb/hfJN0deZPJt1VjTAVDMiskoCVxkrCVlZH/nZ5DWY+o+ugURAMsYLGwOjUxCbbPAeL1qJB48xeO8HEUujK2PycdXPijm2zzeYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484494; c=relaxed/simple;
	bh=gUffnRCkZd8GCDVad4nVwDK9l/4YI41QMrTFTZag9po=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C34bx+d34/JHJV4MskBLh1YFV5rAFyGdEioY8aDZracu0eYY6WAtmbIMO5hcMkU8bSDIpGRvPXMrH5/wHlga1b8y9bEo+z/LfWNiYiYKpHZwowgIg4rGiN1kWD1VlvAXZmWngHkfbs4KIFbXbfcYTxolCMrbwYLNqFXxc1t+2fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=TySAk75b; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="TySAk75b"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso16315055e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jun 2026 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780484490; x=1781089290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=im10zWUipLMKBqnVFXqr0KEaN2pPpAtbqMH2WbacGe4=;
        b=TySAk75bvOfPx1XvqKp8CqfVI2ej2/DNr6ytwUdC87W85ssfcFPp05diYJAdWif3+q
         M7j6ovNAbgeQ0Z5Atzz8HHHY7h0HVXqMfHsuV/4WU4j5dXckO0B4WtPxFuM7pUyj0pBD
         VZ2o7t7Xr/fVFL9QlS0zB3af4Gpc0bDkpXLKSehc8RJNjqS3ylj8GUlNDrA1aSDbBSAX
         VRDOINiAX/aniK3G6LJNfEsJhuYthEw65axsK8ov4MQVHvBDhn5NF7tP5h6ycozmJzsP
         Zqud9tHBwtr6Ea0/vACuogTdWP6sikZhdLUkUM8GaJGnQqSYPOj72lPfzU3weloV29zF
         BCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484490; x=1781089290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im10zWUipLMKBqnVFXqr0KEaN2pPpAtbqMH2WbacGe4=;
        b=r85op233QGjPV6jgZhpfQPVEE8au9gc3JWRUB+rT2GyUi5HhfBkb4/EenO65vM//X2
         yjSJCF8WjVNmiCIpaVuleVCvHW51f0CQuOK3yh8L4FU++0XagKGraK5T2YB+qTZkFdap
         ECDxj8jhETH7ucb2h1ky5v+cVdYGDa7tkIlk40Xj7lk/MbKW81vlZQ3bJoTi3DmygUGl
         YWRRiHfaZ6sEi/k1E4n3aXlWccbyfpre7AIwVR5GTQSe517QB3HmQdmVmm9N7HJka3D2
         An1iMrLmcuVzUkkraTWg3cpp7L2S1VvOsGt3IbN0cNdeArwRqbEFDbx+ASvMPLImsMCA
         nR3Q==
X-Forwarded-Encrypted: i=1; AFNElJ89kGShTvKlC695AAZo3qGILbgLKnSCgjgMsrtQ0z0sh7AxoI8cYDPE5kpAB6mmj2LBCFiqnTs/HPH8qF8X398Q+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO8Brt+rJvyeKHjhTZQctn1AG52i+toB0qI5v3Yii5Lh7GV9QL
	/MmtLUzgZAvsbbCwSeEVMvF5lzGib6MMxSEY8eQF9jzD/EYPxtitNuZPTP/HitBY1PE=
X-Gm-Gg: Acq92OEHb0NITc2cIGNucVbWEI6Z89bNo1HWWw1i308n5tVjXle9qHJSgSk/gW91PtG
	u+E2SxSizJR+daiWzsajgN1WFTZpzeSZV0FoHC3RJHhxikzbJvqC4SWUMtm/FrJB4uowpQNyIl3
	gnSrKVKZQ5z/PAQ01IQ3yh6x07lm44Fo2ZxJrKifse3TrGQAC3dsYFaiZdOGiD6rSwpIm+q3si7
	KKsB9CbVvtVDMCT9+GKoL+oggSQFP08cr6xcYKwyzo8Yolejsb3s7rHb42j0l+GwUjTucscYKiQ
	FKetU8x26/jtKe+kUxVxYPAF9qwZ3C8ud1pQStDRpQyMGpXDD1lqseDgakxldPmG1YMd4hOfGRY
	27Q6JiybC9EWz4K+1KiH8tlDshP5IHrYiiUS3O6KZKgU7VSU/rAaHZkDqzMUlRGaMRhMcUyCcv8
	kj3whA5s/BVRzWht4wqJqWtSCBajnUgmAzjXDhotM9KlT7mujE9wOgccQwHxFqvdaONtLlyTYdB
	bFmOpzM0AtiCK0AHlYUjzsBMnG/aVzsCp4x5UAOqNFo+zvmLoEeaA==
X-Received: by 2002:a05:600c:8b30:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-490b5eb4aeemr46258005e9.9.1780484490576;
        Wed, 03 Jun 2026 04:01:30 -0700 (PDT)
Received: from nareshubuntu2404-gh-runner.lab.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76153sm138908575e9.11.2026.06.03.04.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:01:29 -0700 (PDT)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: isl68137: Add RAA228234 compatible
Date: Wed,  3 Jun 2026 11:01:26 +0000
Message-ID: <20260603110127.23930-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Add the compatible string for the Renesas RAA228234 8-phase PWM
controller, which shares the same PMBus interface as the RAA228228.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index 8216cdf758d8..2988bc6300ae 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -55,6 +55,7 @@ properties:
           - renesas,raa228004
           - renesas,raa228006
           - renesas,raa228228
+          - renesas,raa228234
           - renesas,raa228244
           - renesas,raa228246
           - renesas,raa229001
-- 
2.43.0

