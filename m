Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9120407CC7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538511; cv=none; b=L3xZ+WyoAs0xeBQB/U2beSsRDd3KrFiaeCeIBH28WmwBShd1yvvjOzI6W8eZf42r5o5jOy+ok7NPHArys95PS8LCfTJZv2Rv/JB0CxdTuffeAKgilhk6zR9DdlFnkdcyqa2yhx60rOjDcMk6aQev9NykS5e8PG+226vqRQNVw0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538511; c=relaxed/simple;
	bh=ON7Z9N+BusoLW2abOlOvuPQACWu9rFAjcD8AKM9aY3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=my1AegmDMEPEeGBwx5xBjI4e+PFux9CGEPBkl2yL5fj3LRiWkdVspXpVpS/QVdzlWuITwF3ZDVknJYnkmBDG7teGOOk8ZSFixXIcgMXSP8Df/WhzL8nr1W9t388xRtedfvaRx8AOezsI/EFb9UGuxRk/PwAiOIXlqOXCa0h55+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnkPjCHD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnkPjCHD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2615169f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538505; x=1782143305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8wLD9zxqwXDPnyCjq4DuwsGKzd0OYW0pMm0bgsfQds=;
        b=bnkPjCHDrEOkRVlzOORB7pCHzyCqmcelnNC1HNXfV9ONXNuFYo74VofxlGAEIxkBUn
         xHmRmJZ8Gi1e2LeGL+74vg86sGkxTMoap1TH9rbWvjnwCLAzJt/MQtodWUY5TKsLR90k
         3+3LY15fVDzXgmn2I3d0kZE8TpY50SzSvA1TwUEq5usfW/YoV/PAq/ObyJHml4xofTCc
         fCTIx+sizXAUn0EBj1WMGO2TGTGXDUc2QG+8mdjnq/5a2AzRowocJ0/+b4X7CHisEgwb
         5qGhdjGhZr1lKUdKNHmLOHDMPBoZ9We536Lu8CRxW5h8FwcfmM24WvlzqTSI6yz3odFl
         EIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538505; x=1782143305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8wLD9zxqwXDPnyCjq4DuwsGKzd0OYW0pMm0bgsfQds=;
        b=rr1toQKai5n8dgmd329cLp4tMzRQNm1dVHe2qd98AK3yowg2xu7JIy42vuLqIgom7I
         Xe/LK5L4cqSDvGz7SF6NHIT5fVh08kcwultYPTqSGAoBQUoLFGRwon2hlM1s+hnLo62x
         0BI+/sb1GIJWPLpC2NxokKNXJcxCSJs/315nnHC75dr+X4aMxKNQ7xOR9HaZkOkEqfhb
         whvb2SG+X3Fv/wYR92DbviCdhD501zh2lh2AsgkqwSAU1pdXJOA5iQ+S9w2fzl5gvIcl
         DNeWh3REDcagxyYGz1/iGKPmg1xavzC+HT4Kb+hSCW/0U7kn5TtWS/U/Na0jZXGUkESi
         GBvA==
X-Forwarded-Encrypted: i=1; AFNElJ+WSIPh3YAzjupBBvJBffU6EfmeCk9NRD7bZ2D2t/MSwrPne9N8nV6HFfZeIAhIIig34GI7NW5ppiFOq0Zc3pLvcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzR8P30ADpwsXIqqbZdPOQg3jeF0Pk9Lhgn6cSAfQnLECYsts
	n0htvE7FCsAehqDsFR9QuiTscfxjWzj4x7BEpUdwIdkWBG6l+xkSVkGw
X-Gm-Gg: Acq92OEzjo48pov5LK1MO5bSJPgW4v+LxLQRjpFbTWSMqBYxvmO9Hw5kaQ+ccnbgMsw
	E5GwJkspe+SVApPW8mQhSLeWM7xuVMDdGCMr8+15oLREfPawz260UuqfvHHagy6yNjbtSSueTq2
	71QV+7xvf9vbzsD+yHYqDQVZ3tjzA89wRT9HOPdBsSeWAZerQQrKvYACWiOJUHc71IrXzTr9V/L
	KpDEPSD95wueY3Rdrc7oOsZj4GIrl85fyiCsPN323g+xhTXVxvWzHJfZEc5gW2gxv451IZvbOWO
	M2pBfEH8IBcn9C5KAHnOXxa9U3mHXTdTLu/PkmxN0cMSllnDs5FpCOJ7lFYYBwvSQLpcfjZ7Ls4
	U85d9ppxYbKIX30KQ/wlL4H70MMjnJVVytLHNVQOtfwtgOi7LonjylIR/IiLOCIQ6QFlknCJUUW
	PSR+frDh00eQCzXja61pNxZFfsUi7+ZO+ebLqN/xph0vVwKo3uC9a8d8XgceYwcaGlwhOH9aatp
	rZIy3BviTMQ13CZMfZOag+tVxe6/EIQEErX
X-Received: by 2002:a05:6000:290e:b0:45e:f381:cd7b with SMTP id ffacd0b85a97d-4606da6985fmr21913290f8f.8.1781538505346;
        Mon, 15 Jun 2026 08:48:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:24 -0700 (PDT)
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
Subject: [PATCH 06/12] rtc: rzn1: Sort headers alphabetically
Date: Mon, 15 Jun 2026 16:47:59 +0100
Message-ID: <20260615154805.1619693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Sorting headers alphabetically helps locating duplicates, and make it
easier to figure out where to insert new headers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 12a319e9112c..fe21fa624288 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -15,8 +15,8 @@
 #include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
-#include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtc.h>
-- 
2.54.0

