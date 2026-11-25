Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604747;
	b=kBJT7akjK6G0PK+CpQRKfSASu+Yyjv18qpPWnLizXyQgCAdRDFqthE7pfdLuP0/cRggT
	 wUIW0XXILdRYbmm9Z7kRo5udi0WHhmryME2GEdNyxXJM1uckDvEFcZHwCbD4at6Dm6HtS
	 5NTvGnCahTUTMogweiehZ1oYxe9ntL1JJJoOjPOQoNePwkCfpBYISACvRzjL1wiRkLbAP
	 zI4wH1jLSldxr3mrxKThYdAUPm0JnYKu19JTlglI/Jwpdbe1zIREHNoV1db/PkQrDKcMI
	 1/B7cLlDOuwlAEAg58UjSosGuGkVqZFCAatKNQw2bVHsxdMmop1XzjM6V4Kt1Ld8tNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
	b=bUGLivjK9ELglfQTX++anxDYJ9En8gm1g/HHInnpcqbXGjARsjQJ04j9S3u381ELHM4X
	 N22fogaac4CBr/5qshe+konO6jMqF7aP6Mzgut0Mc4XaxZjUedgqJOhmqZ4CDSl0a/S20
	 J07Qk7AwfmjrkufZepvI31xzjJSfMImjkvMVQh0Av1TUR/+pmpnfrmsS6JTSREKsp+muS
	 ltEQChoehWZpBXBdZ1WAI8C1IoM3EE8kjc75SoRNnou4Wl0FP+ms9ZlJcfDF4uMLxsLA6
	 lQg6z/nOIeNqAzhSCMvKLNVWRlDekYVPuZgNR9o7dYP2ZiJjZxe1QM9c/PwncxlcGuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D15XaFpv;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7CC606A33A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 11:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7CC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D15XaFpv
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so36482015e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604744; x=1796209544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
        b=D15XaFpvj6mJXEZ/XxMEq5qJWi7OtVz2OlvvM9hxJvWG2UVk7/p/hILZOySB5hHBnN
         Uieoz1bX37JH290ixjaD1fEBpdRP9bzpyc/QgdLvdxPIwWsg5pcKxvFxRmCUm+Iw53LF
         tfN5NX9VpW2T+uGUml039axpKqrst45Pw0se05jw1q7UEGRrkrdHo0avBA4LuScZUqCG
         wZ/nNryEUT/HgOdfxHRMtjEUjEUwttW+Tq1ft6Wm7QZ8+k33nv2XvHU+PIvvASQoHh1P
         7splO423sL/0HvAQxvgp+Mj5V3fO/KumA+6EJa5LdXQedr1Ye9OjoatPzQSfJkhMPCMk
         40Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604744; x=1796209544;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
        b=jRL+Cb1WNrBZX1VADKgzeuFgFC+Y4+FneSKWpmd0fONuS2YkrP0q2Ggg/z6SJ8wF6m
         IPb+O7HhcAjHMfwd8qBcZJdc1DqI6aoA+ATa1WWlDYQp1hiqfeeostiFgkGdXnivK5lA
         oIKUP21QWlKXDyzK1NBi3lLl7eEtmGlfo6VSgBY2CLEXgadkK6w33YgmRhsM8UF9jVeA
         ZaX/iXYuOcNDOfqBKjzMcwv4MtYNmQh8fPuFKo2U70V5jstOKA+wBVSmGuaiAahrlQYK
         vRJ5kPs4twJaCEV9cIZiO4A/BZWVXKpXrE/78FtSb+6dSNflwJ2t2Lfv5Tw6CuC+ekKl
         +UVQ==
X-Gm-Message-State: APuU4Z8yaQnzjzfQxdEOZR9uZPT0COzDdnIfN1YH0tNnEA6S40eTGx5t
	WoN0c7ZCGFOYAnlr4Bn6lSA1VloRuvfldNFuthd5QD9DuINfgEgld7aV
