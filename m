Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD2390200
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 20:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786478497; cv=none; b=RQ7wra+HqrZ3zPSh1u4XDYqZxrcgqLfzQKBrAyqLLboAa0GNz6/oadLIBOoohg8X0ko+MvVeT49MvXfsyRIugIpwlVS8GdtYBpsABc+74aNbg32AyBOOIENCsLGio9y8QgMNkTcok1GdMYpk4uXxH6xIt7o/CLqzDx3h9mBmv4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786478497; c=relaxed/simple;
	bh=9WDwPklQZULEU0ftN77u8KResH+rXClRsq15ydImbN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGTIeWhU75aQ8KWMw7zjI0Oh/h/M55OV2u+sEOGuA3CU143vXJZ+Cbxnpc1OTqTDony2wcOCu6lPfxDlb3TJBI5mwuR7/GF+n94lAFMt0XRj9y/TKysVZGaKTr76iyguaPA7tiY5Bx3sIF4L2e5OMF1csoW9hCgpuPLhwe59TIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DU+qYhde; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DU+qYhde"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbedf6a6fe8so136843a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786478496; x=1787083296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0QYx2H3oKVA1pDedVfiJ5Y7LwMtbGVZPi7N/1ddFrc=;
        b=DU+qYhdeRhI9pfoMi3XgKFBpOhKW3ApP1vHzRB19HpSft3ReIzvt/md4XlY5JI5Vwr
         ZZKcu1SSlo1QAT2jcsBZtJ1rhu8lajH2fkh/PztZnYf6P4xDGJ1JVO3uRRofSdqLLDyD
         InNzb5g1uicYhRMjDCjMY1afndc1v3f6H8AWRNv21rVCLb6plNZ2FLSVCnIaM8Kl6ERc
         EpPOaS4aAVtdvm/BKlzuaBlEZW5uBCPuWHMgxQtlWA/KuFY4ZDx8nHdS8ZUilUhgjKgd
         KDnxyeRV1AUOGISikhorImPjLFeVXeePNKSokPUei8UIUr17wNoM/qP+u2jel3wrNKee
         IYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786478496; x=1787083296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u0QYx2H3oKVA1pDedVfiJ5Y7LwMtbGVZPi7N/1ddFrc=;
        b=SCDvMlX0+I3AnfYynMklzuEJvzxJdPHzRDSir1w7jo4ust2VIUqQ6PiCUXHNz+dLKj
         zx9pNUl08EBAoNxDe280n07/d5/XIutJ3LtO36RQ9l97UmoI56kwFUm9m75caaXD3ZO7
         lCfY0BsR4CrAaTuIJF2ZaoqbWKQq8sECSbEDOlxJxhEBqjLlUOL1RozpzFPVfhhdniDT
         NkP1YEUq9++XZbR2OCG8BBpVCxu7MhME6GaYQy8G+AYzuU4/VsqeNMPc1UxzsVdSboc1
         voin6AmBS1rzb0+YNRwZodnt/vCh2Bwb6q+dfIHZkuWxyKIdEowAMQjtRnLYkJ6Exp2P
         +obQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/UTU0jlICUihgKOlSVGOp+MgbGiwbHuJ/vlMjalVecLWIbGcdFYOuo5ZcoZiADkBdAFJzML+QpW1gohya90Vu1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7F9PIQ6DKXAf9U9mHyycOWw4jaCayd1J+tiDqUmHu/BncPE/
	nB5ZpClo6mKgu317ApspZM1nzV0r9J7LGGzL/ovz/0dg8FWQFAm2DJtx
X-Gm-Gg: AR+sD13KlJh2sJQDqct+p7vd5GC4GroqYOJooNxUbIVFlyh0QPCZUJWtMw4HdQA05u6
	lHflS0a9YizxWteWI54CCKPED/FWdEafWZ413UH1gZ9u8z7CP/mSkkEWp1ofpEsL8TlnOxhzcu7
	KBmvNKpiZauhlgUdjc3Z3czWijA5CEv8Q3xm8gtKVWsZZwR6r3KzbrViTirSq/1SVjWVWbikcof
	bCw0ffbut6nMSJCbYGUst/nu9Q6S1v+nBekm6e0I2lTZx0ky3BCHQioZ85DWBw8xqR5gYbWPo+Z
	+6aBVOhBZnhTe2WzeMMTuUCZNgeO3IMmqpFsSquKDBEJVLUCtz6C6MxZAqu9VTN8VK72LuzcNd6
	dhSagOf29530aUIuWUV+sOo1dbPNk/vTEsmncKXYXXA7KPjFdlB9kEHrUmGe6H8JUZ6ViQMWoVQ
	UqstzmAzIUgD1r+goE+iGVB6mFGIjb7oePKqTK8JhpClEOxzXMiIsTddI8kDtwW8vWqU+nCTy7P
	7GrJUKm4ZPZhkrV/2JNUG9uPx1y+S5M5JayQWo6X7s88jMBWagS9aK27Mr7FXawXh5RZbxRcVnI
	UEEQp6yz3Q==
X-Received: by 2002:a05:6a20:2d13:b0:3c4:1916:9d46 with SMTP id adf61e73a8af0-3cc2bac42a9mr7716637637.27.1786478495582;
        Tue, 11 Aug 2026 13:01:35 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:ceae:5da9:e5f2:ea74:b6c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6791351sm2216447eec.23.2026.08.11.13.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 13:01:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] PCI: rzg3s: Propagate platform_get_irq_byname() errors
Date: Tue, 11 Aug 2026 21:00:12 +0100
Message-ID: <20260811200013.185956-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811200013.185956-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260811200013.185956-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

platform_get_irq_byname() may return specific error codes such as
-EPROBE_DEFER, but rzg3s_pcie_init_irqdomain() replaces all failures
with -EINVAL.

This breaks probe deferral by preventing the driver core from retrying
probe once the interrupt provider becomes available.

Propagate the original error code instead.

Fixes: 7ef502fb35b28 ("PCI: Add Renesas RZ/G3S host controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Added RB tag
---
 drivers/pci/controller/pcie-rzg3s-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 01488660ab08..f51b5d7c1998 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1019,7 +1019,7 @@ static int rzg3s_pcie_init_irqdomain(struct rzg3s_pcie_host *host)
 
 		irq = platform_get_irq_byname(pdev, irq_name);
 		if (irq < 0)
-			return dev_err_probe(dev, -EINVAL,
+			return dev_err_probe(dev, irq,
 					     "Failed to parse and map INT%c IRQ\n",
 					     'A' + i);
 
-- 
2.43.0

