Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680726;
	b=XlGW2drXyAMBeOcbiz8nA/PmynrSvYOwYftkrFQAPuUVpbAtrT0ZTxPxkicJO8aZPQMu
	 7OcIECOVNn53fh+cqiEchlTvflo4xMfGPKqYxnrmdGJXSpyMWJWFy+j65+Vazij0k15CE
	 jK0CJZeYirNUWAGjq6qTBLZUj0VuZNRF/t/fLqYt//SyE3J9AWlF85o6D63eqABSaw/vR
	 pLnMt5D8SK/k3Fs+DMKnDW3px0z6iRYHooUmHzN53/FJav3AoPNYF7Vc7BTXKKUTNBbgt
	 6hTnoxNdfdffnnloia5f7ZzEeH7rOuMPAGjMEnoWDoYDDk+SltNSaszTWPBQ5RqD8Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VJsy/GSRtmcR74bos01CYEf3wwJKYnv2p00XkER8pUA=;
	b=CAtQx+BN847YAn6U4U0zObZNf6pG/KE/34uJVBo1AZ7TGrhxYUtaS16PR+tsJtWBmQcl
	 fp7j65W9AvbG7ktGkNlsR9kOp+mpKZ1IZapAGdYWzPgtCyCTquG5EV21CcntHl9Uwhz44
	 xw2WWUPfRRFoKwze5q70ROsdI1osDKRZH4zd9WVZuf6pnf5P/HyfEkOlCTlKrbTCI+f24
	 FysfMXTU7nDYew3Do2YRiZM2LidVUeVuPZxfJTxQzSXda6ixSHCmN7invODkRcrrs5A0u
	 fv8+LP8VxGxgTOVQfR3KzjnRpZAq42+9Gpys6xKaa/uSyc4qfjcbTlPyv6qih/S0OhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=afNMj56i;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A36D606A321
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 08:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A36D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=afNMj56i
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so3374271b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 00:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795680725; x=1796285525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJsy/GSRtmcR74bos01CYEf3wwJKYnv2p00XkER8pUA=;
        b=afNMj56idSUsA8/GA/AHUpfpy019tdDHMdLysmAmbyTWWrURWFDGPWMCvEgLuvEzAu
         2cNy/qGrKZj7x9oV4EKwSjgkLbIhCYpMY2/nkynFBAzrqDzXH5sUyTjax3FLn7U+Cyt1
         RkA7UNcS9jByW7XfK1M7oDDXG9IKgNYMvIT/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680725; x=1796285525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJsy/GSRtmcR74bos01CYEf3wwJKYnv2p00XkER8pUA=;
        b=o5XT1e7bmWRKT9M5+B1S3MpVmO1b+5kOvh4JdQyA7YOJzYZx0jO2A4Ja0hRNIDLZbr
         90WJACwQmLAzX1QkPTs/JTq0CPy/6UKuqPe51WT4IbWNDPmowSnxsfwfKmreYiYZbWPr
         CDrgFFacupvv/QerMaj9KfwGjcRH+Kz4t5EbvkS0CqkL7o9zk/R8KWqDPxddy/4cOxvH
         ZtjJJSIlUxzimbVPnSGfxSgwqGRRNY7utuEYB4E5cSoN/PfEcidKagf84v/g2OExo8u7
         XPlZefnFPQTOeBvyi5uSjfjaiDCFaNV+HN7zcDXggYdNs7qhwHgOPlnh1nTkBq5Lqtbn
         gD7Q==
X-Forwarded-Encrypted: i=1; AL+hErFfHXHLi8ejxiadEVYMlmgqnwQhGgUk9Vt00R9HHaz/F8Iy6M0YfEqfndwtNTpu7D2CZWQ310QiLkUv/erjqQBm7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/yPBbca6UBgjRV1pMXSpdWkAaxraQlmAcXfUE3CeH2ZnWGqfgf
	x9iwHhNFR9pjnUtIha9F678zY6rojR5Rpr4tVP+aaZrLR1ntyrvHioL0S12RsJU6Xg==
X-Gm-Gg: AZFdTZc4L7n7+/MryOBwUBp0b9pR6E5Gq574gKb2MMa5xDkHfUI7ElxHZ0Kf37OlNpY
	f4QnNGUjkxiZyVqFpwTStvO3YKmGhi6REoW03mi5omrvN2yhAdeMRSfcbAYIa1Ac6oGvwJYb9zQ
	RuCJeeo9Qyj7ZMC2hQYpc41YUQNpm9OS1+VvtBA5NFReC0Y2NT9lHTgBKoRz/iIQqx+wKXW9BRS
	f2ieSSPhkXizmiwpbSLDO42LntmlmdGmv5XGp8eXEoHlTboDE5tDzdtSg4C9jB5EOSjb8mmawI9
	nWrvWApij7CjYD5CSDvZZmdYqTNUccvb+cs1VPoe/0Vlg4jJ954ANPncYT5j2yG8lj3X/J5v61n
	M1I7Iu/TlGAlOiWn0RCVd/ImeM//WtEN15SMf7hGBr9SzbifWDIEL2u9Ft/Y3S1NOnjP8Vb/CDr
	3X05xd4X0N5luyC5DIWn59IK9X6znSp4pSnOPg76POC6nY96aCGiQ2wBKOS60kN4X/C57WSJRtm
	UinSmoglRZYu3vRvus/kX5ah9pzsVFU9vugOma/VyIOYDqay23sycegUhETQ14WvK1by2SFvECq
	QvJkTEGmMMGW1YzcVba+q9Ec4SyRsLYXNoFfFuq1QNvcxiAHa7BOM4aDOmSM
X-Received: by 2002:a05:6a21:8982:b0:3e2:4350:1528 with SMTP id adf61e73a8af0-4014a274c36mr19665217637.7.1795680725481;
        Thu, 26 Nov 2026 00:12:05 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-8cbe173453dsm7079649b3a.25.2026.11.26.00.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:12:05 -0800 (PST)
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 1/2] power: sequencing: Allow desc=NULL in enable/disable stub functions
Date: Thu, 26 Nov 2026 16:11:53 +0800
Message-ID: <20261126081155.501493-2-wenst@chromium.org>
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

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added blank lines before return statements (Bartosz)
- Collected Biju's Reviewed-by tag
---
 include/linux/pwrseq/consumer.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index b69117ad3fa7..d3f5f37603d6 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -47,11 +47,17 @@ devm_pwrseq_get(struct device *dev, const char *target)
 
 static inline int pwrseq_enable(struct pwrseq_desc *desc)
 {
+	if (!desc)
+		return 0;
+
 	return -ENOSYS;
 }
 
 static inline int pwrseq_disable(struct pwrseq_desc *desc)
 {
+	if (!desc)
+		return 0;
+
 	return -ENOSYS;
 }
 
-- 
2.56.1.839.g22a8290db9-goog

