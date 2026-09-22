Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202E655C307;
	Tue, 22 Sep 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084054; cv=none; b=fp/a7kDZGQcTEB3Wse7Tj6hhfmY7Vj1kHEBDRqlYhvRQYjULAuUC46eb44achQuILLqkdMna4FkLU3WRRp5bj/e2rxZyTxTqRisAHWGQoQGIDabuTlHzea95xJGMB7m5PoX8wcMU/SZQylsjF1bf8vrI1tvuoxNbz/aq9OQjZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084054; c=relaxed/simple;
	bh=AHSHaRam3VMD/yNqBolUcp4H09ueLegNu5acPLN9GTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dGQk7bbJE15ZZYAmATKF/oVVq/2vFRS0nQuD1eKDu/8bP0HUKzrPl1KDAfjzEfQ6dKBalYOpIa0gWJAy5Frgk8kcQvvtIGXOEnWBbDpF6xIx+bFYTVE/ERu5RH7gkH3xn+iie0D59NRUt7Q2BmW5aVeCc9xp8aFCsGt3NWgqdUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjFUrtQK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjFUrtQK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298D51F000FF;
	Tue, 22 Sep 2026 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084051;
	bh=+GdK6pvcgWilvifm77f5f7Er+eZFy0j70nbF6Poz82E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kjFUrtQK451Ff80i9fopWt+Sz06531eTQLgjDNYF3lcBiceq7T8EhueLNBE+0PPGX
	 854i5bsSmiltE2pdgg3aYmXgul25h+Ce6vF2ccke6XHAjPGfez63pCeJvQL68nQ49R
	 ZC9MkPxLF9JIIlv1btUpzcojHkCoKhkaoZUapukyZ2QonX4NxGUoVBCfv7C83k5ql9
	 MixCUitgDS9w8eAhpnnSsJfARhC/ZRQPGTESNE2K7jHNbilSEo395XT74s1KApMDAz
	 7qyzeL9HBGXvwv40D3Bokn57DbiyJzdwcDYN4p0Hq+rrzEpiJnpFSr6KxrXJBy4cyu
	 IkVd93eS5dT0g==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 15:34:01 +0200
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

From: Daniel Scally <dan.scally@ideasonboard.com>

Add nodes to devicetree enabling the ISP and IVC that are found on
the RZ/V2H(P) SoC.

[Rebase onto v7.3-rc1 and sort the board overrides by label.
 - Linus Walleij]

Assisted-by: LLM
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 637fc92dcc26..74b75be599ae 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -305,6 +305,14 @@ versa3: clock-generator@69 {
 	};
 };
 
+&isp {
+	status = "okay";
+};
+
+&ivc {
+	status = "okay";
+};
+
 &mdio0 {
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1640";

-- 
2.55.0

