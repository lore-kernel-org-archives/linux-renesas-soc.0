Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D3C304BB3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136040; cv=none; b=KaJ5x4faBFkDISpKN91wEeO2DwxLhfDZQnBPW1dH7k9x39JFxxmH8NYfipClyTqmj6bBPr/3cg5cIRrJd83g890pDo09zNH5YgB1bxuRkO/bM69npXeLIIRXzNQAYvCoFTOOFbNyKm9Hsg56FfqzBSv5nJgL92xhvjEuNrpKktU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136040; c=relaxed/simple;
	bh=RCjmT/Q7v1w5wuF6vPZbR3owes4uAzeW/tyOyXg5scg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGVzxISlw58Z66S4RboQOk1JGvB7zy0IE+7dEz49zfZa6jkSUqE6dGIL0pK1sSuQoyHPxJrdMm+pNPylzIwp9xY4nr6jcVRPIj+p0vrQTdYXzG6/kS6o/eK6Rik4Wo0b2srMGaqQOowWFGRdurZV4+KZRiZ1XtboYtB5lMH8HFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gioJdU91; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gioJdU91"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc11a30a259so737669a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136038; x=1787740838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dnzc7GZdTOxbd3quZMussPF4U86iKiRKoVv0Cicg+UM=;
        b=gioJdU914pfgZMP1JNEi6KSIhGuzS5bFVENuZcuuP5skVfDhcmUHav8nmA++Hufmwv
         Q9ltH+CPhJIMx9ORbptz4I2/Mog4bhGAnOzyRK4v3Y+tb0HFBBiY+nOjBd0qz8kg4MZo
         Y0BN3WLb/8NEDcd+M+yMbZ+miNr399Qd5UhORvKf1GVKAoobaB9c21NIkdXwkl9NwtbM
         qz/zvcTS3ToFCOZvprSWcqN0VscrtrdS9lJmFVYv8S9chOP6ZmQexyUqEC6e+8ZC+Hn6
         MAkOjrvdmwN2xopiA8nukpT2mb/8Lyduppq82Ej9WEcCA4prlnbLMFfBvuMagU3dFWnI
         VkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136038; x=1787740838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dnzc7GZdTOxbd3quZMussPF4U86iKiRKoVv0Cicg+UM=;
        b=ZqqoM6L5G27JIC4zvIJUJzJbI1Nt76JC6NKc7yCLeSyxfu+CCqU8oagL3AuDcHTcF6
         GoyE8bxGItKP3pN/u8DaLrEmTFNA8KZyUffwEHSIRjxm3eSaY1VLsoUBBxVPxRny4grS
         L0A5c/PF/uz+kg+5V7KzGYeMA0bz0HKmG/5fECJ4xj6oY6Wutx1OWRJyQd5+MDgZlkZ5
         BdmxTfquUEGd+PkAQiUxkfDBMZkmVl2lCE0XylJqQwUgyJLByru62jcnyn0rdHDbAgs1
         wiYZGAkXB6JGmklWuVkNv/hPycBjAYtM7cMzSrcrDUbHXzhu2VfJEwwzWFSmSHHhV1VV
         pQoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9hYMjPM8LVypH80VFLWXyu8Ry6f+EXpmDbVsZCX/N8knor+dQQkz60dGd7m52OsjJ7n46zAN5gevDdTIGLtboGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy79ykeqgmp//ZdAdST32LOqtFacVVZ8oVstMPZkhn1p5HeYiGl
	ABPSL+EnNEyTcColrP6UIpH0+UMTQN1cQQjvusFMTnOpwXpzns2KTsBa
X-Gm-Gg: AR+sD10bKH0rVFP1Nl9JYuQh3e5LX8bSXFGA23d0ng7u2/hxuv+8B/QCoW/ppy4Axt2
	Z4HBg7SUti/xGO5ylxuIUOosJUsBDCZT+7T10MERa7yQ3dsUt2wVozzTOsvAVi5EopqYP8LYdoh
	PcGbogap8bD5ykjbq+8CYyV9yViP6WybFY1pJe4wtIAc/qdyziONlOv9HKNwt6UCVubtjUhU/90
	conHfXn0ZQ7h4cosyOKUAEploAhIjtIqV0fXXR7GSuojZ+bwxLNG5lj92n7tVH6k2CFycufQA0y
	fPpOyLDPJBm3+QlTJx0hMEoZJ+fA1kxkZ3DFGcQCR7VbttWGHZb7v5tY/RndHFspCPqk336uYIb
	OP2svyD2+5JKamDpzXdFhjnvsxGLtECgTOq0tncn55wVea2KS8XpoWb73bovWXisDisAIFp+kqT
	0RktOEPZkcEtoiHsEvKXuYTf+/1hoylsUxVBhD5DjospHech6QJlR1iOLDaiV/vZJpPVPyNYaO9
	6xkT4le7898UrSKpm3YbewvMhWrPGv5rYgUQoys2Uc+w+qwiUYjR4cQV3CpcY/CpyVcmg7zOHbK
	eCZJUnUz5YzIWt3VH9bl
X-Received: by 2002:a05:6a20:7f92:b0:3c3:a3f4:5485 with SMTP id adf61e73a8af0-3cd00e53f45mr7055144637.6.1787136037960;
        Wed, 19 Aug 2026 03:40:37 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:40:37 -0700 (PDT)
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
Subject: [PATCH v4 08/15] rtc: rzn1: Use pm_runtime_put_sync() in rzn1_rtc_disable_hardware()
Date: Wed, 19 Aug 2026 11:39:19 +0100
Message-ID: <20260819103926.2136712-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index da7d13337c0d..425d9590c55b 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -379,7 +379,7 @@ static void rzn1_rtc_disable_hardware(void *data)
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
 
-	pm_runtime_put(dev);
+	pm_runtime_put_sync(dev);
 }
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
-- 
2.43.0

