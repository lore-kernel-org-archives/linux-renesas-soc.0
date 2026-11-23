Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442281;
	b=Cz5L5kGTEz+dATxTMuXUe0ZNMTAiVFHwiP6UrdkFNZ9V7bbUmek3FMlbTZ4+KxmziBPI
	 jdSAO9xioPCpQCbmUxUUtFkFTzm3PujSGpKKU9xS2Kc/2MlIRjmWQQOsNXuW93fpkCVw8
	 l0POdobTmvfIl4N/d65Gv1OwXoWGgjZFmEif+vnPJIOlgfy4O9oELUlxgGjIeUQlMVk0P
	 pCgFOdWKw72CjB1uFTA57MWBnJikSdCefgxEcehqVcTRjv8TxpI00U7zODqBcad59xypf
	 ZzquSdqmBMGZmCtXBN79Guan0Xz7kVzEL0iD6bCKeeyA1soWkLmOGGfdkYI6U+SLNfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
	b=l3PBPtNu68Pws2G/42uqYtKEG/oFj75jk2hmo/iskOlD03r/g6Q0fwqAsZQelk0EZk/B
	 RWjfxpiOmRqKethra/j//YOSjWJBX7sylWP05lhmpHiPLTKpYNUnzi9YM/UMpI3pJywK3
	 6qX6KOiMkoAEOboGT1NvS56zmqtlBVYlFwSleplVYhKj3e026boMwD/UI7OjEn7PPCd/5
	 hHYYlZ4bAHdNrlyf6HqcQv1ZDoTtl5p81iaIAU/OeqT07mO5OuIYhNfvG7MRCSDusN2Si
	 5PUBVF8u6ytP4AQACuSalO6r2XdV/rpw20hbeSzp1MtxWyZXU+qFS7eiJXWXSTHa3nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzN7U8sT;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A8606A680
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA5A8606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzN7U8sT
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2706472f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 05:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442278; x=1796047078; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
        b=wzN7U8sTKBWE0hnIdo4hSl5mB94unptq0osmgd7FUp1WlhAnKCMGAXL3l86ygWmb7V
         s/rQje57Vpi+05Ehs0Hc4IGwxho5PZ/5DOv16r/NCYuszsLV2pLx62EXeArjLORct3YL
         o63K5hYqGANmph5kBH99+P1hCQ+WsV0QnIUdc/fbLZptPdgXuiF+VSK6iP7qpIBHLYt1
         N8oXIv9CrsKz1vAPo0o5KU2KLytiauPMqliW8QMtnFR9RXo3oL5cEWPZuknt38kAUWNP
         /Z2zfQZi7y9XRtAJcICkVggmfN+A/Iqfv8LdLOQ0Dkl5qZMvxz7uIo2/ILhZdR13rigj
         zQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442278; x=1796047078;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
        b=W8uu2qcSRVJ7hfmi0c4FquRpGxxLCiRArwE/UOpM0M5pfrMJ3BidOMxUGa3dLLj2BL
         /deaK//Y+AQo3VyFWulSl8F16HpDPQadQIeWV1nGRReRpGC3EG5TSKNv+LerugK4f91p
         J5qT9Hhyj8JJRoO+H7aghMqI2Q8tPrONxbuUkZSfFH7QBiBJVJqbKtMJDJ3m/e5Kkvs8
         kspKPt02xHGCmQnrvXvGGlG1cBgRt+q1UORfVAp6LYGr7ricdzKRwfSD8us28QnWkLgN
         ZE+1q64Ocf0NZie6P8E6Dpil1LjwPhHTEM5ScE9Bn2z4XCwhfad+IMY4t7SMI9yJMe9T
         w8Lg==
X-Gm-Message-State: APuU4Z9Y1poFqQ6CpiFi/5hBDD1i/l5hYDV542EHqKwXJcqy6xHlbKdB
	BznAxxWNa4ZHJXB2qgB056O2kvizHPAPU7IpKzoYWG/jYJ5blXYZxwAc
X-Gm-Gg: AZFdTZeJzxS0MIcz6EQkS9x4GYmq7BUiFjzRUOkBKap4e3V5THiWChQYvIhYQ+sPRq1
	DFY8KeVZEVHyR/g4AJZp2iFuoviEbVB94IduTgqerfsMT7/PV0KSn0Nlk3LPIHCRZL/Rjkz5Alr
	mrw6GTiArk/X9s07/NCN/ntio31T8Qo8VnQUrLZd+e8ihHsevHbKsr5r9hsKWNn5Bqvio5j462U
	akVeOgA+rBVGRb6KGFEBzp67Z2wLutalZoLvZyF6XunklHmtxaLM7CyjQbbl5IbnVVMNP0Y8166
	Ess1/tG+7rr4OZVS4cUt6m4/x9B/iD7zvWcdRkc8lFDjtI/3V+6p13UXVzOVQosSSgd91qA5uo7
	c/t1luG504n8Nn3Zu0gXBnt83a+Chf58Gju8KWMgPdCXa0fX7LFMIr1eRUXmo1/UKRnqJ9s8gB9
	ov1cknJxQkGhtT5WJi1sFCkGI1UaVfChS6JNgG1zN6Y+5+TTcabEzhf+3TadZ1vvQcCtzVycGcE
	GbFHgKBtdcZITRoYn6kWKoEAcHXtUwNRuREpIFIPv6DsNkasMa9OjieavIZCaIV9O5XTFXjWAQ9
	Dg2W1xMiKa6SLsSzHibxV2ucAvxiAi8viXXSl7pYV1XvGm+Z+506coCv6opKOsRbFQ==
X-Received: by 2002:a5d:5d10:0:b0:4a7:f82a:7f6d with SMTP id ffacd0b85a97d-4abaa9769demr24794089f8f.6.1795442278093;
        Mon, 23 Nov 2026 05:57:58 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d6f4:1401:6558:1dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm22109308f8f.36.2026.11.23.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:57:57 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] Enable RZ/G3L SDHI
Date: Mon, 23 Nov 2026 13:57:52 +0000
Message-Id: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBGBGsC/23MywrCMBCF4VcpszYlSbFFV76HFMll0gxoWzIS1
 JJ3N3bt8j9wvg0YEyHDudkgYSamZa6hDw24aOYJBfnaoKXulVJasI90S5+puwuUbvA2DC54D/W
 wJgz02rHrWDsSP5f03u2sfutfJishhTOdtFqeenX0F7u2CWdkw61bHjCWUr6C+u8sqQAAAA==
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442277; l=1266;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=nfHK27eamabda+l4/yT+G4It55FfV4xdF374TgHVIUY=;
 b=jF4MLo3rk6NOxho8MwZU8an6T6CD2cpRrIil80n/V1/95q9+MXJEWUH3U9O375bYUx7mDdjCa
 onZ4gKACfplDkOhk+Q1Hx7o57ZOt1V2HaE+d3yv/6W7VRWvHy08GO0p
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
- Disabled sdhi1 when RZ_BOOT_MODE3 is 0, so its pinctrl and regulators
  are not left enabled.
- Fixed the typo RZG2L_PORT_PINMUX -> RZG3L_PORT_PINMUX.
- Added a comment about the SD power signal.
- Collected tags.
- Link to v1: https://lore.kernel.org/r/20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com

---
Biju Das (3):
      arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
      arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
      arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  73 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 102 +++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 231 +++++++++++++++++++++
 3 files changed, 405 insertions(+), 1 deletion(-)
---
base-commit: f5494a6f6d818ca30f70063a573eec8c982ad747
change-id: 20261112-sdhi_rzg3l-e0c7dbf7cfdd

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

