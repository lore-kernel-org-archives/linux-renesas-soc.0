Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C948364022
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251466; cv=none; b=tDsLaXSmbM9JSFcYM11bKIl/dl3POUIpDCNhahPQRcZu4EUtO5IJbV39MyNQEGJPi9Gdrg70PK50liD7QYTE8socfEiNlczxSX64p+VQdZkbRFbySRVF3zsdhflUHfyf8rT4vjKlvQ3kpZrQRqNDqwSuf78WsXBjlymGTjxZwbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251466; c=relaxed/simple;
	bh=SD6udC50xqZVQxPXlHTu+aZ4viUT2akMMWggNWejb70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEi1GlrRFi6CK6B+wSUlq/xxWCWINFRy0Dryzz13zXz976Ju00JYn0W6zgENTrTuIszNWniLctapr2gwZoC3bjm1W00r9Thobg27lG5eUTjAj3aJhk2w+rB5a2XjDW3UtgAFexCvadgVLYzSEZrtRyT1Eea0T64FKUUb3qjJn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NSAjnw/R; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NSAjnw/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Xe30Lk+zeo5LYt
	5BDIEDOR0jr3l6SkDT59cNfjB+Tkc=; b=NSAjnw/RMqDmiDQRvIW1BHss34wUzi
	TDpaNkwdnLfFTbzwdFjGWBKpNTVD56CB+CgdDz9j8I9cH4XBhYejkuXx6D+IdnD6
	KbTepUQvuVfS+GpfQVe1rL/pAkz3iGzYWdK9HoxqfwKR89wqsGmMQ0+yrKGb14IY
	3fYBUaNls1/gYtBUkrXXHn8oD7vcxA3K9IY0NZMozF1ziXpDPX/jQ/Y+L8vHVZvF
	7Xo8pPO5/2k/ZPnE95M5AYWtFG+4aGyIu9LFBrYWxBAZ70alfsKSdCTQ77Rn2W8A
	/hp4RA1uoXjsBgqNEHyrC0S2L9Y0JhQx46ehC4sYQVZH12NQEOiHz+MA==
Received: (qmail 2443762 invoked from network); 12 Jun 2026 10:04:10 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2026 10:04:10 +0200
X-UD-Smtp-Session: l3s3148p1@WXr16wlUrKcujnsK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI and FRAM
Date: Fri, 12 Jun 2026 10:03:54 +0200
Message-ID: <20260612080354.57459-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are the patches to enable the SPI-FRAM with FIFO (no DMA yet, needs
more work) on the RZ/N1D Extension board.

Wolfram Sang (2):
  ARM: dts: renesas: r9a06g032: Describe SPI controllers
  ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM

 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 25 ++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 90 +++++++++++++++++++
 2 files changed, 115 insertions(+)

-- 
2.47.3

