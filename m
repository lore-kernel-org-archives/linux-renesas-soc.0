Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134369;
	b=tAwW5lSP7vf+ZYJU3s0VSlXa/nwO9JwlX1mllVZJ8biTlJW9qhNoBjYcPgzVCoi/HwGq
	 cXCtQqAUKNol195kYdSp3sTg8dBlB3OmF80jIQf5dvi2/qPZjvru5aDbaijdp0yRbuXxS
	 NGYea9imA9aMQjpnd7GEcxDsLOa2OPVUvrAijOx49NbAci2bwRhdu0RPiGqOW+poTMH63
	 XSbJNnNxG7otVo6ZHJroqup7a1RvJFNZ4woPiYiKyAG7TDs5xBvZCg+9NdX9z1ZCrgB/Y
	 l+YQZr0kfyKFkXa+6GM/EoV0YKZzBVXpGLlHBInZs5gSSkDQoenLe67PLBg8lmthZgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bQjGVO3udrhXw9sccvsCj7Cf3JHcG15fTpR6MOYmh4I=;
	b=HA8DQUyd7EIDE0L+3GdtxoNKNGJg3DNoMBaIqo+uP8i/trW7UzdX0krQB1TLpA5v9KV1
	 2zAyKzMgJfppdmnsDxymwGlRIlNARoXLCTqbQneAon3ciV0NZOt8M056kfroOVfr63dUC
	 u/CNIvle+s58QfQFYGJd7ztjc2xxPQ294CGpkFw2MMAs4AWSf6nZTEuiNJmcgzVP8AIz+
	 +/2c6S5a4w5FeqPGsvqSIeNEtXEoiFO7le01eHmqLEucFiEb8xrfHprA5nPHV6qyKu5+o
	 WeetreY+AxGtNMoG0a1/xJ5CCBIrCL+IZBmXUWhePgEy8CxYylBhuSNmistC3VrjdzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2f9TT4L;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3C460A3803
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3C460A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L2f9TT4L
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e47347279so173148f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134368; x=1795739168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQjGVO3udrhXw9sccvsCj7Cf3JHcG15fTpR6MOYmh4I=;
        b=L2f9TT4LRtv8RgluP4Ti+Ox6xj5ld8LFI+r6TWlaAuHZzOVwG//CVCO6FTSMjqYMh0
         XaMKZQc4NrRh8W4bHv0pxMq/NU+VKxn3rXKzM2utIAg1h1Hw+4PyIwYa+1f24CBb/Hek
         V1eoEvoBjP0LM5RVTuYPx/SsIUX6Hg8zqkRZlFRpLvRFtn3z1zv6Y3GvFeENnSqpjC4n
         feiZrCJFrkKR2SExRxyq2ytxq2B4bv5XEZXut5cCvRFv7+35K51Y9VYwoGNGUF645mZ9
         Rnq5xuACtndxArcHzK/sElG70xOV56UCubPWUlFLT43nGHk0YlvJV0fphlJn3i0Xc0Zq
         qvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134368; x=1795739168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQjGVO3udrhXw9sccvsCj7Cf3JHcG15fTpR6MOYmh4I=;
        b=ncFiOmsCkttJL7Th5kCkvWJpTe7Ct2AxVxrzCRPakq/Lf2zGOVmn70R+f2FSdFiE8K
         yTxsD4VdV3wBpRxMsi3mEAdf539lUQ+xf3WDmBhXVZRXLUxksKP28gqp5QcodDLVCsFH
         NML2R9QahMemSE8s9lJcsz56tdnFY1mPE4vVk8b/QRc+KjckrKwi3jgeoPTvFI1VyuSY
         5AhBXR42T0Z/4UJ+e9br42WRkvly9sqZVAclbTxGdO1nWozIWDULAG3tH/2VjYULgyfa
         nXu1EYlCOq+WLnIADXe6jAcrNzDkJTujrr+BiziKSoK0yG5CUUPuyGGezsea4EUPOWAJ
         Ea9w==
X-Forwarded-Encrypted: i=1; AL+hErGlYAxUpyFNa1F5pZOGnvLSl8y2sZNYXD08iFiIR7egCaaEZSKCJrbeQJjIHGoen+arqIHPsjw46NsqyJIywWTYIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8YinRGDh4FJc28dGwcyRc4d+QMLSPHcFZ7TF+cpcAeDPXWEbrn
	QvoYQE3ggpEW/NUkkHiCMT17hDuy8AjK38j4Cm/+NCtpra+UhFt+RdEy
