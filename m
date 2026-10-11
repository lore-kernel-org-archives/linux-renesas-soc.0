Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC8A3624D3
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Oct 2026 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759451; cv=none; b=V++qIoxJVG1nGjAbmgudN/A48FIqTVHMTTHI5lxcWgYNcRhpEN0Q2MoMlkOkcqLJuoctjwSk/1h98w13k8SnYut4M0ibAFVNLADzs+P8WwW3DqlTNq+1ePlCuWkKXC8nkU/cP82Xeyl6XQzguXS9XQMOY6kN24p0UHBZeI67nV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759451; c=relaxed/simple;
	bh=RZwb0v8NRa8WincdU5oM8nIaW/9Wl4Cz5GrnIGcpkbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZoKFYISNu20KYpBDr+PttjkGR+qQF+7k//o5gmsTrUcAQXoMqfAflf4Mm5RRrAFTIVxFYDBnTZ1bgdHkR4g8x0oUEqLmPpP3+SVpAZWaUXt14Re3bnmZQ+U4nHBCBG1BUFowhzBT0F0kyAmgLu8S5SCsB1BhGnYJVMWxTnr+DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fy00jf1i; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fy00jf1i"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5352a876d5aso19001641cf.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Oct 2026 15:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791759449; x=1792364249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJ3lYqdP3s7nQxccxtgd7lYQQBm6qlupyIbypzuH9WU=;
        b=Fy00jf1iliuAYDJkv+MbxZKP7D2f1txnfVnmTGUiDG34L6K2mEV0lRuFKHo012+/N2
         dn7B7lKQ9iYQcrQzypRuuE5rxq9I2Cx7gOLc454E+HKkkKEhaJHHiHWMQwsa9MtVnXoi
         mpCRR/rBvdZMJo4ElVVasRVOThxg05zCh6tMY3RNQXPUMu6PhcvotICdGYXuFyble5MR
         13Z7LdvCHYUAdEzmPoOLPAmD+RGeVXXbh3fDtBdjvF5Y0zjZ1NDAC5TXiI9WTVj+9dP0
         z+ky+NhwwdGM7dmpMJoykBF9M62OjDxQIr+4YekK0Ij33hII2YpDjBBwzYFaCIo6No08
         GLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791759449; x=1792364249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJ3lYqdP3s7nQxccxtgd7lYQQBm6qlupyIbypzuH9WU=;
        b=dhaCiMOw82xf1poLKTsqP5UOVUdH2dNaoVX/Z8vfohh0raPPB41W5Q9bR9/Ogp7j15
         S5YwERGstsTSQ18QMlQr/J3s7iZBdZ5UlVo2AKTA583G2qYZYYiGEIMxbtK32TylDBnB
         yFzyedIMrVxxj+/CQTWnYi2rnY1fb2eeocOjnb7ADLCfXVqPgpSLi8jZmBgULEGViDM0
         nAEAPPv/iom73QxbPp0VvBeyRGNQePh1Nf8POtzmxoBEFmPBSpxFGDOxyOO5tC5oxaep
         9LskBXD8clWM9C8delB8n7RvMnhQROwXTeGmWSM/olbmikLRdEzIyDjaSHCbe3nZoHAX
         XxWg==
X-Forwarded-Encrypted: i=1; AKwUvBw5RVE8qc3ocUD1EmioWGtaGd8jyAlL+ee9EEu8JfSH0FlRraYM3FmXKyqkRGwkCb31LdwWpzVLnbYfveW3c6F6iw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLv7fxEteqP2L5PeLms1onRIDAFJjsbzyUd6DluBjgagA0yqdho
	8R3PssK6qnyuzin0gMpqIodAkzvXfpZDH6NRMEz/jNCgfA2l/RohHDo=
X-Gm-Gg: AYBFou2cWM8xYbhDtMiP6wdMj3mUCpPp/Wrf7WwFxojpVdZM3E914gDsIAyCS/E+Esi
	oV/r0gpnb/c6jIixTbB63/9s2rxURZoIczxjFdPGmLtn6PJkz2o2tc/FgiIl3mAK3QQai3Qlio8
	Zf5wWNg8Ux3bYPDI3DitYQTl31VMIru8+/AmtZx6WlHMTAm+I2qbIky/clS085q9gDKtejYXvNV
	B0ICsDF1qVM9KefMenCfwRilYFPFbA00y1k2jRpS5eIqJKqGQvNAFFZl0QVHIVMHu5NHqyD9Bdw
	fIttaY4kpAUxXVf8JFyUKc3UTTPg7BdXEMiyzwmJ4ggHHbBZrly4rGEdSXpzmiofvMd5E6ChFgW
	8Y2McHXphEmi+VTjA3oNgflu4AvC07M2fQCxNV8issicrdEi4u7n2lgyUUGsmqOi8jtYxh7c0bA
	r9oLtYku4m3e75MXhCejJbGzFqIEccld4Ko1Ib95nfO33etOlT39HIcNN3ijBsa0mc4Wd+uwdxU
	XNORTVHMWAHcEYX11g1K5mJlVMYMMEZ/7byRS2remYU2NrubewgE39eY8QgVsIwRntocmLRmKk1
	v5YwjEpfL1qq5v1AbVQXeEhm+62m
X-Received: by 2002:a05:620a:450a:b0:93c:b10:7243 with SMTP id af79cd13be357-93ebd0cbfe0mr1420548485a.5.1791759449127;
        Sun, 11 Oct 2026 15:57:29 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98cd599sm723647985a.39.2026.10.11.15.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:57:27 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 0/2] rtc: renesas-rtca3: Fix IRQ initialization and teardown ordering
Date: Sun, 11 Oct 2026 18:57:23 -0400
Message-ID: <20261011225657.rtca3-irq-ordering.0@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTCA3 alarm handler passes priv->rtc_dev to rtc_update_irq().
Registering managed IRQs before allocating the managed RTC lets devres
drop the RTC allocation reference before freeing and synchronizing the
IRQs. Masking the hardware sources in remove also does not wait for an
interrupt handler that has already entered.

Initialize the RTC before requesting IRQs so its allocation remains
valid until managed IRQ teardown on removal and probe failure. Then
stop both interrupt sources and synchronously disable both Linux IRQs
in remove, before managed RTC unregistration. Serialize removal with
RTC operations and reject later alarm enable or setup requests.

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.
One existing FIELD_GET comparison warning also occurs when compiling
the unmodified driver with the same flags. No new compiler warnings.

Myeonghun Pak (2):
  rtc: renesas-rtca3: Initialize the RTC before requesting interrupts
  rtc: renesas-rtca3: Join interrupt handlers before unregistering the RTC

 drivers/rtc/rtc-renesas-rtca3.c | 40 ++++++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 12 deletions(-)
