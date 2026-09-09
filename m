Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6EA3BFE41
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 19:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982652; cv=none; b=D4nZwZN62zPHvfgfzRBrEEFqTmEqBNuh3r5woa1sfLG4S/KM8F91nCsdmBKUN9+d6Xjgud4phDy0OjcvT1D9+RfzyXRQ8y/2MS2ECkHyKs2C0x/detp673Myx3pUHieF+Ia/K732wOe2lbK3I0TUhPOJPrCDNzR5LnvNX+yUT2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982652; c=relaxed/simple;
	bh=RN+2l8Ry5cU7Y+SQkk4XBFHCoYkQHFINdSGrSv0wojQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGjtbfx+JsM+pIWAPyie007PplTsKLCfSGnyEiAbaWXOJTJe223mqVPYcKKEWGoMf+3A6q4OdyBwQZREYfjEqESG2NL9pAaWqlUv2+NNQuqpzpuNDMi1mTVIWhSN37hkffJcXDn1+s/obOWS2gbE87auxyLL5aN1slHMcV8/yI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZAaKhWK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZAaKhWK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so73150345e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 12:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982648; x=1789587448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phDmBn0qMNYKxqReRuAEO8P3Gi0eFxNdFtNGKUME1DM=;
        b=KZAaKhWKHEzwGluEC1dehoXQWFWkKWawi1YLvku2Tj2PZReu8uzKVBiyzLGeflpHHN
         kJA6P3/z018/XqYnb/N1f6VIXdv4M8LUz4L0uBMHtJ1l8FGB7co7uCTgfvdwEdeSDT3P
         CTnrnFMXnDHTkT60nqY5PGfZDgGECr4cOu3LR6MAkRksh0LYbqouLLaoCeUH29G7xR50
         3KhpBRBU6gcQ+t8l+Qg0mZL4Zwi7lWkarRvg7b9eOfmLs5tcTStBP57O2MsxCc4gzCdB
         KOdCL5KMX/8hbaX1nB1keRBhGVA0DFOnHoMuqJV6XswmxBwl/nMGIQJ2bkhyLliEsePJ
         Oq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982648; x=1789587448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phDmBn0qMNYKxqReRuAEO8P3Gi0eFxNdFtNGKUME1DM=;
        b=EvKMSGQlljnvRWuEG/BC69NrZ8Eo00SX8es3UapU4iO2WeG04j3v2pSrkAEF9qQ1rr
         HFJumwVu9sjwe8yNgOsbon8yx3na8mdAUKrb/M/BXUKlkNnefJvjaxgu+uaw4wuRQnBF
         rqBng49jPy+b/MYmjwfcnA7lzITwN5CKEu6CK6yedHCRiPPa9ScqNb8VwShBHavepGFH
         19IFfs2m/Z9yd37Sxs8iBVN/JtNt3Rt+VyZXdX5JDjcmaSyWVnkdhMJV98gqZI6j92do
         Yk4Q3JPEw/ys8Yyx6LXaPP+hsVdSu5i/L0f2yvf3ih2aTa637IxuDmOr6KQqU9+uZd2n
         0P9g==
X-Gm-Message-State: AFuF++nI0iETzEW9yPRIL8eugYzyTtWcnTdNBGyLHqUpMNvleod8DNDQ
	xF0thXjsoEgOC5KZWDgiNQfete1gH8Ui+SGmySF0gbwvfWUxmu9mBnfF
X-Gm-Gg: AYBFou3hDzMDDuL4bV+3tLgPh2rqsZWJWEUOaxL209JtVAfbmhv6GMjpOmEFeOPyzWL
	VoM70PpoqcGtb8UOtoz6nQtOxkQLczhoQdCLzRQcWkbKZ4gM0msvfxxzU13Cr6PDsWuOEhHj8/0
	LeNCn2Tg0+ebuu3+oa94QO/Wp59s+8vMDBla9LxjBEyfmXuit0uJHAZQVCqkeVnQPB7ZTqZdI0q
	eS07UvdsnZqeyuHrEfKBPYfpWrzdWxAGHckTFgr8gRgtcimsVG2usvIt4kfwotQlNKIfeckooAG
	sQVgjpadsCE+JoiHNfBdK975+eSZQDpc/UX7iRJ7qGudL+9xpikGwHhJp4ewjVFTDtRkWge7S3w
	2k8++5no3NcHdo/t1xUuUxRjSp/amswEKJRY7DF6YeFFthoc5nL28qbE9hFgcHe7NM5PxjZHdOR
	8azRBejBNa5SiCnMpQlTTEHZTnhHgdG2s7eLPkOK0/lAU3GfhBIphrb9kIoujaSkvoOUO5ZWmzK
	vW7to9+2eL7Fo+m9nyQCTIgMMugz0rqshMzim9cxbdbWqmzmS3IkOLVXkEH2V2+ilVNGnvrLCAd
	p3g45NtPdQ==
X-Received: by 2002:a05:600c:6298:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49d17d4d6e7mr144087385e9.23.1788982647983;
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d357:e592:d56c:d3b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be64a5sm13123995e9.6.2026.09.09.12.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:37:27 -0700 (PDT)
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
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Move SDHI1 dma range from 8-12 GiB
Date: Wed,  9 Sep 2026 20:36:39 +0100
Message-ID: <20260909193640.8069-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260909193640.8069-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Relocate SDHI1's AOF-remapped DMA window to physical 8-12 GiB
(0x2_0000_0000-0x2_ffff_ffff), by updating the dma-ranges entry on
aof_sdhi1_bus so that SDHI1's full 4 GiB device-side address space
(child base 0x0, size 4 GiB) is linearly remapped starting at parent
base 0x2_0000_0000.

Since SDHI1's DMA-visible addresses no longer correspond 1:1 to
ordinary system RAM, buffers handed to it must be guaranteed to
physically reside within this window. Add a restricted-dma-pool
reserved-memory region covering the same 8-12 GiB range and attach
it to sdhi1 via memory-region, so the kernel bounces SDHI1's DMA
buffers through this pool instead of allowing dma_alloc_coherent()/
dma_map_sg() to hand back arbitrary physical pages outside the range
the programmed SYS_AOF17 fields can actually reach.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0926ab891fa5..6845d576af42 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -99,6 +99,17 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sdhi1_aof_pool: sdhi1-aof-pool@200000000 {
+			compatible = "restricted-dma-pool";
+			reg = <0x2 0x00000000 0x0 0x08000000>;
+		};
+	};
+
 	vqmmc_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI1 VccQ";
@@ -130,6 +141,10 @@ y1: y1-clock {
 	};
 };
 
+&aof_sdhi1_bus {
+	dma-ranges = <0x0 0x00000000 0x2 0x00000000  0x1 0x00000000>;
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
@@ -542,6 +557,7 @@ &scif {
 };
 
 &sdhi1 {
+	memory-region = <&sdhi1_aof_pool>;
 	pinctrl-0 = <&sdhi1_pins>;
 	pinctrl-1 = <&sdhi1_pins>;
 	pinctrl-names = "default", "state_uhs";
-- 
2.55.0

