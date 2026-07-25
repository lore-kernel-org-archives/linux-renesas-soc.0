Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CF230FC1F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784992278; cv=none; b=eNJDA0LwcBp53LpdQpZEMvqbkuTbQCccYaRoNxphdbyQrMyiLauM/C/VKEDFcJzdBdQEwsCy9RXAOjPbTypRjeL25kWNzpBjbB1XA6EsjeDGc6ZX7ywE6qiJyiNkbwQ1pEyTHZqmhwEtlVUSSuw8r17EsLpA4sGbSwdFF8W+gZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784992278; c=relaxed/simple;
	bh=H18DqaJ+TlqCdpEXj/3EnANPHgf78mU1/XZtmymGfhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sjqk4iNmRgJ6LQoLo4E/aCCjc0LBFxkBU5vRgBlsj1RpOoICJoNsBQ9p8xczrHDPtAr1iwQuBUMsXv/5JSHYHwGz8pRsmRaco/931+8nu3FFNi+bYmsRO+1vyXz2M8JYzwbxz5Uiv6oYyOrtjIiUOTNBtH9kKHF3uzc1+zmUpdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWEb4hiT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWEb4hiT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso1096949a91.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 08:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784992277; x=1785597077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CYvdEZHLvpsB8m5OhVzDUrH4yO1XYjmeZ8hwr4LCz9s=;
        b=aWEb4hiToMwgvPf/l3KhakuMnRMPuJwsMFt1ToF0UHoMwpRW6opT4u0vPeeaxdtBPk
         Cwq9iGjtoVP84ekLep6NzDGLKtOhhxT5+lS10A7V0gk+IO7Z7Og37whBSNxT13DL3IPv
         sJ8alav5V80qjFp4TfG+h+yY/Nrf1M+NkVIxpKq/Xwx4I/mgTMxaUc+ruPkrlLpxZPCn
         IZI023tRNO2bb9rPyuFio3Dh76SiQmu85HteMGK0tBGowgsqGhLMFWAAQjvF7v/w6ai4
         /XcDDOK4jYbb53e31pacteBSK7IkOjIGX3/0jkGt1pnNQysWamKoRQnFVRITMp+yCjSr
         JWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784992277; x=1785597077;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYvdEZHLvpsB8m5OhVzDUrH4yO1XYjmeZ8hwr4LCz9s=;
        b=RTDnZKZnq8mzbcF2L8kKA79ZfuDUoBCuBxbG5G9d+HocUl6UnZqiAAipWkdAeA5aGa
         siv4Ro53m/7OvIBzgEK4LYuSmnE2TKpvapt4d50VkTZoN9NvByFdwPx4QhV/NOroZIp2
         uAdYhW3ckA0klzvLzg9o/NK83x3bxHE9rMciju7lWt2DT96s5w1tRG3FyOHMqQHyFlW9
         gB5eLtn19OFtdJHIdW9uiwrTe794I/ztYQxe8aXRCN7P/dqTtAoUFC5oYEKkpp8j70gR
         dx+GvGDb6lrcDh4yXs8iblvjtPx5MpxDTKAKVnbqEFf8w8n70S/lnBiKJ6PJOMaCcuep
         WnTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE5H3ENpqmBhgM50Wy9wAavRngLHoO9C2dRRPLy7KX5MBTP2Xo04DxomCJFp3ZMY1F1Dgm6Rz2kKxf7wRseQG27Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfY5vV+CHACecx02gNOalRAOjs2xHu1iPmsDCB9Mljc0GDFj9
	5I1OxooF1W29XJ+9AZTV+Iyt67zx/i4ewiDCrNrpw3iKfObVYaN0rgy3
X-Gm-Gg: AR+sD12j7AaOqsPoA5Q/g3xn5xZ/M+AVbEUBinigwelXinjazlwTqq9OdyYgx9xCvYl
	cuGKMuZMxGL/ohAbLzWYRRCDZgAg9QxGhyE+oFU1/jTxFpbLfA242p5v87SXx8/63/G5mFeF2YJ
	GwS7/HVNmQrwMi7EP2llsNZV9RvZAmz5ZTKZ+WFolKv58HW+6tMg65x0Apg4CbRNJWZmCs8D9LL
	PwzTsA09Pxi78Ppwe/91ISit2e/clA8Don/9YhH7Gm2FwVkbiSJp8J4v2HbqLBw5k/M+0sKgEnQ
	tnbDtB6T/hJqHF1O3yvw5d3VV6I/iMmZU+kWNuvNQHGaB0y4gQ5jhYXTxLEdzwzyO5M7kGBMfHr
	Y2uLHlZP6hw4s04kxwwkzeVn+snrcjL71+8mJ/vJA7+104TWd4WaD6piJP1YN1hZmGGPwkmo60G
	9jfDn6Mqk=
X-Received: by 2002:a17:90b:1846:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38f295232ebmr2572088a91.18.1784992276643;
        Sat, 25 Jul 2026 08:11:16 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm2907665a91.0.2026.07.25.08.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 08:11:15 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: kuba@kernel.org,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sukhdeep Singh <sukhdeeps@marvell.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Manish Chopra <manishc@marvell.com>,
	Rahul Verma <rahulv@marvell.com>,
	Shahed Shaikh <shshaikh@marvell.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: GR-Linux-NIC-Dev@marvell.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v2 2/4] net: ethernet: remove conditional return with no effect
