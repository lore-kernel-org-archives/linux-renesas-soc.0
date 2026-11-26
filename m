Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700911;
	b=42b0riM1ipe/Dafp29/kYpyhb+meWnZhm7u3axhgsypd+TEAq7G8ExrHlrXKfBu3tNU6
	 owBOxfwYt0kr+2rTx0Ctx9qyq064msKZrpfZqyoEXDxSmmIK9yjgAcsM8wmhSWs5dxMq/
	 nQKbKliA7jp/kA4fH61PxSL+Jh2Wu1AjMagJsK5rS+LXnE1M32B3s3xbWAmqLkinE4kKr
	 vuwBfL4zJuvWpXde94gWyxkXYd6lpeYaXlNMLp8gzST8wBW4knb06oFEd00s2uzgJBRiq
	 Qkm1zT41UBxcAChJuAD7r/Zm3ZhI9y+E1mnwCpD+9DAm+FaF3+uf3X/L++aNeb9026Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rm9Myfp9UNOe4eMcJGRVkZiHPATpQ0cO2bVLAIkG12I=;
	b=3aGbdJBYTCWr0V0FzaxT+vQdOcslDbcCBs9Vs9eHROf2anjVIy5xSChzpc7KKXhGyx2z
	 lDodqeFnG12P3KwVAgi2tPuvNGQVy1VblVukZf5oSGpWhxHeJ6B1V0sQBDDUIys1bPcxq
	 LgMmcIR/z9C0PGTo1kGx/t+AmO6sqE0XjZaRvt4Gd5SBlAMuktl6J0QGb2OHpeurjziAb
	 dhX3cfSpgDIUGGsCw+3anmmbwOXJa1OqQHQFJaKrdYmrvsD5VPoVd+hvj6lnqTyKBQx+P
	 EWQLO6FMRq7LScNXaKmDd/EZ2evexQTmfWDDBfOIZlvN5JFhblvh4jMJ1o60PihkoMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYYqiX33;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080E8606A335
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 13:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 080E8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYYqiX33
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so43870755e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 05:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795700909; x=1796305709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rm9Myfp9UNOe4eMcJGRVkZiHPATpQ0cO2bVLAIkG12I=;
        b=YYYqiX331Uy8GlHegZwnmL8M2gdNuEmd2y4FgLMJzBrtRRTg31i1EvYs75DI49hK6R
         S92SWOdBbl1TWmOZGHXtjlJ7wURi+o7F8/Vc23U086MMxYO/IsKJjeLUGUHlT7fWuYIB
         1Vd0Su9q32vl1oDxbCDXnPavu86w0GqSm4linkryRaw4TTJQLT88vK2NN+TI6VC26KHW
         U+Di4QRNwyEAYO+T3sK+CoJ/AyRE4ezKVsu+v+lWd0eNCgvilz+/oqQbc4zWlnfGNa82
         SfdXw/X8Alpb6zrTCJrKfJL1ELKWaR0qfYpCf04PnQU0mmKmloVx2Iqi6pR9w33sW17P
         ZJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700909; x=1796305709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rm9Myfp9UNOe4eMcJGRVkZiHPATpQ0cO2bVLAIkG12I=;
        b=K+rNjnhWGuftbAsq6BnOIvJahAsCVWBi2pLpIZj7SthUoEL9PMNcGv5D4DrY4QNMwY
         8zWeme6QLgc7AwZD7aO5B094xHqAaSBI5QM9dYXlbGmagLhsBW+j4F5g4BXbmtJDSH9u
         NciZn2+IlS8DW6c4SUKZyEsAMEoiNgSbcvU2K3/ZecI0vBsn6p1ghH7gpEfaiNryxLPs
         Lc66nKvOh8PCgP6OoNaxsqyMr+OQQScnYxAl23S6LjkBFARvK4BxXkNCwtTihxDxFNHQ
         ir4XjhlYP2ZzorDR9pmBxaPhBUd9MMIJ3o4QH5PSevDS4gAnA6rBNTZY3Ia2Hc/dd8L7
         kqsw==
