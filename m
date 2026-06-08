Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609013EAC72;
	Mon,  8 Jun 2026 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949796; cv=none; b=i/FUIv9LWb4+wwko83bdaenGHco46VZUF2y5y6tncRQKP871KXwIKb2T07EIdwh+OQcv45fnvA5GDLba5y/KnHL8UYPVb59iaD9aJTnYppQ1V9RPAZqdnU8rHn5pXZM45PXFHSJISIcX1bHjN0p5cerd341/jjRk6VgzozCtaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949796; c=relaxed/simple;
	bh=y4+yQUya3bghX14Xs5byx+CWoux0HeYh5h5ilNB4hH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4qDUrti9TZiBM+1BM4JIYsxId70gmbiAxxpFI+OEaaQOoLIfvV0fQcEU3FWKBdEaZXEyt+pufkJz97V/DvnQ688mnRUtEYZUtUR+kOpHGJMOtFRaYzMrln3sfH5TrO/So2Nyv7CE/d6B9Mi/aI1FA//JkkHjxvUT/q+Qd451Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrrcQOi3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrrcQOi3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A7D1F00893;
	Mon,  8 Jun 2026 20:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949795;
	bh=+eKo+QBFA7yJaVxAS/CPkbCjR6/ASKa96gDMPM3c0i8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FrrcQOi32WqR74lAnM0FPk5/SBPESSqdvx43Txa5icoGj/t8IngEgVxRTO8RWRf4n
	 HjjDixLO6olAc67k8Vs1wC6gKZKH8g+KEE+WfETZGTK0b3fijxofbpeT4NfZ+NlBJu
	 D4cBkPJ47rjeaYxg+DG0aj9qfLekEqRpSGaIE9eDrrMMPDW7xAwHcs4T/PC404N1BT
	 C2dhLNcBdp1g1tWoZEP8VKiNUAV2phU2SFDdttmbkhiauL9BcGRjc/tlDIFUAWenZJ
	 IVTjOjtyhHyr1EOHXJSblQUrEYTwDRwwSdUqs0m3DU6+AiF9Fo9W0g1Batlb4usE0l
	 1D7R9KV+kXT3w==
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
Subject: [PATCH v3 14/17] i3c: renesas: Organize structures to avoid unnecessary padding
Date: Mon,  8 Jun 2026 23:15:40 +0300
Message-ID: <20260608201543.804902-15-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reorder structure members to reduce padding and improve memory layout.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 38ce722881da..103c938d1455 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -221,19 +221,19 @@ enum renesas_i3c_event {
 };
 
 struct renesas_i3c_cmd {
+	const void *tx_buf;
+	void *rx_buf;
+	/* i2c xfer */
+	u8 *i2c_buf;
+	const struct i2c_msg *msg;
+	int i2c_bytes_left;
+	int i2c_is_last;
 	u32 cmd0;
 	u32 len;
-	const void *tx_buf;
 	u32 tx_count;
-	void *rx_buf;
 	u32 rx_count;
 	u32 err;
 	u8 rnw;
-	/* i2c xfer */
-	int i2c_bytes_left;
-	int i2c_is_last;
-	u8 *i2c_buf;
-	const struct i2c_msg *msg;
 };
 
 struct renesas_i3c_xfer {
@@ -262,22 +262,22 @@ struct renesas_i3c_addr {
 };
 
 struct renesas_i3c {
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
+	struct renesas_i3c_xferqueue xferqueue;
 	struct i3c_master_controller base;
+	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
+	unsigned long rate;
 	enum i3c_internal_state internal_state;
-	u16 maxdevs;
+	bool resuming;
 	u32 free_pos;
 	u32 dyn_addr;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
 	u32 extbr;
-	unsigned long rate;
-	struct renesas_i3c_addr addrs[RENESAS_I3C_MAX_DEVS];
-	struct renesas_i3c_xferqueue xferqueue;
-	void __iomem *regs;
-	struct clk_bulk_data *clks;
-	struct reset_control *presetn;
-	struct reset_control *tresetn;
-	bool resuming;
+	u16 maxdevs;
 	u8 num_clks;
 	u8 refclk_div;
 };
-- 
2.43.0

