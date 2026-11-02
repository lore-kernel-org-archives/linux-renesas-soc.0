Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616556;
	b=k83JVPfz0Dh0nHYepJgbVnpPG48SFmu73srtL9eztJU/Ge90Xk3yXy8sP4fX2jYj9RlD
	 IZQQfwlk5I5zuzDg0MUW01JdbeOMh1gEzUaQ8skb2Zzh13eSXcgQEfjdHhyeAK5Au8JnH
	 oz8ny67h2RHj6nip1ltMTxh8P8BpQ3+wBKoh4+VY0e/jwPHf8svhOp02mdQZ/mdKC73jb
	 b/T4GdpNKGNE++eyrWi4GggfNTFj0tXod3tsmPTN3krt6d38xlApHQIp5X2kE19//q1lt
	 4k/G0y4yw0ZkAAAgTAu05dsqW63TlK2LuIMD7I+mTWBEc2Es+pcvJ5zxmfOx1X9K8rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0clmgW6W8K3zvBAdCoPv8qr9pD2NFE9Kzq9ZUKQvStg=;
	b=E09pZ2uRgKE/FR+Ttpxy18JUCI/sg7VpJiRlQFVXr5VyrnpeticdT6Tec/YUZTI4n6Z8
	 RqStMJlRdYHXE9M+3TdttiaX2YyJXPBD+gaHD0I4Nq8Z837xmYAzkzMJUe5JUnAOwjupn
	 hjPR8fE7NPx03xvSwByUHIuSz16Saq2Hdhz79mk55U3jhR3P9zq1jDORgXTOjFSs1vBca
	 HAcm0rqSztkI9ke7gUG0LfEaB2s3NgTmrMq8MLXssVlEHQFUclu+T7yzAqOXF2nXtkVAp
	 zjEwuCE+aGPAaXJL14qTawRnaJeq1B2IXxt/wfbiOs4WHJcoHDqJ0zlOQ3TzX6fuVhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycvAvHqd;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DBB606A32D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Nov 2026 10:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59DBB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycvAvHqd
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so14423725e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Nov 2026 02:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616555; x=1794221355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0clmgW6W8K3zvBAdCoPv8qr9pD2NFE9Kzq9ZUKQvStg=;
        b=ycvAvHqd90Khx1t6ulxhF8gchS7b43Ou4o6seEwKNejjao9eOz6NgM2DGN1b8QdPdQ
         xdthxBT7wm39HG61RJAQW7+YcynFbl3V+uh1laum65v5vxCV8MbydioKTXpthy1FqKVk
         wB6xOfFMgM101zAa/EpVSge8TOUQrHgTF1R0lwOMmoKHS9n3WaRWJmiOlRhGn5z/ZGjf
         q/GBc2UnNNFYDBJ1WblOezv1JKKZlQ1DlwVipraVfssY5KT82Fk33+0A0RN1vVffTFiz
         FEcMQGqk6RuuJaZEyyn5U8S2TLpvgpGpRs2j2LsxBRQEo+9kmxw56TWgBasKZcdy8bjs
         HZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616555; x=1794221355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0clmgW6W8K3zvBAdCoPv8qr9pD2NFE9Kzq9ZUKQvStg=;
        b=qgC3As2J9egf649we1j/iq2cormwAn+WZRWGd/mtwFYmQl/uIHJVHM0ACbmGH0CkxN
         uCBFpNoYjXo5TirsQOjt3SKgC3+QSSRIL/vYxiuxixlVY2w8/WsQ0PF9aTqiRmzTeexR
         21ICsWDTvyP2vfQV1xMfKjBe0e4zwgV8duW6/7+bgAo0XR/R8OLokTNMbdupBl+lEUnS
         emgLX871MoSm9BoVFs5krjwGZQA+XhsDyhRP+SsK5f17Zbx9VJMwp4HCRsRovBi/Wu+/
         ePPGvp0bAgo3hF45gNAOQuN5i2Y6ZWrmRfQZbdNvo72RS9/9LnjQJPYlutKx7MokT0I1
         oAcg==
X-Gm-Message-State: AFq9FYIBZpJlxGs6feMxZeJ11r0GUp8gwLQdtw9emI5tNP/CfysCcfug
	Xf6JLqde/vWbdHumxA+lW9KbjcVHu712t3kJz5FMVAyg30yDurch0C+X
