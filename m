Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539471;
	b=OMzwPDBHs8mROOOU2E5LN3a3+wyAK28VDkLzdDbupjA0uKuXL9eDEivjZ0lrhCf0SLOG
	 ZSaH7fCnjDAG4YIfNcPJ5YsejzSFIQz3IT0LgKGm4r2O9KPF/Y0qZoRVS2jZ8f8hWrwDG
	 bHvhTgg6bz9mPgADhwBLLgZqB92tyAO2kiPr1BUJBztfynWESWdujCBwkypPrqoxYuPrl
	 VbZ08XFcNKEhDv44m3A6tEiM21YhoMzNeR557c8p+WTX/qskzPU9gEPgYuzmfF6+HEk0v
	 ttJlIqy1l9hyWf+aDbg2KFcGHUNT+xC9wO+55Kug7Qh+eW7R0tqb1HriewSCoFRFvhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
	b=5csl0hZQsQjvid90/wN20KEqDqodWtskB7REJavvYyL3cEpSl2mlE4sK9MarMH0IKESV
	 zpeRhpc6JZcX3o219Ru4B/nd4fSCvUNBq0CqEf8LFr6iLxEzs0succGzWSUu/uTqRqooz
	 h2063PEY/5jbAW1zw1o8EjTb5OOUcyEL6ZTk/gm4HIGn/JafCAY/mc8z5xTzNdB+lOUFw
	 +KIfjK08mrPrgkFvYmL4Q4fHrqBJ7B6yH1bbHd5572AL1U6c6V5wKGEmBxqObQoqibzvY
	 e3+a3hbGH7cHsd+7KVmWoCs/2PRPatKS9g3fXu9eOzKFLKFeX143M56uCw8N/EdQMVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEFO6fAb;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0188E606A33C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 16:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0188E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEFO6fAb
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so4512162f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539469; x=1796144269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
        b=sEFO6fAbA4G3XO6q+zujY7LGmdUMiGjT62QMyhVzKOD0je/nwpy3WYgt+iQYdYsL8N
         yH/UMA6ogU8mUzKeMIOoFBx3PDqTusT56wYU0ga1M27JeAor8knzizwnvA5EYOKU5x2+
         x6VZs5gBv6ri+DB/evcL/nIfdVU1zPeny4iyaR99YLFxeZ8SSZ92vT734Q9btQwSSNLI
         0HHnw4n+e917y80Rio68bL51iWoekuzKnQsIZTYVQsSMtedXJkkiDCXlpdR4mYQDyp4c
         8SV9nRPNrNpS8ZnSo7SiyZw9gyCOZGJRkfrZIPy2IwUm/h+eRS7JiUX1hZNFMtdQlPTh
         1NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539469; x=1796144269;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
        b=2Aq4WxiftPKcr6Vv/JQVVmqsjK8rVn5q2h82tToq1HjlDpEnjrsJ0wpV0lP8iDSK8U
         RGTxvM1LeymcFP10A0eLf8COghIDaSAjS8njpwnwJFfXgwzHE6cSfIZOE+O8PHuR+T0G
         ujZKGvCdNUYuiLCmyeY9U/ltLQ5y+/PaX5ShjDu2N9SItlUwhUVD20KrXnKnTMbnht/8
         FtVf00D6/w7cTXI5oiolX/afWKKrqE4W7++f21mM0LPLwpt1aSlzYXanVmwa9bSYmtKb
         XuKLkbz5B+KMladFJQiqH8xZ3kr+QdwU454O59JyQmT4wMwcljHdxfUtAXKkTEXapqGS
         FqOA==
X-Gm-Message-State: APuU4Z82TVfthcxmC6QkmKRfAM0Qimd/90wyUOlEgAot4Y7enotdAgKm
	iLWglnZ5CZFURsvhdoq+6gpGox7Gbi5dBYrnSR9wM8KCHwbkXHa9k/5p
X-Gm-Gg: AZFdTZdOiEji8jw4Hg3Blng+e0jPR5ZvvvbJpzeZkUEE1aFBYCWQNb3RNsWZPNqRIMC
	zbQ08HCZpT8pYc30veXZmgr69VXW3GvbWGprvKHMrtEXCqWfP7sQpYw0Q+Yn2bgty5uwcZtnZeu
	wbP5Cj7UEQwH7hU8lD908cTfarulom67SAgRegbbgQlDG09T/CHrTA/EfEx0EEFcEldkstBO91Q
	ogZS0JSgs0qAmBDHFmAFTS+lpyuQPqVsHYdDWtBiop4jUlam82N713MyfGcws56oJ2l6Dcbgtg5
	0Wbe355kVuqJiOSs8eBSatZbXkzH4TGt2sfjZ4D1USfaVMrudPhz+Kaq8Znjerhz23k18BShgFv
	7eUbydak4UQqse8jL6cTv/RsmCfeMSEl8smu1UMpyLY79TW1e2czY5tcTMe2jiESstfPGd8E3FR
	xBw5bMWLQT+mBvOQj7hob+dUCLhiH2Nrp0MvcmePJlZYDLuGPHayCeZ/WakS7I+LbX2lh4TiDDF
	IPJs2lPcYu4B2ImKm4L41vvKhtBDmIV/7JzZ5wIRI8QsXFlDvq3iVYoSH3kiysr/w+QQsfQbSrE
	5VgCrtyFVKFY4PQJfbnG6GFTsOgMDQ15TalSYEuy843Yno0RcP83vR06jfQqu/u1MQ==
X-Received: by 2002:a05:6000:27c9:10b0:4ab:6077:32a5 with SMTP id ffacd0b85a97d-4abb30b85e2mr22202041f8f.30.1795539469277;
        Tue, 24 Nov 2026 08:57:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm28794104f8f.20.2026.11.24.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:48 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Enable RZ/G3L SDHI
Date: Tue, 24 Nov 2026 16:57:46 +0000
Message-Id: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAArCBWsC/23MyQrCMBSF4Vcpd21KBju58j1EJMNte0HbkkhQS
 9/dtCtFl+fA988Q0BMGOGQzeIwUaBzSULsMbK+HDhm5tEFyWQohJAuup4t/derKkNvKmbayrXO
 QwOSxpccWO53T7incR//c2lGs799MFIwzqxU3kjelKNzRTLnHAYMOuR1vsLai/PBSfXmZvNFO6
 VIVdb1vfvyyLG/0I7y66QAAAA==
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539468; l=1532;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=iFo7sdHkGslQ1kSM+Y25akW9VwgPNIpJbKGmr8OYoYU=;
 b=6C7wS1kP5VKdYvjWxyVJ3aGWwaw55O51VZMSQjiPBj+3fuYpsPIuncCK+Ci0WVBKVfMdAaGOh
 Q37SBrL/oP+A4auyv51QBsShkRiLzriNRrpotmYuAGsNfSoMoiJhzzN
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v3:
- Fixed syntax error in sdhi1 #else branch.
- Added generic node name vqmmc-sd0-pvdd for GPIO regulator.
- Retained the tag as the change is trivial.
- Link to v2: https://lore.kernel.org/r/20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com

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
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 104 ++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 231 +++++++++++++++++++++
 3 files changed, 407 insertions(+), 1 deletion(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261112-sdhi_rzg3l-e0c7dbf7cfdd

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

