Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B8037E5DE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 20:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786478492; cv=none; b=tOVWw7vQ0ZHSB5JN2OMn6I4QlAbHOACa1lftfSkOzqoPimmHEQuSrsRXrlegaNr9g5Prr4IEb4bgANvNc7EH1gwXzSYn5Dh+Qm+xVHqZB9pA8M5wa9Obwq7cqvdbyySyhlLO+Z+6B6A9MJNtYndgBmjGnGwBFIqAp8Timfg3Fwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786478492; c=relaxed/simple;
	bh=M/Ozed0nksdp37DPAu/RhSqJymREkLvE40C3ZrkbZrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4jhCe3PLXqtOS6FCsYcGFnx8nLe7bOIZ7dRAl3zF0dgimsfh89XZg5zksPeCAMCF01dnDOdZ7dUuxXZm2fFwBaG1Q6XaWQtfuphIguWaa4Txc9k9SHrYrh1KUUdwgZeyGFH9Ntpm1zLlGLfCb1abrCm3/VCBlDN+0nbwOG8uHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7lCBjCe; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7lCBjCe"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca80d708489so203121a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 13:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786478490; x=1787083290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMP0hddgxDRJDSmMUhN6Ff8CjFaNmUc5wsXEddg84DA=;
        b=S7lCBjCesVWhqzZW1QlBnGRkXtEHCVVxO1tstZdmNcc+oYVLlqZOILxg+FOZWvmcBP
         HB6P5h/ZIDUrmDmCMkWKjal87pSxdbp5+GjUsGEg9vtjZ6bBWUfbR0GijLjiYBrUzDFV
         klvVVZBMqBHAcjPWNBFOnqOeGFtSQ/Ptc2lXfsBTlWksq/Sa+8B3TTFjZ3dgs1+SNIsu
         W2+JGPCUT4+K6zhvVGInfNfXjy2Yvc1hT6r2Cchea6EYBmWNR+bJOvj5tOlyTXT8iGfA
         tbYGu/GAyh/fczgGFwQza3bkvU+zC99Eggj1/0ZGFVNW/RQf29EILtwHzhZGcbC6vNLs
         92TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786478490; x=1787083290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMP0hddgxDRJDSmMUhN6Ff8CjFaNmUc5wsXEddg84DA=;
        b=Oet0Wni0XjZ/ObBAUVAHxAjgrNVod1EJ78S1olV6DFiFwDUMVYIWSvHH462Fj1O5xu
         vO/9u8oyZtVnQ7eY9BUH/VW3ZE9Tugm2YsTQbYRH/BvhAKKNQadHS8fDBVyjMuXjvrSg
         YDXyIxsKpnMSz92ifwObxJtmbFDe+MZmYknighgHEkAa3sPgSzgB9/lpOVQpHXpKA/nS
         8xxcOxTvoVwXdauvDu1AgVorHG12y+uo6yapCb6rJmecZgxY+99nFeeMiFFzpmneWzcb
         jHpvtO8zgqfq3UtNwZ+A6Q5hkek1QEbQJJ3AU9/f7URzBCen45Z12Fvqygha/GXBLIie
         klyw==
X-Forwarded-Encrypted: i=1; AHgh+RrorZCVQpRrp9DmZ4ZzCMk43UV5Jx9RU8QnQ3wQmswGEGqqBD96xXP5zNDs6kRtx+RVXa11B/a+uN5h19eATw45VA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Gpsse6fA6ENYdKjPsZ3oq6fvDJRrV6Iu3gz5V2zpNPWcVVBX
	ULonwlKEwlMHP3IkDXe6c0xc0wg+OovZnSgoCbGg6zcsmzpPv5kjgNCM
X-Gm-Gg: AR+sD11H/0DYzuoutwhLXBCMZ7uW5gWuv3M007XZdSXphPVInNK+A23uvviVBiVaHm5
	QjOgTj0/cGuG0FuSgKiYydygrwP2ECS6ZhRdfp6Mp8pG4xPx5FAxAQq4dwznGBksaRgcUKduSNB
	45xdjnrnvuKp5iFfnN60sTOvE049GTt48XN5J59f13JfynMzI9f5JbHWmeH9CA8PvcHiQP0yamW
	ddLxyNiqJRsQwVLgt9HEBPBR/zPgJxIbbpeEgMkQ7tMfWKEUEXW6x1dCiBk9oyuI6vanGJIESRA
	Dcw8vXZZQYle3nvJpbQvv9QLP65uK74E9kFGLM1IP1th8+7Bb5efbIQwbwNq+ByPVr+5Gp3DCMS
	xAdIKS0pPUhIHduaF+LRA3cyy3ofdAvUDSjU3vMuwMCWJTzA17obLBVPlchjhYIcbymaJUCGfKS
	GMBMu64xsu4+vy3B45ZsRkQNKsBNZ1RglPMjvE+ffy8DMBUsZoTP90aOdcFJDnRyJi02amewgZr
	WwisXEUwObgiA86ZrQIordW6e6TplfZmkBML5fK4/Uqya7bQJ/FdlBsIx4aWcvtA6pQ7s9+xVMp
	aBs5dAuxkA==
X-Received: by 2002:a05:6a21:3117:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cc377db1cemr3874600637.2.1786478489770;
        Tue, 11 Aug 2026 13:01:29 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:ceae:5da9:e5f2:ea74:b6c3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6791351sm2216447eec.23.2026.08.11.13.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 13:01:29 -0700 (PDT)
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
Subject: [PATCH v3 1/3] PCI: rzg3s: Disable refclk on probe failure
Date: Tue, 11 Aug 2026 21:00:11 +0100
Message-ID: <20260811200013.185956-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No change

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
2.43.0

