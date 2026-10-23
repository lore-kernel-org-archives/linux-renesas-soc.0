Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721384;
	b=ZjjNsRRAhDWd+CQYfjYPwxoqJKoobtOtyiRaIK4893svdeeDmweilXnRBE+4kalSdf1b
	 8oU4G6xtrKKSIkK9As6IQyvCfzqzkRg1a70dfWRQUdDhoXepSGdKcyQVtmLhM8k3bpBxr
	 9KcJqa16DWoCue8IhxvGnqcSaHvzjsNDX82QeLbIrHu/BtHC2DlciDYlkOXgYLAkFvoMH
	 92jce/b4C1JFSLJSXd661BcyyxeMGJjakBzulItJ6REoL8MpoEkVwPq19rpexh4KCqxb7
	 LaovGsR109Q2L2Zz9AFCbnaCv8a5OE4n8DX4GL9RAIzJnDkmut++lF+7mpv2d5bQVEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
	b=BY4h5N4XzJfXsa5UkIpGsbzv6Fq3IR8/+i18HRjcTFWloaUNjkjeWnrup9xIIQpIyMGh
	 iuMQMQa8Osv6uovXzzKhy0CkhJb4NXk194GO+Yw54eruWfvEfwQB/d6ivN0bAQ1BdBFmD
	 5VR/vOQuKrOXmFI3dHcVLdM02D66JRl7VICTgGjO2XfRSEUAPatrO3nCVRQpid5ePDk/y
	 t626JlRxPcyGeHjNIQXC0XbLRFG22xRPGhpY4fz8yOrYXBnO5njLQWuOVpDUtWxxu8Hcm
	 sufg8TC/a25W3Tsqw6Ei4bInJqPggOLU7paFej7so2LLjFT8Ib0R4sNOMkO8HGZ3z/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ajy5gVdz;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFF606A31A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 02:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DFFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ajy5gVdz
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e946155442so2780935ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 19:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792721383; x=1793326183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
        b=ajy5gVdzBO5meo7SWQMrbQWJtJdCzL1//MFKia84+VmiCEwkpVsrYbtg3P3ECvPbIv
         ZU7C15JYfKcqk5CFUI3GPJiGsXYXRccf4+a7pAX14b/C3mpAgIgdqeEHthMNxFdB6dPJ
         OsBB58VAqhpbjaBteX9r+qP88upV3+dOU2CRVfiXwrMZJn+KKZphwXPh7ZisDwAIGgeo
         MJDl8k2WHSuVfn0rpI9WMdHaLw6ocTAWG9PK2sHrmRcCsvC5qW6PjAKnl4O0r8lMhtPv
         eSm1yFdyui8bL25xIMF/X6/Y8fGbSWUkoIK/YVcQE6KRldKPgUEw9wt7V/CDVHlmV2ou
         iKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721383; x=1793326183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCEgrGMpts002PKaGu2tXyuX04mpb/j8xqv0L7WHiNg=;
        b=hAJjziTpWMKpJHM/4SpVwthEyaywqjsEHo7RU0xPvz9RH8jKyjKCxNLEYUupJ0egMD
         jvjMReojgx9MbrZD+ZgEAbuKLagnFshkYDhgFEut77tY4vE8H9MSAD59qTVv1HCJ4dff
         UT5uO7HdCbEiuo6F9VicU123wi49tbIZIfs22Bbga+o04Zky2ouPhT8ITmsWefExcdEz
         KX8lFTxM+KLvpyAauHTm/DRmM/lrR1XRUl7v2PuWYV+lKcIcrSQxKF9HcXrA1vKqUuUi
         rHsKBonkEROikRQlnCZH6ZTGNxNsMZrFvfrnuMBJ7CbQqFtTQ9j2+S5sg6aAlBbkWUDe
         dWPA==
X-Forwarded-Encrypted: i=1; AKwUvBxqTXwNExHukvOoGvxciB7tv1KWAh1L6jf8B+VPhQljyNOW9uJtkR2XVV5LnN/1naD8E6Lm6fivyNY/MvudCXbWjQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbrT8jNUHdLazfHMLi5J29A5YEX98WIv0KGqIfu+lwFi8F2Yrq
	bKems+bSu2buGAaWOxwUc2qBFokjM6vCxGj6Tl3CArBcO5vO+JHmnS7G
X-Gm-Gg: AYBFou2up79ZVsZ+JjSb4ZrGM1PQUEqaUuqXUgY3W58vMvUPm17mVBB6wj0iEp8AuTu
	KhGFnVS/eLOH3RRPkvLvBZix/S5UdVKgTmKmtOYirr8CoCYxBCxxOhFUMuVPu1vEejhXqv6fYcY
	vnKETK3o/kOlIYdwxCpEOHjZlpuj4rdKgYiZo4e3fxKxsEcJyfLmrb6qYlLvy7VAGx1ruMQSVDN
	GmlhxJzCLGfebr5EnD5odH0De9FZvwBgASEZwcD0giNWCFb8VH+CTg4Pq73RqYZpsn45RgqURNW
	gKLCn708fnmGTAerafwyLIL9EHHaUypX91Wj5SHaSbqnK4YiIteM8lKB95wLEgEUmGVWjMEmd79
	uCog+ad2Sy4OxmYg8+gc0GBpTebNe35ManTrygwLj88wk6/JDn+JNxFpH94/3Od3XrQV3kOCNJZ
	p7Dh1MDbiniBxzO6qoHJUdEB1rtd1JUK5+VY/48MayXlK2BiSuaYrkPavS3fA/b3soItJfxK2J0
	2PvA7MZ3KV+fvQkUGXN8yXtfj2qua0kOt+lv0QYq/xfPkC/TauVD4j1egjsg5pWystqenmJGYSg
	aniQAKDBeOD5kQ4uomNf/oW/i8eADjChO7M=
X-Received: by 2002:a17:90b:580f:b0:3ab:884b:65b7 with SMTP id 98e67ed59e1d1-3adce7db6d6mr477154a91.25.1792721383412;
        Thu, 22 Oct 2026 19:09:43 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adcb1b256csm1199747a91.10.2026.10.22.19.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:09:42 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: daniel.lezcano@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3] dt-bindings: timer: renesas,tmu: Add SH7305 support
Date: Thu, 22 Oct 2026 20:09:32 -0600
Message-ID: <20261023020932.23836-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add the SH7305 compatible string to the Renesas TMU Device Tree
binding.

Exclude SH7305 from the mandatory resets property, following
the convention used for older SuperH TMU implementations.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
--- 
Changes in v3:
- Align SH7305 YAML comment with adjacent entries

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..263f60b950df 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -51,6 +51,7 @@ properties:
           - renesas,tmu-r8a779f0 # R-Car S4-8
           - renesas,tmu-r8a779g0 # R-Car V4H
           - renesas,tmu-r8a779h0 # R-Car V4M
+          - renesas,tmu-sh7305   # SH7305
       - const: renesas,tmu
 
   reg:
@@ -110,6 +111,7 @@ if:
             - renesas,tmu-r8a7740
             - renesas,tmu-r8a7778
             - renesas,tmu-r8a7779
+            - renesas,tmu-sh7305
 then:
   required:
     - resets
-- 
2.56.0

