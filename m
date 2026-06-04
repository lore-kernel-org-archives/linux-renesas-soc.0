Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCEF331A65
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586344; cv=none; b=WOTNrNyl75MiPF/+KjPRz9pKcDCim/wBSKN+qbsb/Tb4+tkX+Mb+e/Sn206/nSD0nqtxC7Ayq0w20J+DgGkrtYCRZkk+kSfrCjWxNcHknfq0qZsZmWgjScGONGLZeXDOt+H5u/vSgcnbkwyBTEb3hS4RvcbZ9GZ4TLKg6jLhnnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586344; c=relaxed/simple;
	bh=yL2qAKI2jcxosbs/pLkS1PbpJbGzxbxr0FtX8S8lgC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPHz1yOzPeoEXPoaHCmy9koD0HvjoXur434CAA+6oxFV+dc99CJs/rTTOwUQNYfvVAnjnlZ6aB6QEVewxTa6vfp/OsOHi0sJ/v4ymDWgvF1QkPQ5mpzvaDeS257xFoEvfXim34c1D0aAbGsnQs8LA7ADkJ2mO35uLfD9IfrgxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFW47HuH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFW47HuH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b64c8311so10280465e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780586341; x=1781191141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWUcXwhNpagO6TYVN1qjS6SxZrgnvhazVIX5TODrDgE=;
        b=SFW47HuHzzQ7+WwHoHu81QT0srelIUtYheHA53exrwdCVnNhskIczaDqa+pupoSY5g
         ATfv1vpPRxuLtgWoGgbPhyvlPLal+bkGIH5/PT2VZ5rZMLyBc3c/HaCZnj9JLHPlZ0j+
         n1NzrdtHgl5Qn2chCKnaM5imudNypFvHITfaZGKXlNxLw1rlRu6wrRhvU6kG5mM2uFFQ
         DVUrUeSpT4WAY38BibBmpwTuOxP+Ou4cdejPzDBaH/R78UiXUDRT0Wz+pJHIT9DOsrBK
         UI/nf3lZcMIKgNFiRfw71T1oklM3NvBswtUPJty5cQnVwGJ9p0+WsXfVKixlYtUJKwyQ
         RPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586341; x=1781191141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWUcXwhNpagO6TYVN1qjS6SxZrgnvhazVIX5TODrDgE=;
        b=DwV+R9UC8xFWFj27afV0c4Tj3k9grcxBx/eqMP8S9Hf4Av+QFdpExkGvON9Xlm1jaf
         bMsHD2B1oJM/yWCJYSrsTua7i36C1wUs/CqgorfPNUcyNeNpo63lmH9G4O3KwAMHvcM3
         qSdcAj8RI4Df4150kuTkGSGhnq4IBPpwdOa5p3o3Em7FnA7jz0qNmkRU9p7H2bKWfJP5
         rV++ZjkjTq6F1rEju89rE+eCg4BYZI+4+W3PzvbM3j0dEL4Jj52j4uiwU+03BGdhT3LU
         mOB/ZFBUqEON0KF9y/i5OFapXF+0qsCWYghTOJw8zkUDisKxMGxRt9BcytzwfUvQBtqz
         qWYA==
X-Forwarded-Encrypted: i=1; AFNElJ/BYblD6mCa2ciOmnBl2w+UZyd1QjyXvBSA5+hCuY05Q75HhFK73vzkXrIGBrSQ7lvZPa65R01hAL/7MZ1oF50kdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cVvu4GNTUJ1vvJNdrH/roDIBZrJIALd4NV4f7G9KhEjy/s3t
	EU3HfnyAmkgFIXSaT9vQ6Bh+UVFfjFYzY/muHZQy6XM3HUzHGMlp6U3t
X-Gm-Gg: Acq92OFyBRveFGDDnTDTZzaqpW34W8Ze/rSOn0/8Zb+AFjxZXdHRZ2T3LD2+PCiBrFH
	W1G/y9hPHJsDCbS1dfm2gyxv4D15XfQbS87ZYJ6sfeEucORW1xO5LcpS61so2Z7uix/bFyBSzBP
	Z44bOCukr9wjjx/GMSZZ6o9UA0gmRVdmC1nzV1Eo5tzG2en7ywXceB/49Gx3y3YucAG7CtjHvB1
	zA2gt2zFPs9DvWJVMDl5kKlgbsCsHoytLQ42eZX6i17UQF0BwJB9J537+GWO8paTdOnYT/ZacTW
	HLaXzXkCwIJRqTFJwTQT2Dc61ycngjU5hHYKEZSfOxsWuql74MrQ5IffYYROEa18r+UZqW2ANb/
	77gkmdH+ETXUjQOnu+A8iKLNXpsVdSbkPr53lT1EZVk8ZwVr1ZmqnKJ+6Zli54D9+t5nuTbQwcX
	v3FUl7cUZ0J0gsY8LVbs4NM6U5YMHsVL4qL61YOlHc3g2bHf5Z996uQ7VNkPY=
X-Received: by 2002:a05:600c:5288:b0:490:b0f1:c27e with SMTP id 5b1f17b1804b1-490b5ee1c64mr140495465e9.24.1780586341284;
        Thu, 04 Jun 2026 08:19:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm82776805e9.1.2026.06.04.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:19:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31
Date: Thu,  4 Jun 2026 16:18:51 +0100
Message-ID: <20260604151855.307772-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the Mali-G31 (GPU) node on the RZ/G3L SMARC SoM board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1] and [2]
[1] https://lore.kernel.org/all/20260603065731.93243-17-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260603065731.93243-18-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 3d5e6b8489a9..fd2aa064f9a4 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -51,6 +51,15 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
+	reg_1p0v: regulator-1p0v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.0V";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -119,6 +128,11 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&reg_1p0v>;
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0

