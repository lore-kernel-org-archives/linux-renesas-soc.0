Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215807;
	b=eF3mb11EiVrHNW7/2cqsWtdoqrrnzK+9Et0WcKNBsq8/lYFtvH36aOhxZBou+FngmTqZ
	 k6B9WeE8IV2wth0imV+f6GhAocWuhywI2Q6XUT44ZRuQ08/gbGplPiOIjnvJHfdxTKuJq
	 df8YlGOyWDtPcPYToM6oCZ7f67ZIcSFMcog43XRRBJiPRpCzqQ599u+ANFgfm9zVdeDFD
	 fV8/Di55HmtG1Go+VBSQAqLUc43J0ohcL8upAXcqmkp1TmSNtQbeuINu/AZRFaVmyH08e
	 2m4UnCxMX7a/KfMfaxNEf/zJGaUGbZZDAAYK5C+IjSfTAILoMh9XYK/vyq3hruIF9vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4JYzGansMqTukkQ4RDlEbc+etaP39OGNhJKIlvghSHo=;
	b=En2uAfNKjD/RifU78/tWkrVTEFsQtjCu1tKiHRpTkTRcdkBnqWpsSq8xcrYv0h++4I0Q
	 xdqhTSL3pa7mpF/N1FTEGYg/vHDJhoyhYihJLjfRxFeeku75zDGaDygUXYQ4lu94S4Blj
	 JGbA5/rHUeS5K4aF/YDOK6+AYobIjsywx/rgtybO9OnjLjkzWO6cqJjV14s/KxLDItqMZ
	 kHEjVcUma77gx7PD7o5l/opk4XZpE3yjKovsGUv2gWFZbj9Uuk5suxs1laogQSxgAqw6Q
	 n4Eb6JKdMOSwv6HmOWKDpjob3BJJZ51rKl9aIlyk3WG8UMLld9knN00JpjY0tEHvAQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlLjh34f;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D760A6F56
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 09:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4D760A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mlLjh34f
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae58d17cd9so283404c88.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 01:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794215806; x=1794820606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JYzGansMqTukkQ4RDlEbc+etaP39OGNhJKIlvghSHo=;
        b=mlLjh34fWJrUQyEM0QJmTVBhUuD6/MixZtoC4K422wie0uhVjBgC7cFSJIhg0EEW7v
         Sg91/qMumkPqqy85RyvTY+NVBLzB3L2hephR+u2b9TpvUSD2MaEX/LZ5f3DwHp83hFdN
         BjluUvZwYl77/TT+iPCH8jRS7cAz3AMuZscmUWE39i3//XWmoUbRWyVYoPW6YDikf8t/
         349fvuHYw19W++3018hUZm2tENmljkwSZVt9FFewfA2Rlvbu7ewhROR6Qu+gMHB7EnAl
         25cdb8o1HmOWLKQ58KbDjaecDL4kgWdX7r7jVFHki8IGVrzT8bdr1qsrU457ZGmEWHk6
         0I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215806; x=1794820606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JYzGansMqTukkQ4RDlEbc+etaP39OGNhJKIlvghSHo=;
        b=BcoKKGrr4T4r8yhkUkX/KD3Hx6fmKZX6LgXWa6xgbIiTL6dn5PKm5OeO08WVqEz6Ae
         VJOYeMwuGvgPGTLCVanEUfkGV3oaD9a0Y+ZFgmZIX8tJ4VJRgwdKljeHi3XQO0LLZfsT
         +To652wKYzzx5ICygRXn77/RSEkiekOu8p81swgc38SjKeOhqF5O0nVrTySfV+zdEsu8
         Xuzb2G9eho2+SJLh/zSpX709+lI8vn6YEQi3N8NbhSPhGiIqTvkqiQgdU3hnj89EuWXq
         KIl4bnq5SBuP7bZFgoU3ZtMZLc3wlsrdoHUDKsJXSxjN3iOz2OJ4DH2JYhMCXXxU2FU1
         2yyg==
X-Forwarded-Encrypted: i=1; AL+hErFECxI4D2ceY0U/WBE87mqJp++ncLihvC7qyzQibLF+8/998L476Jzfbkmk4nOHkN766x1rod/heMP3DkGzJBKPEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XLZVaHAHcDSl/LQnb+mkIFI//93mUebTaOysN2kjkJDO1jEXX
	ulkK4o4gjRb6nBhJ7WvN2ghvb8vhj6MFZEls+iFHUwxvFrkT/60BNhDT
X-Gm-Gg: AYBFou0Y5bPBqOPCip41xoiKdFbCxaRtlwN+u9hYiQsiP8LD1Ez7HsIgKsDqunUnN96
	UYuCl9Fy8LhbCLgbtsbffDaUq1ewxH49cupcXEdgERu7+0CMG3/Ufh4cwwByuVt9umLgxF8+p1O
	g3ngR4HqDRLwPFSKL3L5n3BUDJG38xecUn3aF8J9++F8+2mKEtauTtzG5nhgx1mXTC/+ys49Xak
	7d9Bz8ukkGb6ZfPIW8P6C9l4L0l7uFodg1CkscLhTksdaQVaO4c1FYjOFZ7PN4ObhaU2ojQppJT
	fV3wYu9IARIMJ+DOBHkh3Yw15Z3yNavrkPpeGR0KRNLaoI91VaOcO3mBwpn0HBPCPCMReaCQXrl
	FroH8QvUqtFFjLELS4LMb5AhKJNC+lB4lueTlLS2tNkbIcPHYwg6Bmghc5h5Kzm7oQNtJNOTDRX
	uzBQrLiKOW6lCN8uqBLgaOoTYxanzRmCZeZw56nTPDGFREZBsJsPETgYnxhrNQab9F2vAIdMPNx
	Mgw+zKChic3gcZdx3URgOue921GliZazv8r6KRIl6ISXmpEk73UuB3s8KXjw4vnEmsgAGBv6LlF
	rSERu++O+bx9KMY9fDT9HY5G/tuAc5lDeNY50xp/GKDkFOlzjA==
X-Received: by 2002:a05:7022:e02:b0:191:3c:aae7 with SMTP id a92af1059eb24-1b39feec174mr7917195c88.26.1794215805760;
        Mon, 09 Nov 2026 01:16:45 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375728f8bsm10675160c88.15.2026.11.09.01.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:16:45 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] phy: rcar-gen3-usb2: cancel OTG work on unbind to avoid use-after-free
Date: Mon,  9 Nov 2026 18:16:33 +0900
Message-ID: <20261109091633.1430331-1-hj351016@gmail.com>
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

Fixes: 2b38543c8db1 ("phy: rcar-gen3-usb2: add extcon support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
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

