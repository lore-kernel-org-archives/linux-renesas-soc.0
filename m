Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85F3DEFEB;
	Fri, 22 May 2026 10:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445142; cv=none; b=txgASzkiRnwcDxcp+et4DOPQmj3728YLVoH24otNLdYTg8dSjV+vrrEjXpfDsxJScNm1X/f7Is2CJ1qBOQK0th0o893/i8gxewa+HyLLwQrsY5sUOmBHWyVMjKnwnLZkDC0HihvePffOsROtF35GeJI14XhFA22Nu8ndVCdTcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445142; c=relaxed/simple;
	bh=/X62KWmzAmStDDgZowmuKDOpnjU2J3YPFUr+QdPAhBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTkaBdGrouX3FZ/nrYCs9Y/W0r7KW7YylqHIgpTM+AfMI5K73jpu4gaOgE/S522RjsnWswzoLL0eVc41jGEp02E9EFYuaTLlxaLT9HM92d8eLVdc8Nq6RQnir4BGuAAOXzwHy2pPLDRLgz3P8VSTIshwmlCTr775XDQYHcCuvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eR948MYO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eR948MYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659D61F00A3D;
	Fri, 22 May 2026 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445141;
	bh=+vFJFlgaUSzlhWn87F6K4JPStiuv1ICWwA4GM2ytu98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eR948MYOknWWdHEvPctgZ+boHq0n3tHGuKVcPKzZM9R8pSXK9MBflVTBU8ZbYPUc1
	 t32ppFnSSusuWRaMvAhJqB/HB5GTdfa2AQiimTc6kHEygdBIZsTxjHyPVgOAQ1dApX
	 4iTPZe5TRO7Sjim1AV9JSe/uCA2Bxj1cANr23nirX9Iaz3wi9CB+y3GwSNxoT8PUeQ
	 OTloT1Z4z7iqLpuZ2nnvfgPIb42WWbJ2JumVbdebBtDjxTRf70mBnEufvLU6Lnoq66
	 6EQrafoLNc8IjJXiNReWC48j41rs7b9midToC8wcmKdmVsjTFudZGpd86mUH+Obhqc
	 fFjoJd4agtWZw==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 12/17] i3c: renesas: Drop the explicit memset() call
Date: Fri, 22 May 2026 13:18:10 +0300
Message-ID: <20260522101815.1722909-13-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the explicit memset() call on struct i3c_device_info object, as it is
already initialized at declaration through compiler initialization.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 12bf4797a70d..865e67ac0fd2 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -624,7 +624,6 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	i3c->dyn_addr = ret;
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
 
-	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 	return i3c_master_set_info(&i3c->base, &info);
 }
-- 
2.43.0

