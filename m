Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680722;
	b=bII6J19I1ZuMxgs7eBYHGfpPAjBGw6V/Ri5MT588oQnOOMZz0IYT/H5yP16v6wEiORSO
	 1Mok5rfwQcztjRS08lXDyjP8y3caQOCWOr7eQiaGOUoY0++loCMAsyWKC/KTRyYuf9zix
	 1zL+diC5wfNaj317Q+G25DLJ+FbVvXn+VP5zcFF9k1cYQjv6VSMw8nOcHzTTRo/nPB9mu
	 nZdNVAZOCVuJd7UAUE+CHHetSeWwDUww0A8WutPIUPN4V1wWJLKuy1bn2n2o+FJMIeyKl
	 T6ZBq8Qjq72NloqD/G0tTW3+7K+hZyv0s7ks5d5E3RArSZKYYO0OAnNbF+h5FGLY1Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LIceXVfgUW/+K3E1yyCM/bErBx0QHF8gu29sHeG+Asc=;
	b=wMTlbJ3tpwAfXuYhJsBFm1DhRmuMwLau8Kdv+nJ2utdljx0NRiYHZsgthVcqh1VL52o2
	 12S/QTt1cQ0hMb5aRwcqZ9LAotbXrnjFS3vY9/UsPrNS7seaCSak1CN3z2wTzdYHjjFGn
	 w7KLuO/8l4YJKB8OWeM/JuW++uQ3tfi7xh9te9KuIE6qY10nsz43uLR637vkX7iqwvZro
	 bJvRM6hB5OOXXid7iY6HN8p1g7aBF9JrxTJy2i6FekILmXRnNzVQaJNahMR2fqu5DeM6s
	 z/+f8lBvGYnRDpMFBO6sMgYmMLhWNmzV1tr34Ci5+JrV8td9ZvRvT7aQ3UQZf3gQ2NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BbdbSX7w;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF9606A335
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 08:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0CF9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BbdbSX7w
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so3846683a91.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 00:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795680721; x=1796285521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIceXVfgUW/+K3E1yyCM/bErBx0QHF8gu29sHeG+Asc=;
        b=BbdbSX7wwOQQL4prnHw0pE68+2q09ukaAXLRXVlrVhcC2deoQ3y8C8Y1C7zm4PYR/A
         Mr9vkicwYcpS/g2rcx4VkXLPC7CDXJGmahGx+LbrO4BTgZv/G0tZrQfQCgH5eKjf5xN7
         GXqhP4Fn7Ay1WVekMz2wMJdONbsI3Mw7YLYPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680721; x=1796285521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIceXVfgUW/+K3E1yyCM/bErBx0QHF8gu29sHeG+Asc=;
        b=aOl8pYEz78TRdeRyPPNqpXOeRQe7ODAAa91qsQYk6bwh6y9vtW4LWqIsFseBWOkqzw
         eqtadt+YxroeQxBW8XxWa+Y8P4Vuhv4V8QjS7f+XcihDxxzhoDh6gMhrJDkyKbtFXiK8
         PtAtIS3ipEdHYIZL0fEIpyvOW7ncsUI4x69YcePkq4d6gdvsPSm1IxzSTcaKu2KhcDKR
         CM2rmQvEM2s7IXN/VV7wlx44GXidmJggcmXf99AaQ9rFYXdOtheS/fTe+zC+tJASupuy
         XKzk+aJOG3BTFapwltG+/npGCt3oFZRMcWACgFVSMDeGHlgltpJ293F7T7fxAzXQY1xy
         Ovyg==
X-Forwarded-Encrypted: i=1; AL+hErEsBAqPafKmVrn1COPQfYCnzAQ5gMWi5IDaX5YiE7uqVk8Xg4SYtnY0NqEN4ulR63r/ikHRpRnu0SzDBmoDqmMcxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ubaxSAgt15CETxx+b4IqPw9QnIIS2MsIAFLYsbJdrDwyRbJKl
	qpFsRB03r6PCabiDs/gQk+FpkMzd2INZ52VtAMOwCcL8oFtGCQTWBYy6rla7Q0QIkA==
