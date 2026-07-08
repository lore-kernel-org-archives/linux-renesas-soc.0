Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769044BC91
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531747; cv=none; b=nDhPF9/6Hmu6zK4SQtZ5mVMoNxwqhnkyrCLw92/UPgQxQT+GKFSi0KEB81EA1sDYULJ4blnaJm8jZjkJJdiZB7kYJ5EFIpTRNVBXSGRGLqMb5GOcGLRD5vGG8ndqopwHuka5VZehG+APhvlKSVKJ1AjqNv3wDewfRJBxrapSPYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531747; c=relaxed/simple;
	bh=8dh/7MHJJgG3a7K8/uIPvyij77LIaEGZs8vfLdY1BLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBWOz5Z8FqQuCDoA8KCC2HIV3fFYVJy50AZRx9YgYhdYhhSVs4rY4/2a0GWS+QPEBwPjI8v10Gw8EusWvmgSDnLwfIxedMjnoo0y1FGbLI5v5/PkkXYKEw3LedTjujwYGEl9OEcL/0Fc5Pnp3wwEh5Chbm4HlhX2vtpHO/04Agw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtviE5h5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtviE5h5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so824726f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783531744; x=1784136544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izWahf3T4MrAAlg85meIlcHuAYy8AohYcumEZV7w9VA=;
        b=CtviE5h5MCCzIMiPU+HrlNggbKCmUq8WjyfU6X+NGlGzaOlRdQ5nFHmGae324uqhGr
         R3oBbXWqw2+O9nrhbbjDKPRHZcEBFd80g8FxVE+m21SL8rTS351oS4ZCtKCCL3wD2DDS
         TMDakor8J27iTdIJefUBY9h7KykAvYWrUipVFrtQXqSv8XWMP9pa0sTIAHg3WONz6aTj
         taUz/hqN45ZDwKA18pln6Lqz8Wx3+nU46gy4Xm0riyKv9MDJz9+f6dqdJdbX5D064WgI
         UvOK7PHXfqzvKUZ41alL6ZE4Dsv8tOb7rVFe6Yu/OZ++Hr8sNw7dxPl+y26xue+QGEku
         vaLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783531744; x=1784136544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=izWahf3T4MrAAlg85meIlcHuAYy8AohYcumEZV7w9VA=;
        b=JP65Qug7YSTPk+rMFZjM0nLWotxmGEoUnPCnnRJLmo5/6+9ltzUXaRauFRLasivaNN
         hvMjpGXbgNhlyfKILwoJI7sCp3MpSqIMWbfvCDMDQyLz60OoGeas48+f46rKnMcT9Xto
         YuvZe7ufNwxJzdC8PT8uq4tanhm/W5TvI3addWCl/zcICQln6UPMbLtxxIBPoAm9ivaj
         M/SVkFTIPNjvS/CxXLo6TdxO0yjigHSizKtxXG+GLk30j5XettHH/9sgKph6/YjvTc/3
         GcDhReMAy59zYaBzUM6IoL9jivoa7F/TewMiEBbu9nG1oTaZ94NbGaRI5RRCBbTtiI0F
         DScQ==
X-Gm-Message-State: AOJu0YzMT4GgIDNylHFqfeYv+VLjNXTXIjC/2K2fAtcInTFnzYM5+8Z7
	tYi5Uzpmreq2rAUPojyL3wKawWS+erfPhbZ6ogE2xDolFxK9WX3PFEfJ
X-Gm-Gg: AfdE7cm8E+p0OiIhP5Qr5wpO9DBDoVrYKR1IzIOaJDef/pGKxHvu0ZrF+E/PdrWoM/G
	8ZpAGr4Du9lg9CJbwPKXU3FU5wBkX7D4CdpE4aHTykwvFAHy4KYX+zOfkJtmASJCv2dozwynrE5
	rsXD9cddD+SmVWxDKfH1K68dlzka4xAbPlJorpzaopxdXqzOgCrW8TJPMzVjjIfi1nZOXHZYRs/
	/CBCZP1SpbjqHjIOYDndYHCsWCuAfB9n3vBAyliiOLsXAOxScLKRBHuqnm3FLf5ffTXHEkAItzF
	nGB6pnDOkJ1Y+WEpjjQI+iV17H8vFVPeR8eM/QbfNUgNZBPksxdy0z3qC/6TOnW5kN3j06Owk8q
	fQrs3J92q5QdONHseKnc6CxNf52fNlgu9h0VOAW1Y5M1dVUn+JP4jH9M0T/lQnRbbRSc0jU28H+
	eU4eGFcNwfO6Fnn4trAkiuXzfd12kEIcK3maRDavU2eVJ3Xzg3GMLlYmRIZY13FruaqfDkMJlv1
	pMQEFMLtFait6DgQMdbtcV6yKI=
X-Received: by 2002:a05:6000:98a:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-47df074886dmr3844176f8f.16.1783531743668;
        Wed, 08 Jul 2026 10:29:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm46588469f8f.2.2026.07.08.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:29:03 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges memory space code
Date: Wed,  8 Jul 2026 18:28:48 +0100
Message-ID: <20260708172849.227915-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2N SoC supports up to 8 GiB of memory. Update the PCIe dma-ranges
property to use the 64-bit prefetchable memory space code.

Fixes: 4c443296ff17 ("arm64: dts: renesas: r9a09g056: Add PCIe node")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 3a308dbf733c..76fa34ff3d07 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1065,7 +1065,7 @@ pcie: pcie@13400000 {
 			reg = <0 0x13400000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
 				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 2 0x00000000>;
+			dma-ranges = <0x43000000 0 0x40000000 0 0x40000000 2 0x00000000>;
 			bus-range = <0x0 0xff>;
 			interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.54.0

