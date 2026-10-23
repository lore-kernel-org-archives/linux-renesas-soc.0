Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778368;
	b=1NiaYAC7PvDeJsMczBM8yDl3u1YjC5d+zeCBRVmEDCKgcpeWbUW0An7VYrx/dX5+FiKM
	 FabIT1aCO0W9WIInvKxucViDiPO88gRjiMwxUnrLi5zvZFNm7Zm1V6XtxlW6pY06vi6S8
	 f7NaNfNIWf4LnyPhwW3fPL8L/UjPHxf5TIYQIy4Oo/AYlcQF7xypemxnNPzCgLPF1fATR
	 Fcx38Rh8lV2NHVJrYBKXJrIs1+Z6UlXPLPCWMg+yTkjcrs8YrWN/UmhWh2/fc1EGsoLzZ
	 TKmugcuXhhIFTGXwNvWi4p/zUmILedxjA/vOpICXSZN3tduawGS3wKCC3C24VLvjYXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
	b=U62pxo3b9umK3UbqMKnub0zB7e6fUz0dYLDeHgcdkC2wwSeXW6OQaBD5CwRqLyeGcawT
	 EcWVUQLEoEi3ynjux8bBE3b/KQaAOS7lpcClmKLCeoOCNDwLRfqX8lUtRsggLfzZB8nRC
	 pixgTk2lElAGaNrhLhKh0rxDsR4OV3KTKF/kBkXr+xAMT62Baw64gD+2vbFPkDUPuJaHv
	 gkNC45J/eZuD6aC2p84v85DSFIVS7l9zc1pfmJIfbDCELpFo2J7dWYQu+9nfpYMLjpPsl
	 K6D5dUjwTtzsb5GqSpxp2/8sEGV383I4QpMyzzGeURPTs4SUd6pZn6PCctUZFs5y4jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMPVSIPU;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E4606A325
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 17:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9E4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMPVSIPU
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b001cd92bso666834f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778366; x=1793383166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
        b=FMPVSIPUP4r2nJIpBzw+AnOH4syghw9n89Z8Gr3tcHyhYZgMPSW2wo/l9P2KmSJ6xE
         JWW0NRo8Cd/tIuttGp9/u6xE7Eg5agM3nbdUJg9/0sJnaA0r6MYoWRVrBBYtC4EG3Bny
         nhMSK4DUyGvJkJPZWKU+rkgxoGy5Wkh3FW1All8qDORLYNHrFMq+ixmvOR0XjB3fuzWg
         UGvy3wPcZdItGmCc9upmVxpWcNNdbPdThBM/QOQUbsq8JhbkUQhKlyqxhh0DbCL5IFu8
         OK3QcDAmweCwbP5xQOoi2yZwNAnRClPpbrAXkmHWqPOGmvQJVb/J9RVmF4KhqIqrCP/j
         meEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778366; x=1793383166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpKChd7cX2IKr3NLYeu19b4piYqsJmCK1pOKyiliy74=;
        b=sWi5K1PnLUwtGlnURI8PponQ//NoLd3RzW6LXbD9Z94ib3lXYLAH4XxVgd3d8mog35
         7CwdhYOgymslBRAvU43tjY+M2K7kpya7HPn/dmojvCuTERfZMJJLHpm93Kh3HiYzEdly
         1Mcsgv07zyQAubx+5l5eRni1c5Jh8U2n42UPam/t/usLqltijzohaXr/CcbbotODtFvT
         qVDHwgktytopjHFTQfseJdWyOjycFLNeAN3A3YlCW4n2OE0XRga6FJ+tdWbIPAXb5ycw
         taSaCvqohDAqSkJo8ZKGtCCzV6dDXFjb9Ejik5FjpkmZOjKHG4eO6lIj3MBqzxpNLn8Q
         868g==
X-Forwarded-Encrypted: i=1; AKwUvBx9HKU/gw/gqGvuzCWZHyTcLqbrkchLfku5j7wzN5bm4V+YawbYzeLiavIkC9wjZaa6rJ+ofGdBAiZR6XiF7OLb5A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJuAgQ7cGPfLJ6Egf3nWdNC1vcCYR4b24UEFL0m5KDxfrDvjWdN
	UoJvIIUYEO5oYHwJDMAvGeAeGyHBVak+TQb/V+e5xQcRfQ4f3MDsjIHX
