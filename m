Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B3739F16B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219695; cv=none; b=nOd2/G7wp+7laaFH9L7Jm/8Xvi5W6idc4Db8caIszXqK9byySe+WEkzBPKwj3qnuXLVjluP9aow02CTwi93KfNozkp5FJnhmsOKH9TNoQd5XnaF5einjInwfLxsK0/2RgUTikhfsWizlysHRUc2uvh2EphGVaydMpYqUhE6Hfvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219695; c=relaxed/simple;
	bh=3T8yln3axv45A3E63yV5iqv5FT0WT4juR1sxJuajqpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwWtU+1dpupvE7+E9OsiMPKCVStr3Xnz23TAmjNHHw0l7zb3OoAaEtuSrn3NxtGtvsatEJGdtunJYPPoU0x+UHk1ftIAGbqL82Tv9NDigP5oZTbHC33zcIa57LqQUiUTyY5JllOlSFR+lfpM+mUYNyTC2kunVvIylNi+5a1Ln4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nw9YnraD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nw9YnraD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49978908b35so14486935e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787219692; x=1787824492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1UXKqZasUe2XDRGblEDolDFdvU/QcAgxElvCa/O02w=;
        b=Nw9YnraDqko5OSw17pCDVqqduESo5iOZ1UYRcweCKk+sFmpgKEr8zJx6d47vRiu6K3
         CZb9Y3d4q5P60QXu9IU87mB2wPACQVxkKZSFcktwoC56QaRai1X1kvum5/iOFDK+7GYH
         reH8tT17TWb1q3D6VvT7AgPllTWre9lSxYP5nzGIb6F8fkfw8suNi+z96k10YVpHHRao
         QMQRifz8xAG13FosOKSAm3JvVjkMCAsXMPyEhoiHy0+ImSXidiaQQQWB/yDq+sUYrejf
         WYv3Havmf9f786AqEASdUkBZ7oU7gv82c8Qgxa4ZxdpEFDKDpp58oVIi2JeyuTt7xR/b
         rX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219692; x=1787824492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1UXKqZasUe2XDRGblEDolDFdvU/QcAgxElvCa/O02w=;
        b=CgqyWWvqMee7ZBFZ3yIorj3AyvBnM7KFIyjXtRRSaCjrK8XhD1niU/dFBCYjdXoBqv
         F17lfZrKzMishe0niZnj7IiTHDoEci0aZBPbJ6MhD+ttqC2T8CjX1ced9jNsnbBPAkYF
         SXGSQsq6Bl9mLjRKlNd4AAiYO0Ax6dXj/X00Xurth0Le0yPHevAfga7aQAkEKOgf5N0b
         mWrM+e4jRN7j4X8kkJV+IOvbjFaZNBMj6VoSG++JCqRxoQOnVKYdel4gSQhkszv1Qfh1
         ZJlCwMq9Hn7WGCgYvtkX5DsqmNKoXS0GfjEUIPTl00DFQ1qj6j7RBhRohohtBHk99Y2o
         oY9w==
X-Forwarded-Encrypted: i=1; AHgh+Rqz6GL1anxmac3eV2antJrSvN8DRA0aMy+6MEOF7RstRV9iqWpQE27hIeqgJXqvlu3/a1Ew0qgnE7Fmz7Mew+f+Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/NrUifkBCtoJ74G4+nyrfZpQaztpEnSGJ7qWY7sbPMrzixfcO
	y2UTM+JpODVqPtiJLYsv4WgeGaiAH8Iayz5twfrLEE8HEtCGuCjtC+RH
X-Gm-Gg: AR+sD13JNmI5gWOfIUf+omCjLoEF6y1fqESbZL2Sut5/QpxW/9OAulCLMdExnFRGGbU
	tMT2z8UQfcyYsxuiPADJgzICJ3/rsgux8uufK+8J2YdTHawLn/gSgHYZdz168ogSs6n+vV5ua1G
	B+tlOsLv7MTdptpzmrqtC4pT3EBcPMfew7J1OJUvuvmk9ADZO+ecSN+hv5bC3A+XHMOKO1eqgPG
	diFw6q6Oir2bwC/mH8ojFAvythJlh2MSBQsktF0TSQ7qAgpsuZptMdWfcABE1FbAzwnptJEVW3e
	YWwarDSjPf4D4Po7T0L4LfStg9WkLIgDp1n6gEyOIED2AY2ULdUgvX/oV7yBxuw1J+RfZUR43qV
	QlC82GBnEhfz7iN4qOFVVyBATnyWKAord00EXIpixFVHYnof/tdQL46HjorMiY2Vk8zTADhD3fb
	jQp/jyWpEeW6E63vI3Gt1QBJlX8V6F/COmQOlRJNOIn5Tozx0FUYEvBoM2nHJfPOjV3O26
X-Received: by 2002:a05:600c:a30f:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499b01e9125mr84541145e9.2.1787219691800;
        Thu, 20 Aug 2026 02:54:51 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:eda0:8ef1:e1ab:c2b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm172069675e9.11.2026.08.20.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:54:51 -0700 (PDT)
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
Subject: [PATCH v8 1/5] regulator: renesas-usb-vbus-regulator: Rename platform device to rzg2l-vbus-regulator
Date: Thu, 20 Aug 2026 10:54:39 +0100
Message-ID: <20260820095448.20930-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
References: <20260820095448.20930-1-biju.das.jz@bp.renesas.com>
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

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * Collected tag
v6->v7:
 * No change.
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

