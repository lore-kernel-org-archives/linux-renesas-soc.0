Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A79B495045
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320702; cv=none; b=H/SljKwUTcLTi7SaiqJ6+V2gFWiuPftg+TAJIrajJ4zuWpAvxf7+Vo32cIeDRjYtbPKRjfvmQ3d/WxeM384A+/6SQ4lXsS8EPkDntChFPDGt6vnbKJQLpHgNtasCuri4rvgrmTQEGdj4V0JAIc7TTLy6+j7i6eec9s2OGQsAc94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320702; c=relaxed/simple;
	bh=UPDJbJGCBOg6+lUDxPQ/+xKfCV/KTrJ9OCvxOLU+LNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUFwgCDuLr0ddPyYpU6duzwEkm1Og/pLlnpbSpVRkdpg2uG3Es2MS6QgP7O8MSel2hi6ZyaKx7JRY50PmM7w4wugihXZgFaRJJsQ0FOzTXPsbx7eCxsR5oiYcOI7bw3HJ+oXsuCmKINOc2sL4tBeRTVdI1PfaVX1aW2f4bc7v5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFZRhpen; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFZRhpen"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caed617615so11412975ad.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Aug 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320699; x=1787925499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYvzNltPmk0j/AWbkVpb3n9XCUKtHiz/lu4CDiEtMAs=;
        b=SFZRhpenZfTxxR4rr4HJ+DsDcZ/5jxD0MOnVAaH1dQ+UQNxJ/c4ip50ba/TFiGf+uD
         wEKJIcxzmq4XsUOUNxjWBmu9WUKeMcx9K/PEOa8fH12I5cJUXc/8n1gAeqznWUB/69cF
         GcPhnxQjlJ+xyY+JCDd/WB89eOiKkbYe256mPMK23xqnX6EgBe9PBImOMCxmy5HGhIJC
         MGnapZm9cohfSrkVh4/tXN29+E155fi8YmNFFOsKMGu547G2RK/fED3IatVvvATV0u64
         C8NE8oWSN2hPrYcgWRYy8I90CtMCCvj5J/0lFSHHLPGEpgW3mhuhvyIxVDIAhzVWS1DL
         PslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320699; x=1787925499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYvzNltPmk0j/AWbkVpb3n9XCUKtHiz/lu4CDiEtMAs=;
        b=kR7S3kcyG1IrLNl/xfP/1eOgu1k0WxUPA2AiOxFL4zs2s6k3Cfy46xYMyaHlMs4HkZ
         3Tta9DZogfq3UecapLsxV50jbBWd886C1rdFOA81eVVrjc1QyaX8B6QD41ZyLhUzesW/
         fh7/v02cQWJ03yCvO0llhZgTLeUouW6Chm4u74zS97m35CIN30t5VeRjlz8met6Z10/p
         TMHyaOGBfxYUDE8x3GUGVEZsCfknOdEmdXXJSsHGDHJvE5vu+6i2SQW0rm73F058607J
         UbY+Sj0FBUMpwTFw656+N9ayD9QRW4IFFNMMLCkrLKQtXULKAqG8Syd8Aoxel/+EYdwA
         j90g==
X-Forwarded-Encrypted: i=1; AHgh+RoepFW8YdBzloPk/2wmwKgAWosSrk3aJQf+rkpsdDXk+uzOcyBVhEXl+hJY01RiSRh9ab/Yt3+RW3ZKmIsTldzc3g==@vger.kernel.org
X-Gm-Message-State: AFuF++ndX9/IXcOnJg4rrlyjkB9ahvFvQwVSYNCXJzEnw5xDwsSMv9R9
	fzgqhzJJTEa8DRqgFSu/hjvEbpnKE8dY0BFN5di3kZqq2iCxl7p9av2+
X-Gm-Gg: AR+sD12WvBsE8xBMoZU3xX8vwlbcuUldBjmA5Sr8IUBQ/5vzVoF3SoSUfvhYIrJF1MN
	r6RDrumGc2b1Xsg9iYvM6q/IEYEThVw+JXqBTHX/x0KyR+7nb6AvFSZElxq6xIPqZJUfdUmtBDe
	rSWAiZXOQO4qwEvoGeYhqnpHbVu52/KRrEgxtkarxoH18aJdnJfpqlrSIyRs5EN2U96pFPWT6Aw
	25gp8Xp2X304uT/Wxv/0AEUdvR+bhavwj04BxvLsdYeMkGhB8y61lbGjfS4NV+XTt12VM6DSeE3
	pnP/VS3y+hhLHWYQopjLt37+T8jY5tL8bMoWY7+yx2n78MdovToctqYqEASZaX1ZTsb+Nt7jINX
	ZawrIAnIf5BwRtpVw/5uGn35rLsJ9y/G7Icgh7CCv76PMgR64VjmqNS1YxAS7rirVlxg1mh63lI
	2gBw6k/AV6xiFX22/5aoNhdtnm0zDxyZLhno/IlSv/yBN4SrOTEmZHHowCJssrGI5Az0Qusrlv/
	gLPv6Gq1zhe9OK54rWFbJ1aedTCksy+J8IkxFhDARHZ56FIZ8/fyZLyxinNg2sJ4aO/EuH7vg4L
	saStgxnanw==
X-Received: by 2002:a17:902:c948:b0:2ca:e62c:9e96 with SMTP id d9443c01a7336-2d64af3946emr118545095ad.5.1787320698880;
        Fri, 21 Aug 2026 06:58:18 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:58:18 -0700 (PDT)
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
Subject: [PATCH v5 17/17] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Fri, 21 Aug 2026 14:56:08 +0100
Message-ID: <20260821135608.275233-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP, but
do not implement the RTCA0SUBU register. Use variant-specific match data
to disable SUBU support for these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Renamed rzt2h_data to rzn1_rtc_rzt2h_data
- Added Reviewed-by and Tested-by tag from Wolfram.

v3->v4:
- Dropped RB tag from Wolfram.
- Added OF rzt2h_data
- Updated commit message.

v2->v3:
- No changes.

v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 75713e7b045b..fab8213c5244 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -522,11 +522,16 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtcdev);
 }
 
+static const struct rzn1_rtc_data rzn1_rtc_rzt2h_data = {
+	.has_subu = false,
+};
+
 static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
 	.has_subu = true,
 };
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc", .data = &rzn1_rtc_rzt2h_data },
 	{ .compatible	= "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
 	{}
 };
-- 
2.43.0

