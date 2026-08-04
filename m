Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4710A41D633
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Aug 2026 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857075; cv=none; b=lSUo1bfJqTx5oIS/iiMz9kABMeUiWUgtnPIZ+UupfnOdGlW1AtLZpDgDF3flHF6rtrUHnNR/yUkJP3eXiZmItS3TYvCbQ01aPxvCQAlK7/zwoIUtxYk4/6lH209GuV9lU+9E3ZK9FIEyw8WBuyR+rUaVZjKRinbQH9zkICoEYEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857075; c=relaxed/simple;
	bh=OopYQvhAzOgtFkvIvP9rtCLorwAIPYHcEYrvhnabJkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NS3MLpCNcWoDOxIV73FDZGgTAGRwZ0FQcaNZRnaU2iP5nmY8B5HueLxlStTiQM1/AbO/gKXQzeqo+N+sGssEeJ4zAgVx9tWldq8tgBN6ZWlRCKIV6pJlaOG3L4d7hwTfRv98TCw2+wEPpDIgYjJuGWCSpz+x4+ZTx9wtI+tMftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFpMbg2I; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFpMbg2I"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84830c774a0so4621755b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Aug 2026 08:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857074; x=1786461874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBV25FHnbtj4yfXf4y/tjyzU6LlfwbEPVATRcbf7jt0=;
        b=WFpMbg2IZuRMFAlez4+9xN2P0uRMk00N9kBvw9FXruvoTZdhg0L+AS9xJxQ4C3v/ZM
         4NB/eZpMxgMC2Y+GfVcDObdE5mrIB9BnvtKIXA8ZHrCPgkhY7b+9hLRxL3+Wvm6ZBdyr
         7SlItK0+tK+m+mY22IhqY5O8oWH1U34VUvRajZ5E/63422c4LaUVr6glEUnXNIlZ3UKr
         VF6kjxnkUauAHpTt2dbut2GCh/lRDecFY1xKMFRjkBfuYk0Jl8PO4wrU1gPZYPwcB1j5
         9V6NvI7vAuMILnNqDY6tGwBrSKX+0zazwbofiqWYv+Bf68ivcwBambyMd8QNMe6NRbHY
         Oc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857074; x=1786461874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FBV25FHnbtj4yfXf4y/tjyzU6LlfwbEPVATRcbf7jt0=;
        b=R0VVguC7obldt31SB5HHqoBpHe/apfRbzH1WHi4t/U8icbPhNdehVmk6dql3YnMfFN
         ZImLOAN+Mb8uKTCIY4T2WSjiA56pJKCY3nx7x2wL97Vn2sYdzGn3/fGhoHd/gCW9Z0my
         OMNrn/2K2mtT1Ax0Va+Ff/8P0twuqeDDYztfv5YuPiWFD1xXbKJ3JNbDNvwv8oGdsIcd
         CIFXaSAiPDyJlMftXexNutEsmquxkANzTNluIre8UVcLjUyHa7/Z7FFZABROl46oYfTo
         NV0GVtQkw6CIOK3MUbef8FuEgobBYDM5y0f4wrVwYgyfG1y4cMSRkM6Ott4xhwsLOblZ
         2JIA==
X-Forwarded-Encrypted: i=1; AHgh+RrGijMbIi7u+4enPPF0IXg+rnkVGUSKnXJv/AcQTT+AHJvkRceGf224rJawo3yygrZje9GFm5GYmM4DIFkIfa7ZwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfmwDXuBkjUfeQMR08FklBAbgfpMCOkquvieOntaUNOFNj0Cwu
	DcV8A+6kTyqgehX4dSKcSMgodBaDxz6gaGoC/s+f50U8ALVR3lAm3Yp7
X-Gm-Gg: AR+sD13Q0MH/BtttrXHnbTVlglkFTyKcGfcWCyWT8QObLquni6nMi1PcKnGcOxfcrfF
	hxNgmIcny8dcQNDpnOxwEYWrclQ6iR9qhEKYfUMUfmjt6SOX6B9JP7IGvUtbfroOiS4petMbNFV
	dzhQkc4Lwn84+ZBO7OlzQrj2TUpB5WoiALXc5/cNZfxN2bPS8983hvI4YPj5Wdut60obuelqsba
	FrN8OVWGj/TV4cia3XFvUmhOb6nQ0vQF+qEuqFH3yA59YmNxzvbUSDYofHvVli9ZSVpp1F0XFvX
	5G2XMtdp7I0dqK66bQuazi4h2533jkRxjw+ajS5GB6FVPp90SihpDcvpLuujDM+ymVJ+cet77LC
	OvJLQu8ShPh43PdWDssNl67ZLKN0rQqA2mbLNhY8prsTLertTp88amKtIOL8Zcbl5Dbb7Jg76ci
	37ohJhvPQEmOYAAJtuv43QzkHFHiDaYH9AdwFgaJJAL40r01Xg3sLVFWJ5ROD6m72nzGsr+/m4B
	0/8uQCtO5Z0JZt7be9+1F0TMMkdW4unMVfEp7cnjb5Egs0Q
X-Received: by 2002:a05:6a00:3d44:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-84ee48bc72bmr12127911b3a.35.1785857073491;
        Tue, 04 Aug 2026 08:24:33 -0700 (PDT)
Received: from [127.0.0.1] ([103.17.98.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe564b3sm5586778b3a.14.2026.08.04.08.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:24:33 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 04 Aug 2026 23:24:18 +0800
Subject: [PATCH v2 2/3] phy: renesas: rcar-gen2: Return -EINVAL for
 out-of-range channel reg
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-rcar-gen2-v2-2-829cb84112ca@gmail.com>
References: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>
In-Reply-To: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785857060; l=1024;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=OopYQvhAzOgtFkvIvP9rtCLorwAIPYHcEYrvhnabJkA=;
 b=BsDksh2TdDHRuuWFLX2lyAqs3HxunCcOgfL9ctOYsr3hJ8MAEq/fJvK3TGgzc+SXCD58Mqjag
 BWpevYb9t1uBC4XdEjt8ivY5n2ryEPBd5wOmV2P/WXBB2U86s1LEReX
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
index 5a272e25e051..b18727ed41a1 100644
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
 

-- 
2.43.0