X-Gm-Gg: AZFdTZcvCvo7Hq0eqmrBzkEGNZkOT+emvIGRz/m2+peSuwtjRtRlxtVRLdzn8qPalHr
	cirqfRhbF68Fof1JhyT7kqcITuMOPJV58mzbeITeEcrOyJKGbr5DHaTRMtYoVIy2k2LXlsCbuC1
	AFw8Mo4chUwFQRtOXu0e9O1rnEyhY5OaAt+Lxc60hI9LUUMHoAotmcudzjdv71Dc1Cdgqj+k4wn
	dXX47GJ+g9PEjQJUY5j2+mb4Fljjkrm3szgl4uCqOXeCKUwRBOIWE/NGZ0n8UgzSs0ya/bY7ACd
	z7Xxg9XswmMVNAqIe1OV5+5ow5HaiQHH2ZTW/RrXM8xRgjhe760Dgal2RBvldwVX8392NShGANk
	0jiZrrSniyIdEywamVfXN5CcZlBGsj9PWks1ORoOBI4Y1r8yiD249bEPrxGo2cNoK1wa5fKaPND
	qtF4p1Qquj48wFrTbkdGso7Y9BISfxHnoqcaaVjKoU73ZZFIVbEtiaMg3sm0rRkyBUUnQU2C8Np
	LDMmXsSmuz7y7rk7QV69sveAN5kqOulMt2LzC3dczuRS2ZgEBafdW/OMveak/5/yhEeoaY+hT3x
	jd+aPINcov4IKCEWmSju3SDQQsUKRAXC+QANxcbqgLiLCXB5dBI6fl8OvhH4
X-Received: by 2002:a17:90b:4a4f:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3b41c8e0c68mr13193599a91.7.1795680720910;
        Thu, 26 Nov 2026 00:12:00 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b405ec698dsm34037852a91.14.2026.11.26.00.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:12:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] iio: adc: rzt2h: Make POWER_SEQUENCING dependency optional
Date: Thu, 26 Nov 2026 16:11:52 +0800
Message-ID: <20261126081155.501493-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

Hi folks,

This is v2 of making the POWER_SEQUENCING dependency for RZT2H_ADC optional.

Changes since v1:
- Added blank lines before return statements in patch 1 (Bartosz)
- Collected Biju's Reviewed-by tag on patch 1
- Link to v1:
  https://lore.kernel.org/all/20261123113755.3033436-1-wenst@chromium.org/

Commit bdfc454e8567 ("iio: adc: rzt2h: Add support for RZ/V2H(P) SoC")
in the IIO tree added power sequencing support to the rzt2h_adc driver
and made rzt2h_adc select POWER_SEQUENCING. When combined with the
in-flight USB core power sequencing integration [1], this introduces a
recursive Kconfig dependency:

	error: recursive dependency detected!
		symbol USB depends on POWER_SEQUENCING
		symbol POWER_SEQUENCING is selected by RZT2H_ADC
		symbol RZT2H_ADC depends on IIO
		symbol IIO is implied by HID_MCP2221
		symbol HID_MCP2221 depends on USB_HID
		symbol USB_HID depends on USB

Since RZ/T2H and RZ/N2H do not use a power sequencer, rzt2h_adc does not
strictly require POWER_SEQUENCING at build time and can use an optional
dependency instead. However, rzt2h_adc calls pwrseq_{enable,disable}()
unconditionally in its runtime PM callbacks with adc->pwrseq == NULL on
RZ/T2H and RZ/N2H, whereas the !CONFIG_POWER_SEQUENCING stubs currently
return -ENOSYS even for a NULL descriptor.

Patch 1 aligns the pwrseq_{enable,disable}() stubs with the core
implementation so they act as no-ops (returning 0) when desc is NULL.

Patch 2 switches rzt2h_adc from selecting POWER_SEQUENCING to an
optional dependency on it.

Patch 2 relies on patch 1 at runtime when POWER_SEQUENCING=n on RZ/T2H
and RZ/N2H. On v1, Bartosz noted he would "prefer to pick up patch 1/2
and provide an immutable branch to the IIO subsystem".


Thanks
ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-1-wenst@chromium.org/


Chen-Yu Tsai (2):
  power: sequencing: Allow desc=NULL in enable/disable stub functions
  iio: adc: rzt2h: depend on POWER_SEQUENCING instead of selecting it

 drivers/iio/adc/Kconfig         | 2 +-
 include/linux/pwrseq/consumer.h | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.56.1.839.g22a8290db9-goog

