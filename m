Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EE39C65E;
	Thu, 26 Mar 2026 04:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499070; cv=none; b=WCReeRPjAMKAl/37LM228vqJ2KohdrfBBAbzEEwDFOzsVfhjCV6kfce56ENmrb2+q3KKeSYCmTaVy1SxnUj1AtMBRGws/6/bBcYvGwAh6rtbGRcOAKC5dNdd8+lmlNMpplc+pL/rmkGC8da/jhwvgIUtmVz7fHl70qeIIoH/Jes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499070; c=relaxed/simple;
	bh=DGWyxXbPPWiLLfcVQQfKkl6CPKrzGRc9g16RlRCSZGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DssAakLD4ab7xIeRFS+xBIM+5JsWaE2fmMsZfxj/xGzjmye0w8Mkem/mizCWxuMs+Amy1rZyXbAYqtj3ZYCcdvTNsSuNfKJdyDrZEpVHeMBNPpQBpfPEiK051GWl9oiZIekS2x1jrixQE2OIjlYZ6SSMITtyM20ph2iQbx7guBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qHki3Pv8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=D7rTkzRD; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qHki3Pv8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="D7rTkzRD"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fh9dw3n6fz9tq0;
	Thu, 26 Mar 2026 05:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4sc9eF22ynlpvOhGIdmpxFtevzPA+moa6iK6YW8bAPE=;
	b=qHki3Pv8BitXtg7NUbAmF90IP1hF7YVm5J4G/SeiqP2zTiSAuMK3V4UkzID2KnJP3pgLNu
	+drSb80MU98RLKFFRvfpHx1rcEYTlhK7tMLgGhWtgvktpBInAA3fvNA6IYuAkyq0jlsKl2
	uWG88Gtk/8ll2yLTFdc+R/rnKeCc8vVhvhoWy6q3NxGbNQJfzw4tFV2gAEhW/KHWDomOPw
	29t7vBlnPuC/qOqcGX0jaPY9qnhtH+b8U+TQDwEGssqVdWCazzjPVpUkcqzN09KTv4te0F
	pX3FnqMSwBRCBIn/FEVJ7LQqQeu8ERLEasn5Q6bTZWbKSZ9cJNvAaF2eOjy8Zg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=D7rTkzRD;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4sc9eF22ynlpvOhGIdmpxFtevzPA+moa6iK6YW8bAPE=;
	b=D7rTkzRDL+xaid+ZggyHD4wM3GPbaN2RtcQyoyDLM+TUVFVTrlIob9s24gmSVHpMJXRam0
	zHVx22p2whbhMr79eyYRM6Z+rofMIsVtY61+ao2H15jauK6CihpgheabzbRfhVX6CysZdk
	H81S2AgnEAMNw+p2tIgNWZKP/N3HGAlY3i+0fZzTbHsZJiusDbtINZ5yRSLxWvNFJBS63T
	0Pwss1nfbzqzav+zKCcknm5Mf/D4jjyOvsKbLkHqvAGEkBaOOVHSRLm9b0gQ5bLXC9mM7O
	AH9s2JsPHx21VDzgwATOZSjDgKVbqR9JMdsbRo7jhMhJ3TibDQizHNdS4qOzzQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
Date: Thu, 26 Mar 2026 05:23:57 +0100
Message-ID: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5w3gzjnq9qnautburomud1kmpaim1pqx
X-MBO-RS-ID: 1ab4610f542420e0b76
X-Rspamd-Queue-Id: 4fh9dw3n6fz9tq0

Add missing cells and reg DT property into DTOs to fix warnings like this:

"
arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
"

Marek Vasut (4):
  arm64: dts: renesas: Fix missing cells and reg in Draak/Ebisu panel
    DTO
  arm64: dts: renesas: Fix missing cells and reg in Salvator-X panel DTO
  arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into CSI2
    subnode
  arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into DU
    subnode

 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso | 5 +++++
 arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi     | 5 +++++
 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi         | 5 +++++
 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso    | 5 +++++
 4 files changed, 20 insertions(+)

Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0