X-Gm-Gg: AYBFou2FcBy2Uuj1dKRqHct66qi+SooI0ddb8oGI3B9WWnC/PVyXDL3YyVuUUQX8RDR
	4PD25Gp+kr8ArdykDgCfGP7aWv/WMdX9f6qMpAsJvk0TCvHzfAjaPKOR5SZQmmhLiS6+wdXpxkT
	ipXQUWt/RhMroNSL/qmktIEJhyE6Xe7TlIexvQ564sXOKOqwp88Kg/UPeZmcAyMpqT8iIaiexIf
	5rJJqzFK/CMFkpRxjVHzKOHDh9NgBLPsWBflKe9lG4hPohm+Qks0oIawFgB/MCBkmKqxqXJe68P
	UxKWOWxOlaIQRD6zYFLc9r/VLCeoPWWY0gQ4F6ncjXBSsiEEO154v2v8oQUljwKbojjZnucRGAE
	qdOzfHSzj5VY7aKDOLm4dKgGoazMGhp1t5GiPldFvihHKfd7UntTDIL9VzoR6VtV7YLxQV7hNFg
	AVasZHvruIQrEGnbAI4Z9Mb4Nra37gfxvCuZQw8t6TSLpUQxAcBdmR/IV4xIdq3Ehvzkq9z5QZQ
	lUTD5iGC2VFvAPuzmYecabCcSNm+SchMq/6+eHfab6/khwMA8CCDaEht39voEzl6En4HaatQ9gL
	vgt7gLnOFduRJMep1katdiog+OdTbibKjZztmSX/e9nXgT7UAC3z97ifqdgIdxbjGxzumJyRnws
	J5Mz6GourBU2RR1c2kR/rjOLq/3WLjFsDFPv8+DLDhF2o
X-Received: by 2002:a05:6000:46c8:b0:488:8384:c382 with SMTP id ffacd0b85a97d-48e385a2ca8mr3518753f8f.49.1792778365736;
        Fri, 23 Oct 2026 10:59:25 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/8] Add ADC driver support for RZ/V2H(P) and RZ/V2N SoCs
Date: Fri, 23 Oct 2026 18:59:11 +0100
Message-ID: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series aims to add ADC support for the RZ/V2H(P) and RZ/V2N
SoCs. The ADC IP on these SoCs is similar to the one found on the RZ/T2H
SoC but varies slightly in terms of available channels and configuration
options.

v2->v3:
- Added Ack from Conor for the DT binding patch
- Avoided splitting up the ndelay calculation into multiple lines
  in patch#2
- rzt2h_adc_pm_runtime_suspend() now checks the return value of
  reset_control_assert() and returns if non-zero. This is to
  avoid churn in future patch.
- In rzt2h_adc_write_scale() used multiplication() operation
  for comparison by dropping the div_u64_rem in patch #8

v1->v2:
- Dropped using DIV_ROUND_UP_ULL to DIV_ROUND_UP
- Included time64.h
- Returned -ENODATA in case device_get_match_data() returns NULL
- Renamed RZT2H_ADC_VREF_MV to RZT2H_ADC_VREF_mV
- Updated Kconfig description
- Included array_size.h
- Dropped unnecessary extra line in rzt2h_adc_write_scale

v2: https://lore.kernel.org/all/20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (8):
  dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N
    support
  iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
  iio: adc: rzt2h: Add chip-specific configuration
  iio: adc: rzt2h: Add optional reset support
  iio: adc: rzt2h: Prepare for SoCs without sample state registers
  iio: adc: rzt2h: Prepare for SoCs with different ADC info
  iio: adc: rzt2h: Use scan type for ADC scale
  iio: adc: rzt2h: Add support for RZ/V2H(P) SoC

 .../iio/adc/renesas,r9a09g077-adc.yaml        |  38 +-
 drivers/iio/adc/Kconfig                       |  10 +-
 drivers/iio/adc/rzt2h_adc.c                   | 327 ++++++++++++++++--
 3 files changed, 346 insertions(+), 29 deletions(-)

-- 
2.55.0

