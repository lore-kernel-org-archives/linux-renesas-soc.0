Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D46513545
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983958; cv=none; b=lrky22zPZgwlvW4p2H1BQr6KHfqM0ElO0raWSVEaC6hNfkUEllAutGV8PtQ8VjHde/ELGYLlt815SKc9l6BhhmO34VDMA1Q6hAA0kcHVZHLJ4YjBYWD9MnR2NhlfloN7ECEb8B6Vveng/HgvQ5Ah0sp76K/8faAt6HESzdWYr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983958; c=relaxed/simple;
	bh=wCSHkmpmqNds19gvHTj2g8eLK1v77hJYzp6d27iq/I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emczuHWWFwASqrVG3HoAwF0peV4i4Xg//wXyKOXM0hQBJCwF23D0jE/o8vvJICTO17La7YaZdAMcdrc8mGghra9jcfT9Xp+RurhBS/oGA2I7zqcEkxF63sk1VSSjc3B9kJZFfpd9R78/tRZOZYuCPqMlcc+FTo+Cs99gJlrKIDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+IAe1kE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+IAe1kE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a020e65269so26871165e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983953; x=1792588753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3mIZvb9NSu/NJ0MJgWC5kXaVTnE6zGUGGsd2cXGCbI=;
        b=Z+IAe1kE8/3Nkjw8lPdz1EUArIVRhKOCLIYU9svGalcW68F4eWZmWPRPA09vHQyUdk
         YHIRN8KmIuUZDGikVUwLW48srtI48t5VuladhwBmnpg0k3qDIdRVYcIbz5YcBblzO0T2
         qMSpSfLxEmTgTsEUBt6ZM7FZtSrsRMobm65nfHPZ0wBwfLLronnlMdIg/4IxKwVKdfXZ
         HSKzs33CF22Tbj7Dlz9DKJ+tfMTOiM+FOtKiUf3LOZbh5NEQiUnP2BK3iH1+96gcRkUx
         B01+9VQng3/02VdZfGyjDf2DedEaHUULqkQ9wzaqJgC2HXWEAem8UAl3SiCLFnhS1okR
         A8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983953; x=1792588753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3mIZvb9NSu/NJ0MJgWC5kXaVTnE6zGUGGsd2cXGCbI=;
        b=rhO2ZPCqvLh++cJFH4vogsCCDVT2yauDvZpXfMNJo3IDWFWj0oitWuPN6FoSAhSAK1
         tOcpC1jFQNB21eioQsSsC9tEtcESG35wUWhE7/pAku95HzM+SkhKvF0fKTXG8ndObMG8
         l6u10K1MfvWBVKlEFjPB7TD0hOJQNV9Og4dqB+Litp3nlo1w0BafJK3Hjk/+Jd0o745T
         vwjK5UMTx4Ic1IaxVoAGLl15RTmz9N8C7WSAKwD/SLKRV5VJr6rERJUlBNMJGrF2D8UZ
         fvFbiRJCXsrj+i8cGnL2KRatZLOMoh6SBDQozmCJaEEJXPn3bEfuuKP8fk9dc+D4aUYn
         Ce4A==
X-Gm-Message-State: AFq9FYKLAWc90tz95B2ZqbAGECfZDe2TUCsjgmbLBNFcIscKvfTQN7gG
	i7hfKrdnVCUqy5zmNsqIiPQrPaKE+SJWUH0Ta26cKVeXnca+0hr6PaF5
X-Gm-Gg: AYBFou30xjTCP45luu/A59g9leF+Stu7kFyOvneZ/69kNrRD3mM5IniXQAu9Gkn6VEN
	/ZtVpJhiY5mYHgJjFx2NTMlfpxEF/eXZ/8S7yuy9ssmbtZV7EbVG1HYPkilZjNjdcBW05hVV8Zh
	oPypkkNjGkTQvFrdfpvEDzEtX6Y1bC+95naj86l9hUPwx6OYaQM7RHw1GT0zKEsd4GW6fdLb4NB
	MU1suvt7G3yeeXhpvKj3jb3Jw7kUUvW4kkjsvk+/1BmFc8bZE7Toc9GOlaQiSQ9nGhrkT6W8P7+
	QKGD1cnPIxOS1IDOq43IEXluSXpBLndDPr6LIKJJzNsaoLLmxOtoXXxuX+SMXKra5OGSLEMxSoK
	QKltYx16U2W3Xq8oTuPgpx4ifUxQz8AxM5YpESx6XllrhvIA+42vHP4dO5K5yIoltWizDLUtn7t
	RDbmfdkAjuAtxPh4m4xLB6rrBmZgaOx2F/rSpqz56wSaiqJStvvI1jTkbidhHiWoBbYP73H4Kc2
	1Xns+WFk3IdFUoG7v2XNYSvdm2kPBMG2ObGBGZGiU/dXXX67arniPOBNzHGAPWM6AWLRk2R9avC
	9QShnVlz4mrPAcvjKY2oyk+yHPAZ
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr289780235e9.21.1791983952579;
        Wed, 14 Oct 2026 06:19:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 01/13] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Wed, 14 Oct 2026 14:18:49 +0100
Message-ID: <20261014131906.990077-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v2->v3:
- No change

v1->v2:
- Added RB tag
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 734910156dc3..aab0ec143c77 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.55.0

