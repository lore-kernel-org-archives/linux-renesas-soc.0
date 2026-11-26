Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680730;
	b=NCzPXN/nqytwO4GT5SZhMXum97EjNeMqgSbhwMlQ2gBaOQynwlPDP4EqB7DCWa1ighIK
	 W9SqH3VSuikOSfV5PMDXOAepaBDQy+OOsT7A9s4QZRwxiZOjD5GNqwHZxR17srcg/PQGm
	 WbGtj8k42Fnu1BGowxNoeKlO0UVR22FWEZnb6O2/mqk1gRMqexva5fHNgHCwMTxHGMpTT
	 DpwlxwY9wwLerDVYDK9W+YCAbo2IiOK9BqZOQ9ytF94V62coOIY/xx+GNVRaBv43GLkcG
	 EkTx7guKkpfBA/nGMZtOQylB7WG5H6v/w6F0pjseCcxGtd6of12lDlTEC5PBoFL6VZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kdVRaDN/T7vzdcCEg4HnPSMiNJ7B8TDs5/yJohuuJeU=;
	b=dfj1F24JiTxyVMTwCG7qymCg75/DtfczuDbtw3Mbkb9N3jTiZ2LZywUWBdr5lryGfpyC
	 WKg3KjWLCGHJZ8A5X8bAQyfP9JZ2FjYJ7tAAJhy4beBPXvAvBVvSrf4HJswgMMX3fFInE
	 RCtywJhq4Ndl0I+D0cI5bInoS0zHLqTQPwrZ1rspOunQVGz9R7zO50k5PCO9QfYmUGtJK
	 6szCkZsn/Fog/Z4kXqp+THFcHklHCOHoMz0IQwjMyTYGzMVGT5ZK4hbDR3DD7Z7ppsqP+
	 METl3wzPVKC2vljswyhdW2TtVMOl/mPVZGZaoxYZ202R9NI75oT5b89GHhW7bBubWTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dERc6wBt;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F6A606A323
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 08:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F6A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dERc6wBt
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso4240400a91.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 00:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795680730; x=1796285530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdVRaDN/T7vzdcCEg4HnPSMiNJ7B8TDs5/yJohuuJeU=;
        b=dERc6wBtCSnHzaDqt96zRmZ2vdHqF9+v0cSfmz5negKeazrLKeu+xbEzVSkLChR8Kb
         WhL9JcSes56BAz7atdGPm8u6ROTAAp6puz1OyS/d4Kj0uTtEjxvpumqeXcV1S9d7gi+t
         39pM5d2r3TB9TsjItygBA3Xj9jRtafYy08wdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680730; x=1796285530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdVRaDN/T7vzdcCEg4HnPSMiNJ7B8TDs5/yJohuuJeU=;
        b=rIqscZaVgvrO7TDbzQM/V81LKmUgeupL66Hwukza0dMdWdPrZ9WbK0guX0whk/Tiop
         9STmBxDhH7q+prxvvpts4M9imocH9Z586kuCRIczGfpv7r05Wm5U7NJrxhoWaZ2cTj1D
         pZmupjWbhl4zO10znuDHqqg/fv38C3hWEThWzHOIBSYjQR0KPJRpPlGppCQVjOjxvDJv
         7XXjrkQm/TuzrFvtLeuKQBT0C4JIFft2tdyALBZANDh7j8hl/DHnc0jM74nC6AihubMz
         a1+wt5y/Th5+tMZH8zesEWxZm3qnrIkwoGcGgdMByjtG60Nl920foHTl7G9x5tH70Vx7
         Vf+w==
X-Forwarded-Encrypted: i=1; AL+hErGKEule1TU3Cz04F4wl8ZU+dbB7DaH8yLkjxT57QM1aSaKzVm/CnUjkizQa912a2yN6ZYZ4CHynuV9bGihEtB4MjA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GTBCzIouLLo85pxmR5vCLt0a/oeQfhooTSXXONLhCIA2Ztj3E
	I+sHMDfyPK2elACbRgjCZEthjorW3fjFlJ67I3eplMzReVRM/S31ZoqYwvhr+MaLLO4rIsKSO/J
	Qj+iPMg==
