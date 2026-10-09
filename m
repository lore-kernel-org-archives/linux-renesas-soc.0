Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF6D3B9922
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Oct 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565046; cv=none; b=lMYxQmzwbM5iycllDOCR+bWzKv5cHr5fyHePgjp8QERkEXAxwA6vAGJYm6/HmiSOXWPnDtsLQsTAhl7+3+R2V6U6mVebB8+ZZ0LfzcH3vr/9l5KAJ0i161YiQqVF8kLA7avmE3T43RZPwzk7n/nc482e3QggZJXAmh3NC3OSZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565046; c=relaxed/simple;
	bh=0Ms2Ce1jxsdv/q82egBBcwdKWoMGW3+m80IgSNWXrmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqXoDyJdMhT2aqa7gyxCKzGLSWNBVs9fjSxkvjFe/cfcen0cC5e1GlwnDCP81LDgi6tUbh6qJonU5mtz/vY87ixXcT7boqAae3GcS7XrnxirP8BzbWVvDorsiz9eU9Wk21We15BQ53klGx4HutiZi2PThq/mrlyBWOLPVrpGlCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOO+Jfyw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOO+Jfyw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a168355946so1114625e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Oct 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565041; x=1792169841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkUVfSEq2h6YekNsdchzA/EZsTYtJJcojYRbIdHEgaE=;
        b=pOO+JfywURQGZ0BqDCDYnHNwAWzujYZp3m7mRTbfCXkUcNaktDZckTMqXx/JzSHXUw
         ZRxrarcwUexxw05MLhZcfn9/Exx3NMg47UTWDVseuQkeSo7YROcrp2BWV7fxVuI+cROA
         gB9Er6f/IHPmAKbA/LU2jnpGqEgaG6hsKSMFjiUjrwb0m09nlR8oLPvfXd6vsjLDNOZu
         +b47NpcNl0x/YwPvVYtXNtqHgiJ5pOe5yZhvhNxzxj98D7Ap5EWn0UhGZMjXgfswUDka
         +zAoyc+87+Buchr0ilgN4u2c8V/l9OX8m6E/04Xs7ZXGm+XFLSH1w5OFRgOEQPLZpX93
         3vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565041; x=1792169841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkUVfSEq2h6YekNsdchzA/EZsTYtJJcojYRbIdHEgaE=;
        b=n6ITbS3KIxZei/gfEGs5xevyPoTIgzZbN/crB6trA9dmP3dt5G1dU2z1TZkvKoIcw5
         VezOOZabeQOkho5/fU1H12SpYv0YYhwsKf/wjLYjKTZxsDydQ8Zj8nnPvAjVNA0GGmAt
         YvTLIG8wNlCptLKMas+/MbzVuLBkVCGoLePeRmaD7aCdNVumZArkwu5h1oiuGc5tXuYx
         /Ry+aBRYo1jMz12SdTqxli1KzNO1DYdFiQHoFALl4NoFB9/7CQ/BjSgNk8xLdCsP8IcH
         ww8FDzuR2x7T0oAq04DXarVtFgzGvvTxRUDoIPnswYuZwqaVUN0LNfkpLd2Fj6g8NZ1i
         bNow==
X-Forwarded-Encrypted: i=1; AKwUvByWPCuWpA0SrUCq8fQAT6nefyQWlalN1bJIOXrL0ObT5vvEzbsLjpUwTPxN+Umhg4DtHMpNyruBPagzDLEX1kBSFg==@vger.kernel.org
X-Gm-Message-State: AFuF++lsMu/qAwpasD+pKqSH1oEmbOewOIQ5hKSP8LYD74EAizmk8mUo
	KgVv5lKOW56Jtbri6iu5Yo+6AVPgg0qGKfJVtWUVs5rcWhMjrdLrKj1K
