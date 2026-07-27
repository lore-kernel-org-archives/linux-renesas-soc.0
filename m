Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039DA3F1ADB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785146331; cv=none; b=bEQnJgs4Asi/vHBAgUqJMGzyo3f2KpzqEFrlgTezMlPvdjrNtrrbLrnCskkFnxhPT1FwZM96Kd+WhDmOjR3AUnzFsnfz+ZG2OoduA9k1sRbf5BKdR7lUaFT5KaNzT53fpoMQ0N91XghtClyS1qgi33qGcgqOTttRlZMbSSr+/e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785146331; c=relaxed/simple;
	bh=quGlo1AAMz4MdcR5eJvUFdG4S3/8Vcmu/B1ry5mycPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVxVKjaV0GR9sUgnerdCsIT63dhCv69Jtyu9vzgrj83vxhtA4W+E0yL/OSncLuDRIuZMCs2nRpTXJ7zD1ZvQ/NaFdMo6t0bvGlVys/vtLLNAytO7eZpLW0U2c+TrOu5QKdFA62xYgWWma9/LU5PRy+GpTkY1oAVsplYpMiOa83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wq0Qq/Tf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wq0Qq/Tf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954aff6088so21166775e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785146328; x=1785751128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mamcx34JMeLjC6CN46Yh4hwjjs2Agi/cyzZ2FrLvP38=;
        b=Wq0Qq/TfXt5C6WiMEaV2aa/0iM5sotKOqKHB/KECg9sGxx0TBYHnEZLpQhb9bLQvAT
         aUeD6K9qdoWkOFUx7pVmJluNx76ke0cyFWNPlRoShu+t6fiT6vvuc2iF79EW9KNCQXmj
         axCyJAWA4wntdGTPNWcesJpwlVWqi50yxmFS06DYtLbLmW3K9q5atkbvSmUWzNOP14tY
         9eW0UNJqloU5K5gYRvDMLJRpOtJNJBriMe3me3VOMcLvs3gtLKCxhO263V85HwGua34F
         39BKfQVOkehCakkHyciFkw8fyR8W7/JVYuBgMQ1OPkCtA7ziFWquhfynAKZAhalgXZ+1
         U7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146328; x=1785751128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mamcx34JMeLjC6CN46Yh4hwjjs2Agi/cyzZ2FrLvP38=;
        b=mKsR1RXelpq7tyQZclW00FQD/loBu/ITSmThcoqlgI28YBt5EyiMsJSUqD+qa781Sp
         BKZLN6F1GcdvzwmAfmptO8L/caMISyrRbXhHT5NzGx6mtICJ0z08c+1lJyW9eUigBsNs
         OeJ/v5fvT6ZEW3uJt4RE7ABCnw3ixLU8xNLMzrNC1xstKN/vaOSa1x6tWO1EfLqfCH9N
         KuPDkeDFYK9LlZ1ckpPWajWj0leHc3gudJTLjU2MzWAAw7LtqcnmKabnE30HSnJ8z0QQ
         z696xYfSN9pf2czfn1GdFXdvvDzDn74H9JAyoovxOiB5MW5V3W7ZRXAXSfC7q6WdGiYg
         vjcQ==
X-Gm-Message-State: AOJu0Yzcjg1nCvCzuEmuR2liTTT7k8jPHnQXoKUVLRUnbAK33svI9NDg
	nQstIaqWvrC2gJBddjKhcdrBh8fEPI4xkX37wF/OPyXl8DF9yP1oRdyV
X-Gm-Gg: AR+sD12cXhryDaI/vZzg+3SQf2VyhRka3A6Dbok0xbbE9uZDevmb0shvvWJuQItabCh
	Ed0NTB4riLBMcFcyxY25PJevUp/dNZG780Vz9dz2w092I5wDkkoRAR1cfV4XMRXtz/e+mJhM2dl
	2wwqTbs9YMcER+vnyB/j+BkZ0DxlLC6fTH9LKYggEZEfV1ZSnW7xI/R3rZ/BS34sMFvK/pgn6gf
	YMlMMaZq4WG9XEjGQEACZ5lKBriGle2E3U+BqYt+rDMGPgfRKUAWEIBLZeJh/Hn7psDiofR0YBx
	VD4l6oLlTxp1y7dqoHgEdI1N27sJ2ogOe5fJQ/oPL4JYBDRcyUJjYW7J9MBA5kA+bpapxruOQC9
	wR6LY1+VNvOXInW+s4echPRKkAeYwvlyH7khV4SBOB1zYhTGanEQxrpL/v42w//skecXYUQAWcC
	FKftCRNyKEf8w50PSQ/zvopR4ETEWYp8U0S28FGP/15PdZaRQmZGGQVTbeS25VVJjcFCMOrl11g
	hmBz8+rWTGk/9Fq
X-Received: by 2002:a05:600c:8214:b0:495:5e07:649b with SMTP id 5b1f17b1804b1-496b570dbbemr95770795e9.24.1785146328138;
        Mon, 27 Jul 2026 02:58:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8281:5343:33a3:cac0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b842691sm238346295e9.1.2026.07.27.02.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:58:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] PCI: rzg3s: Disable refclk on probe failure
Date: Mon, 27 Jul 2026 10:58:41 +0100
Message-ID: <20260727095843.116950-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727095843.116950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260727095843.116950-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rzg3s_pcie_host_init_port() enables the PCIe reference clock using
clk_prepare_enable(), but if rzg3s_pcie_probe() subsequently fails, for
example because pci_host_probe() returns an error, the probe error path
only releases the clock handle with clk_put().

Balance clk_prepare_enable() by calling clk_disable_unprepare() in the
probe cleanup path before releasing the clock, ensuring the reference
clock is properly disabled on probe failure.

Fixes: 7ef502fb35b28 ("PCI: Add Renesas RZ/G3S host controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v1->v2:
- Added RB tag
---
 drivers/pci/controller/pcie-rzg3s-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index a1a78bdb7af1..01488660ab08 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1897,6 +1897,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 host_probe_teardown:
+	clk_disable_unprepare(host->port.refclk);
 	rzg3s_pcie_teardown_irqdomain(host);
 	host->data->config_deinit(host);
 rpm_put:
-- 
2.54.0

