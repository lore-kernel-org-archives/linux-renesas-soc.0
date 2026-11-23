Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433892;
	b=RrzLmh3ojcbyZOUUZCylcejwxHubUBePBvM83txtY6Jqb8RRU0ohttuICX7C97lWkIMj
	 7298fgTu+n+7I1VhBnexeOUd1Xi4c67irMxj7PoMbjH+/i6Fv4T9tw+TdzgshgfoB/yWy
	 iyOUEDxKqMsdorGunM1yOO3VfZxquAM9On47UxBm89fpCnu9nnuHuwoXxd1+DYAwnIboD
	 DyEd8F4IRmdKO2ddDG8G5cqKb7P6Zz3J1k4FKsfeVW6ZqHQG8oVDCgH5P7a3Oe2rKnppR
	 rg6H6CYo1kN7MAWLFzzYLEN/gwIWTXaNa9GrktDIBZ68yzINrtHnG6xzvR1iI3c6KLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/uf72jF94qcU3idbI2020NJhdWUqwDd/ONaRN+2ot6c=;
	b=nDWnFMkgvpVM7AxNEjL3Y6mIwNcP0Z9FMSwA7eSgKa7MAfUxOW7/GPiXWAVDKDS3XLtA
	 OwONdd1PtBjyJS62ZEbzpWbfnST/6c0e9bbw+mJ7qoTkVW+/VkUm0A3p20BG8DX7O436R
	 bshDAcyzhDn3oqhlIZjmWT1uO7JDU/OhqfD4tgEru/7jCakIxE8WtbGa3gEsbCFPBfiwm
	 QTpGLuPeTRbPYqJ9yK7TSTETrwo76YTJd6Co1KVUq8s9nRuG+oFOu2qFHGBOU8tbcqCRX
	 oO5TjvOSJzyWDTzvmvrz2gsz2sVszBZd8pgfCxPVjno9yBzcF9kAeSllw1/yHfUJ1rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ti3mIkkI;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B2D606A331
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 11:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B2D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ti3mIkkI
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cde1479f76fso1922805a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795433891; x=1796038691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uf72jF94qcU3idbI2020NJhdWUqwDd/ONaRN+2ot6c=;
        b=Ti3mIkkItoB1uzyh3L5WUUEz+MtHiX4+XGUoA2+v/RpWcSXi7L1Ty6bHeK6o3xuPxY
         F0Vj8jV9huA+/e/GdDSaQ0QFMvfDLlD5sLa9ctfzj4JZhFXCaI8qjWqF3ZbPtWmEjB+o
         ayR82fZrSNujQsZw7/zhxzwakgyVVhzzQVmc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433891; x=1796038691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uf72jF94qcU3idbI2020NJhdWUqwDd/ONaRN+2ot6c=;
        b=wySF7uQ4z4MX4J7kYLC3se+31VQJU3qpqnJ5tkU/Pl+V27ceVMkKPF+7O1q9ZF67mB
         TZCQF99FqpsmHX/wnVUws5UDZje1Aa6M/ZkjWa2ByJZyfzxiGumb8XtRtc9nWyW1k4jC
         +d6SP47U+YAqt/+vSIiWfmJSbEQayISVENP76bnCKQQhxmhktifT69VkJs5BjONU8BRC
         t5uuWHJY8E6AZrlk3TMm7t9+f9ONspHuDQuxWiXr7/p8fYyJYDPXV4YAW02w+TV8bDqP
         gNIN2/fPFNTznKaXE4X7lvq4+1KzxXcuRRfFLpDUT9BDwogkKmTFi214tsRqQl3nGqQi
         HxNA==
X-Forwarded-Encrypted: i=1; AL+hErFj5heYjU3ORdAduyDGJWawG2zzF3DPIfEOE9aSnEXcDjwXuA3HhK5R4XeqhoJ2FgeLXk7a35nMcQu3apP4SFVgEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HGroX2NyQef57W8D4qKrSv1R1uAFIiAWtd1z8nT4XDdpUdV1R
	hpLjMm7okpepIKiw2maqAMDQHu+A5i5UVhyOfcf6Oc43wYdjat9tcf0LX5qSiiykEQ==
X-Gm-Gg: AZFdTZe17DGjVcLMwaEnh7OSa5HJmnch3W78Q8FBKsTBpClUfA5zubqcG44IvgzU7Zv
	LnI4CN1K/sJSYZLAwgya11HG64s+5e+EIK/2Ot/kf/TIJLtJIRIHq7KfH4aVnHAVSJ2gJr9/e6h
	f3ZHABre2WuWPBtw8zpSgTZy1MHZHMfVp5nI5XrJ3BnU6yBePQfFdkGhdY0HJOaNJIaB/TLeVwZ
	zvbvsTzk6gTg5lOauUjZFlmuPG35AOlKwVRtE/9i+8ZgxU5EloOvpqzeJ8FO10FOL8A3bJWfuZP
	v8JmToFHFwzkiyt3kGY+Tkp3x2Qb4vviLMeJa9m8tTDewqqgQa3nC8gU7rGc3yvwdETfbM5ueH0
	mh/fldiuqqUkA/2p9rLWUoHjyG7XuE95+jMe49MQ5NHwe1cqKzDyc71ZWaFCzEd0lvJOeSLQB68
	883oixkRadhp835T+t4xSa/0k7OxtOsvm0P4ytlw9blgWqrQJEATmhLrP9XhfsGdJPts5zLeNgm
	1y4TnbjeNLsnRIOP9pUks1ppBo0jiYsNXMl9OYHJY32yFOVNNAoeFtfS6pBU1obEjXKPj+IRCqb
	pP4RyyiUY9Qm86M/rHct2ZGop1rBcBqv6WA51FIbWGwi7oC3+BzncKxz5nYW
X-Received: by 2002:a17:90b:5109:b0:3b4:aed:d423 with SMTP id 98e67ed59e1d1-3b41c95ce8amr10439138a91.57.1795433891643;
        Mon, 23 Nov 2026 03:38:11 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:ceb5:5e59:832f:d16b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41ad8ef99sm18165446a91.12.2026.11.23.03.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:38:11 -0800 (PST)
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
Subject: [PATCH 1/2] power: sequencing: Allow desc=NULL in enable/disable stub functions
Date: Mon, 23 Nov 2026 19:37:53 +0800
Message-ID: <20261123113755.3033436-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123113755.3033436-1-wenst@chromium.org>
References: <20261123113755.3033436-1-wenst@chromium.org>
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

The non-stub versions of pwrseq_{enable,disable}() are no-ops when
the descriptor is NULL; however the stub versions always return -ENOSYS.

This would require more code to deal with on the consumer side if the
power sequencer is only needed for a subset of the supported devices.
One such example is the rzt2h_adc driver. Only one of its two supported
hardware blocks requires a power sequencer. The driver could be built
without power sequencing support and the other supported hardware block
would still work (provided the Kconfig dependencies are changed).

Align the pwrseq_{enable,disable}() stub functions so that they also
return success on NULL descriptors, acting as no-ops like their non-stub
counterparts.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 include/linux/pwrseq/consumer.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index d24b5af3e49b..5b3c61e963eb 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -54,11 +54,15 @@ devm_pwrseq_get(struct device *dev, const char *target)
 
 static inline int pwrseq_enable(struct pwrseq_desc *desc)
 {
+	if (!desc)
+		return 0;
 	return -ENOSYS;
 }
 
 static inline int pwrseq_disable(struct pwrseq_desc *desc)
 {
+	if (!desc)
+		return 0;
 	return -ENOSYS;
 }
 
-- 
2.56.1.831.g720f3f5937-goog

