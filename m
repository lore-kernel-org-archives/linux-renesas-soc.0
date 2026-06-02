Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0653537FE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429831; cv=none; b=sRRHr34ctfgYfVWDPdQQQBqXKIj0g846Cs6DHWxrIGah5AjkJh6AVlQD5cGjN5ix+Vqnp+Gzr2JiorM86Z//67JMW1X3+gT/njy3m6M20kGMm+KbKOccEsfZRoZoBCnfebRmWEEjBmQrAvKQFGDsyzjWNiFBg6H16C3Ys4uFpi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429831; c=relaxed/simple;
	bh=caT2SiyFRVe1tQnApula+Tg1pRxT4kUa1c+sMzr3lwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piy+SqvHFMGN3XVmASzdoVYdlYrtjlM7RVsV2oJSU+mIIT574YpipVNluzgodez0t4t0p8bIJ1lyN/GFqxgfjXAb/SI8a5IEwMyQld4YskGxwflFH31jJ6P8/nYzrwz1MlBDwlGsDwE0GATk/ERhBua4ZMsf1FfxOtB8Fl1n4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M70HasNR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M70HasNR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so120622605e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429826; x=1781034626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjilDvsFAgDJCrCqQ2GjmgGRXnCNlPL3o8T3tdVudnQ=;
        b=M70HasNRsP2BYDeScyP4cInCOF54UeFuAJp1plKuabNPp8ToTgzp6UK9IDf7/s2fnU
         9sE18UZJApkYfIk2vpgrOZwcsI9v8e7j2/sjUhWy0hK+YlBZVs2HtZzYPsKp+hLvMUA5
         J7EedlTxfoWBx27PN6dN4vre2l7Z9KH1rwM2LMXSkdsQMBxQDC/XxcuB1LNQvTSvjJmO
         qfDiRcD9pVEZVsiim4KDEYXzHZscsqMXSQnaQvxPrllscCnTK3HCe6F77d8qUQ7z8/w3
         p9GarzFOkADnXv+i4x1AHi0p6UZUy5+mt4QWVOjzPmcz8GyvyJG+z9gBpdpTr/5A5hQz
         Z4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429826; x=1781034626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjilDvsFAgDJCrCqQ2GjmgGRXnCNlPL3o8T3tdVudnQ=;
        b=qhDayCzVxYOZn6msusNh8ZoU8oIlDOu0ATL/ulkwwJc6g1xZGZlgb+zOp/BDe10da4
         Rmuk083XvBWQ/AxKfP9MkTkQ15PDWpLqvSprEj7/f0VL51OBtcbkpuskL5iZZ9W2PgzK
         FAb4ylwjwT6Ic5sNCnjfJZeTQIYTn7bTLZFnfp67CkYfCwt3a3CNOaTC/ngVGM1MFcUN
         P0lQj1iAYOFfl86pktGJoBJ0qtz0dU7TVs1PEsuhfeYe6lrSo+tsAiNWENKuMopiXl5n
         kgIc7wCVlOB0lkrlb0vCE/JqfgQyx47EXmRIBJhfr3V9hpqeo+pxTk088zPOcKP7INLy
         j3lA==
X-Gm-Message-State: AOJu0YzykwROEmMFXwMtQnwimzkfa6xtZCGk+MSKuIMDfHF3ciEqacGY
	D/EN3JFSpeBhDP8B4iP/v9Y97l1uIFoG9nllagsnTzudRnJBXRxwUWJl
X-Gm-Gg: Acq92OHi1LPejerXuLEiPwbl2314eb8y0A/4M2NtVbdt8sms+wBKuf5T5qj5kMc/R7h
	5h7Cr1bvPLWO8k18aUTHjg3NR1p+rmOHV7bQFb4wWbMoMELNTpdbNpGiWCjVlRMzYMiMRzl0Stu
	dt+Ms+MmlqVMF9LnEu5LsDPY07pEYbDViSGn/rl2wKMMmww3fpvznxP0BDkdsR0Y/vQwO6luZtI
	sSWHaiCK5ynnkTW92lAlcvs+maFtsf+KddkvAHwULWta+oLPxf44N/wUPocNx70PF9qB6pw8Mch
	GKCW+rFDuWyb/EcM5T9SdSkpC/cVG9/7gdbD41RHY7eNi2m7JiW503fk7pFgb+GHp4Dw4z64trW
	nH8pXrjyPn8/bywfOpcWVjd9yYqPS3y9rcaD8FUeS/JwSV/kmMF801v9nvhKiRdo9aTJqzLKxgo
	al/4eif4VDTOhAJzD71j+jIjpi4xsS+pLUqSG+nd/OCzF9VIrHsqWMRbCVhfy/woYjoojvyNgQn
	35hdCZLTY6RNJjQqVH8DDiMfVvYQHnCRc8rZtxwRb68Eq3Nsq2w4KEu
X-Received: by 2002:a05:600c:810c:b0:490:afc5:f95d with SMTP id 5b1f17b1804b1-490b5e82e89mr4565035e9.29.1780429826082;
        Tue, 02 Jun 2026 12:50:26 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13eefsm87353395e9.2.2026.06.02.12.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:50:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/4] PCI: rzg3s-host: Prepare System Controller handling for multiple controllers
