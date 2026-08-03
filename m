Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B03E377AA9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Aug 2026 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762458; cv=none; b=tD7nsQwWdR/TlzkCTTpir7LI0g0bbjDLgQo9u6tMciAbM9FFYLsB/m294d5wBOWfPe6uRM2uHsVN64aYzGHAyRrkOgIpunuq2PaTk7HtZsPlwNGhu79t2DWKdNe5vYd4ofgUMRbIiGIgeKzeUqmmNmJ19z0qtrDnwns/Fc9Y0dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762458; c=relaxed/simple;
	bh=mgNbfurCgEe/9LJSMHHHowLjwvDoD6FclLw6ncGPoTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FjogrvtoUxmaWEc087hJlQ28Qb0E+D6w2f5ZT/+233aFWvevtk6YkAvH1lt5+IrNfUQUe496g39DixnENuHMoiZYMoHV6nlY+L2D/61oH3FcORoLvaC2qXZcIOAZ6rr9uP72Q7KPsZnmFpCJKhIV0iYZMWO6n2pEP+0C7+jBUCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYb3/+Wl; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYb3/+Wl"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso4222670a91.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Aug 2026 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785762455; x=1786367255; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cRpNOSp0h3L0rFKlXO5YQxhArCl8oHMttLaGl9wZm/w=;
        b=IYb3/+WlrUK00IBDDDjppzpYousXOTbQFKvnr+fgxujBhyeEpg4DWQ7IU1Bjzfc0H9
         Ztqa2oUz1+Vw/R3Ru+JxWlwmraHefFLwDSgTbfJveR7zZZIp2b/VKteHTJODJfd+0CJ5
         k82DKPeLZYoide4CoidCLYmRFetGE5DITmFPXIjbDYTyS+OXg8CXFTuuBnciA4pMTaLe
         +KXktGI12we5FNOWgQafSKfRDFsGOWLHgD8rb4uXSzN8/r/HegiokP5iAPTAp9xYl//t
         w1/r9zvJ0ZCu9WShtrCa/lgcRcLlBTTMRg3aHY3HxbCMUcQ/mPSZtWWeEE222923SnRE
         XvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762455; x=1786367255;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cRpNOSp0h3L0rFKlXO5YQxhArCl8oHMttLaGl9wZm/w=;
        b=Xm/Y2Oh+LImxLovHoori9WttM7UeUNSuu+4DZRuxcNoCDOLd6NPTO5+Ma636+ViqTc
         Xc27TPEKf3Ia+zrNIWe/hNsQAAX/z9iV7P3iijBiY8CRnqmevjeSAjtLvx0fFwaOY/NI
         Kzpm/K2mfdoG9jtgKO63J8AuznYU3dpBLnvoyG4FUYjHFmyvqR6VDJR9XDRZoYdfXIVN
         GwbU67nG9GSxccNCWtxq9cAqLwRzToHu2AKikyQ25Va8DMfhuCyxhy1L4s4bYb3MMjef
         JWwOk4UVHfmMeZMAriY3W72NXA2Flz206sAoJ1c2rwCgi5rFM2wMACNKz+EIHySy9Zc0
         k/Kg==
X-Forwarded-Encrypted: i=1; AHgh+RpeEF8OIhtGxxQKIyu8pa0YvolXLgMEgjmYV7RG9jvOAShpTIqEHgZyuZtKa1l+YUTRTVputu3xQeZBaVNR4MIAAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSIapuEsbmsVewdaNWASBkfCy532hZE1VDhP0+Z+w5tqgoCQlJ
	vEkSxE2rgJzGT3UJm68uovOTCrLAl8Dv78CUKaR6Dci7NkSFLMq760Xe
X-Gm-Gg: AR+sD1200NyIafzYSH43YqZ0DCZ00/bAkPfUxN2+p4g5pXddpknfu9GTrMMG3P4X+p5
	XchMif2J44Z0vK+U7ShqioO6T8paa6mUamE7DpAbxqr8QIePdehq5NcgAcQnxxZyH8d9D6qET0s
	OPrqmYRUtOgv+sB9syDLCvhpkyPd4O7+hjdcZBIigOri+td1ycQ/817xTgDky4/vSwf7TwfHx9f
	Lc9iEASTL88c/IrM9J3ukhMcx60K0cQqs3EqZ8/Now+p19CdjGZIpmih6B9zm04MJ9Xal5URhhV
	jcEH2hUN676PJ4DtUv08AFxf+PN0coosdGGTdE6HWq+bIsQ7T9yRKfM/YqwiUTgv790dhYKzRFd
	3qVDy7baW7tbKLpuFxBNYJ+CLzYwS+RLBwvhP7A1uNIbur8h7Xd8FGkkY2a9Jol5pKwPehyZxnJ
	lOxNFl0JcMOrJut0A5hj7v3HyAVzb/YCwpkvriP1BMMblaasTT4nK7MjN14Q+3Lpyrayw6YDzED
	qY8PSvfHn1uo2cc/jVzwhPD8SrvarIQzJwVBg==
X-Received: by 2002:a17:90b:4b8f:b0:38f:9b7:8c92 with SMTP id 98e67ed59e1d1-38fbc5607a7mr8532952a91.34.1785762454725;
        Mon, 03 Aug 2026 06:07:34 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b663efsm2485544a91.3.2026.08.03.06.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:07:34 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 03 Aug 2026 21:07:27 +0800
Subject: [PATCH] phy: renesas: rcar-gen2: Return -EINVAL for out-of-range
 channel reg
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rcar-gen2-1-v1-1-4796ea6e76d8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI6ScGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNj3aLkxCLd9NQ8I11DXUuLNBMTgyQjiyRjUyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgDqnbX7bwAAAA==
X-Change-ID: 20260803-rcar-gen2-1-98f440b28b35
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Ulrich Hecht <uli+renesas@fpond.eu>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Biju Das <biju.das@bp.renesas.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785762449; l=1170;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=mgNbfurCgEe/9LJSMHHHowLjwvDoD6FclLw6ncGPoTc=;
 b=tueQA/WphvbJ4bu9l8Nppp5s3Q3nHNa8F151AeQlWVIilNf4EmzaitfNkJ6rvdlaWIfth3I+d
 TrLTxMQvTEpAYNM0WFNXJ1QjMdjJSBSPtBgd7IzoAxV/5YJUBbIFYXj
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When of_property_read_u32() succeeds but channel_num exceeds
data->num_channels, rcar_gen2_phy_probe() returns error which is 0,
so probe reports success even though no PHY provider is registered.

Return -EINVAL in that case.

Fixes: 1233f59f745b ("phy: Renesas R-Car Gen2 PHY driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/renesas/phy-rcar-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index 6c671254c625..f0858d8cc705 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -390,7 +390,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 		error = of_property_read_u32(np, "reg", &channel_num);
 		if (error || channel_num >= data->num_channels) {
 			dev_err(dev, "Invalid \"reg\" property\n");
-			return error;
+			return error ?: -EINVAL;
 		}
 		channel->select_mask = select_mask[channel_num];
 

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260803-rcar-gen2-1-98f440b28b35

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

