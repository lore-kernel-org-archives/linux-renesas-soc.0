Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015445;
	b=mWXhwu9m4KoJPSeFQRJS1tmxlsjd+sHSYnTvRtFrJB2ucLYHt3jn6dvAP/UH643MM6sL
	 fS0oOEcYG5KiEks9AtbzaXLttRWWltcStaiev/R8P//s9k3JFi4PV2Y92rMKCHh4vCagJ
	 FmDjaP/b30Wfauu80r9HdCfZJfM9+KRsSJPVc2KPI0i8UQt1OUVhvrse6kJDeoQ+PrSHw
	 kkc1pbCJ1YeuFEDj/XVUfqY9c7mH16coxiKNGmmKJLoe+qo9AVZiBjhEw5skazFbA7c01
	 YnuHYvJDe1LYtrKC0owcr9LIelqjpYqeqMouXsVLAfS9UAGPQ9DynSd44XdnBjYXqBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lhhy4dOxtnnyPutzo8dg+ONteVRvx6diYiVVEcbUzY0=;
	b=AvMo7RdFqe8V5ZkN1/ZUV6XfWhDoglYVykZaCNJBcwuCuRnZ/Ajj5hGvj1AfA37tAWoo
	 91/W+6M7J2aB7vWfyn6uMusCnvhlyYzCrzKRB+ut0W1u82IBpOxEGLycOVoJiKF+6qL6I
	 Joz4AY2nX+tTKEKMwxIW666KwxqyNT1kyk1Ovu4RddXmhzTcGxGmYA1cgWSJKehI5R+kv
	 ALlaEPqAlmAxqvwlKksGqrGE3KF7qnnmuNcaPWTgQvMB8CQQfpLtGnrWOwd1h5uHRJHbj
	 g8NDlRFtAP4z70NY7Y4erYtEWSsy1k+VWB8YJIdJCp44ilNpg+KcXW/OsI9H1xZ1Z3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mzsx+Qdn;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67D606A31A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 11:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F67D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mzsx+Qdn
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-89ff475a152so1055682b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Oct 2026 04:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793015445; x=1793620245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lhhy4dOxtnnyPutzo8dg+ONteVRvx6diYiVVEcbUzY0=;
        b=mzsx+QdnmaXh6VOzJMQh2Yfr1eD/E7W/Xn0ObOfzC0kuS024gNwgs0zu75Cn0ZysSN
         3yA56gDH1PgrKcivO5g4r6AgqgE0kL4Vy6rKM1J0q62dkvPBruzKi0jHpF30KHKC+4hM
         MaTookWu7XMs32Tk70Vucpa+C8abpJt6CSfS9gw7O9XILpYmLPRJMVt+3aPhHIpara0a
         JA3K0ch2LMxwp7oC36IgpbnzucCPJr5u8SYAgRKqEBAVdxqtlr40koOSh/Q/GeEB5Hq3
         810xcANoR64mFFIknEr2J5184bt3pz+n6mGfcXdEyy1emdp6iQzILEIXiInIw1WwbgzZ
         Sp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015445; x=1793620245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lhhy4dOxtnnyPutzo8dg+ONteVRvx6diYiVVEcbUzY0=;
        b=nmrIdh6PMT1/gSCVbaVmShSOWfwj0HqMJcaclk0P+zOJfme0/Mvu4XL68CY6d/XbGJ
         XCr8sficQyRlkyhTxekWnOiAbkJQSblETh2V7Pm+Fsx7a8tJvPKI6h6s2EjYv+R0aOSw
         N91q67HQKM3JG8x6U859g/ABn8bCbPWEe63yzwHWnmuY2AMYf11oxS62cSDlKdLSzVJA
         6nalWMGmMSUWFLY3YMbzpZuSHHrNN3z6yAzurfhKVh6hBw50JJThKr3FqJrcQzbq23nB
         7yZv4kIDFpqA0JNMo9/xy7qAQz6pswkWcG8dUOZ4rPjSo39tjg1aBziwTPNVL/9ct7/B
         zlrw==
X-Forwarded-Encrypted: i=1; AKwUvBza1Q5Bm6gDXP+tKR4o+5q4a/8oiXFhcgqtAv4Mamcd7hHTc6EQa2rSJZUe7Nus8BHOj3PBj1s3qmuF98fekS/dHA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/0HMj5RtJxVHE1vFuI5Kd4doEcht7DGHB+CBJOmb3m9cNhv1v
	zH3N1WpTjV746NxOXDyNnJjLYEpHn0kO5J5Y4QfEqTPE81wJUQeJsRPT
