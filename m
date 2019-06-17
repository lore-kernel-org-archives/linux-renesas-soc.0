Return-Path: <SRS0=vAcw=UQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFDFC31E57
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Jun 2019 09:01:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 474D220644
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Jun 2019 09:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1RwXzQ/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfFQJBl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Jun 2019 05:01:41 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40581 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbfFQJBl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 05:01:41 -0400
Received: by mail-pl1-f194.google.com with SMTP id a93so3827367pla.7;
        Mon, 17 Jun 2019 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:in-reply-to:references:subject;
        bh=pNwBWfI8myBxqP3LnLKAXWxY4B0BFMOKTEoUha282Hk=;
        b=K1RwXzQ/HnkTbKPZU4B/GjkysH3y4KUvhVSu5QhX6f0Fn8ey2WTZRX1O1cg9Wy4rcu
         /oP44AndJhxg/ZsACfQlG1XdEi7fJfWkAWh2huX9I1LiDA1rc2xrIJSnjm6HGEWWebAk
         SbWYvaXcnhbdobl+tlPca0v01vcX1c7f768BUn/1yGbRWiKkeJDyLPxkcxq2ZrGBSGtH
         XsNho9+1WdKq8qFvUylV2kH8tUJnWTclecrXh07QwjhfWRm9Av8wiYr63nzDf+8s0Q7s
         YeLgkeb/aSoQswtqJLZuw4Py1KowC8EglqR9OEvQEIl3dPuMuAPLfSoD3q2CI/murwIZ
         g5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
         :references:subject;
        bh=pNwBWfI8myBxqP3LnLKAXWxY4B0BFMOKTEoUha282Hk=;
        b=dzzAh+JcSOOhShNtLhHIhGPSpGuzPmxOJHk20Ns8x4iw7z5wrvGbEYgHOKJRaBhQqi
         lm2MHkfgtmVRJ6nmArL7eV6169DocmqNrnO2NjWNm0M8NXbN71ovQ8bMNsQ9S2TaI5tu
         sS1HS1KrHwtkY81M5b9LawSK8AmvenS3mGjBCkiuT+uTj35kaWNAyOyDwWzInr04eAQK
         FDkVGaDiHgndTJnCfAag67E2q4lrcTjZjZy0/K/UMJUWjcnv9w5uSkwjY54Z71T8Rjoo
         gYf4gbpwMbR9lAob2Jpydi5s1jgUv/gKeItzbp2mrNeNDt3rGXmzxiMO5KMGaGEUs7Fk
         gb9A==
X-Gm-Message-State: APjAAAXPVWlzRnrKSYomuOUNC/p8jXvAHyDd4pP5nCp5N7eZBIuFdJjk
        XE5MMAmPkNyvAPMHeiAk8GTTbHQ1
X-Google-Smtp-Source: APXvYqxsY1ePxb6ZrzEccUjp9oYaZ6fEbBFiIigI9fhcVcjg24tBOXLQn0vxFPRvlzhA6/hV8Xj5IQ==
X-Received: by 2002:a17:902:760a:: with SMTP id k10mr86772400pll.83.1560762099993;
        Mon, 17 Jun 2019 02:01:39 -0700 (PDT)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp. [218.219.193.216])
        by smtp.gmail.com with ESMTPSA id d14sm5108936pfo.154.2019.06.17.02.01.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 02:01:38 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     devicetree@vger.kernel.org
Cc:     mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>, robh+dt@kernel.org
Date:   Mon, 17 Jun 2019 18:03:05 +0900
Message-Id: <156076218574.4736.10317127566447729303.sendpatchset@octo>
In-Reply-To: <156076216767.4736.16337667537984218274.sendpatchset@octo>
References: <156076216767.4736.16337667537984218274.sendpatchset@octo>
Subject: [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch reworks the DT binding documentation for the 6-channel
48-bit CMTs known as CMT1 on r8a7740 and sh73a0.

After the update the same style of DT binding as the rest of the upstream
SoCs will now also be used by r8a7740 and sh73a0. The DT binding "cmt-48"
is removed from the DT binding documentation, however software support for
this deprecated binding will still remain in the CMT driver for some time.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

--- 0002/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2019-06-17 13:31:52.766505901 +0900
@@ -12,17 +12,10 @@ datasheets.
 Required Properties:
 
   - compatible: must contain one or more of the following:
-    - "renesas,cmt-48-sh73a0" for the sh73A0 48-bit CMT
-		(CMT1)
-    - "renesas,cmt-48-r8a7740" for the r8a7740 48-bit CMT
-		(CMT1)
-    - "renesas,cmt-48" for all non-second generation 48-bit CMT
-		(CMT1 on sh73a0 and r8a7740)
-		This is a fallback for the above renesas,cmt-48-* entries.
-
     - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
     - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
     - "renesas,r8a7740-cmt0" for the 32-bit CMT0 device included in r8a7740.
+    - "renesas,r8a7740-cmt1" for the 48-bit CMT1 device included in r8a7740.
     - "renesas,r8a7740-cmt2" for the 32-bit CMT2 device included in r8a7740.
     - "renesas,r8a7740-cmt3" for the 32-bit CMT3 device included in r8a7740.
     - "renesas,r8a7740-cmt4" for the 32-bit CMT4 device included in r8a7740.
@@ -53,6 +46,7 @@ Required Properties:
     - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
     - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
     - "renesas,sh73a0-cmt0" for the 32-bit CMT0 device included in sh73a0.
+    - "renesas,sh73a0-cmt1" for the 48-bit CMT1 device included in sh73a0.
     - "renesas,sh73a0-cmt2" for the 32-bit CMT2 device included in sh73a0.
     - "renesas,sh73a0-cmt3" for the 32-bit CMT3 device included in sh73a0.
     - "renesas,sh73a0-cmt4" for the 32-bit CMT4 device included in sh73a0.
