Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65A499F26
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320694; cv=none; b=D6+jp5MXLboE6q3G8fKHHoARjBvwTFJTk0vRjdioeASVETEdPsl4QKnP5c0a7SayfwRIm8JY4T7ECvxmPQz5Las381CpT5JlcBAlFkrbeTnfiqf/6ItoYDdt6eRINjO+1nrwepi4OLDYPkrZBB37RE2/J3cKHIQRZY5ROXyist4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320694; c=relaxed/simple;
	bh=04GCmteGIux4olAHeskFAacFufwWGnwkFW1GWc2dsNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxJ3WRd8r+2jkxMkGaMg6jSVaTsT8MNCqsynZ0f64V89cYpH2KhgAQetLS9PwD/7/d/x/d1y+gTygWn06G3qBc89dNdN6xoanC6LheZPqFESPShD1HGoLlSqvlFG1yQIgTXvtzS92zrMlUd4w9eWK/7KiU0hpvfEl201d8OmHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gk3YzsBB; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gk3YzsBB"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-395cf2535acso556228a91.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320692; x=1787925492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwGs2ndQ+fjxjLIqK9oi+yaLvoYinheEb0GyyG+r0eg=;
        b=gk3YzsBBhccMwhwaXya8roFyFS0OtV07f62bDiN6vdNaXwW1vJ7afYyYqHlR5ode1x
         5xdGMT8w7dO1Wl/B8lZYB6x7ro0LLkesFhMLP5rGKB+3VO2EQy96PFk3G7DrCeJ5rkMK
         f/8T4AZ3wOCFoGXIBjl+zrsfRHEmyX9aoEU11yB4b+SLVUsL8XtBx8LbNZYsadJ787ij
         ffwHCodjlbhz/eMsr5ds4ZUoBlTR3ZEQA86IS4a4b8tXDboGfEF8EpX8YULfPDKEuhPa
         2ZpPJxnog6voiJOnozWyMYCKV91EOjvQsH0fk+QljJMXdMpxdwPucEG5uqggs4CVYwaE
         UUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320692; x=1787925492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwGs2ndQ+fjxjLIqK9oi+yaLvoYinheEb0GyyG+r0eg=;
        b=hVBFj5uVF3QDXR67pkd5bR9BkB/FxnfDpN/GAGmCY3EDbKCuLuHFErkjLpRWN0aw/O
         MKWRdHWo4noPd++XXplDMreBHyTrzgRiCC6LBOPJnATsJvsIihsM7LcmjmQZJs9lfo4A
         Up6n7fi2EuyPUcpLoNgYinbtXT8JkGxDU2XYtkZFk0oWpk0LuY44dlGJup1RdGVYDHrv
         SXiSAS0Ym1yUgXtvMCgfGR5kABU7FcFlotVUXyKZcuOg4SalzXA1D0e9snZugCcsbLtt
         jkuF6K5QNBqnW6D3yuP91pITaSR6JOm00lFcnxen9n3THxBmkNlhnMsgsdssF2AtMsww
         TaHg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5JRm3r6NRsRVLOoRbLFxHSepkD6kIMSGX2JFr85KaUG7YbAZryd8mqhTWh1OQnNg3QP/i50yOTqNASeup71JuvQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mR8EI3J3DzeAGNN1jxVftxxMDjQ8Jgj1HwUYvzgAV/2kuBn/tO
	cHZypaWLZeZ8cfIHyStG1oN0Q6hBQ6X8XbYXZjv9lFejADAZ5869rRY9
X-Gm-Gg: AR+sD123GRmeg5cMgj4DT7onrv7M0Nvvz7a4I3ADlSTBAwpyePy8OjwZ03DvOT8Z/E2
	ttM5iU39rxL1YfntFlUswRXaPQccAYoDm6ELskRK2/iYWFRh7w8k0/CjieZEz0RBeHvhIbzr+nY
	KLhSLQTTE2oWIXYAOyZrqI4xSK8iruc6do723vYqrskYajvpQHzfQv5IgIW2SPtcBpeFKZCitje
	faLqWbyh+mhmsLCjOCKjbtZE4Hw1w2C7/AhuPE1qjb2YZ/JKAwJksnGoK/mb9mnUR3Xm55xZMfS
	Ayl1ZM8pF2cIvLv9KDdh8g1PfREJQflgpwggE+75sioyLS7cAj3Td46JPKKG2utRvZNkzcUOias
	pijEMOiSqMuQ0N30knypSZ/klLyTEJ2xNo3js4usAceafnNCyNRj4s9a2dWzpXIN0Pdb/JkstE/
	elfMO0TqBqtyAEuREKmHUV8qV6TS+NBr9qohaJ94hiJFaKTqCNu9aisSO9CIvkTZKGOiRbHYg/K
	hMEmBzoT+TGfi18+e/UYk2CLvtSJzcp4WOQRmusEU6cKjndI1lk8X9PFH3we9MQNgiawi01UkIq
	uKwb8r45+g==
X-Received: by 2002:a17:90b:2d0b:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-395a044f2c1mr18208312a91.1.1787320692568;
        Fri, 21 Aug 2026 06:58:12 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:58:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 16/17] rtc: rzn1: Drop trailing comma from OF match table sentinel
Date: Fri, 21 Aug 2026 14:56:07 +0100
Message-ID: <20260821135608.275233-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Drop the trailing comma from the final empty entry in the RZN1 RTC OF
match table and mark it explicitly as the sentinel.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Reviewed-by and Tested-by tag from Wolfram.

v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 35770bff129f..75713e7b045b 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -528,7 +528,7 @@ static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
 	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rzn1_rtc_of_match);
 
-- 
2.43.0

