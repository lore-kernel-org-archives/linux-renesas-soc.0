Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995083F328A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651458; cv=none; b=bLqkoJTPzMii22SPKmD9oZcUHLiT0ffU7p3KiyAu82QkSnZ/oPrDRhxTUlKR0YbrFKCy5K4vK089nHLC+eJyFsyT0yiBK1p39mY+o8jCUsFW132mgCmKWMvIFuDPeqf1eoDGyCsBpmmNkdHRZrIUtmMfSMQhZ5SlyY26d7TYNUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651458; c=relaxed/simple;
	bh=L4KcC/D8JNR68JbmIZsy7FDJIPX4XPqpuzQaMbjaS8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCuNC4jcVuBG0CnBduNV7n4SXi+rUFLKkuQmOpFhhNDJjWG+5Q5zH46CmKBlcHW++8OishSemYtBzm3298XsF/4j+vD3N2OMmcADjminh9iqFdyRCVBwyOpQkenNAC1cVjWjVeuYJ1OvNWx6xNg4chLV4AGOhdcD+FfqumehXIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiaytjNX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiaytjNX"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1670dad7a8so798537066b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787651455; x=1788256255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeaVy2u4NwAxOvzDo2/ZVVxI3i4d6+VqvUeN33Hsu74=;
        b=GiaytjNX/52UUZUm8PWir3Ok+HZnoluwW+H9154fomdJupmrizn+06jbiK97e6RNpS
         iTdseqp0li/99br6etMcJw/iWnr+Wl8yWLPsUMMPXH8STl/8FFp+skMUnWAUioQAtSmT
         c+nDfLWtUoMjUFYfb+vphiiEV5eq5vhYuOqCQPFP/1ZIPoYHhSRoxe1Y14EOngKed0a+
         A35MlBQnKCPhQ/PIvOtWC/SZ//FVSXi7D3c/VS7FOKKNZsMhfcYPkCEn0AGdKdp4MTkl
         VLa1MAkJ5vzTPYev9nyah1aewzy3+E0FBpolY3zXTjlFjMPJXuYgJv0GiBeG2j1jEYEu
         NBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787651455; x=1788256255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeaVy2u4NwAxOvzDo2/ZVVxI3i4d6+VqvUeN33Hsu74=;
        b=MSQqFmBM0rSS+G4RxVI6uq7YoZkTE6I2gJx+9psCVL9IYcuuuVC1QwmUOhZUCuoH0C
         jH5NnS51NRbWBznwUMarrfNBZj6baNUqu3mSkCErzZl9NsUZOB3k40oWGyz3YyXTP/UW
         s0xxdcaRfOgQDvTLlgFREEUDfdLVp8aGZDtfQ4VM54Bq1ZlophC+yYixGQyrztwVssnm
         IvNf+DedROzTBkUz1J3tYDB/tmwiL4IBRUSzzVVCQEKU0q2Tu7o16ij3Ol2yN30VHkNn
         2dl22kQHZMASLZ3t7GaXEaZO62t29b0QN5FvtgidygYIJOQghQt1oLjL75rB1ZVKyOVo
         yaiA==
X-Forwarded-Encrypted: i=1; AHgh+Rof9PSaWbHfE6V13X5tJ99XO2XSxH42rgfwnmPJC0nYPnlhZt64kBIflq+7Mg9uTzh7gp0KZRNcLOyUIiyQngtumw==@vger.kernel.org
X-Gm-Message-State: AFuF++nzcdTh9vjhLYvBs+RqxwtHUl1lNKGZIyPIJ9NdWanMKlPxKzHB
	tgJ2qszxm/9t8GbdRvxbwk6i0wOlds4/gJ2luVbi/wDS2kRWxhjh5VYt
