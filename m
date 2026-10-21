Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627264;
	b=Wjj8lvVIWlPLG177wSO1NymPtipfh6yTkburNgCr15Va5thalJkG9k6k9Ti3wZVsp3Ec
	 5y2oGPK8tlHmbZWBycP7Kd4InJz4uslxVWFliUZhXsML8U4t85bOlZ2Xu7bBdDXdWO6T8
	 8mHQDAopjxnSOfFPx9EO4LXTjtqGr2QIOiJiNc6301xkyeZIHdT8jBYNIjICWhO1KbSLY
	 eLXbF+81HftK6GJySe2I6o2/8FZTEHe1DP8sh4enO1S2RypfP/bbU/g4sZ64as0ZRbaV8
	 KQejFQbun/LbBjF27IMpa16x+W/QGbD8pHr0az5d7JNj+E0rKEwTax0Yaq8h7+rmxSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vdQ15CY2t8acOR+daJ/by7IbMKM9K/k4D2pVTlpzkNk=;
	b=zG36NLnIhyGGW3hFiBzXEqIy8tEIEwII1+2/kYxU3CrtJ9X9J7Hih4RUqHwnt/g5NsbJ
	 r5fadixGq/kVLrE3b65FakUwYeFOv93NblXbDje7obNdOd873EV8AnTPyBkDKak5wKpwa
	 bmW7U0K6jCl83PGfGcOlBkyuOo32xTHE0jDPlS2k+Hso9Mr1QqFGlB9PzUSkCa5vnHo/u
	 IYj5BTzn1kcoVG4uIwfqL1zqyF6QXFiyyaYbu/2mNzK7tXcTUrFP8yjCiPpajTxyZBXCl
	 YEGWdMGDvSW/fIxxnYXOCujO0Wy/Wf8Db/p85a9NvVHksR3p/e8vfAdG5q/3XzDNmnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UmA2bOuU;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190EE606A319
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 00:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190EE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UmA2bOuU
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1714900eec.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 17:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627263; x=1793232063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdQ15CY2t8acOR+daJ/by7IbMKM9K/k4D2pVTlpzkNk=;
        b=UmA2bOuURe6zzZcz6sNdn2qZsqHZK5yINxkcZrAhLL8QDaeRg9nf09OXJdDZpSCRYf
         +aUzwszLCLnOIgj3vFHUtMtabk1DMoHgTSs8fG9CjMPPuBumBiza6waGhaeaMQRTjq3X
         8j8BEdih2gmRULB+bP5mlObW3UOjqcRdummgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627263; x=1793232063;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdQ15CY2t8acOR+daJ/by7IbMKM9K/k4D2pVTlpzkNk=;
        b=0P0TNJ30Hio6lAXpPF/fTFMoeb43oR7OSzPdCq97fiPQ0o8uzMlxKcGoitrClaLrSx
         vDetkowOgVMBYe+luRb9MRQeX2hrSsUEqvoaVVzgM/XdWLk0sb2vhKxOUS/6euEytIQX
         p1UMCoJf8TeSNFXQTxw5glRgLxAEYtkeJ7+bVKKpgK12Gm5yL9J0d0tHM7HI9llhWn0w
         QU9XXaBYZBrsm1700OHpXjxDVPn7G+9tgzJFwRygTvdtv9I7FHSxSMK4EjFMwDyHCnGZ
         +D7GPwZVND8Ie5Y4DhABQ2dNqYhFn1eEY6pSgGE3OHmw8/3dmKtLQQFbJI+Wqbvp4PRp
         qJdA==
X-Forwarded-Encrypted: i=1; AKwUvBzDfLnMHebbhtoLvKCOCXaiJlLfEWgzMluHxc2tyuQ2fpWHrQ3/1XzwXTNUd0gA+ntlCN8iNdNaNM4goz2Kx81r6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLdvFXH0rW8n8B+E67L3SXjPsdIY4WbpU8+oT5HpadLDuFDRTLF
	+ksamFfoHi6xfPkZFV2kwdw/p52u4dIzI28y5/saLqXe2YC1kspnVXrv9joCdew9rg==
X-Gm-Gg: AYBFou1ZKItYbZZULklPrN5l1C8NsrHljdKIU2PL3S9qsVv6jeaKznusVeLSYmwkoLs
	bC1OMWD5841ebb0hvVQrkBL/D0WKuCZWJS+quPruBNzRuMku+GcBf7dVlToLbhtRtTuLHOBMHBw
	bRq+EAzjELS8RNnWkYxMIUAv0Q1H1Ft5EFwNneV1rwy7CGjFfVpjdzbDWYWnrHKvaC90UCCkYqk
	LBKrL2KqoEXJGdpnX5R+JJN9lottvTF5Au2HJ8BJvkCSfe7nDgVrSwEO7TEKBwPldik7tUaVsO7
	jOupcZA+32vhVuiKabuYM3NvZM0DVl/UjmKPdYjeV0hjvWbfrtrdOkcM1hbSZdarf/n8LU4xKJW
	s0kAvW4cxPlY2TT0CojermurfIFySwFs9wuGEGQTwj4PT7xnkmbzcstx14Adk0nYAi0kaUhkBte
	Wb9Ca0v69Wu2lcPFyIix/wig5bftUvf3UFdNEqQmZ3BCjvhNHjZ0xpDPY/JHLQANgABOAbPT0GJ
	xZ3qhPJN44cdlyjvwccR30pwSnGMKST/bsNo8L3Ah4xW8vzYgqJPephEuaj+PH2sQgAfmaOnB7R
	I968mKvELi033MeRJeK/