X-Gm-Gg: AZFdTZeJcI1zV07p449XN0WBAo9qLQycd+gy5nlnfLchH7w/jDA2gdGxHKPnsKGF0uv
	FRGmRy//y2BjJPNZtwVCZl5zZgm0Hx145FZWmgTlD1/Z+v8xui+6cIUq+eunkaMvZJLF1/GkjvW
	SShRMjuRDPIvFMkVpuYgmwtHXJeL+Euw/VCfj1Lfr12/vqv08GIBz7jYxUZSsCc8jxo5jfjr7IF
	VQMs8peRR3VlI16LTQoCFbMVEI7G1Oki0rBEbopQN0/uGyRSrAus6RO6NPcHxUZBHmQVoNTfqKs
	TyFJD7ZYFuaImPMjHQhvxpNWNRot4sZzy3P5m7eeTyW96aOL1R7xiRejBD8nIraUQKD0U2U1dPI
	I9R26cSr9jDpBis21x2oUp3BjaxRoIZ9vX8mLmSby95p0oyH622KaCdJ0D7AB79BaQBMQClPET6
	17dWPFyQvHAC7Y6YmbFGdkZuh15RGbc9TpkuNLvZreXnIXzhdEHCtbb4WXO6SJZA5l0GzD61JJL
	hO+MTNrX1MVOMpBOxpHlRMzSTMVq4X7bQhWlyBxuVBUVttW05w6OKOrIbHwkDmCS3vmxGbv4Yny
	EQtoYFvoInoDa9snaVxLnw1BYy9dLZaFhP00bfn2bxYHS9TuZtdT5bf7RP2u83S7GgFHCbo0jsR
	BdxY5todYLPgOADek3NUPym3mI0neJTqjK3HhjOatMCoAog4fBq62HNhKQDc0623x1QSktoAp
X-Received: by 2002:a05:6000:2385:b0:497:9e2a:b1e with SMTP id ffacd0b85a97d-4abb36787a4mr2384296f8f.9.1795134367746;
        Thu, 19 Nov 2026 16:26:07 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:07 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 15/24] net: dsa: rzn1-a5psw: Get switch info via OF data
Date: Fri, 20 Nov 2026 00:25:25 +0000
Message-ID: <20261120002549.1908299-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The driver previously assumed a fixed 5-port layout and derived the CPU
port and number of PCS instances from this. Newer Renesas variants use
different port counts. Although the CPU port remains the last port, the
fixed port/PCS topology hard coded in the driver no longer matches all
hardware.

Introduce an a5psw_of_data struct holding the per SoC switch info, and
use this match data in place of the previously embedded constants. This
makes the port loops, PCS allocation, management-port setup, and other
topology dependent code reflect the switch layout selected by the
compatible string.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- Added return value check for of_device_get_match_data

v2->v3:
- Fixed typo in commit message: swicth -> switch

v1->v2:
- Updated commit message
- Renamed A5PSW_MAX_PORTS macro to A5PSW_MAX_NUM_PCS
---
 drivers/net/dsa/rzn1_a5psw.c | 31 ++++++++++++++++++++++---------
 drivers/net/dsa/rzn1_a5psw.h | 20 +++++++++++++++++---
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index bccfadc1d5e6..8d7cad90d613 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -384,13 +384,14 @@ static void a5psw_port_bridge_leave(struct dsa_switch *ds, int port,
 				    struct dsa_bridge bridge)
 {
 	struct a5psw *a5psw = ds->priv;
+	unsigned int cpu_port = a5psw->of_data->cpu_port;
 
 	a5psw->bridged_ports &= ~BIT(port);
 
 	a5psw_port_set_standalone(a5psw, port, true);
 
 	/* No more ports bridged */
-	if (a5psw->bridged_ports == BIT(A5PSW_CPU_PORT))
+	if (a5psw->bridged_ports == BIT(cpu_port))
 		a5psw->br_dev = NULL;
 }
 
