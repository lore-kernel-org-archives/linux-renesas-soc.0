Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141A048BD2B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672943; cv=none; b=KRpGiZ8QrqpFkCpk+9i+GzUuV5J1POsUduE4aDeNpyljDC6G6CmD9b45BiI3U0SbvkEdSst/MCLhroyFg2v7XBBV+6x4MsWjNJ+Q/zNiJ39So086YCM3a7aiuJ+1ZaiNT+IK1nHyLEfKUtCOIg3jwHQWwVEYkfZgQ7kccTIN8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672943; c=relaxed/simple;
	bh=Smy6j+jvyzcjX3oQa5z23WouidnyYH+/yVbzp6giW+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9aVt22K/E+sMQ+IjGqzshWFHrjAvD8bf8A3ahYac9eTVJyHIShPVD0iuLZzmxRx+3ucd+zcPLU63NksUkbhsNvEjez04IMAXinyRuzbRyLTle7MNUm9wRxOevedPB2JLkjeoQMlY8i7q0qdTt+Uv0GV2qYhczCLHLbRQ3whcM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBj+GSEV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBj+GSEV"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2020421077so846613166b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787672938; x=1788277738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L41oBJgkTA0hJ2K5fg9Bazx7ynuYkWueRKGvRCk3LHs=;
        b=WBj+GSEVcTcNyakwEAt8Xv5LYvjPfXLf7GZ23d7z1U8c1btd5dOIX3diXN5IeFdK72
         +5htTRyy/7u8dMZA66tzJmJs5wsiVmqWlxfBLSUUeFDAl1RKOafMmdcKMYbXpW9+j0dC
         hPeZVni4/GCXpKSi2WvOfiByTW8ya7aK1nYyntV0U+b/P621ktJnrbVwat7s166JnIam
         WPa8e9Hk8ElktfS88PeiKr2YhwMPjzcf7rxwfQwTjssFznAORH3Rqr40U5HC4/EUQ5IZ
         ec3D72JCQBrPtf1T+oZKmyqWN1ojMQhV7x9lD3u5xGm5RmQbv03tLyfbN+i652iFtkQo
         /LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672938; x=1788277738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L41oBJgkTA0hJ2K5fg9Bazx7ynuYkWueRKGvRCk3LHs=;
        b=QXP5GMBAGNu1rhlM2BiMMONssB+6ovk6qrPCE7DM96q1ysllygF6FhPpv9dWRiRYCk
         wrCyWQfzt5aKdCzP/VugQpfQwmJxCjg746/FWF6nh+sztynXtxAWkpHdzwFwMCSTIyjD
         Cpn8fMGhTIBwlmCMxc18idiIGHNsnlU3WWShAmvfzD/f/KaHvtxVxBwkTo1MybNQ4+f3
         /iMyLVB+M8AtLh9nF3vzT1dKDHOGEOtRk6wkzJtZwtVZk/3YJsMg1aRRvX1uEUrhutmI
         f5N4pWuo+4igDLFKLVC39jEAvgdy0q0mu78jmmtkVvwyAtKVl4sqJJhAhI02i7Tt0Q9Y
         vHUg==
X-Forwarded-Encrypted: i=1; AHgh+RqKppzdgUsH5WQA/Hid0jl8/Rq2ZrQmCr44/CV7UtR6TMuzaMytfkmKpiSKiuY5AkZijTB7M/qMjo+DrFSxY6XhWg==@vger.kernel.org
X-Gm-Message-State: AFuF++lfYcCs9p8ns5eEc88GBTImDYEhBSYP8uvlEyn1Xa1IDlpH/Gd/
	jGwnvFeHHhF1GzQIXYMrm1A6PvtMd+W88yoMtdAvH89Pswg/XySS6rR3
X-Gm-Gg: AR+sD116vMlarweJ9Yvbi4P5SUNX17N7/9IyNGxLmHIBWyyW4w1Ivzi1oG9TiVhm5LW
	6nimkiv48yfCU/QnXErut7AcgGMLbx1xvyrewRJbq90AnZ1nJZb5n2PmtrHAmLSkDf+BF//Pqcs
	w+0c7MgaLR+Wgufvu0vacTJkRL4Fcm2Xhx/q+II80oa9EaohpA7YicFAwmGR7KvWbGcwxb8ztXm
	jbMDMkxissWAUFtkuhLoVGM8ePLXr42uusQeHTZ2ODsiCTB0myVYIYp1Eh/UgZugq38qPBsblu8
	9GvHi9wVByeNYdTMQSaBbDiX5CVkayCQ5H1BEXDe+2Vy8soQnheuQu5CXFn6ZPmsWPbt9nFQnJs
	BCg3TSBkJLkVo3qAtY6m4SKFJHD1HnXUG9lrW4OfiPEbF6mFcEByBCF3VwcLGy6gmGesWOk5uPK
	cGM5byWhmsmyWTMT1c0zNZH2EwWdLKwyzxeAOImnVyP4yLWqqbpBdCp2ckdDg8EFBDqYJXdyafj
	7uF0aTdVEY4
X-Received: by 2002:a17:907:c8c7:b0:c24:680a:1c42 with SMTP id a640c23a62f3a-c2491c9a6eamr3228063966b.7.1787672937652;
        Tue, 25 Aug 2026 08:48:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:81d:57c0:e4cb:959c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fd69asm16682066b.18.2026.08.25.08.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:48:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v8 8/9] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Tue, 25 Aug 2026 16:48:36 +0100
Message-ID: <20260825154847.197948-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
References: <20260825154847.197948-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L GPT IP supports output pin disable function by dead time
error and detecting short-circuits between output pins.

Add documentation for the optional property renesas,poegs to
link a pair of GPT IOs with POEG.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change
v6->v7:
 * No change
v5->v6:
 * No change
v5:
 * No change
v24 from [1]:
[1] https://lore.kernel.org/all/20250226144531.176819-1-biju.das.jz@bp.renesas.com/
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
index 13b807765a30..98bcde755fb9 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -245,6 +245,28 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,poegs:
+    minItems: 1
+    maxItems: 8
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to POEG instance that serves the output disable
+        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+          description: |
+            An index identifying pair of GPT channels.
+              <0> : GPT channels 0 and 1
+              <1> : GPT channels 2 and 3
+              <2> : GPT channels 4 and 5
+              <3> : GPT channels 6 and 7
+              <4> : GPT channels 8 and 9
+              <5> : GPT channels 10 and 11
+              <6> : GPT channels 12 and 13
+              <7> : GPT channels 14 and 15
+    description:
+      A list of phandle and channel index pair tuples to the POEGs that handle the
+      output disable for the GPT channels.
+
 required:
   - compatible
   - reg
@@ -375,4 +397,5 @@ examples:
         power-domains = <&cpg>;
         resets = <&cpg R9A07G044_GPT_RST_C>;
         #pwm-cells = <3>;
+        renesas,poegs = <&poeggd 4>;
     };
-- 
2.43.0

