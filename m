Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D65395AC0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743720; cv=none; b=JlPv3Cj831db7xSIBSATFKvpTXaeAUJAQkqGtePPKK1jMOuf5vO851f6ZSqAVKukl1sPzR3pnx+4JKVf5CdpFAklIvmM010Ku9Vjm5ukW69GT8Hq4eIvjhXzmmLh4Z97XpPmcCMHiUu3GcnSBMCG3cRrBrz4DqIHskPCM/nJcYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743720; c=relaxed/simple;
	bh=1o03/ndP+4oh6D/3IEGgeqs0/5WU893jqrOxWHnIJBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VgTTHMZZ8UbmibjfYQZUJ4TKpNhLNNQzWxh2DZbPUWK/V1GqOOh/KgKs93aXmZvtTCI1oS3ajsdDWdF81umvuT8NHkT9Shuzb5OyG6gfXGcX24tIitAmrUEgzQ48y9lxWrg2DbSsVm5qSH0KaC1pj+DxZcHx52my9EQ/NBAh7Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMYBJ+gd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMYBJ+gd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1693499a91.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743718; x=1788348518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uTt48UsjI6unQzCay5RMDU5Cm+VyaIXFptKfLmQm14g=;
        b=HMYBJ+gdUD5F7T04sYU8N08D91Dlp+jaBKsmPQo35QLSpI19857VYNTkosB3fl95F3
         Ms7flQFySmt61/98osNvXB5GZsBwPM6rMfQTyF67V+KZf+nHLKSdelw+e0CDNXoef4ge
         KbqPRz6ZVGvp1hqNvyyTPm63awYgUg4yuqDEDZ3JUWKDBL3tFiKU/ZUAea33fZ1ymJOy
         dk+E7AuDemkIYcb+cvINWXWH2a4xuP2VWTyMANave8S6KvplIMCwi5C3yB2bJvRKbue9
         HSNBXBs15yN6eiXdCAL1NNBGXaDxf2vO9N2xTiEjLtJrUYAVgAiz9lm1D9PEObNmi/kL
         Tfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743718; x=1788348518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTt48UsjI6unQzCay5RMDU5Cm+VyaIXFptKfLmQm14g=;
        b=XPPy9LCtNWECK80PTUInM2pltM8HHar6xUTHllPn+eEbFWCimzX1/ySyRYstM5Q7Cw
         FUaoWWBaUwS3zd11nNXW1Foreln+hZQdqWWYQDx5WeZf2grlcFUAQn8uo8dsz7r4t9WC
         mbgp42xnc3/TAnVrUzzbI3a1jK3Ve41ak6HO2kqx4Ursaq3MJPfVVH1KUhTj5x0DORsF
         Ouxv4F0kbM2LGnZSgi094TKznOjsjn4JoPDBmAVW0+KRxHZ4tqRiM7zaAjVH0BdqVrXs
         Uuj7W4Sb/aTBJ61wnb7q0LLWbSpkvt5ZjgEH+D0L4UeoaCqUSCKnc/WUr51QcnLHoYvD
         6vug==
X-Gm-Message-State: AFuF++mKwRgIfQUQWfqP2SyKBv34TZYapuq/SKsPMhNlIVcQ5c5OWyd4
	YR4tdJzQXiaXzRy4UaR2kK6uOoeOGspX3Rvy3ZIDQ51uwfzKxfr1RE+u
X-Gm-Gg: AR+sD10/08PckAcV7PMojEothZdIkRjdfrWsLO+UKsvcyS8S/NQ2E+h0yiMv4CzyfZ/
	zaDJRRkCzyFk4iu9nt3RV2r2f8z9oE9JmVHC+iqwfnET6nnMDI8Olfjajqkw/Zp3DGQkxojESw1
	BCDKGs/JZHhH9hYKpDHW2F09mRSxAynqW8COy+nbLgrqvW8R2dOR7RPapKFz49ERemNqpNujhvW
	Q9e26NHc93DtH5VVM4sf53IwEWq19WHx6LlhrX34zKaCYffh4MQPoy3TLIrOUc+iBn+L+kqOVg9
	CbgLw2aJOObkNTZlrLsp41t4RMJ7BaoF8ZvEYsDRYl2U7mFMM5gX99bOsMWOWlkKgqfyXUygw6z
	W7MbGAUK/K8k6eSusxXVqbfIfJ35uNFCac2tyws8U1f5MvPtTVqvIeS2t1UvmiHKHL/VXAJz8wV
	1UA0eTcYsXV4rZO9no2+UtGndiYr12+kUs9eVury4aPmLvKHFjgABDQ/w5/VL/X8nFZxrKhF8ft
	YCuUxnUlYnVbH6ixshyAL6uv9eROfl/G6y96EDrvTpsy2bm8gou90arKwfNnSkPlK9sHB86xyFc
	2p2iG3pzPg==
X-Received: by 2002:a17:90b:4c09:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-3966d3dcdb1mr12379744a91.9.1787743717901;
        Wed, 26 Aug 2026 04:28:37 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:194c:8843:f38f:1aa8:6d39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm12414919c88.5.2026.08.26.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:28:37 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot partitions read-only
Date: Wed, 26 Aug 2026 12:28:21 +0100
Message-ID: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
from being modified through the MTD partition interface.

The corresponding boot partitions on XSPI0 are already marked
read-only.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 20d0b607ec62..395316c61f33 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -825,11 +825,13 @@ partitions {
 			partition@0 {
 				label = "bl2-1";
 				reg = <0x00000000 0x00060000>;
+				read-only;
 			};
 
 			partition@60000 {
 				label = "fip-1";
 				reg = <0x00060000 0x007a0000>;
+				read-only;
 			};
 
 			partition@800000 {
-- 
2.43.0

