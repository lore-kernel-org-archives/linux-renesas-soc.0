Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDEB13D2A9;
	Mon, 26 Aug 2024 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724663297; cv=none; b=V/Ya7FPDRnTGvBgFWcrGOUgusFbDganj+0DQ/62xM9ORCGqWvZLTeoOwJOUMU1Odb2XuLfzYxoKtTGNcNeclJAJtjiwS1sV43uMMAb0fiPf0x/el2PXK5/kqfL3oLMRyLK+riFIevjumChThN/cjtjO8FplsSKvgSiDm5Q+B8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724663297; c=relaxed/simple;
	bh=X7+8nQb9lzLAHMjE1y9inzs2gvbg55BORjmxSbaxA1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEOPywjyJjI2Z0+vS09zBq/nEmmAAX3CSpOuFzsOcaPxWlnG9fXFXf4Xf9fXuqAgYYjYQeJbbjb6g/NDgsJWwTgXqr5yBNFV7w9vXlbhc66aR2Md+HW3IcBhjJpCjYurs/i965PYFkh8J/7x224kKXEm4e5qcu1gacC4ogNLV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,177,1719846000"; 
   d="scan'208";a="216583869"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2024 18:08:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.68])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7A9534007554;
	Mon, 26 Aug 2024 18:08:05 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Add HDMI Audio support
Date: Mon, 26 Aug 2024 10:07:58 +0100
Message-ID: <20240826090803.56176-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to add HDMI audio support for RZ/{G2L,G2LC,V2L}
SMARC EVKs.

v1->v2:
 * Dropped SSI1 RXD pin as it is not connected on carrier board
 * Dropped deleting ssi0 port when SW_I2S0_I2S1==0 as it enables only
   when SW_I2S0_I2S1==1.

Biju Das (2):
  arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
  arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio

 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  3 ++
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  |  6 ++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 30 +++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 33 +++++++++++++++++++
 4 files changed, 72 insertions(+)

-- 
2.43.0