X-Forwarded-Encrypted: i=1; AL+hErGPTyekT3UGhANL47nQaAjWErBcLD1K1n92Q45qhdNZQaSnHt/EZuXyDNyNl5Y9bPAVMT0OKkop85EonjJKA5L6aw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+2SLnDRSsf3wOaBFr9tc/b+o13p7msTJ5f7B1ZymwkxjvyAt9n
	Ie5X71FrERBU+WMEm18agfBu0ZEJTsmTLuGGrevDsmtwLGVtbRiyJsWF
X-Gm-Gg: AZFdTZcqGgol1KBHJvWqQVpk8oHXBGg1vRhhRXtDchbuegjOSvqSt5mXURCdUQ4nxYe
	tG52jMwCEboFJv3B9kTMj3tbQeCvBo49OeK7OO4G/oXygAO7BTLKZdzIrjCKUQxNXKAfjXUaklI
	ZUJwLbAf+L2MGLbp0CE5dmq2OJj69RqQQnTbqGWj/5LvcIz97IIofozwK33Czr/FwUxNSjiXNVJ
	u7JO2KdWvRRJgMAkKoTXxxCouvfobsfELY4qI1GkjNhU6/RxBSsTIawN1L50PM2vGCDv4MA6yNA
	RsDSEnTdGYplPAhmlaQT15c6X0AD899Vasde/+pzAFsqoz4mE7cL/QAxCTxIPJ7lt6MpmhZ3P6G
	QV0upj13D0VTD5yzQ29aZ40VwlevXCLZLlKdAb5W4jVGW9j0zs/uR3W7r1maK53dXrPhq6j5TZ/
	0kckOyOi0inL7GFbPOV0LU2znkCQlNM89gKZEZU5IAljgkmSFJAVgusxQwBvwOZe9LrCawHlvv9
	PMYfzjQRRbkzdWmnnNi3fORwpS+Wy17ALM/KuVzOrWVxvrQMhNbSV1+IjhHMi1PX1CnN9zE7PcX
	sdjmbS8f8pmR8mtFAWzuJKM8iTY9Y24BEByRhrVFAKCZMi5RrSWdHikJyY5a2A==
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr440409255e9.0.1795700909186;
        Thu, 26 Nov 2026 05:48:29 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a702:d301:c60d:8d79:1008:270f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm591221015e9.10.2026.11.26.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:48:28 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] iio: adc: rzg2l_adc: Add fwnode_xlate() callback
Date: Thu, 26 Nov 2026 13:48:19 +0000
Message-ID: <20261126134826.46044-1-biju.das.au@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G3L ADC1, IIO channel indices don't map 1:1 to hardware channel
numbers. Add a fwnode_xlate() callback that finds the registered channel
whose number matches the specifier argument and returns its index.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/iio/adc/rzg2l_adc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 340813f6f890..f00cfb897124 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -286,9 +286,23 @@ static int rzg2l_adc_read_label(struct iio_dev *iio_dev,
 	return sysfs_emit(label, "%s\n", rzg2l_adc_channels[chan->channel].name);
 }
 
+static int rzg2l_adc_fwnode_xlate(struct iio_dev *indio_dev,
+				  const struct fwnode_reference_args *iiospec)
+{
+	if (iiospec->nargs != 1)
+		return -EINVAL;
+
+	for (unsigned int i = 0; i < indio_dev->num_channels; i++)
+		if (indio_dev->channels[i].channel == iiospec->args[0])
+			return i;
+
+	return -EINVAL;
+}
+
 static const struct iio_info rzg2l_adc_iio_info = {
 	.read_raw = rzg2l_adc_read_raw,
 	.read_label = rzg2l_adc_read_label,
+	.fwnode_xlate = rzg2l_adc_fwnode_xlate,
 };
 
 static irqreturn_t rzg2l_adc_isr(int irq, void *dev_id)
-- 
2.43.0