X-Gm-Gg: AYBFou0FFJqnRNcPhjBiOPinj/hGD8GbuU0doM/OyyVdTmsopfvhaKotwI770z/+wW6
	NH92xkS6c22B4Wo3Vkm0HNuuptkML6zZCgFynd0iUYSqvu5+gWeZuNG2AiusKX1k9CUYY4ET93q
	sCnG5aGheIvznzF9Dwj+LzhkrUCA7YjqOHHYkAdG3G9lPHIUgwIMDzlfuo1n7q/BaGFl8z2L0qh
	9zLs8fyTJ2twoGa6ugcZZwWn3BvioJQgUfqMT+3wrUX6jp2xjz08cwwrzGb0bn4cq0dUB1IPabK
	SZ0+nsqOH221yFQIwev6k0xDNDgn2o+PuN4By9FU/DJ6Wg0pMGgVu3vxZSRWeXqnJmtCHnj5btA
	RiDkM4wnugaDaQ+oRr+JOOBtgxJwsrDkBMU/6NAU0mY36/zgkjWiCv0h3i7yGLBg4idx9ml24HG
	XdRUPeActSuIN1MkmR5BN69gAb91dlNruUIxCT3atiLgmLqB9IlYAqX/TpwkRakDteMNtLX9Qfe
	w8PCrx4oeNWZ9z+8WnIIYQbPAj0ka+Dxi5PLrVTaxplflyraeVH5H5kBbk4hrF+GALjaZ/eHHNl
	en+7UxsNi+aDPXeifhSBYxTIE498LQ==
X-Received: by 2002:a05:600c:3488:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a18e4b8028mr51196765e9.17.1791565041351;
        Fri, 09 Oct 2026 09:57:21 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm70667395e9.4.2026.10.09.09.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:57:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] power: sequencing: renesas-pwrrdy: Support SoC-specific probe configuration
Date: Fri,  9 Oct 2026 17:57:08 +0100
Message-ID: <20261009165710.1320233-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Allow the Renesas power sequencer driver to support SoCs with different
power sequencing requirements. While the existing implementation handles
RZ/G3L PWRRDY signals, other SoCs use the SYS block to control different
power states, such as the ADC power-down control on RZ/V2H(P) and RZ/V2N.

Introduce a SoC-specific information structure to provide the power
sequencer targets and consumer matching callback. Pass this information
through the auxiliary device ID table's driver_data and use it to
configure the power sequencer during probe.

This allows support for additional SoCs without duplicating the common
probe logic.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Passed targets and match pointer info as part of OF data
  instead of prober pointer to keep probe common.
---
 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
index 743855620501..158ee5c6432d 100644
--- a/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
+++ b/drivers/power/sequencing/pwrseq-renesas-pwrrdy.c
@@ -15,6 +15,11 @@
 #define SYS_PWRRDY_N_DSI_MASK	BIT(1)
 #define SYS_PWRRDY_N_CSI_MASK	BIT(2)
 
+struct pwrseq_rz_info {
+	const struct pwrseq_target_data **targets;
+	pwrseq_match_func match;
+};
+
 static int pwrseq_rzg3l_set_pwrrdy(struct pwrseq_device *pwrseq, u32 mask,
 				   bool val)
 {
@@ -111,19 +116,28 @@ static int pwrseq_rzg3l_pwrrdy_match(struct pwrseq_device *pwrseq,
 static int pwrseq_rzg3l_pwrrdy_probe(struct auxiliary_device *adev,
 				     const struct auxiliary_device_id *id)
 {
+	const struct pwrseq_rz_info *info = (const struct pwrseq_rz_info *)id->driver_data;
 	struct pwrseq_config config = {
 		.parent = &adev->dev,
 		.owner = THIS_MODULE,
 		.drvdata = adev->dev.platform_data,
-		.match = pwrseq_rzg3l_pwrrdy_match,
-		.targets = pwrseq_rzg3l_pwrrdy_targets,
+		.match = info->match,
+		.targets = info->targets,
 	};
 
 	return PTR_ERR_OR_ZERO(devm_pwrseq_device_register(&adev->dev, &config));
 }
 
+static const struct pwrseq_rz_info pwrseq_rzg3l_info = {
+	.targets = pwrseq_rzg3l_pwrrdy_targets,
+	.match = pwrseq_rzg3l_pwrrdy_match,
+};
+
 static const struct auxiliary_device_id pwrseq_rzg3l_pwrrdy_id_table[] = {
-	{ .name = "rz_sysc.pwrseq-pwrrdy" },
+	{
+		.name = "rz_sysc.pwrseq-pwrrdy",
+		.driver_data = (kernel_ulong_t)&pwrseq_rzg3l_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, pwrseq_rzg3l_pwrrdy_id_table);
-- 
2.55.0

