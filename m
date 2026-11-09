Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223906;
	b=13Cs1iTBU0YQfC7xhHdM0vSY7lIfggy4nMlbKRPJx/i1QpI4MnPiX2gZiktDr4OE+dga
	 /2E5fmem9r70OkuI/kkPZ4ABI9JKvmQrxne6C7JkoU2+MKI5XGdXUya27ag44VxEow7xP
	 YfgWH4vMH+BSI1bqUFpnI3nS7G5wYvGDW3OdMqrF6hzASMOU72gubnsb82Q7GZ6cRFx0/
	 UCkaSlK1iN/mk03sVWInan9BE2RYlKY0L4f8SARE3n+IbGhZ53oBBHC3vrFnlecpcCvaJ
	 83uGmCpLXU/8aQ4pO/o3d9hS6lzkwmu2HjIdE3wnrAh5qwFYTm9F92C62RsPZEYUxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bIa1ynwYPh6ExB4St17D8gCLUqTxfSws2zY1owFapPk=;
	b=cRclU1PcG/1ElMLD02ZkEB4PEwZFtFDlDr09J6G+8NDmQqNrro4q67rurtGUqWFnYZj6
	 VpxXcTh8xb2bByGT+7MrB4HxAD1662iTmY6YyaBvMkycYdW7ioDlL3WgRJsqYDx98Gpwr
	 ixqcnFw7rrPKTm/F7IRKOxXLQQKBmc/KVIHdEZZuV8PqGelLECiHxS6c1GD1XQZd+GnF7
	 IjlSn7jo8/d2FAzN1DxjE6zJgtEzdrrjnKr8usRO9kgderfWMkDyotbOZWE0Y6594qyCz
	 j2X2uJmZYgU4WC4xsDfUyF2uf8KxW7FXDWWRz+pOJa+qK+7oD9OgkGggvUFtR+5lCaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZMAYU6u;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B819606A332
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 11:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B819606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZMAYU6u
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1931ff67a29so1963396c88.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 03:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223905; x=1794828705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIa1ynwYPh6ExB4St17D8gCLUqTxfSws2zY1owFapPk=;
        b=NZMAYU6uFUwUQfR10zJ0gom2mrhC6KEARAAK7SbAgFMuz/8sRumMHfJipcQcoCs50j
         T+UzH9+2TDisbsCBJmw34cQed6RgOKg+bC4wCQWqLtEqh8NyWlTdjsEUt+9koU4n2SjF
         Z04h+MoOz4M5KC7DqpRGQ+8iHhjfcLlzxXgYOADMBXZsZ1QYv5txSUfTlubDUprim10p
         1o48vHi3PjMcVDLLk3lR4Nt6PfO/8UlWZ1FSY/Uofrw8wqeJ4O8Xv/CmEZtM0snmuloD
         26nK8OnuAElYYeUYfhhg0aQIVhVWNU4FyvDiDWLVJJ8Milif2k2s+otQlmFd507wBMcD
         uacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223905; x=1794828705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIa1ynwYPh6ExB4St17D8gCLUqTxfSws2zY1owFapPk=;
        b=NLUt3wanBL6PTFCA+Jr420OAsJOEjpIHBzXH9bi+dvlHVsSaZARkIdMahXQ6aot5Dd
         p2a+D9s1cYKZx8qVg7VLl5Y3aWXJgScb6On0+y261D6AckUNGJc9zvo6e5Bvv2bpaHGT
         CXlHnHj3KjVp0llKyqoSW+SONJNQPReOv23s2/KS9QvCbDgAf3PK24BDg4auo9h55OgM
         nai7hQ/UfvsPtk/gm1gYGAYFJjUDmTwzE9qn6BFdcgIzETVWCuiSoYysqzEqFdO1rIWn
         sF6X3HE9F8I2/Ncd7BvgBCJqUfhITOsA+I+AA9LJ3shbCRdSZeebppsqV3DQZw1IZpI2
         dVTA==
X-Forwarded-Encrypted: i=1; AL+hErGhWIL6LbZsBtQol3qYPV7nkggOcD1bOYxyZS9E66sLSB9duXsQ+lhodOYtHAH0IJkRQVemKXS8+cT8wr6ypWbGtA==@vger.kernel.org
X-Gm-Message-State: APuU4Z97rbxYJZyTbh3Xtod6F3arXgj/TaiA8kDXg6rST65tWRX4t2Dm
	qTlnxhslPMukZey3kdaocFKQ+0UBNxmyW4KrngfdAzpOMZQD8gpTJZgh
