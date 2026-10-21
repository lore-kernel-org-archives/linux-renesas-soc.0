Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627285;
	b=G/xF0WRU7dPLi+Y9pTXKaWgXRpg2b7uVm9kDjE7u6BotrnDLz5XnGqmVkiA5+dMinDg5
	 deM2dd/RIuEFYvK5Rh2kmG1Zdi7ntv9Hh9kH3SwHG/+hcDkNE864hN0/88h0z6mByam7m
	 ROTsRXqszo1L6FdMDX5ayT+15jlSFZSN4eHKmI6TWhcFyt3DuLbZSbRKECebLfPnMTkPb
	 GRft7+w4J3bHpLMBkeD12wZAJnDdNPyStMvhjXjXvoHJ7s/9g4KwvfqWTQNTJGdGCsqx8
	 m9L0pNc3jHycGa57c/4Mbwf04JLiUf03D/Cy9GfexsQAlwgI4AT6l3punmq6RjhdGTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9rsuU/zpvGVZ6N3nvTXW6aQt3MLOdJQFmOTT1iINVYg=;
	b=ydpju7S7MVIP1MOK5OHeeBFPdPrknf+nCHZ6Qa/tdfG3JRnuPKz2jjBS/Vflk5HYF3rd
	 nMr++F4C2dyiWpQM0ZqksnZkzaMJiDBxKQhkKkYTG4UUJ/821Q2andjJEpkJcBnb5YSUs
	 2FscnXOxMU1RdnrWwA+8SmZZwn/J1yBFf3pXf4/arAjc+dr0yygHDmKtDaLn9ZYWgOpAU
	 jpbMC/mcdxbGgcWDG4mvcknqi+3aoixgEXRoeZWHYn7/CjcT0cIiWHps6QzwrDy/wadud
	 GpANHxzbDSoVcGX/aBizrdkPCDmGRTXtwYFXMy8lDtWl/mRWvBxwS/5OsDy7qBmIJyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m5yg9UoE;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239F60A2620
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 00:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C239F60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m5yg9UoE
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-368581df789so454925eec.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 17:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792627284; x=1793232084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9rsuU/zpvGVZ6N3nvTXW6aQt3MLOdJQFmOTT1iINVYg=;
        b=m5yg9UoEpcdYE8egFZeIgIiw+eoQYctsAkRwAViGsNT06ip2KWN83KgAyDKgQ+L1QV
         SlsKZ13l0t35zjsjJg3dfmFvJP5BVklcHpBUWEIVatgaa2HInySG0PQHaAeLoV6oY8AB
         +A9l/nh9nQQx8ljsyMwVjjiyaRbLxs2l2hiw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627284; x=1793232084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rsuU/zpvGVZ6N3nvTXW6aQt3MLOdJQFmOTT1iINVYg=;
        b=JhW/sO4ZEGrll5wPdZN5ZqQo2tXKhFchqNBwXIZ19H2kvoPPeSDG3Fh1JFaOAc/FpW
         21yjoQ/ApeSVCrnXTuHY4RLA2OtAjlGt31IHMVp9bjsYQ3AdzHs/8aDU0zporOKD8u2p
         1EgYipKvFmu9bdIBq7QcH0FBgu8XCdyhGe1uQi/sInlD7nWyGOQFyDTRR/DzD2Jv+3zq
         bBbkHWaIij77ojZY/OAXCuecJ9x1wPDMTqy68l8gsW6wgZV4XVCFjzJ1ZEqsuIPY8Pc/
         TByOCuB0NMseHleQqPWX3neQyo7MGV0l98C4pjGwrEkyenTz4hQEnhhRoEwSVq53DSgf
         7lPQ==
X-Forwarded-Encrypted: i=1; AKwUvBym9pMNCrb0h9PB/rlTa3nY9k5f8hMlPs/M+7G1VEpAgR6mbBdlYHbxFD2dDN51WQhuJDNycAciPUGDtpXMSH1liQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvXmjZLhlLuqUjeHlLzsRcylrK403ZuGUFo2dR1zutAenKHkmW
	Cvrz25up1A7sNh+ByUCU/BwNEHgriqwfvqSZ6u82oW5xBgRenTz8mbmJL2jDRG4GEQ==
X-Gm-Gg: AYBFou0WCCGC29FBumu1qf7E05VVWz6lPB3UkQTMIrA1Z2ZN0OxmhN3R+2PvgqVqKrE
	b1RTaeH95qnT0JN9WJzexeo7hIipW+5eh87KI+xu7IqIGiUbqt6vffnVOZZzIJWU0EJiK4lWojY
	5UhRIlAuwSwEkjCIqdo3ejE1LKghMu187YaHQRaIlqQ6I7dXHy/N7GomcwYhow3jaKfHKOMpGeq
	MLPMWEGngNIjK9gsqKJy36UiNAvXa2aQ/Z8UlG1HPsX5Nx58wDPPMQ5mV8Ly6YJa+Mza6L3BinW
	VJIm+Jyq/pGedMAbEcocYt53V6idg46ZcqvYXKxsi1AM+NVD8ikqvHnE2l+e1IJzgWdpRXkEJAE
	TYcjIVXP1bo3eFZdVOpxWts30U7ZymXpt9sz8JmwZXSQJgZBCx7twEjvrDBAgh9I1dU98ciFl/d
	8i9BnbeUM66tIFIdln5w9Rn0J3uGlyH17EhQmzRUuf+VDDKYv5Rmk+dr5WMhRuYOpYrh5QFDhVC
	qVo2iDmMX5nh9WiTybg8AWzFKP6CpG6oCHNY5Wmd0s7dbK5vBY/IQzOT3rGo0PgwgpwyH0y2vq7
	giwJmkqw8kCiXM0tQ+3B
X-Received: by 2002:a05:693c:8102:b0:351:606f:2832 with SMTP id 5a478bee46e88-368ae2d4b25mr1068928eec.3.1792627283594;
        Wed, 21 Oct 2026 17:01:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:14ab:bfeb:ac88:458f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-367411bc89fsm13245730eec.16.2026.10.21.17.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 17:01:23 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 06/17] iio: adc: rcar-gyroadc: Discard pm_runtime_put_autosuspend() return values
Date: Wed, 21 Oct 2026 16:57:07 -0700
Message-ID: <20261021165858.v2.6.Ia4649c7263a5733426a8778ac4b2dc459f3ffef6@changeid>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021235818.3059519-1-briannorris@chromium.org>
References: <20261021235818.3059519-1-briannorris@chromium.org>
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

This driver propagates the return value of pm_runtime_put_autosuspend(),
which is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

For this reason, modify this driver to simply discard the
pm_runtime_put_autosuspend() return value.

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Split iio patch into per-driver patches

 drivers/iio/adc/rcar-gyroadc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/rcar-gyroadc.c b/drivers/iio/adc/rcar-gyroadc.c
index d38cf3caeae0..0d3b061d6ec2 100644
--- a/drivers/iio/adc/rcar-gyroadc.c
+++ b/drivers/iio/adc/rcar-gyroadc.c
@@ -199,10 +199,8 @@ static int rcar_gyroadc_read_raw(struct iio_dev *indio_dev,
 		*val = readl(priv->regs + datareg);
 		*val &= BIT(priv->sample_width) - 1;
 
-		ret = pm_runtime_put_autosuspend(priv->dev);
+		pm_runtime_put_autosuspend(priv->dev);
 		iio_device_release_direct(indio_dev);
-		if (ret < 0)
-			return ret;
 
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
-- 
2.56.0.218.g1ec904b173-goog

