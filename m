Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DA744A3FA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787136015; cv=none; b=Z1hpznw8cRFu8ENRfz/egmi5mZ0GOZHTRRosBJHNFZZAEnjiW730ETKZOhP85YBlh+samnAO4GL1gsdqmYR/1gssNcyuNqQR7QyyJpZ+n4h5xVrjvfgEcW9Z5pIFjTtIq/JMEIef2E+5WTZNhHE/8S5pykb8urPgrnTAvP//AhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787136015; c=relaxed/simple;
	bh=pIh3ZGCspa7wJibCNWZv+tmS81lRNPmMa6+/3QMQUqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B4uw8QLvOp8tfOLvql+xIb239vdrxHZt6I5uEVgFf9Mpk9O8R4a/2ULRr65pvfgWGC//a4+DE8/MsOAhjIFUd376mQtvbhBQd6qmUywx75X3J0/X/fESNH1wlb48msJnLnMdSndvsmL952uMsdvwL7+stwru8pJlRwV3VNxbBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ/3OnoB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ/3OnoB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ccf2360620so6115015ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 03:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787136012; x=1787740812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p35PMWuNq9g80SJw4x1gXCwK/9VH0twhB+7CIMwKn8A=;
        b=NZ/3OnoBR4f2aquP0yHpeu8ZCbBor9DH9V1nFTi7nRLrB58XQtmjqXdIE6niPDy0BY
         ofuJL3uVKRLjRFZxBkvjS+FSPzqYl1A+BHXSfgBmDGPGehIgLC9C5mPWMzmIxQwPGR0n
         7SVQ4xy6cbxOtK2Wpi2lv1u3ZyV4tEKjAX2FuodAPRJiBmiIlj4B398lWo/d+bDgKFZm
         8xIcxpvyMIzXfJwu2JIFbcXxYkrU9uL64dwWrGz49ynf24EbCy4LPLOJ4IE5A+RvQk/h
         CgkvtGeAfzHWop+xE68aIIutX1Bb1Pas6x9glu2BSwTgOdyn76G/NFxhszPlbBjI7u7g
         EnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136012; x=1787740812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p35PMWuNq9g80SJw4x1gXCwK/9VH0twhB+7CIMwKn8A=;
        b=rnDzQ9ip8O5bxXWqluA3W//qMnD4POzfpoi/kZ61q3t7LSJ1Jtlm7bIcJojL8sW26G
         bbycOifyuRC2kKZed/Nmk0d+CNYzBGXYsv5HHvNC6xYCGT0grnnXumX6cStLO9x2YZRD
         o4ccNpg1g1cQs0BzVxwuVRyDqOHQ2jZkP9yd2gTwoFz9lZIFrio1qucrPMKHAv38vnI1
         Gs6M0W0wqsZSLA3+2yMOnVxrSoxKB8dN6jdeSHfIN2cpp20lpbtd4c18HsUzei28AnKN
         JYM3rMAGjgS6jAlwLXbmYBt3QBiylIjkPuW/odUBnyOXuq72sXp6YFEY3wCwZk9GEXPB
         xmRg==
X-Forwarded-Encrypted: i=1; AHgh+RqLMa/eJxmMVZj36Pi6SWnKQ2AV8ekRFvCYo49nQ8cqW13TOQe0XtiKpGScP+XzLJvLboPgmtXdeiN9FcYQiaMIbA==@vger.kernel.org
X-Gm-Message-State: AFuF++mEqf15fHZ8QuG0Z1VSLel82pq+iDEVVNmxBT2V92W4TyX5TylY
	+q4kyeGaz+kjmhRflguHbpX0y6a2vzZiFzcfejirn8tgv8B4CYa3lV6r7fhAsphJ
X-Gm-Gg: AR+sD12t+v5dr6Z8TWriZEKeqNMHwkvCeEWfIYa5vpqRpf4h//r7elblylz+ilDej80
	R/WlBz4qnyfdxI27/Q0F+YSSbxarQJLP9c3XEUQT9Gbo8BCphSBkeutJpm1jpPrVGYQyN0a7d07
	1S8Cgq5lXoc53rwE5OYo6fWQPUvTVrwt+bIOkUdS4pvceP24U17GlMAZsyxUNR0RNgeLC7FP676
	NPNLxdv8PLGxITL7E2bunVF5vEjwEpC+ZS7wVtEaUy4MaNww/kH7wlv35wse0ir3NDpaTWz1aKv
	l3hSrNwQsCyEHqDH+UZEVB9hA0QL7DFUwy1hZgsCoBdPerXEODcVt0kjm5zgIx6sgqShjByYAum
	x2uMO2onsxU5b/DxaifB6G6RBG0z1go0DgcDMMifi+3GsJL07RBKItZrFupk2YJhDtv9JbzkkPp
	O1+Z1PUmtZ1BfnborVjK+UT9Iy6kinSt786rxoS+vEp44UqKRFdgr4HetZsn9JUeMTmGZxFu1Br
	xMJ51MKfGdnXLBlt/a8SUkvZzZCF5S1ZrkOo1xQJ0g5+q9v7B8Dmz+tyLwzCjDH4qpm5VkKEQFi
	r9v2HYHMGg==
X-Received: by 2002:a17:903:1aa3:b0:2d0:8b28:51ab with SMTP id d9443c01a7336-2d5fd710544mr71371885ad.7.1787136012388;
        Wed, 19 Aug 2026 03:40:12 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:a897:a9b5:e171:c935])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77fc0sm11169630eec.8.2026.08.19.03.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:40:11 -0700 (PDT)
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
Subject: [PATCH v4 04/15] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Wed, 19 Aug 2026 11:39:15 +0100
Message-ID: <20260819103926.2136712-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
closing angle bracket on the second author entry creates an invalid format.
Correct it to the standard "Name <email>" format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 8c70dbf8c7ec..d03d252fdfe1 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -511,6 +511,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