X-Gm-Gg: AZFdTZeK32/erpjsG/exD7cPvDcu6rix+OplsPe9OBBJLalevWbJhpgmHeo+FYHAkRk
	LMFSSIV79PJ7mO0t7FzWpuf2e+EgSzdtbHToQnNNLXFfApQKXTkgqvOFB0PNp689DvmRRkk7uH/
	Ph6t9I7uOB6AdAQs6TbQ9puGs8Q7qOgbQo9cv9RBvfhjMW+bhLimAtpI/svUtvVeLZ0bLh26W1a
	9YekrHrw1Btulrdvg+/4dEwPPFPG/6kIj3xbs0EvwIZv5kMJTkFTt7jhfWS66D7iEtsUwFBJUAf
	88D8dgR/RYDQYfkFVBbU8elqnAsGXKa77shH6a1N0MsQLeCbRbdmBszDOtm8NOracAqtnXuIthm
	3yjowCHE6pybJXqrtOFDskrp1f1aREXEr6r6SlJLfS0LoL1pwjz/gmYJoMWPVtxRjrzrHhYjIVf
	R5G3/UcpwhnArGF5q/g0lSC+zWZn9h49q9YepPtvYANBb1uRNlUNlhQaqKLsE4aQjaE+BpRzrLW
	upmuOABuYUt5jB3dK9lvH8MCyLJMN3em8lLIRlxHlrdauRWw0mvm2FmmtT0g6q9euTQ11h0IdUk
	0Ed/9CuEkpcj2g08MOmjSpkesd92Q3RRzciY6y7uMqLdJzaW/VIMquxQ0Xoi
X-Received: by 2002:a17:90b:498c:b0:3ab:be66:ddbe with SMTP id 98e67ed59e1d1-3b41c902f3emr18704680a91.28.1795680729913;
        Thu, 26 Nov 2026 00:12:09 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b44b7a8c64sm14084752a91.3.2026.11.26.00.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:12:09 -0800 (PST)
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
Subject: [PATCH v2 2/2] iio: adc: rzt2h: depend on POWER_SEQUENCING instead of selecting it
Date: Thu, 26 Nov 2026 16:11:54 +0800
Message-ID: <20261126081155.501493-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126081155.501493-1-wenst@chromium.org>
References: <20261126081155.501493-1-wenst@chromium.org>
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

Commit bdfc454e8567 ("iio: adc: rzt2h: Add support for RZ/V2H(P) SoC")
recently added usage of the power sequencing API to the rzt2h_adc
driver, and directly selects POWER_SEQUENCING.

This new Kconfig select causes a recursive dependency when combined with
the in-flight power sequencing integration into the USB core:

	error: recursive dependency detected!
		symbol USB depends on POWER_SEQUENCING
		symbol POWER_SEQUENCING is selected by RZT2H_ADC
		symbol RZT2H_ADC depends on IIO
		symbol IIO is implied by HID_MCP2221
		symbol HID_MCP2221 depends on USB_HID
		symbol USB_HID depends on USB

Power sequencing is not needed for RZ/T2H and RZ/N2H, whereas RZ/V2H(P)
and RZ/V2N do need it. But it is not a strict build time requirement
for the driver. Change it to an optional depends on.

This also requires a change to the pwrseq stub functions so that the
pwrseq_{enable,disable}() calls in the driver still work without a
power sequencing descriptor with POWER_SEQUENCING=n.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/iio/adc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 1d6ed49041ab..7874d0e78e9e 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1631,7 +1631,7 @@ config RZT2H_ADC
 	select IIO_ADC_HELPER
 	select IIO_BUFFER
 	select IIO_KFIFO_BUF
-	select POWER_SEQUENCING
+	depends on POWER_SEQUENCING if POWER_SEQUENCING
 	help
 	  Say yes here to build support for the ADC found in Renesas SoCs:
 	  - RZ/N2H
-- 
2.56.1.839.g22a8290db9-goog