X-Gm-Gg: AZFdTZdVQ4vrRd+2XbTnr202ecM3XmACoHRnbtPcoA8nRYeBYOmIRoocKQ+9nhgylMa
	bCXDiqDZvffdmmLVCVRLXAdskt1Z3bZrk6lCATN72Nr451WdOeTbWDtKlkG1z/Wxhyrd0wXswGX
	JmxbSIZ4aJnD63IsMkJZOuG7appbaJFmECUiD3QG3ZtKTH5iILVpymIV9hqy6BhE2QVIg3cV6JJ
	lMZjL0ZiR8W3p2+5nGAEJ9+kOG+Nfxa4ucqiqBb9h/R68jAC5TpmhSTJ515Ew34ABD08j734S4a
	gFIQuydMZZVGPgxKtkc5tRqhRhOqCPA6jqXJB3ntjlv5EaqAkmuFtSKKGCKdWNGWo2JsPMDPwnP
	P06sWJ+Jo80H1QBlSSIAQN1meeJgAM2ZexV6BRyzL0FK4lDztCdvQVjUR9oUxDqZtEAyTLjYDcc
	z/VrJML0RAT+udZyuCxOQ8MBKgNSHVrixrF1cCtwAB/bPqC7Poxq8byJIY9vXdwjKp+x95AmTYr
	RS37NGvqvHIMkHTeZphxQnmreAKHUKN6gt/g/6lbmDZr9zB2O0SCfUbfrx4vjgCdjTB0bRoy3mJ
	LgpGttLJgOVo/RI4SEXWcHOJKdrGZsiug5CQTWuY3mdpvSkB/j68JcHL8cRVNhGI
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr338366475e9.9.1795604744528;
        Wed, 25 Nov 2026 03:05:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:44 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v9 0/4] Enable USB2.0 and TSU on RZ/G3L SMARC EVK
Date: Wed, 25 Nov 2026 11:05:41 +0000
Message-Id: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAAXBBmsC/23MSw6CMBSF4a2QO7akrUiKI/ZhiOnjAk2Ukl5tV
 NK9Wxk7/E9Ovg0Io0eCc7VBxOTJh6VEd6jAznqZkHlXGiSXrRC8YU8y1/iZjjcm2hFP1iqtpIP
 yXyOO/rVbl6H07OkR4nunk/qt/5SkGGfaCN7ZxjjBVW/WOuKCpKm24Q5DzvkLN8YweacAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=1502;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=26F0Gx6SkwUZ7Oiw0xv/NVjSYSUNBgnf2u1Ptjdfq1I=;
 b=PU/eeRLOBV8z8P/k4LIfDNeyIJdOHSL+KZFuDaXI6aRHtwChs7ypp18+Nu/TAu5+Yy3IyL4u3
 Md2YnKyM/xVCDm350K7G64Nn4lwBOs6wCCHBMDUhkvAUAZ3fZ1RQGLc
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi all,

This patch series aims to enable USB2.0 Host/Function and
TSU on RZ/G3L SMARC EVK.

This patch series is based on top of [1]
[1] https://lore.kernel.org/all/20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com/T/#t

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v9:
- Restored usb1_pins to fix over-current condition during boot.
- Link to v8: https://lore.kernel.org/r/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com

Changes in v8:
- Moved patches from [1] and [2]
- Replaced place holders.
- Updated commit header.
- Dropped redundant nodes from board dts as it is defined in common
  board dtsi
- Dropped usb1_pins.

[1] https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260925061617.127349-1-biju.das.jz@bp.renesas.com/

---
Biju Das (4):
      arm64: dts: renesas: r9a08g046: Enable TSU
      arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
      arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 193 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  49 +++---
 2 files changed, 217 insertions(+), 25 deletions(-)
---
base-commit: b086ce5618932e5ee2a0fd5fc759f70ba41ee1b9
change-id: 20261104-usb_rzg3l-16fe5cc8a82d

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