Date: Sun, 26 Jul 2026 00:08:50 +0900
Message-ID: <20260725150852.859188-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725150852.859188-1-ekffu200098@gmail.com>
References: <20260725150852.859188-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Arthur Kiyanovski <akiyano@amazon.com>
---
 drivers/net/ethernet/amazon/ena/ena_netdev.c          | 6 +-----
 drivers/net/ethernet/aquantia/atlantic/aq_macsec.c    | 6 +-----
 drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c   | 6 +-----
 drivers/net/ethernet/freescale/gianfar.c              | 6 +-----
 drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c    | 7 +------
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c | 6 +-----
 drivers/net/ethernet/renesas/rtsn.c                   | 7 +------
 7 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index 5d05020a6d05..ea89619039d8 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -2303,11 +2303,7 @@ static int ena_open(struct net_device *netdev)
 		return rc;
 	}
 
-	rc = ena_up(adapter);
-	if (rc)
-		return rc;
-
-	return rc;
+	return ena_up(adapter);
 }
 
 /* ena_close - Disables a network interface
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_macsec.c b/drivers/net/ethernet/aquantia/atlantic/aq_macsec.c
index 3ca072360ec7..fd4ee6212234 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_macsec.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_macsec.c
@@ -735,11 +735,7 @@ static int aq_set_rxsc(struct aq_nic_s *nic, const u32 rxsc_idx)
 	sc_record.valid = 1;
 	sc_record.fresh = 1;
 
-	ret = aq_mss_set_ingress_sc_record(hw, &sc_record, hw_sc_idx);
-	if (ret)
-		return ret;
-
-	return ret;
+	return aq_mss_set_ingress_sc_record(hw, &sc_record, hw_sc_idx);
 }
 
 static int aq_mdo_add_rxsc(struct macsec_context *ctx)
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c
index 33e7a99d3e49..79d4a77f72bd 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c
@@ -3935,11 +3935,7 @@ static int dpaa2_switch_port_init(struct ethsw_port_priv *port_priv, u16 port)
 	if (err)
 		return err;
 
-	err = dpaa2_switch_port_trap_mac_addr(port_priv, ll_mac, ll_mask);
-	if (err)
-		return err;
-
-	return err;
+	return dpaa2_switch_port_trap_mac_addr(port_priv, ll_mac, ll_mask);
 }
 
 static void dpaa2_switch_ctrl_if_teardown(struct ethsw_core *ethsw)
diff --git a/drivers/net/ethernet/freescale/gianfar.c b/drivers/net/ethernet/freescale/gianfar.c
index 89215e1ddc2d..cf636fc5aafa 100644
--- a/drivers/net/ethernet/freescale/gianfar.c
+++ b/drivers/net/ethernet/freescale/gianfar.c
@@ -2877,11 +2877,7 @@ static int gfar_enet_open(struct net_device *dev)
 	if (err)
 		return err;
 
-	err = startup_gfar(dev);
-	if (err)
-		return err;
-
-	return err;
+	return startup_gfar(dev);
 }
 
 /* Stops the kernel queue, and halts the controller */
diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
index fff8dc84212d..e96a268067f2 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c
@@ -2478,7 +2478,6 @@ static int netxen_parse_md_template(struct netxen_adapter *adapter)
 static int
 netxen_collect_minidump(struct netxen_adapter *adapter)
 {
-	int ret = 0;
 	struct netxen_minidump_template_hdr *hdr;
 	hdr = (struct netxen_minidump_template_hdr *)
 				adapter->mdump.md_template;
@@ -2486,11 +2485,7 @@ netxen_collect_minidump(struct netxen_adapter *adapter)
 	hdr->driver_timestamp = ktime_get_seconds();
 	hdr->driver_info_word2 = adapter->fw_version;
 	hdr->driver_info_word3 = NXRD32(adapter, CRB_DRIVER_VERSION);
-	ret = netxen_parse_md_template(adapter);
-	if (ret)
-		return ret;
-
-	return ret;
+	return netxen_parse_md_template(adapter);
 }
 
 
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
index 45ed8705c7ca..47cd9ec665ee 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c
@@ -1618,11 +1618,7 @@ static int qlcnic_83xx_check_hw_status(struct qlcnic_adapter *p_dev)
 	if (err)
 		return err;
 
-	err = qlcnic_83xx_check_heartbeat(p_dev);
-	if (err)
-		return err;
-
-	return err;
+	return qlcnic_83xx_check_heartbeat(p_dev);
 }
 
 static int qlcnic_83xx_poll_reg(struct qlcnic_adapter *p_dev, u32 addr,
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index ee8381b60b8d..f7beeb73eb16 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -685,7 +685,6 @@ static void rtsn_set_rate(struct rtsn_private *priv)
 static int rtsn_rmac_init(struct rtsn_private *priv)
 {
 	const u8 *mac_addr = priv->ndev->dev_addr;
-	int ret;
 
 	/* Set MAC address */
 	rtsn_write(priv, MRMAC0, (mac_addr[0] << 8) | mac_addr[1]);
@@ -702,11 +701,7 @@ static int rtsn_rmac_init(struct rtsn_private *priv)
 
 	/* Link verification */
 	rtsn_modify(priv, MLVC, MLVC_PLV, MLVC_PLV);
-	ret = rtsn_reg_wait(priv, MLVC, MLVC_PLV, 0);
-	if (ret)
-		return ret;
-
-	return ret;
+	return rtsn_reg_wait(priv, MLVC, MLVC_PLV, 0);
 }
 
 static int rtsn_hw_init(struct rtsn_private *priv)
-- 
2.43.0