Date: Tue,  2 Jun 2026 20:50:18 +0100
Message-ID: <20260602195019.1798126-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver to handle multiple PCIe controllers with distinct
System Controller (SYSC) register sets, as required by RZ/V2H(P). The
current design stores a single sysc_info structure per SoC, which is
insufficient for multi-controller configurations.

Introduce controller identifiers and extend struct rzg3s_pcie_soc_data
to hold a sysc_info array indexed per PCIe controller. Add a
controller_id field to struct rzg3s_pcie_host and select the appropriate
System Controller information during probe based on the hardware
instance.

Keep existing single-controller SoCs functionally unchanged while
preparing the driver for RZ/V2H(P) multi-controller support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v3->v4:
- Added RB/TB tags.

v2->v3:
- No change.

v1->v2:
- Renamed RZG3S_PCIE_CHANNEL_ID* to RZG3S_PCIE_CONTROLLER_ID* for clarity.
- Updated commit message.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 48 ++++++++++++++++--------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index a5192e4b58df..edb49af7429a 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -241,6 +241,18 @@ struct rzg3s_pcie_msi {
 	int irq;
 };
 
+/**
+ * enum rzg3s_pcie_controller_id - RZ/G3S PCIe controller IDs
+ * @RZG3S_PCIE_CONTROLLER_ID_0: PCIe controller 0
+ * @RZG3S_PCIE_CONTROLLER_ID_1: PCIe controller 1
+ * @RZG3S_PCIE_CONTROLLER_ID_MAX: Max PCIe controllers
+ */
+enum rzg3s_pcie_controller_id {
+	RZG3S_PCIE_CONTROLLER_ID_0,
+	RZG3S_PCIE_CONTROLLER_ID_1,
+	RZG3S_PCIE_CONTROLLER_ID_MAX,
+};
+
 struct rzg3s_pcie_host;
 
 /**
@@ -253,7 +265,7 @@ struct rzg3s_pcie_host;
  *                power-on
  * @cfg_resets: array with the resets that need to be de-asserted after
  *              configuration
- * @sysc_info: SYSC info
+ * @sysc_info: System Controller info for each controller
  * @num_power_resets: number of power resets
  * @num_cfg_resets: number of configuration resets
  */
@@ -264,7 +276,7 @@ struct rzg3s_pcie_soc_data {
 	int (*config_deinit)(struct rzg3s_pcie_host *host);
 	const char * const *power_resets;
 	const char * const *cfg_resets;
-	struct rzg3s_sysc_info sysc_info;
+	struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CONTROLLER_ID_MAX];
 	u8 num_power_resets;
 	u8 num_cfg_resets;
 };
@@ -296,6 +308,7 @@ struct rzg3s_pcie_port {
  * @hw_lock: lock for access to the HW resources
  * @intx_irqs: INTx interrupts
  * @max_link_speed: maximum supported link speed
+ * @controller_id: PCIe controller identifier, used for System Controller access
  */
 struct rzg3s_pcie_host {
 	void __iomem *axi;
@@ -311,6 +324,7 @@ struct rzg3s_pcie_host {
 	raw_spinlock_t hw_lock;
 	int intx_irqs[PCI_NUM_INTX];
 	int max_link_speed;
+	enum rzg3s_pcie_controller_id controller_id;
 };
 
 #define rzg3s_msi_to_host(_msi)	container_of(_msi, struct rzg3s_pcie_host, msi)
@@ -1698,7 +1712,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sysc = host->sysc;
-	sysc->info = &host->data->sysc_info;
+	sysc->info = &host->data->sysc_info[host->controller_id];
 
 	host->axi = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->axi))
@@ -1891,10 +1905,12 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	.config_deinit = rzg3s_pcie_config_deinit,
 	.init_phy = rzg3s_soc_pcie_init_phy,
 	.sysc_info = {
-		.functions = {
-			[RZG3S_SYSC_FUNC_ID_RST_RSM_B] = {
-				.offset = 0xd74,
-				.mask = BIT(0),
+		[RZG3S_PCIE_CONTROLLER_ID_0] = {
+			.functions = {
+				[RZG3S_SYSC_FUNC_ID_RST_RSM_B] = {
+					.offset = 0xd74,
+					.mask = BIT(0),
+				},
 			},
 		},
 	},
@@ -1909,14 +1925,16 @@ static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
 	.config_post_init = rzg3e_pcie_config_post_init,
 	.config_deinit = rzg3e_pcie_config_deinit,
 	.sysc_info = {
-		.functions = {
-			[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
-				.offset = 0x1020,
-				.mask = BIT(0),
-			},
-			[RZG3S_SYSC_FUNC_ID_MODE] = {
-				.offset = 0x1024,
-				.mask = BIT(0),
+		[RZG3S_PCIE_CONTROLLER_ID_0] = {
+			.functions = {
+				[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
+					.offset = 0x1020,
+					.mask = BIT(0),
+				},
+				[RZG3S_SYSC_FUNC_ID_MODE] = {
+					.offset = 0x1024,
+					.mask = BIT(0),
+				},
 			},
 		},
 	},
-- 
2.54.0

