Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9BB416125
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 21:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346759; cv=none; b=O2tT/+lKSpBF11bTiraCwUlJOFF3QGe3vhSAbk0PzUW8QAyNtv0Jt4SvPYZjWRxlwtdtIKIA7CjvGOqbQ4wXF0NKTSvjE4ySfglo5zUzxAc321XQEC7wKdXMk9h0qu9RJUl7n7rbK+2WBikVp3IgoHTJeKv0PxW4jtzpPz5cqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346759; c=relaxed/simple;
	bh=pqm8lJvKyQBek+VRRquT1stu70Oudwpmv5uE5mWefoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuIH7zBYAISlIhTg7qCoHVOnIM2puKnRQzcldsYmcVCBQbwzoYBg0CmfGOVS7IBkvX10UyglzparmjjMQjFhgvSBJH1xJFWF3EfWNazTUSkQv0Rtp7lcF6cm8F3pENt6IERchm7P2zDnk+hyzU462zGeO5pf8696LakW1uiRdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cue0kEvA; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cue0kEvA"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1130932a91.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 14:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346757; x=1787951557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPE5YqIeze9+5WQD/4I5qaaAjG465/ANUVJrXtv+vZ8=;
        b=cue0kEvAhGWqrohDdI93OyATrdNKWcU0dab8E26lYXx6MipsjvIAF+HqVxGUeMqBTY
         bU4xHK32p+7s9JPzfhxAb4jkHxpbEYQ8ozMcm5fV35Dg6dyrsmtq4igicY7J5s7O4x9x
         8J+9Y9ZwOMRLy9vEGCypWskfJAahJSiUE3J9FTAO4sOp8KNwceQgj0DS9g4u1Jqmpnec
         BbD4An1JO2IUgiS2Z7M2cBYYubkF9rbZQRqhOVCl/uCMuiQlyyhJRU4ezzEnw0yHepGc
         OCgdAQVncHmBLccIqX4dPSIfhm+plDUxTH/3cuMf+uEPidAbfzB41H8oYUkNZH5xYIiZ
         +2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346757; x=1787951557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPE5YqIeze9+5WQD/4I5qaaAjG465/ANUVJrXtv+vZ8=;
        b=KO+T3rKWjO1+E0AtjAihVPqgfIOJq1Qg4uiidMaXp1gs9CJ+en/uFFt4tbpysdNI3o
         mHd28XNyxHmFHuej4U4HnwbNEz41IGA8Ief14vqKb661wbbEkUgct2Dr1lO21Npe0Fd5
         hc/A5DrMRTaVumbxw9e4LGVKB/oN9OVgcecAIJ42IXMusBI3CACfQQJ533iqRc9tgHIT
         inTe5yBM6jOvbBO7PRaO90EDFlwm2HhcFC4TmqJzxrg7nPDF4LNsDXa9TSj1HRwuBfbR
         NuFVLxBQma9e3aAbpm4rd4pTgFZRaCRoE6MVCzSs3mKU/YaWQC+PpOSPIIkTpPdhdEvC
         LA3Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/AuSApm26Pe2EJH1UC3IY5Ta2AuHpUTqhJ+Dw90tmXVK+fQkVUtjFtLPhmQ5YwCUCOL+KFLrB5lqwS1qTfzNlxg==@vger.kernel.org
X-Gm-Message-State: AFuF++maAqtpElUDFs09rNAGQpbdgxMFIum/d6n8dRAZVg7rMyCaqnn8
	wNewn8xPwLDpsee7imBi6jg/WyfhWTe2nK1OJsZj0+QoRTSJHnmmag0L
X-Gm-Gg: AR+sD12ggCYonhu1lhCX/RrAURrvrqlNBHTvswsiDR56QJ9IPjZjrqV/y2q4ZTn1ns2
	rGcS4dppOh3COCCpFpVX42DTkfOD5lQLjXKalm6/ZPXLSfDP0+1QR//n6seo2v9Y1gT+XnChkus
	AioLZtZFiRkZxZdya8rdJc6eyLCV6bO73RzCnwSfJiVImpacQmy9Dw2GYB2iivP7qI3gwTc/Evg
	Ep0Ld6FueHExKgmYBfevrKHvQtat3PSJ/5VAnh+w8CFUVxDLPRo00ql/lIVRpwMwP80riG6ry9f
	bSzizMMx1x9ViUVqv/SJ8bO7KufK0e+AmJkoqIuq3zDkM+c8FPXGGmXQPZStqxj1bEt1xMCvuqo
	xwpGYPnKWSr2EPYhoTJdS4S7qcN0KBHlFAXbgeKv6t4cTtnpDujRISuMbz9rd7JvJ85kFwDkltW
	uI6AEGi08/g0EV0EvTn+HgcCdBjj9Rjv1MMbPYkgyqA1FnrOSFS6Ic5Bvzhj73hbgZ28WLbrYSL
	SpWN7fDTEKgIROkrhdL93gCWqFGwIsNdrhdhZQh724lNliWTDpO4Pt3A57iQzWUKo7Snxwk
X-Received: by 2002:a17:90b:1a85:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-395c3aa9e26mr16109390a91.16.1787346756800;
        Fri, 21 Aug 2026 14:12:36 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:12:36 -0700 (PDT)
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
Subject: [PATCH v6 16/17] rtc: rzn1: Drop trailing comma from OF match table sentinel
Date: Fri, 21 Aug 2026 22:10:31 +0100
Message-ID: <20260821211032.13554-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Drop the trailing comma from the final empty entry in the RZN1 RTC OF
match table and mark it explicitly as the sentinel.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- Added missing sentinel comment

v4->v5:
- Added Reviewed-by and Tested-by tag from Wolfram.

v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 8c3dbbc34717..906d03c65df3 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -529,7 +529,7 @@ static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
 	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
 
-- 
2.43.0