X-Gm-Gg: AYBFou16leahYNCl4EIH5by6Wz9rojSCY3GLlABJiGDsrNgnCvEiK0sCAY3CC3fnUhW
	ev/zOY7vGjeIMuRQcFwBbHBPxI3iTdvHmsP27VOLU6KHAj6kuHXqV7UZma3KsqMCujJa+tLSjqh
	pp75wemnXDIK00Ce1ut6ny/ey4wu+SqCCb6U9u3EBp81de3cz67dzqXElOD/i2wnxoFhzztY2tG
	V62xchbXHqt/fyBmuGGyJQLuJAtQL649vgRkqCl+BjdNrIBl2x570mA4S1sSVgeWf+k5cjvwJSq
	SO6bMsJPTAbcEsyuJhztauf2OXTzm7UB11b8o94Fwry77HO+L0NdC6XZCIxhs6TtJ+AuVgUlIa8
	M2ZtWRNU934Ao3wVeNTVph+Rwo0QbPNMWjjv5HLobU8uAxWWMI6yE++vhGAIyzMdfF/fiS3izeK
	aUVV/t1j5dxnVCZlXLvs5NIPFKwgp1WZrncKGr4Cy5nFVOY+n5noicv2jY9C0bZRMv3ZtvSmm+c
	vd51IlGg37Xvwxj5Ei07J4zaP5miJeXd8bjQzrMNERsgZ7XDrOVT7r/yfre+NXrY6lmxZ1gNrQ7
	ftA+Wdr9ILpYDOf9GnJJTHuiowSjraztOekptq7069P9m0Um/3V3PkfdNYNUBfDm2Ng8Qg==
X-Received: by 2002:a05:701b:2401:b0:1a1:47b2:5512 with SMTP id a92af1059eb24-1b39feececfmr6126165c88.26.1794223905110;
        Mon, 09 Nov 2026 03:31:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f0e0fsm17762322c88.20.2026.11.09.03.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:31:44 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] phy: rcar-gen3-usb2: cancel OTG work on unbind to avoid use-after-free
Date: Mon,  9 Nov 2026 20:31:21 +0900
Message-ID: <20261109113121.1534929-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

The OTG role/VBUS interrupt (rcar_gen3_phy_usb2_irq) and the role sysfs
attribute schedule channel->work (rcar_gen3_phy_usb2_work), whose handler
dereferences the channel (ch->extcon). The channel is devm-allocated, so
it is freed at unbind, but nothing cancels channel->work:
rcar_gen3_phy_usb2_remove() only drops the role sysfs file. A work
scheduled just before unbind can run after the channel has been freed, a
use-after-free.

Cancel the work via devm, registered before the interrupt is requested so
that on unbind devm frees the interrupt first (no new work can be
scheduled) and then runs the cancel action before the channel is freed.

Fixes: c14f8a4032ef ("phy: rcar-gen3-usb2: fix mutex_lock calling in interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v2 (thanks to the Sashiko AI review):
 - correct the Fixes: tag to c14f8a4032ef, which introduced channel->work
   and rcar_gen3_phy_usb2_work(), rather than 2b38543c8db1 which only added
   synchronous extcon handling
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b5ba751..35e519a 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -1171,6 +1171,13 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
 }
 
+static void rcar_gen3_phy_usb2_cancel_work(void *data)
+{
+	struct rcar_gen3_chan *channel = data;
+
+	cancel_work_sync(&channel->work);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1277,6 +1284,17 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		return irq;
 	} else if (irq > 0) {
 		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
+		/*
+		 * Registered before the IRQ so that, on unbind, devm frees the
+		 * IRQ first (no more work can be scheduled) and then cancels any
+		 * work still pending before the channel is freed.
+		 */
+		ret = devm_add_action_or_reset(dev,
+					       rcar_gen3_phy_usb2_cancel_work,
+					       channel);
+		if (ret < 0)
+			return ret;
+
 		ret = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
 				       IRQF_SHARED, dev_name(dev), channel);
 		if (ret < 0)
-- 
2.43.0

