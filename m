Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B6C225413
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195996; cv=none; b=XYMToWUnP71EqKmMxwvidtKJgkBEoxTZy+qOLHS6kxb7fbeZ9e306k+sL2JlnSENuo92TkW7BJpeHFC7ShAuPmtB3jsls+kX3m6fZBwPQUmJFd8FVdlgKNFUpIjtxlNwtB1Jq9/Uxdh1hFjdCGL9KVwB9blg8zJNN9dmVSenUrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195996; c=relaxed/simple;
	bh=xCdgc+qgL6scQ3DyiMWCi7ovZIEJkyyw8qu4HaZ1TTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rPORB9tkCJI3nuvMGXKcoIuvnLF1xaDyNszSlBnPALtVnhjcgx1v9YCVpGTX2UGXHXknsKjQo1+T2DQ93y/XioIN/BfLfZzx+3fYrZoD3v8u2/YVWo1F9qrKhlFNCadJaoNZI5B5I87+0vmKAn7FFOx8tDlf/n0DWHABQdELmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fPFvOtN/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fPFvOtN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=yMQ5gQkRA8qCwc
	xTaSA6PNHIj5d5PHHQcK5YZ7OqxqE=; b=fPFvOtN/tPV+r/EYyLOb6UGBt9h90V
	14nxDT43I7VVmOxsfjcYGtGYaJvI09ki9mYAPebkpWRDxtqdodSVEOZO9u7HaqmO
	LUVZyDRL6w0si8bgvegJycdSLxynvTYOEJcqz/JPwyF/SGGFMNZ4OST3dnO0RiAi
	CXEXTsWq2ghGyFg9XmlC1hGrxjUCvEPMxe6DO76D3rnxoL265/eiYyPrNCocbgzV
	haZIZWyVc9fqYil1yeK50RKVRsdc30K1IqxPIlw+f9LsJ5v5Ix9CQ6v+Kq+p85P3
	Do2DqajFXR6XerTUNl4Ll3P9vu3QYHjLAUhVV5yhZR4PU/861SPE1JWQ==
Received: (qmail 1006296 invoked from network); 16 Jul 2026 11:59:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2026 11:59:45 +0200
X-UD-Smtp-Session: l3s3148p1@R6/rf7dWWrgujntt
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] ARM: dts: renesas: r9a06g032-rzn1d400: GPIO updates
Date: Thu, 16 Jul 2026 11:59:35 +0200
Message-ID: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While adding support for the GPIOs on CN12, I found a small cleanup
first. Here is the series.


Wolfram Sang (2):
  ARM: dts: renesas: r9a06g032-rzn1d400: don't enable gpiochips which
    are always on
  ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs on CN12

 .../boot/dts/renesas/r9a06g032-rzn1d400-db.dts   |  1 -
 .../boot/dts/renesas/r9a06g032-rzn1d400-eb.dts   | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.47.3

