Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F6449EB6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136027; cv=none; b=G9wU5bQSZXY2vNzZLMnXaXJMoQqGloWaY6HFLddSSEoLLP2GF6+JoVYpPmcsm+TzCGFgE8d25eAbFWpKeBxroeAYVvj7gEanHZ5yYf8L0OhxzV8Jee6pvfxCVqxecV9VnXRGLfEM7ZKXYA+tua60PRa14t8xCy+ITqCkMMm6tro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136027; c=relaxed/simple;
	bh=3BUzoj28E6V8GJmTinFm2vYFBwCspjBgpneyKufA2pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wpcv52VeqadmuIWdIu2U74PBLqJZ17dGRTJ413YbHaPKNK+KJDSqvulE0pOxxFh6rMGUDCiurHaTd87GzD3lzh8b3ldvPeNZK+nCiTYPaZnx0jLbm593QJJfk1GPYQBZGmXkLpHuABYa08XVwYnacuKo8SJk3wRGMTVwGFaVDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThUVolbL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThUVolbL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce7d2adef4so11135485ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136025; x=1787740825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRLnlvi+bhNjkkBKcOqI3gaZTagiJN+P03FYzuxJbNM=;
        b=ThUVolbLUE+JNfhklCa/1O+6fecJ5vwoGdBvHOtfcZKxqFtEb8n8zXlioykGYfTUfz
         KSDAlhtOBkbgd+5oCBQhFxSOSX0dH6bISINylnVBxws7fwfJ7b5Rhecr6EpiJGGyfFX/
         TnAHC4Xsu0YacxREXLU+TjVKrMEThf1jNNxPc943FzLf/gPGLPKhznlCqqSEYDNacG+N
         S2RVP5eK8MTqXjq+gHBeIHNmrHXC9algN/7RjLj/LKuPqwgPzyc+e11MVf7MG65xbndh
         Xu7K1dDQvuoPeMIqXDmymSK49vkURPMnr3X8OlHediGnZdijx6EHxHMTFUwXj0Dw3i96
         VWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136025; x=1787740825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRLnlvi+bhNjkkBKcOqI3gaZTagiJN+P03FYzuxJbNM=;
        b=HRgqLT7qCNc7zGmVf0j7T/PwCX+FtVJhzsZjV4ndXWNdWxCBtpDQaRsP/HSmBSeFmh
         1vMuh4ycDNj5i4eRpuOUsOGEv+xjfqADWkKzidhSy8okH8RUkQk4Tzml9Pd8AhGNZirX
         ujp+fN5Rss4sK7tSgsmDkQ/DczRbjNCF+wpBx1WfjpLzvrmnP7dhdp/gLQxjMfZBYq5n
         PGepMLbgnvYn+lOQakMJ6Bjj18AmCTtvrnH3tjSIvHZn+eY2N33T/CWnPqhK6WkDA6x8
         R57ulhCLBBLHkbHC45maVHtrnzWJNkuMdSGWx0ouBHZdsBp/gbSgrlTrcqoQloXU33o4
         LLEA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0J8LS/cJNYiPm9L0EN+IMk+4qRyr1quSD/xfMFOq75vi0t9EwRd2HzJyxdKlZG84ET2GdURSzMiDLgxBCJjm2XQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k7Po/4rxgvu60FtxmCfxvwTQVpqNi8LpKH1Kk3rIcEK9fZUdWl
	j2kSpKya3Fsa9+xiLw61oNQxWsxPrBr/XsgX59hHBlgaSESB95+jQqX+
X-Gm-Gg: AR+sD13P8nMIpAiwrGOtFS58mejF0vj7u0rgduBXC4Bbg7bAbYy4MJg7scbV3K7rA4N
	jt+N1+qgiEDk//CzKE2NKX5Uf1penkGHQmULBahoGKgZpbxdwqipBJUDydpCJFjELbh+poR90yT
	NLgs5DqRGAkuGq6lE01423MACkeeLOkFRoQlG3hfG8V9BuYJ1CioJ+aImeHRiAi42RM4+9sHIc4
	90aZYj3eABVAv6j+oGJoNGrD/d7QVoV4187ne+AsPdroqR3kiID9Vq+OOYqGsZcNkW4bsQZjz4O
	ciZX//tVPBLUohofsk1/x/DlzfAh7JtbZg2b/hmykUFGCQvM0hWOBXlvULwbkCzgVH3hTaDqFL/
	S5YSF6HvhSPoBFH17nXlhHkPuSGSd+KSz7V+8Vpn1eSYS7q2ogwVS06ixTsCZXecBVgV6gf9tkv
	ToEQDJJR2BB8PtbeG9PSuyBHZjicjlNHHQKHjZCEljsy3EiAFY5E6fqBnuBdJxKlYCLP+El0Fev
	5pfT0gEj1ZfN//HCw/8XgMXDTA9T60T2hufIJQ64HrqTF2a0eXpy5UnTbaWP7c0DJpoOEE1BOHx
	tcLyP9KCUQ==
X-Received: by 2002:a17:90a:fc45:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-39580f6d136mr7422152a91.12.1787136025518;
        Wed, 19 Aug 2026 03:40:25 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:40:24 -0700 (PDT)
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
Subject: [PATCH v4 06/15] rtc: rzn1: Fix alarm range check truncation on 32-bit systems
Date: Wed, 19 Aug 2026 11:39:17 +0100
Message-ID: <20260819103926.2136712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

alarm and farest were declared as unsigned long, but
rtc_tm_to_time64() returns time64_t (s64). On 32-bit systems where
unsigned long is 32 bits, the assignment silently truncates the upper
32 bits of the timestamp.

Fix by declaring alarm and farest as time64_t and replacing
time_after() with a direct signed comparison, which is correct for
time64_t values that will never realistically overflow.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
- Added Reviewed-by tag from Wolfram.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index d03d252fdfe1..94d592e88a04 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -259,7 +259,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alrm->time, tm_now;
-	unsigned long alarm, farest;
+	time64_t alarm, farest;
 	int ret;
 
 	ret = rzn1_rtc_read_time(dev, &tm_now);
@@ -269,7 +269,7 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* We cannot set alarms more than one week ahead */
 	farest = rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_max;
 	alarm = rtc_tm_to_time64(tm);
-	if (time_after(alarm, farest))
+	if (alarm > farest)
 		return -ERANGE;
 
 	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
-- 
2.43.0