X-Gm-Gg: AR+sD109BwcfpMNVva9g68hy9RpIDrcYlbqiSGA4ssb/2iNyBRiTepO3Egg3rxKh4g+
	ZNIaP/8tNDo5xbkIPfHX2jAk314/Zpznq2gAHx3sN4Ng/GiHYEux9hXLXEaMTqKvj7emK5ouXTE
	QHRC/xuxUWX3PDZ3awM4kyaXamuqgkLK7K4GXYggUIwBDZLmyAdqoRgQ/5xMw9Y17nAe19VkdkW
	Ur40V6gz0HxYs2NZx9kjkXeUrRAzVdaoGAzq6hO9y0Nk+Kv8jH4ow3J+Y2AwxQLPQOFzvk+Xoeh
	1TtfgnFVJQZ+KIS6Hrfs4jWl6MP0zbf+WWv1ML24Pl06Hm5iGjRC6RMyC88eF7idbE39BpCe0jP
	ue49rG7SsoGwIuKrQc/nPCBj70Fu52nPPjv3xkH0uqXSuV1tP6iuTqNbbE+49UzCPcLCpVyQJcP
	BuAGGIhITrr3JWuAchtLTBcaC6DDZYgcchF8dNQ+sfZKkFJptJiPtj57nUfabg5Wjtzskmis0Ob
	FW+4577H4c+tO8Wo38r5Zi3
X-Received: by 2002:a17:907:e1c1:20b0:c25:437:3dcf with SMTP id a640c23a62f3a-c2504373f29mr20567466b.21.1787651454490;
        Tue, 25 Aug 2026 02:50:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629929dsm1749320666b.23.2026.08.25.02.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:50:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/4] PCI: rzg3s-host: Add support for RZ/G3L SoC
Date: Tue, 25 Aug 2026 10:50:42 +0100
Message-ID: <20260825095047.9971-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add SoC-specific data for the RZ/G3L (R9A08G046) PCIe controller and
register its "renesas,r9a08g046-pcie" compatible string. RZ/G3L reuses
the RZ/G3E config init/deinit callbacks and power resets, with its own
L1-allow syscon offset and mask.

Also increase the timeout in rzg3s_pcie_set_max_link_speed() to fix
the "Failed to set max link speed" message seen on RZ/G3L.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 25 +++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index b3531468ef38..3dffb85c6a47 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1165,7 +1165,7 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
 				 FIELD_GET(RZG3S_PCI_PCSTAT1_LTSSM_STATE, tmp) == ltssm_state_l0,
 				 PCIE_LINK_WAIT_SLEEP_MS * MILLI,
 				 PCIE_LINK_WAIT_SLEEP_MS * MILLI *
-				 PCIE_LINK_WAIT_MAX_RETRIES);
+				 PCIE_LINK_WAIT_MAX_RETRIES * 10);
 	if (ret)
 		return ret;
 
@@ -2467,6 +2467,25 @@ static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
 	},
 };
 
+static const struct rzg3s_pcie_soc_data rzg3l_soc_data = {
+	.power_resets = rzg3e_soc_power_resets,
+	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
+	.num_pcie_controllers = 1,
+	.config_pre_init = rzg3e_pcie_config_pre_init,
+	.config_post_init = rzg3e_pcie_config_post_init,
+	.config_deinit = rzg3e_pcie_config_deinit,
+	.sysc_info = {
+		[RZG3S_PCIE_CONTROLLER_ID_0] = {
+			.functions = {
+				[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
+					.offset = 0x3a0,
+					.mask = BIT(8),
+				},
+			},
+		},
+	},
+};
+
 static const struct rzg3s_pcie_soc_data rzv2h_soc_data = {
 	.power_resets = rzg3e_soc_power_resets,
 	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
@@ -2516,6 +2535,10 @@ static const struct of_device_id rzg3s_pcie_of_match[] = {
 		.compatible = "renesas,r9a08g045-pcie",
 		.data = &rzg3s_soc_data,
 	},
+	{
+		.compatible = "renesas,r9a08g046-pcie",
+		.data = &rzg3l_soc_data,
+	},
 	{
 		.compatible = "renesas,r9a09g047-pcie",
 		.data = &rzg3e_soc_data,
-- 
2.43.0

