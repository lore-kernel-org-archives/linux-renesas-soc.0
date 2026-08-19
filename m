Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6787415B72
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 19:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166816; cv=none; b=qxtyLjBDm6QFQp8aiNnP+/yD5EpdjILxGJYeMIGxBhbiYcgLD5ojV5oCS5YPEAJLgsF0Gez/Rzp6IvL8eGOWaWLSYMNi3byiHOVknFhyA7grhKrt4KrXSm+owQnyJprfuVIZr/Qv8+kOIiO+lZ3wBVnVxARkb5BPtEh6nG2zMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166816; c=relaxed/simple;
	bh=wYad11hA3mnk2VgyJfhQxyQ2a9j5WMlBNGeJ1xdfi/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cz1kIkIPd7rhLux01FLSZn2pnTR1z73kMMbJK/X5eCFf5lWJngFIGv8F6Wb1fe9QVJptPZmmbgSa0a01JiK0RZbWF18//boQppVf+JivrSeSeFtzbWt8asaqhNU6TDTFzN6Jlg40Y5JleNN88FdaBUIs8Qevc9aTReZTtn5V80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V418U5fO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V418U5fO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so863133f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 12:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787166810; x=1787771610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VtCkrUfMEjJubGDHG6KI/oRc3p1JRjRbau9vzxQEAA=;
        b=V418U5fOqa7uQtYMs++KzdUXclo9l71l/HuQGFumH/z9mecLgTqor24y9AHyRwlsdX
         EnRFZZbpgVph9JgzEckHZ4+r/G8RriF2CPzV1TryD7WNsTVDDeAzW2DbbCq/t5TQwTCE
         zd8fiDeI15pD+knzAWc/5goR2MvXXtpddUSrCQJcXHgO1BC7Hhf5vYEDgvEqiOjoCz2q
         dOx5Rtlc1U1f+cWE/LOp9D2B0gIaGOdmLGfqAF6rtRGK0PAx0h6lSUYTpM0/3qq716Vm
         JDxYVYuTrIjtLnLNQ6cY8AMHPP8fCnKmI3vw2jSaz+fBbik6EdmXS6q6ruxgNu01KoCe
         jDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787166810; x=1787771610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VtCkrUfMEjJubGDHG6KI/oRc3p1JRjRbau9vzxQEAA=;
        b=oM/CpFOcrMrEKzklNgJQZXQSy04Gw4ffNB9Dqv0yYQ83ibWjxGAyrewKmZldjh+cPB
         C4ZO1+lgdai7sJ7OHK7njuI8BWKa3nSm8ukBN5T2DTVd5SxlM3qhE7q61j79MWGI43Jq
         SPIbcby1BRx4FUBXPCi2ZbTSunkWhTK3yAK23tajY3dGNMH98Y8lxnVN5otJvzGzTkR9
         KiDWGXLDv+Qe6poa/MO42vZOsa8AkA3AvX6mxNtVtsU/Bi3YQCsFBNg4NwxBf1IkK7X2
         xiGVb1awDLO57NBvE9qgqjicaLVh3qBSlrGk4TADUi8bKwDREdt7gySafWhYDhayR/d4
         jl+w==
X-Forwarded-Encrypted: i=1; AHgh+RoQk6QxqKBO1iGqrSH1O97U1ZMIVLBVXjbeefYQ0saTPVuCl66a84N3ZykWl7vKQ0Z9YwSLe0Ft081THMc+txbR7g==@vger.kernel.org
X-Gm-Message-State: AFuF++lZiX7FtKyR941NKm3obXBQnKCy2tSm4cZVN3NMFWLvzz3IkOxD
	yX03muDIhD9NxWAJw+7yJw5varG4X1ei78lKKCr+EcphV7CYO7ISqKFP
X-Gm-Gg: AR+sD12uK4PgRX8Nlc4uci2dyqdgYswFMfa4+pdY3lijYca2MWMggW2jS5DVY3XGvoI
	okaMH4R22YYCsxoJDwjBxwz0hCnTjW581cGbDlCAGesi9WyUVwqkwoDUZrK+T2GqQo+eGLOQowQ
	lp267NWsShz75z2837LbkeGkOcrTrBOyn+YN4oUdYMqorXy72zaxdPqTwaBWhsY65CQ2TpM+ooX
	Z7ut5Hp174jYubYo2bNLDn8kdwJTQ3gz+eSHxrhxo+wT9iyv5z56o9CWprlc7lcMyZxladlzUrL
	lE7WzWEnNYpBPUQJq4RtckSePd2I7yTn/A1gQczsDG7Ztw+tn3hEQ9zFEzf5kitSlM6d79/06wr
	oUi+HspZ6xX0L6UbiNa5mUrPE7txUfTf1pI9B2mvGoUmx1aVyMVd4HUonuqsSwmrRfk8Dzf7g2p
	4ZKzPdrMAVPdpWFK+p83/kLCxNKUNaMs3hv1Y9cdXlGH3iGoC//jq1IMJsv+5x3X/TxQ9L
X-Received: by 2002:a05:6000:4283:b0:482:a909:53d3 with SMTP id ffacd0b85a97d-482b1e877a0mr11578952f8f.2.1787166809988;
        Wed, 19 Aug 2026 12:13:29 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:c7e0:8c9b:65f0:4aef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c338dsm6153398f8f.25.2026.08.19.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 12:13:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/4] power: sequencing: Fix build issue with COMPILE_TEST
Date: Wed, 19 Aug 2026 20:13:19 +0100
Message-ID: <20260819191325.217809-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819191325.217809-1-biju.das.jz@bp.renesas.com>
References: <20260819191325.217809-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The POWER_SEQUENCING_TH1520_GPU driver depends on
(ARCH_THEAD && AUXILIARY_BUS) || COMPILE_TEST. This means when
COMPILE_TEST=y and ARCH_THEAD is not set, the driver can still be
built even though it requires AUXILIARY_BUS, which may not be
selected in that configuration, leading to a build failure.

Fix this by dropping AUXILIARY_BUS from the dependency and instead
selecting it directly, so the dependency is satisfied regardless of
whether COMPILE_TEST or ARCH_THEAD is enabled.

Fixes: 1a7312b93ab0 ("power: sequencing: extend build coverage with COMPILE_TEST=y")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * New patch.
---
 drivers/power/sequencing/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..226c62704d9b 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -29,7 +29,8 @@ config POWER_SEQUENCING_QCOM_WCN
 
 config POWER_SEQUENCING_TH1520_GPU
 	tristate "T-HEAD TH1520 GPU power sequencing driver"
-	depends on (ARCH_THEAD && AUXILIARY_BUS) || COMPILE_TEST
+	depends on ARCH_THEAD || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Say Y here to enable the power sequencing driver for the TH1520 SoC
 	  GPU. This driver handles the complex clock and reset sequence
-- 
2.43.0

