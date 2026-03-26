Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0505019B5B1;
	Thu, 26 Mar 2026 04:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774500845; cv=none; b=niQXsoNvrt7wJ6Xrp/yvzkiMJXwouduJQioYVDBjxPJIL1vW03wGe9pgiYv1DyAtNqTdaJDAq4/pA3lHnTRN2bjsM2+GXhtNJ5Qg7GF+F4MWU8zwovFFnr4OPscIhhn9/t24bhArAfbchG2ed2CkvivnxfvX7N+ZhRblKJH7NRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774500845; c=relaxed/simple;
	bh=cjdKbHJJ6LtAhA+a5BeTS1s2l03pDc3+3EeRGDJvVg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PDCpVYb0NzIfDWTa+D9LXZeOF4ggRvGWlx0eyN/HdQbMP3NzdEFkd7RQ8SMGKZZ9klaTGblVzM3xfKO/ecB8jGXDmR9CC9QR8nfhAvgLG5vdhLq0ImQk/gie7S+sUvKHxRP03Hv48vAe/QbWSX5raqF+5cHHX7MFUUO8R/HCUw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ijy2+VTT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=U2HGUSrY; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ijy2+VTT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="U2HGUSrY"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fhBJB077gz9tqX;
	Thu, 26 Mar 2026 05:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+5gFP7YwrJnFNVXiscxFDwA79x/GURVZ2upvuTJ3tKg=;
	b=ijy2+VTTzT7P6EM3tEbsHKpr+5nQvOG5g0gQyzWVJfP3R2zN1wfDxirOzbkX3qhILrbskT
	A5Lp9YkSdDqjf27+BBwm6xFFBgw9x/4gj+xZzZiBDJlp+Y9GyghWXvzI6vXGGSMsmcVeBQ
	8fHtrj7EnziGnqmvjh2c3metmTJSS98x9OjWQvg1Imref7/cPS5pd0HjEqB8hzFVAwj6ZM
	ehIBNzWIJ+m+ZexoAtic9tga1G1TAkv+Nhra8RCsGeFYbSCbrepZyBgTe9N5kSaTA5Etnr
	EaSYpz1Ko7k26L9BVOs9ekgfUHmVTsTnY5TljSGCOh2h4ykO4heFN5OKSM5LAQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=U2HGUSrY;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+5gFP7YwrJnFNVXiscxFDwA79x/GURVZ2upvuTJ3tKg=;
	b=U2HGUSrYFKbqk7I0TNh65xBq6wWbvxX7dHznfbcRMOjX1hBA2/QYl/lDf5XEWQZtY4lmsu
	pyaIELfa4tlMqLIV701dlWE/GqOcRd+/pJooKSBqO1qjPHij1EF8lU4bNp+UhT8qIxENLv
	xagTwalj0BT3nah9isXVU49ocbpa52sPv4/xaGeWm2e5c5Hd3zOJbsgjmcOmfyqgc50yfW
	k5Uj6KyT8Jt0bE18gAj3GmRIwQdsSocQCG6RPSfotjqGjYcrFvbGtK2l0ENcSw5HVCYhuE
	4SO76ugqtFFnexWxUOIihjQqEyYGl5kX/A//DstfXZF0YN5O10hNmXwnuLiirQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop KSZ8081 PHY C22 compatible string
Date: Thu, 26 Mar 2026 05:53:38 +0100
Message-ID: <20260326045355.223529-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bxrekjewuqupwonyrbkk59ty3i73yqdh
X-MBO-RS-ID: dc97bce3079db75bf83
X-Rspamd-Queue-Id: 4fhBJB077gz9tqX

Microchip KSZ8081 PHY schema indicates that compatible string
"ethernet-phy-id0022.1560" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
index 33ac4bd1e63bd..c43c08d9ff944 100644
--- a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -85,8 +85,7 @@ &ether {
 	status = "okay";
 
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id0022.1560",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id0022.1560";
 		reg = <1>;
 		micrel,led-mode = <1>;
 	};
-- 
2.53.0