X-Received: by 2002:a05:7301:2f1d:b0:361:6dc4:d0b2 with SMTP id 5a478bee46e88-3674b52acc3mr4938338eec.2.1792627262898;
        Wed, 21 Oct 2026 17:01:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-367405ed295sm12097312eec.9.2026.10.21.17.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:02 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 00/17] iio: Stop looking at pm_runtime_put_autosuspend() return codes
Date: Wed, 21 Oct 2026 16:57:01 -0700
Message-ID: <20261021235818.3059519-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Similar to this effort:

  Subject: [PATCH v1 00/23] PM: runtime: Convert pm_runtime_put() to a void function
  https://lore.kernel.org/all/6245770.lOV4Wx5bFT@rafael.j.wysocki/

i.e., commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void") and friends.

As with pm_runtime_put(), there is very little value in return-code
checking for pm_runtime_put_autosuspend().

Checking the return code is more likely to produce a race condition
(fighting with user space writing "on" to the "control" attribute) than
to tell a consumer useful info.

Because the IIO subsystem has the bulk of drivers that inspect
pm_runtime_put_autosuspend(), and because those drivers have a lot of
other issues touching the same code (which Jonathan suggested [1] I
fix -- I fix some, but not all), I'm sending an IIO-specific series
under a v2 label (since many of the changes are still borrowed from the
earlier series).

For reference, the larger v1 series can be found at [2].

- Brian

[1] https://lore.kernel.org/all/20261018211807.66bfea0d@jic23-hlaptop/
[2] https://lore.kernel.org/all/20261006231900.3230373-1-briannorris@chromium.org/

Changes in v2:
 * Split iio into its own series
 * Split into per-driver patches
 * Fix various usage bugs in these iio drivers in the adjacent code
 * Remove now-unnecessary helpers
 * Maintain Reviewed-by from v1 for drivers where there was no
   additional change (aside from splitting up patches)

Brian Norris (17):
  iio: accel: fxls8962af: Discard pm_runtime_put_autosuspend() return
    values
  iio: accel: kxcjk-1013: Discard pm_runtime_put_autosuspend() return
    values
  iio: accel: mma8452: Discard pm_runtime_put_autosuspend() return
    values
  iio: accel: mma955x: Discard pm_runtime_put_autosuspend() return
    values
  iio: accel: bmc150: Discard pm_runtime_put_autosuspend() return values
  iio: adc: rcar-gyroadc: Discard pm_runtime_put_autosuspend() return
    values
  iio: adc: ti-ads1015: Discard pm_runtime_put_autosuspend() return
    values
  iio: chemical: atlas-sensor: Discard pm_runtime_put_autosuspend()
    return values
  iio: hid-sensors: Discard pm_runtime_put_autosuspend() return values
  iio: gyro: bmg160: Discard pm_runtime_put_autosuspend() return values
  iio: gyro: fxas21002c: Discard pm_runtime_put_autosuspend() return
    values
  iio: imu: kmx61: Discard pm_runtime_put_autosuspend() return values
  iio: light: apds9960: Discard pm_runtime_put_autosuspend() return
    values
  iio: light: pa12203001: Discard pm_runtime_put_autosuspend() return
    values
  iio: light: rpr0521: Discard pm_runtime_put_autosuspend() return
    values
  iio: light: tsl2583: Discard pm_runtime_put_autosuspend() return
    values
  iio: light: us5182d: Discard pm_runtime_put_autosuspend() return
    values

 drivers/iio/accel/bmc150-accel-core.c         |  75 +++-----
 drivers/iio/accel/fxls8962af-core.c           |  56 +++---
 drivers/iio/accel/kxcjk-1013.c                | 118 ++++++------
 drivers/iio/accel/mma8452.c                   | 100 ++++++----
 drivers/iio/accel/mma9551.c                   |  21 ++-
 drivers/iio/accel/mma9551_core.c              |  39 +---
 drivers/iio/accel/mma9551_core.h              |   1 -
 drivers/iio/accel/mma9553.c                   |  36 ++--
 drivers/iio/adc/rcar-gyroadc.c                |   4 +-
 drivers/iio/adc/ti-ads1015.c                  |  50 ++---
 drivers/iio/chemical/atlas-sensor.c           |   4 +-
 .../common/hid-sensors/hid-sensor-trigger.c   |  14 +-
 drivers/iio/gyro/bmg160_core.c                | 178 ++++++++----------
 drivers/iio/gyro/fxas21002c_core.c            |  33 +---
 drivers/iio/imu/kmx61.c                       |  25 +--
 drivers/iio/light/apds9960.c                  |  48 ++---
 drivers/iio/light/pa12203001.c                |  26 +--
 drivers/iio/light/rpr0521.c                   |  57 +++---
 drivers/iio/light/tsl2583.c                   |  27 +--
 drivers/iio/light/us5182d.c                   |  32 +---
 20 files changed, 401 insertions(+), 543 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog

