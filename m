Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77568437467
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112834; cv=none; b=gomqXunsckO8Y0NT5kE8WMLYp3TLId7JT9mSceKBR0gMJbZWk5G5mU6FbmBstRT04G3HnkDKYefE/2AI+PmBuV/ql/GDR2TQi8bCRx3WQBBMqGgRVrQclkfjN4OxLGdIghuz9aDa8NN8ZyVoh0U8EuGA6egwtEigFl626GFywEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112834; c=relaxed/simple;
	bh=3S5qph7Dbs0bVnLZ/OYGw+fpWW2QCv/r3QolJOpsAvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3aP5mP+Y/4WRf/LTWoWG5PcnKcnDVfCVVq9li1Ww+73MVu1+CSG2/plK2o/SZ33WoQVurF5d7eu8CnP3lnHNxvyuTZ7wm7hEAoyJ3ZXPTzHlW2cPDOhY+m3WlzdoNElTk4MVpNfOvV049aD4eZV1vI2x1Dn1BaLzxZ3ZYbVouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MqUzAVke; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MqUzAVke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=nSEZizGdBLNTtt
	g9AbeJSWiaf0UL2WLOMSKQancVurY=; b=MqUzAVkeW7bvneOYesCcOlSy4lx8Yu
	IFE/AKOhF4hT381eDKvjL5bvN3K+qtCf9q1cS1X1uskfP0g2RvybKQQW3tzBtjzV
	Gzecz5Odtei7iI1uOfe2ubAVtAUv2JtRd7oO5dGFLgsIwG24u3QvVQ/qP7hTt9Xn
	BdrnTFhGMmMjqB71Tfo0IQUCO5hapTy52bQoBpWQmvve2Rszc+feiDLrGzNN08G7
	Q4w/9Lg8a5jRajA7mewpf7BMitbsLBpCXgnDOLhc4CHFBqw172dEhW6fgBBbjaXz
	ESHJ7D1CZnnR7oALofJIje6SpcxmmiVzRONQtroYqSltwEqn9xJFtiLA==
Received: (qmail 654684 invoked from network); 15 Jul 2026 12:53:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2026 12:53:40 +0200
X-UD-Smtp-Session: l3s3148p1@AQLmIqRWJrMujntW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] ARM: dts: renesas: lager: corrections for the i2cexio0 bus
Date: Wed, 15 Jul 2026 12:53:06 +0200
Message-ID: <20260715105306.25147-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working with the i2c-gpio driver, I noted two shortcomings in the
description of the i2cexio0 bus of the Renesas Lager board. Here are the
fixes.


Wolfram Sang (2):
  ARM: dts: renesas: lager: specify correct connector for i2cexio0 bus
  ARM: dts: renesas: lager: use inclusive wording

 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.47.3

