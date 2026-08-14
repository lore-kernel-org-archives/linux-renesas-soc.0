Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263744A33F5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 19:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734890; cv=none; b=qSOPKkkAdkR+I5oB9LXAjvuczEvLgG2hxqG+rTuVj/Abxh8r/09Wachpo/rxb9ISc+niSzOHDrtJ6d0ZwroCh47U+z02CFlKqfi2cVkkfUwKcVMw1qR9aMaXNlXqLqWkJRQe6lDh7j29t3On3fbuSBaLWNgng1tpEDGaoeI1T/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734890; c=relaxed/simple;
	bh=Z1V63TLbOOJiZ9OWYBLhtvG8u+j5Z+qNWVfO33Rsqbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHgUYSDaT2VL231FhxPqXtE4EbV/8+EHWYruaV7o+9be6RvEMQNoxCLKsR/nlLH+8DLGkqDI/v7xCoUfO5kVmAUseCRnveuQkTDH9KKaWgQ12tm7tMIvtpijNunYPsNeHUTDSvDEF8Ak0vyvX8YXhynvk0PDZMidEAJupgBafZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foTh9Tw6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foTh9Tw6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc61541f8cso31719505ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734888; x=1787339688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljw4i24OukbGiQJQCxBeHaTi06GYjymaKq0wZtgmu0Q=;
        b=foTh9Tw6FGITm44TapakljVHUFl7ily/F6IQ2hFlk731P5UIQzGVPrNZa9XC5CXRN3
         Dp4MYl6dzKTx15EnB6FUhr94/HHT7QvmznUNECtOigPx84Gng11bZ8fWYlVOcJSoXTA7
         LaDxlsUM9X6goUVozGHUxcnqfCVVdnt3eSbtFLnA0toEaTjBVZK+Xwpqz221F8e4K9BN
         R6aOfEPY0E4G500WR9nz8+aE5dQqxshAmmTkQ0s/Prhzhe7Pvs0LxmJMtJDxiPazI4Qv
         gbtBirf19IlPyxqyn2vS33xq8USl2Xj9wIxawTlilUU3kkn9dhChLKrDC4PAcmJwjx2p
         qPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734888; x=1787339688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ljw4i24OukbGiQJQCxBeHaTi06GYjymaKq0wZtgmu0Q=;
        b=MGkrGeDBMUh4mxZxQbo7959+E8VmOQ2bbBroFUo/boF75+27/aIfSxfH7Xl/awuMlp
         +a6c1QgtIVLz3Apl4UbLszFfxOpAWn0A3AKW6xClQvOoviyr68MBuPNVzFGkLOd2KMXI
         6kVvEY3o9SEWx2yQP+AV/yg/P+vODPEU53p13LpgrNdX5g8GNrcigIxHuPD+irakmo1x
         LnYeyHhitPX35yqrTUSKSwBRiiGiRTZa3bKq6L4C8gDv+uZjC89mYGJ3hJVZjJVWKB64
         NyPzyFZ9uaQQUVSbt37mr6Yud9EW4RSg7wpUP9QKO2dur2Ap/0tsKrNo4QxY3yB+e5dq
         Hcaw==
X-Forwarded-Encrypted: i=1; AHgh+Roff/Wb462Sczgiq8Bwrr+YnYRENq1CqdTxvcEztuNCNeJALFF8ULH7l9jeE6z/AdL7YCgBqLeZ/CBinWM5GER/ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxINJkqTHgC8MssSv8dHJeiBxHDZBzckqzXAsYmzZ/g1yr6cv7w
	qT/RBQ2R/Zbc5BJmrVkSF07Mr+vrbT+ktYqcu9NeVsDUZ+LcqZQWnbu6
X-Gm-Gg: AR+sD10ouwoDc54Pk2LmIsp2GmX8b6u4OVntqmipbvkd0QlS77+xdtODcDMZFob3iPn
	vQvq3kGkhbDFAXYNpRZWfHX/M+Puzqr83op7C8YsyoOwwKW06ffOyaMBWUqV2MDM6j3sF276MUi
	VxsF9qYiYghxFS/Nh/m4fnA0vDQ/yUF0bR68U9hBY766zQ3mqHUax0d+de+WfhYc8+30oz8JVdJ
	KhL1ePtR9rUXNzzJsQI66yPcyAqizoX8xb32zq5vMQOnW+x0XigaR2CGHnnMGw9J1FqTh28k0CE
	gzoEJIWVKNvsEFMTI/LRiI5uw8L1rVkj0aebq1wL8XKEQ/M0/e6N67g5CdlgQdAxmTAoSrGwWko
	8Swpwh5rwB6fWdv3hdHdsmyKbpVwfDXK3+DyMMdkZkf9s1QQZuFNbqVQQY8lCqjQXyiH+adxOZj
	MOsZGOPHestezfXTFx8GTRLWbBwyy0AomYfBGWJGBNrHKSV21Xgs91H9m2CutkyR0BB7NMm3ggo
	JtOysok7xeJjWXhD60WiuOyysU3uMteEfE/VOn8s/nUnk+RjuR8oijxRmpP8mZLpWBsteqF1XRk
	eYHhgM7f
X-Received: by 2002:a17:903:1a0d:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d37f7b7ca7mr177972955ad.13.1786734888228;
        Fri, 14 Aug 2026 12:14:48 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:bd48:a716:c86d:67a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ead105a9sm6734865eec.31.2026.08.14.12.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:14:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/3] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Fri, 14 Aug 2026 20:14:14 +0100
Message-ID: <20260814191415.2110732-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index cf28caef31e8..8af2f33b5680 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -40,8 +40,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.43.0

