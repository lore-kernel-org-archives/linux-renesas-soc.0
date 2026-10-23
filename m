Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778373;
	b=Gi3dgSDWp6qQDAEYEv6g1KUtLMfJu3Ppe5LB1+sG0AHs3OkZcel1e3xIzQ6tgpgOCfkI
	 Cn9+B4TfBvF5GXsDoaOu0groIFPO3ziFuGJvfC+0Dl5zC6ygU97lvIi7AlrWxoxOkL2EH
	 Wxr9C2I1JvzP/55fzOai8+s4gH4XD0cfRSVqlUIK1ojKa4zcKyBpv/KCUv+UfrOlJ+d6N
	 H1lnQ47zGJTH5SozRlwMbMf2+u7/dO52etnAN2UPbFLQXXYXTnjR1UbFxDXyX+aA9rCAL
	 H514E+HdXMVI+kW+DW43p53yMjz43K1THLjPH/vExuBYVINMD29J3mlO62+LORq9Fdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
	b=wGCG/iipoYrYs3sRrUt6TJ9Vl9cIVqqAKGuzU9REsWNpGD/ntf4iR3KtY7VCly4gHKbM
	 AzSNaRplTcRm0GUlAJZaQbJTiWwrb8VzRMoo1OOo2UZfKPVjjztzj4zzZGyuEYZsDgncW
	 9SStKYC3++1nPEp3rM/AYUSxm97+KnKHHrzh4V8ABY65EuQor87PYcFNHh/LOOdrZzxR4
	 4Jkdu7C62LGF/WD6RdTEaFonB9QXN3iNRJDwjQu75bXBCG5ll+SVg8y3JQKArfh1GrKjU
	 ry7pWrnK3kFR/AnmgDdDcDGwFYCCe48VclX3C2InDtTUmTpgRwPBb+wUvMTjF6YcSVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OEbZgL1k;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A69606A33A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 17:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A69606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OEbZgL1k
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dee593f18so826204f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 10:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778371; x=1793383171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
        b=OEbZgL1kulvSCIS4M18Jozd+OJn2wgmMdz558trPyD8wLQqmEhq4RCR9o0T1MX89nD
         HMYKXZ5hetATa12c11uKpQGbcYiyf4uupXTyEARTd9JRXS20WpY55CrrHDU+BnDZTPM9
         fGn2jZVVmV8nzcdTby2mitvPxU4QT8Ff5wK581l0nw4EiwrnEmuO766l3cItnCnEjybp
         h6akcUcHoLxgmhx+aWpaj8X36ireJPrN5YS9Eb1DdlrIAEecZMRPiauctTzqnVbTvMXy
         KBk/0sNqn3rJBxGMztCDm/kxKzMJSGinAxjMUAG4S87Dmbbuo6kZhrc/ukc/l6YH9VQF
         mWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778371; x=1793383171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
        b=2M4ul4411hSPTNKwvSWkNa/njTK5ou6RS7dT3QH68HxnU99It+v4gd/2AMamn8iiOp
         aWBVtazRS5FYffjDAlcEcDMN7rNAca4fcGOu29BBImiGY4O/AZFHOM7wl4CPSu8fBGIm
         oerFaUZ1lUqyq4VbceMkY4dHSv13xZJiKGPCDQ7N9aRbZ7xdiaVUpOOojSPLn4DQeYGf
         fjyMbZH+vtGxtEaF9B0mi6mbTM1AFKXWI8/pPfwBdbC3n0f4iF8hNS99Hd6RJfZLAKMA
         Ie4dDBBtTJ+PFp1dJR+KpkFaXGgoZevIMQ12qflIT38QYtbPxoqN3JcFkgah4A0ncfAP
         as0g==
X-Forwarded-Encrypted: i=1; AKwUvBzbOV1JKBAAb57J0ZMC9NdR/eZ50LvfIi14aCNVYhEy4Ir/otMry2po3HQ1b4b+bnB7yWqehVXqQ1urcJh1Mtwi1w==@vger.kernel.org
X-Gm-Message-State: AFq9FYI83H8fbwMBNcroTYyjj5MsM9YYgeZsNsgXN6EcsPMB36E/zqQ3
	YezCrSx4zfFcRycGSnbPGqh6oFVcKAW7Nq2UneImDgCXBMtBljudQ1hZ
X-Gm-Gg: AYBFou3qTXpU3X9o3aj2Wf0nN7bJec4zkOazGjwqtwiYLueTBPmiO8YJj/qnfgahQAq
	lXN/geXJIg+Mye+CW4jG9u0feVnAVr5UHoVDsEAEMRX4KJIgE8Y1rKf5Clix/GROcgU/VygyGqf
	X26Zb9dZOZxgf8wjJ6Hjny6nlhqSPdg8f+cM95YKmeN7nmyBJNJvqEPR7NEi18clnjXkdvfcNEN
	n1nt3dmEQkO0lhbLDGW7/hwCw6c11a+1eC6l1QZjr8jAFXlL3ECKrGZumr4y0kdTIUrmk8Me5XR
	uHJ/uYIB4zl0oDsFSvLmtpgSih858HdhviC9GL1o/T3VspfAwu7kf3KaJQLeuvmTjSTIg86RlJ/
	dZMHpJs4T6bbtJO7Nh+4UXwOcp/t23QH6lo3MLzCDFJUezVbVGNu2ZxDcSPXJ/eQ5KRFQ0F1laX
	TG230fDgED6SnC/X7yP3HFDIBl0J0xVhUXkDhMeB5k3YdPz7ZqHIPBiE09LN+t8UDjJcyWX2tho
	2JJbRnkdASiPmQtICEwTMrLy3zUEHZnNwCaPiW9GC6CJCAIlhtSDxHSP6tpnU7paKMnkKDwrKWT
	ZcoKVV0A/USgHjCNYguhvP1FLkDZ/RPfwhrLVMK41h7tS2XgnID7cpkpXQ/9+DCjbpVUx0Hae1j
	/D2kaRREiMesra67d3pIRl8VsarTWcR7qcVqtE8Vk+MceYQ==
X-Received: by 2002:a05:6000:41c8:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-48e3859451amr5267524f8f.23.1792778370853;
        Fri, 23 Oct 2026 10:59:30 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:30 -0700 (PDT)
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
Subject: [PATCH v3 6/8] iio: adc: rzt2h: Prepare for SoCs with different ADC info
Date: Fri, 23 Oct 2026 18:59:17 +0100
Message-ID: <20261023175919.160103-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the driver for RZ/V2H(P) support, where the ADC supports 8-bit and
12-bit conversion modes with channel configurations that differ from
RZ/T2H.

Allow each SoC to provide its own IIO info structure and use the
chip-specific configuration when registering the IIO device.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 94dad479abff..dbe82939acc2 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -68,6 +68,7 @@ struct rzt2h_adc;
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
 	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
+	const struct iio_info *info;
 	unsigned int num_channels;
 	u8 features;
 };
@@ -763,7 +764,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	indio_dev->name = "rzt2h-adc";
-	indio_dev->info = &rzt2h_adc_iio_info;
+	indio_dev->info = chip_info->info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = adc->channels;
 	indio_dev->num_channels = adc->num_channels;
@@ -778,6 +779,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
 	.sst_to_freq = rzt2h_adc_sst_to_freq,
+	.info = &rzt2h_adc_iio_info,
 	.num_channels = 16,
 	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
-- 
2.55.0