@@ -928,20 +929,21 @@ static void a5psw_vlan_setup(struct a5psw *a5psw, int port)
 static int a5psw_setup(struct dsa_switch *ds)
 {
 	struct a5psw *a5psw = ds->priv;
+	unsigned int cpu_port = a5psw->of_data->cpu_port;
 	int port, vlan, ret;
 	struct dsa_port *dp;
 	u32 reg;
 
-	/* Validate that there is only 1 CPU port with index A5PSW_CPU_PORT */
+	/* Validate that there is only 1 CPU port with index matching cpu_port */
 	dsa_switch_for_each_cpu_port(dp, ds) {
-		if (dp->index != A5PSW_CPU_PORT) {
+		if (dp->index != cpu_port) {
 			dev_err(a5psw->dev, "Invalid CPU port\n");
 			return -EINVAL;
 		}
 	}
 
 	/* Configure management port */
-	reg = A5PSW_CPU_PORT | A5PSW_MGMT_CFG_ENABLE;
+	reg = cpu_port | A5PSW_MGMT_CFG_ENABLE;
 	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
 
 	/* Set pattern 0 to forward all frame to mgmt port */
@@ -1154,7 +1156,7 @@ static void a5psw_pcs_free(struct a5psw *a5psw)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(a5psw->pcs); i++) {
+	for (i = 0; i < a5psw->of_data->npcs; i++) {
 		if (a5psw->pcs[i])
 			miic_destroy(a5psw->pcs[i]);
 	}
@@ -1181,7 +1183,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 			goto free_pcs;
 		}
 
-		if (reg >= ARRAY_SIZE(a5psw->pcs)) {
+		if (reg >= a5psw->of_data->npcs) {
 			ret = -ENODEV;
 			goto free_pcs;
 		}
@@ -1228,11 +1230,16 @@ static int a5psw_probe(struct platform_device *pdev)
 	a5psw->dev = dev;
 	mutex_init(&a5psw->lk_lock);
 	spin_lock_init(&a5psw->reg_lock);
+
+	a5psw->of_data = of_device_get_match_data(dev);
+	if (!a5psw->of_data)
+		return -ENODEV;
+
 	a5psw->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(a5psw->base))
 		return PTR_ERR(a5psw->base);
 
-	a5psw->bridged_ports = BIT(A5PSW_CPU_PORT);
+	a5psw->bridged_ports = BIT(a5psw->of_data->cpu_port);
 
 	ret = a5psw_pcs_get(a5psw);
 	if (ret)
@@ -1277,7 +1284,7 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	ds = &a5psw->ds;
 	ds->dev = dev;
-	ds->num_ports = A5PSW_PORTS_NUM;
+	ds->num_ports = a5psw->of_data->nports;
 	ds->ops = &a5psw_switch_ops;
 	ds->phylink_mac_ops = &a5psw_phylink_mac_ops;
 	ds->priv = a5psw;
@@ -1319,8 +1326,14 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzn1_of_data = {
+	.nports = 5,
+	.npcs = 4,
+	.cpu_port = 4,
+};
+
 static const struct of_device_id a5psw_of_mtable[] = {
-	{ .compatible = "renesas,rzn1-a5psw", },
+	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, a5psw_of_mtable);
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 9693f8503b0b..26d201931453 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -195,8 +195,8 @@
 #define A5PSW_aCarrierSenseErrors		0x924
 
 #define A5PSW_VLAN_TAG(prio, id)	(((prio) << 12) | (id))
-#define A5PSW_PORTS_NUM			5
-#define A5PSW_CPU_PORT			(A5PSW_PORTS_NUM - 1)
+/* Maximum number of PCS instances (excludes CPU port) */
+#define A5PSW_MAX_NUM_PCS			4
 #define A5PSW_MDIO_DEF_FREQ		2500000
 #define A5PSW_MDIO_TIMEOUT		100
 #define A5PSW_JUMBO_LEN			(10 * SZ_1K)
@@ -231,12 +231,25 @@ union lk_data {
 	struct fdb_entry entry;
 };
 
+/**
+ * struct a5psw_of_data - OF data structure
+ * @nports: Number of ports in the switch
+ * @npcs: Number of PCS connected to the switch
+ * @cpu_port: CPU port number
+ */
+struct a5psw_of_data {
+	unsigned int nports;
+	unsigned int npcs;
+	unsigned int cpu_port;
+};
+
 /**
  * struct a5psw - switch struct
  * @base: Base address of the switch
  * @hclk: hclk_switch clock
  * @clk: clk_switch clock
  * @dev: Device associated to the switch
+ * @of_data: Pointer to OF data
  * @mii_bus: MDIO bus struct
  * @mdio_freq: MDIO bus frequency requested
  * @pcs: Array of PCS connected to the switch ports (not for the CPU)
@@ -252,8 +265,9 @@ struct a5psw {
 	struct clk *hclk;
 	struct clk *clk;
 	struct device *dev;
+	const struct a5psw_of_data *of_data;
 	struct mii_bus	*mii_bus;
-	struct phylink_pcs *pcs[A5PSW_PORTS_NUM - 1];
+	struct phylink_pcs *pcs[A5PSW_MAX_NUM_PCS];
 	struct dsa_switch ds;
 	struct mutex lk_lock;
 	spinlock_t reg_lock;
-- 
2.56.1