X-Gm-Gg: AYBFou0Sk63bmgNu2dzo7EwI03XAfmhA9un/bXWnaSxIoKIeAWXNvfbaz/nNtToNf9/
	ADvA5Ewkc1JTjEuSBi4VmVTDaA0/EyQfV3PyzpgKVn0Z+h63jAiNjJ97Lw4A/5JsFzMayyvXvaL
	CfVZBhvUHn1zMUFCHL5VUzRJyucmzpaaIbo1j5YLxLK0CUy02YqrZWATP+ntT4KHPmu7qKmLPyh
	cxTEpzMxuszPyk9khibZtP1Nz0UvWdgqGhn85wPwidQh/irvCCCGH51jCUVY5IMoBEEoMar+xxc
	MfxY92G5WSsuT0vzFdZoXM3WHFa2aj6QDEb9KljV2bYdshPifDfM04oDSkYpu892v0baNyBgt2C
	MsCe001zZSHyJMcKxF+cTFZ3nyFvp61dajCVBzQYRnBKe3C6Q8wft8uZAyb6ZaKSVmjwU8pgqAi
	gPctJTPQqDUE+u/9ysB/fD3oNR54rN+XZB26NIDrBX9BQqaozuRxEjC2CsbgtnPG3ueXcM4U4fQ
	TH1HGsKfhaAMEQkRE+m+unOHBJuKM0X5ZImoRmyQ0uBsUwVp9My4+CcE4u4QF0KJ+mBxOceVTQY
	5AtY6iyP9TTg471vVnGVVxXhdwgWxwbGbvvwiCWzxX6LwSdv1LAW9Cg5vrEgj3DcejuDrx1eLdJ
	tBk9gKBiSU1qilIC0OQTvmjGLeTg5KgygpP/L0w==
X-Received: by 2002:a05:600c:8183:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4ac180f2ba7mr209406045e9.12.1793616554603;
        Mon, 02 Nov 2026 02:49:14 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:2980:4c44:a4da:31ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm180553815e9.0.2026.11.02.02.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:49:14 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v3] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled until role is known
Date: Mon,  2 Nov 2026 10:49:07 +0000
Message-ID: <20261102104907.16007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

On OTG channels of SoCs without ADP control, the VBUS regulator is
acquired with devm_regulator_get_exclusive() and its output is switched
by rcar_gen3_enable_vbus_ctrl() using regulator_hardware_enable() once
the port role is known.

The helper acquiring the regulator has the following problems:

- The internal regulator is unconditionally enabled at probe, so VBUS
  is driven before the port role is known. If the port is connected to
  an external host this can back-power it.

- regulator_get_exclusive() hands the consumer an enable reference if
  the regulator is already enabled, for example by the bootloader. The
  unconditional regulator_enable() then takes a second reference while
  only one is released on unbind, leaving the regulator enabled and
  triggering the WARN_ON() in _regulator_put().

Fix this by making sure the driver always holds exactly one reference
to the regulator: reuse the reference handed over by the exclusive get
if the regulator is already enabled, and call regulator_enable()
otherwise. Register the disable action in both cases, then turn off the
physical VBUS output with regulator_hardware_enable() until the port
role is established. Enabling a disabled regulator to take the
reference may briefly drive VBUS during probe; this cannot be avoided
with the regulator API.

Rename the regulator helper to reflect that it acquires the regulator
without directly enabling its physical VBUS output.

Fixes: b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
v2->v3:
- Added Fixes tag
- Added Reviewed-by and Tested-by tags

v1->v2:
- regulator_enable() is only called if the regulator is not already enabled,
  ensuring exactly one reference is held.
- Dropped enable parameter from the function
- Renamed function rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable()
  to rcar_gen3_phy_usb2_vbus_regulator_get_exclusive()
- Updated commit message
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 35 +++++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b5ba751805aa..3481505dea2e 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -1114,8 +1114,7 @@ static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
 	regulator_disable(vbus);
 }
 
-static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
-								  bool enable)
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
 	int ret;
@@ -1133,17 +1132,35 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 		return 0;
 	}
 
-	if (enable) {
+	ret = regulator_is_enabled(channel->vbus);
+	if (ret < 0)
+		return ret;
+
+	if (!ret) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
 	}
 
-	if (regulator_is_enabled(channel->vbus))
-		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
-						channel->vbus);
+	/*
+	 * An exclusive get of an enabled regulator already holds a reference, so
+	 * add a cleanup action to disable it when the device is released.
+	 */
+	ret = devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+				       channel->vbus);
+	if (ret)
+		return ret;
 
-	return 0;
+	/*
+	 * The regulator is enabled only so that the regulator core holds a
+	 * reference to it. Do not drive VBUS until the port's role is known;
+	 * rcar_gen3_enable_vbus_ctrl() switches it from then on.
+	 *
+	 * The VBUS regulator used on these SoCs implement the .enable/.disable
+	 * ops, so regulator_hardware_enable() cannot fail with -EOPNOTSUPP here
+	 * and no special handling for it is needed.
+	 */
+	return regulator_hardware_enable(channel->vbus, false);
 }
 
 static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
@@ -1151,7 +1168,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	struct device *dev = channel->dev;
 	struct regulator_config rcfg = { .dev = dev, };
 	struct regulator_dev *rdev;
-	bool enable = false;
 
 	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
 						      "vbus-regulator");
@@ -1165,10 +1181,9 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 					     "Failed to create vbus-regulator\n");
 
 		channel->otg_internal_reg = true;
-		enable = true;
 	}
 
-	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(channel);
 }
 
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
-- 
2.56.0

