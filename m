Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F190C3FBB7E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538510; cv=none; b=mexxX6y525ju7ueOsPLN4DDHly7EylDJ31k3+OgieBUcXK/PtyiLiTtjsVAK62XYDgFi5rGmA72cGFhP9o1y99vXdNwUX8wAICxhWQe3DN8Zg5wbfHdY6TzQcFHAjavpGnbuYnCeUvIpA02vJ3FIfN0XjRU9pGgNrEVWT/Sg+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538510; c=relaxed/simple;
	bh=3VaIy9lYxPseySDhvgtPJEdtxb7eyDUqidR6PRSBZYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPc2fdhS/LybMPOu3BuFjWOmx89PDpuiK86dSlnpvZ75L8vAxw0NSJUpPRs2AY1y0dyat4e0xR4hW+xMmUeq57tx2DgJ7hEKSnbGml1dTTGsF8lQ5JgPNskV21W5c5ySCoDU/px6v7vNXv5Ij3uQFzNhxEauw2JKVdLBL3S8uRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgDiRWRi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgDiRWRi"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1885753f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538506; x=1782143306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9HWytDa9V2PZ0L29istICZrF1ai/UsBjTqPqnYxQeA=;
        b=MgDiRWRi1oDaK6TYLJY2M8uTd7BJ6NLg2IYN/Zx/EbgI4RiG/7fO5fAuUTmHOUMkFC
         NlOcucG9LfBXa7MIGz0X96/88VoCFHSbRc0dr8qsPP4jNCFpBn0d2IQlvz/2alU2Qj7l
         vswSTh7Qd1l7tzjpcXwwAV90GVfW07+TxIuoPtyrEq20rMuQF/CY20stp/LBwZLx1WCU
         SCAoZrqXuPQLYQktOPFWFbQwjz7jQjphJpwG4c1G8JYx2c7FWhGCUNkFCxnnUmm93HoR
         feundSfJFhKUlVdOTG+IC7Rsb9xFhzA+NFC7R30ANtSb/Tv/myCFfzfhgDjTNq0T2b77
         EP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538506; x=1782143306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U9HWytDa9V2PZ0L29istICZrF1ai/UsBjTqPqnYxQeA=;
        b=Qc+/E1a/RHqjwIoeMcTjH6DPF40hlJSQ8qbaE85ZcwKANjMDvqrbAPWoaHMqrI8erJ
         Y3e86QLRIwx9ziMz0Uw1naSPJUcXkpUGLJfpfk3JiiRozmVR47IFcHHL/e0wruLbvIvK
         Hpp9x+vgam7tTTQUtGxbg6CDzNkmkB8K/9fLbGOYwJ8cihr6v5o8Hk9rXCfYUk7ap0HP
         4SC8JCusXG1FAeZyaqBPYkobDfvT2qLOJklSBedwERKMaWCuF8iZUeBAK5xIyO4ovibh
         kK/z7FqRe+LqSoxkmE43B9D/8xBtBhIMzF0+4QPttKYzK2Wq1CQkHSVFUIufrBUkGd8E
         MZAw==
X-Forwarded-Encrypted: i=1; AFNElJ86QY7U7eHCW+X2aQ4cTa6Exsw+S1tKjrnpympkFgYOcg73XOBzgsVbH8mnjnZQqYIyY6vZK+b3w1JuNLPFWvePQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh2v3vDNw2dFH0rZd5peZYQ+jDNMAqgkzLzeM0aeiW4mR8RVKy
	/bu+SgQQqvuOL0CT6x+XRGU960JhM8+udaxmGI7NB5gV5tCV3KXz/JYp
X-Gm-Gg: Acq92OEw2JvsqAYfS/2CunvY1U7+HkY1aiKfL1awmbJrIEcuhuaJbjlNK5nXQ/NjAcC
	j4NKaXH5pUJG8NLei4aIwa3Jbrn9m4/u3wuEam623OQdj6pK0zZUn5ib2TRwZfX4L9P08u08zth
	1kOxNHf9FM636pGEUwlInget8LIa68Z100BB4puuYBDUeZGgl3kKQfAFoR6/nP9PtQ/THW9S/yT
	0zI6mUIun3/H227eUWBnG3xg3bSi/jrXsHdSnPKCOkYvQYHktIkVCDki6tF8NAwIWuyd8namx2/
	dZpWCREz3nn/Gsp3yTtnsTeslXUPVECLRY81jC4od/FAyXpG7+VzDf7Kn3a9XRpB4kgTJOXcqjJ
	w1nlCUIv2x36Zyg5tf7qohOe753fWiQ0WddanjC8fXeJq3fP+X/50LKp+9gw9Q9u2wzNcOCkUif
	tVPTGkTaFMkhDtH3P2KruAWPkpax0DciLCutjz6eQgMafxybUmUPpBufSg41fswT/0JgObwGAF6
	x6H6Qh7XFuyGmYpEYNCNdgOkiiD54y0euMf
X-Received: by 2002:a05:6000:18a4:b0:45e:f68d:e791 with SMTP id ffacd0b85a97d-46074a38ce1mr15429804f8f.0.1781538506394;
        Mon, 15 Jun 2026 08:48:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on 32-bit systems
Date: Mon, 15 Jun 2026 16:48:00 +0100
Message-ID: <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

alarm and farest were declared as unsigned long, but
rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
unsigned long is 32 bits, the assignment silently truncates the upper
32 bits of the timestamp.

Fix by declaring alarm and farest as time64_t and replacing
time_after() with a direct signed comparison, which is correct for
time64_t values that will never realistically overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index fe21fa624288..06339adae71f 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
 #include <linux/spinlock.h>
+#include <linux/time64.h>
 
 #define RZN1_RTC_CTL0 0x00
 #define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
@@ -265,8 +266,8 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
-	unsigned long alarm, farest;
 	unsigned int days_ahead, wday;
+	time64_t alarm, farest;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -276,7 +277,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* We cannot set alarms more than one week ahead */
 	farest = rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
 	alarm = rtc_tm_to_time64(tm);
-	if (time_after(alarm, farest))
+	if (alarm > farest)
 		return -ERANGE;
 
 	/* Convert alarm day into week day */
-- 
2.54.0

