Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798574;
	b=R+Ax2It/fNzvAOKWdSg4LJkPh0KtxtTc5hLKM05wsGAgwyC2KJwsdG4/dONM5D7D4Cuw
	 ZqUvd2DUjXah8uKD6XiigpXCrb7vJtRNE7r+BP2OCqdsdEbE7bR6kMVaE3BkrxnqbVLVl
	 MClx5YE5WH30IBk/vEAXludDKHSWMI0xgLSWF0+VFFAFgAs3TifSs/R9eqxw9C+OfyIfN
	 Hj6CdqKNIb1vOFVz1QgSyee4/hyZJj60GRggH/Uf68UbM/vGcxgahgQmUM/zVxLzs3R7b
	 tIMuPlkufkDC7V6XRuCZTTgrS5/XAFBuUTnQX82DZSA6dKAo8p9mkr0lM9Bho/BIdJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798574;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ilSioL1qvu/zbbHfHXynCf7z6kC3aLPVbEeX8HDmXNA=;
	b=1Al2iX/ZgABaMkDDp+skB88pmil/Zh7ceGMlwl7O3XIySVSnjfmstGRhQ1zfEwyFVG1+
	 LR4e8JJ/raa2RnLFlnWQOR4wj0OnhgtZQPdZCd292zG4XLYMbUKK3qItmSNXqE1IvaLZC
	 0N090kZ7UsEyC7iC12vezMliCZivn05E01buppVBrB+qDGpKSrG5heSrs3O5h0+7PEsdI
	 vp8/VDqQ57KpyQBIpaOuh8WKWtagKH3MZREbHG5J90UmVZFPm+7OFzOB9tJSHgHYTlWYO
	 CByZog/beeNX08K6BBRaWeQMTM+GjYdRE/sfm7/swUbeD9nQNEh9eoG1/ohaFLaPSNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA45606A32C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 13:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDBA1F000C1;
	Wed,  4 Nov 2026 13:22:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v7.4-rc1
Date: Wed,  4 Nov 2026 14:22:45 +0100
Message-ID: <ca5b7840d5e2ed20b06eed3364b1427ba67cbea0.1793798520.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas RZ/Five systems:
  - Disable support for the SiFive MAL-9092 erratum (not applicable),
  - Disable support for Page-Based 48-bit and 57-bit Virtual-Memory
    Systems (not supported by RZ/Five),
  - Disable the RISC-V RPMI-based Device Power driver (not supported by
    RZ/Five).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/riscv/configs/rzfive_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzfive_defconfig
index a5d9622c47a00146..cfcd3f6a95e63a53 100644
--- a/arch/riscv/configs/rzfive_defconfig
+++ b/arch/riscv/configs/rzfive_defconfig
@@ -27,9 +27,12 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ERRATA_SIFIVE=y
+# CONFIG_ERRATA_SIFIVE_MAL_9092 is not set
 CONFIG_NONPORTABLE=y
 # CONFIG_RISCV_ISA_SUPM is not set
 # CONFIG_RISCV_ISA_SVNAPOT is not set
+# CONFIG_RISCV_ISA_SV48 is not set
+# CONFIG_RISCV_ISA_SV57 is not set
 # CONFIG_RISCV_ISA_SVPBMT is not set
 # CONFIG_RISCV_ISA_V is not set
 # CONFIG_RISCV_ISA_ZAWRS is not set
@@ -174,6 +177,7 @@ CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_ARCH_R9A07G043=y
+# CONFIG_RISCV_RPMI_DEVICE_POWER is not set
 CONFIG_EXTCON=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
-- 
2.43.0

