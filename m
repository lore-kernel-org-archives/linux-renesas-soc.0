Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883216;
	b=B81QniL2vXp/MXIu74SZEvjcyccqfhMpchIlKZf3YZGZH6W+3NCJuThoN67S2vAGUjdM
	 IKGvk/ggm1Vp0mu6c+iGRj2v6gt+kEE9UAMDSfgj/lq4L9NrKYJjCTorReyGQQUh477PS
	 6G2kNT9/ruik/2C7EsC9RrDdUoauevySMY+MZiapx8wTTMXmaFpxOny2UPbgsy/DyTcM3
	 fEEpbJb32ouEHXXa1dk4lO7/sXyG4x2UmG2vdEDsbQn5YbRmoadptvDfth1+0s8JK1Dr6
	 UQy2bIKsxYfccPXw4erBT2llIp6n+5t2I5poy/GbfT5tUYOxQDKIg5xYr4f7w0HyMCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883216;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=BC83iwRWZ6FFGnVDisAQj2Hg7qh28ZjaDfyoUQ1qYh8=;
	b=f1jjp/MD0MzPDz/GufGw152rhJpkRQNAgVkQP41ncaGTVZo5znJgin/KmJnYaGw/lLJs
	 7JHqf/wjZoirE7t2TDlsoXFjCoY6+sPIPaHKFfawH6wZzNID2e5puGGSEZUqyqKnCaY00
	 zCpkAindC+E0ohw+nnTFk3UQZkXRymyol6y3HnmLMvi5YQ+dzLSTbULT3oJcHheaL3Yps
	 /YFh8MolPrYU36GMBIlK40MPNxE05f7CfDcvpNXYHIPYcn0UUP2HfI9hlMPnsPilL1xr9
	 v3pOtXFExWk41odZpZdzz3UcoGXg1MUJKDk/X+pXgzYRXJgIwnsKZUyK30867fvtaYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jlNeTu2B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBE606EE84;
	Thu,  5 Nov 2026 12:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jlNeTu2B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6CC1F00A02;
	Thu,  5 Nov 2026 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883216;
	bh=BC83iwRWZ6FFGnVDisAQj2Hg7qh28ZjaDfyoUQ1qYh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jlNeTu2BPBoxlMx7bxqP0iRu0bj9DK9cw5FGKKWrQX+D+/heQpVTYYDVQBG2yTp8y
	 vj7xu1fUW4Oiju8CFgst3mJaJsopCfwn0Zi6QUi2SFLvDhipvnzVbiPat/Ap+qnhpm
	 y4DMxcmsW7c1juK10XjIpU4qAX9gf7QhaQVvvPtTK8mOkwovEaHpgYiqf9+gsT0dCc
	 Cmxjfq4XE0fWt4yP9XdbaELAORBgDQdmTDWqkpFHrM4KqCrSJwhsaXJCAxoUPIe85R
	 QtHEqiVMAy8Uv/SPtaegllAvwHuwHrWfLhW+hmizCx7AbCYJtk13zjM9mMYLYrbt25
	 j7Ge7kM6mSQqQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:53:18 +0100
Subject: [PATCH v6 5/6] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-mali-c55-renesas-dts-v6-5-7dff41bf7107@kernel.org>
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

From: Daniel Scally <dan.scally@ideasonboard.com>

Add nodes to devicetree enabling the ISP and IVC that are found on
the RZ/V2H(P) SoC.

[Rebase onto v7.4-rc1 and sort the board overrides by label.
 - Linus Walleij]

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0926ab891fa5..0b3106b45074 100644
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
2.56.0

