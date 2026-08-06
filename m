Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2D43A819
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011763; cv=none; b=ubQUHVocDWbfCETQbFQWX+qJnfGLAvK/0bWsyGU8SPO/rjFycFq6X/xlrBm/E/+OVBcSyso5ubSVTRFVUHYmDhyuP4CpeH2Nar6wVe451BJh2WHAHOdng4brTPajHbHiRze7QY62UPAKkxB3udvrpMr9neCn0GtXbMHbOdbobQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011763; c=relaxed/simple;
	bh=1XQnPoRY+cadzi9w+cuMHw1gMPlqHdXlgoFjVU6Xf1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIDTs8HmwrWi22o4cm7ZgbHb6Wf+NtWVXuhuRm9UobHVUhmmWBVUDc2VPgpWqkvd/D4aHPIoIkkI5ZDbstdenoLVRnpxVkNZTsxxRXO2gA9FlR4uxhAsTCA58i+dScaLG1HICYwPleLmSvCLctTaGsHvQyVwj+JYrvid8pnIk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ea5JkFby; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ea5JkFby"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so1496424f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011760; x=1786616560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVjLCTpb3CROjM8sUwImJqYPjKenMJXGRwFRRwDWMoA=;
        b=ea5JkFbyG4gxr8t8mcr1S2NIHuibmH0QrateCJCpvHvOvNftXBNkhugUVDRVvGrcI+
         ycDskFc3yOCT+SqIiuot2wNKmKnbVPR5UDG7bWPyGtlam0K9YAf4V+oGBUDE/WiftYDR
         l0S5Lt5RaULqKEWNS8LvKZsIHEC/ZrcAJHBvmPgn3kPCItZq+SUp4Ws/KYrtAPwcGi/M
         vu6I8wfw91nmVSaCS7UkPXgXFjMQQ/LLv0prJ/EEx0nTiz+ESqxTe6nsDIU0gKvXUzXU
         pnvmNm2Xsxz+q5DhgWfLDY6/hEAHCptmo7xnPVLc+C2FQXrcd+mAS1hsHQMEERGo8VbC
         VJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011760; x=1786616560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVjLCTpb3CROjM8sUwImJqYPjKenMJXGRwFRRwDWMoA=;
        b=Y7Kc+1BD7GZgH2DbT0tQuTP9EvIYB3FAu1D+FvBZOr0aJRT5EVSFliHp7A85upAQOK
         DoLsuJMWhTh9AY0nN892JPkw7gMusIDT4iSj6ZRKXUqFCX6zTONyk0JD9oHnlzYm26sB
         vUChlqnjfrzglXvw1LK9Ouk+nirW3vcEee6iO1L7/3oyCBYYpTeBWL+se8AybOrKFoGv
         dYJjb59TgR18E6z4WmwYM8QLZV1z5D83hyq5d1JYWPaORkh8RDvycBKzbi3WvlHam8i3
         BoLT/VyHlUDOt7lnk6aPc8dihuZwLinm07Olb+7xeE9UImPSOKCAimoixrpEZ5pOeHym
         T46g==
X-Forwarded-Encrypted: i=1; AHgh+RolZ5J62IDvfKSu1DNQOO3K/7cLG5fN6iiS/lg3eWsZjDQkdhLkj3kbin5F1SSbJT9I/Dn/VKSHtKInAayepsBkYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypB+FVhQvCUD3aqfzK266/Mzuy4LfP2suWW2US/InFjwys42KK
	K5mlBSSbI7XqBJCGqiRparBMIkW2JWoAEGVk3hsWe474ig57s+GmISmz
X-Gm-Gg: AR+sD10zX2N0tfQgk4Eu67G1ThnAPU8dVuihU9UuEY79YYfZ41H3SStJ4DZ7RfJz15z
	RmpDQOrYUlcDiGtO9k/PtSRiPkH43W7h8iMwr6tx9MlXWqxcJo5JBB9RmCCB1KAcbj73+rXv8Nh
	Uqzc2oOsvlwJHfKHGnwRaUzcrlrV+xVacSOEMtip+vmblGYnzoU4ioJjVTSL19WMqTroMyvqHmZ
	l0Ah0bgO9VNTz4SiPtncytSEmdRZjse8x4A8O1SgFQalMWsCW9TYYk5uD1qjefHrYb/GGfYA0gP
	WymyVmD0P5fKzJ6k8ik8/q5Pvdn3ZW52dNwf+T7SAhHB+mFOKq8sRoC+NNWliDIBbYI0ctryjMY
	Cp8g1SBW5GrLUSmcI/MAekcOtE6fp3PmFiUSjlvvS128Ly1nlbxc1N4kgy+5j0q0b09yLneKWUO
	YzuOcUB+/Lg2weZjGmdMrULmHCTCrYefKZDO8tGCkygSnlb/48z6BBrvLPwdkNETk1zuuOVyagh
	1963i6FkMPd
X-Received: by 2002:a05:6000:46c4:b0:47f:d011:f644 with SMTP id ffacd0b85a97d-47fec4e73c0mr17429931f8f.4.1786011760090;
        Thu, 06 Aug 2026 03:22:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 01/10] regulator: renesas-usb-vbus-regulator: Rename platform device to rzg2l-vbus-regulator
Date: Thu,  6 Aug 2026 11:22:20 +0100
Message-ID: <20260806102236.149159-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Rename the platform device name from "rzg2l-usb-vbus-regulator" to
"rzg2l-vbus-regulator" so that it fits within the platform device ID
table's name size restriction, allowing the driver to be converted to
use ID table based matching (struct platform_device_id) instead of
matching purely on driver name string. Update both the driver name in
the regulator driver and the matching platform_device_alloc() call in
reset-rzg2l-usbphy-ctrl.c to keep the two in sync.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * New patch
---
 drivers/regulator/renesas-usb-vbus-regulator.c | 2 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..22fcf0d10c85 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -58,7 +58,7 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 	.probe = rzg2l_usb_vbus_regulator_probe,
 	.driver	= {
-		.name = "rzg2l-usb-vbus-regulator",
+		.name = "rzg2l-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index f003b360629c..f90fdb7e6ea4 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -241,7 +241,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc("rzg2l-vbus-regulator", pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
-- 
2.43.0