X-Gm-Gg: AYBFou25jcDDFa+IAXRd02az+jkzJQzMIP/7zNSj7G2k54xFHFxeyW9yzhrgvwPF/Fh
	thNBdxsKSCvQ57lH8HWQ+HDjFkepc/nRN+YiyFb1CDpDWzbTB1knsMRbL9UP+5+ob4dIBTwFujA
	HCyyJ5vA5yYC4JSil3XBP4o5/DVGCG5Qb8Fmt1J2LFLOFL26nX+TJIGxnZ9dmJPWMsYYFiRxgz7
	ZACY7kBr/4r0Jz9xU/mGhAIw6iUdLXopFnoGpoCObfelUuFYadXvQYb8jG8yz7rZOwayKBDLzZD
	BnWnsy9YOEgqF4iAqiiHQWS0TxHBV6wESlOb7gi3REV0m9il1ZJCktFAaoIB1XPk+tckbVIBos4
	wIKDwNj9XzFFEWSctS9tZ5wy5o1ySPHT32p1e+QQoomdcdUPTSb3t07PsIHNxS7O4RV4MEjuRph
	TAsH5AlMlTyWHrhPHR3g4MmvI6CnqTVZiE6ZpFlK0fX35RPH07fObwctj8regf6hynjgpahqL1U
	Pe5fMMjMWkuwrDw6tEQQODYhyZ3OS4Pu0Nr4wlgEGD+ggLr4Q4H+igo41V0xJdFlfmJeIS9KKOs
	x5TzNJJvuY5WtgY82kvB
X-Received: by 2002:a05:6a00:148c:b0:878:34d7:69b2 with SMTP id d2e1a72fcca58-8a369b1d3bcmr4776262b3a.57.1793015444491;
        Mon, 26 Oct 2026 04:50:44 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a37695ab9dsm1054245b3a.26.2026.10.26.04.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:50:44 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] thermal/drivers/rcar_thermal: fix list_first_entry on possibly empty sensor list in suspend/resume
Date: Mon, 26 Oct 2026 19:50:18 +0800
Message-Id: <20261026115018.3227372-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

rcar_thermal_suspend() and rcar_thermal_resume() call
list_first_entry(&common->head, ...) without checking whether the list
is empty. list_first_entry() does not return NULL for an empty list; it
returns the container_of() of the list head pointer, i.e. a wild pointer
into struct rcar_thermal_common. Dereferencing it at
priv->chip->needs_suspend_resume (and the MMIO accesses through
priv->base that follow) is undefined behavior and can corrupt memory or
crash the kernel.

The list can indeed be empty: rcar_thermal_probe() only adds a sensor to
common->head after platform_get_resource() succeeds, and it returns
success even when zero sensors were probed (no i == 0 check before
"return 0"). With a malformed DT node (no MEM resource) the driver binds
successfully with an empty list, and the PM core then unconditionally
invokes the suspend/resume callbacks. This was found by code audit; we
do not have R-Car hardware to reproduce it at runtime.

Fix both callbacks by switching to list_first_entry_or_null() and
returning 0 early when the sensor list is empty. This matches how the
rest of the driver already tolerates an empty list via the
list_for_each_entry()-based rcar_thermal_for_each_priv() iterator used
in remove and IRQ handling, and does not change behavior on the normal
non-empty path.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/thermal/renesas/rcar_thermal.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 9a9038671..65dba6354 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -530,8 +530,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 static int rcar_thermal_suspend(struct device *dev)
 {
 	struct rcar_thermal_common *common = dev_get_drvdata(dev);
-	struct rcar_thermal_priv *priv = list_first_entry(&common->head,
-							  typeof(*priv), list);
+	struct rcar_thermal_priv *priv = list_first_entry_or_null(&common->head,
+								  typeof(*priv), list);
+
+	if (!priv)
+		return 0;
 
 	if (priv->chip->needs_suspend_resume) {
 		rcar_thermal_common_write(common, ENR, 0);
@@ -545,10 +548,13 @@ static int rcar_thermal_suspend(struct device *dev)
 static int rcar_thermal_resume(struct device *dev)
 {
 	struct rcar_thermal_common *common = dev_get_drvdata(dev);
-	struct rcar_thermal_priv *priv = list_first_entry(&common->head,
-							  typeof(*priv), list);
+	struct rcar_thermal_priv *priv = list_first_entry_or_null(&common->head,
+								  typeof(*priv), list);
 	int ret;
 
+	if (!priv)
+		return 0;
+
 	if (priv->chip->needs_suspend_resume) {
 		ret = rcar_thermal_update_temp(priv);
 		if (ret < 0)
-- 
2.30.2

