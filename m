Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674200;
	b=kFmQLraCRYEdoQzFURNW/aceCmlJhvbkNur5Mlypdq31SBKWB7LcdeZE1MV8Ydk2dd58
	 umFasfi9jdQX8bnMpIiio7skNa4WsA+/xYcYGero5DagZ34rWLXxgJnfSTnID0fIRL1Am
	 ZH4bzcLZCcLlzm/xzeoCGiJjYrRBv0lLbXAB44uAE7TqH46Bq9GdldpBnD5jZMscJfJQY
	 UsSuOlwJbJj1sKludPeevTENQfQR4R1Sp1lYwSrkMBCOBMHF/h8qDNkj5TPdXSlxRZf7d
	 C4tA1gIEroz5jkpqLJPa8CqOXzg18yAmRXFCLFD8yh1EI4ZhrhiHbP5BhOeK3WhxT+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
	b=OSWgtBemFgr0FvYqnOgvP88zTUteP7qnjOAcND/OOxW67Km6mt9QqZgraWHkM1SSRnt9
	 Wddu011axavpYQMMsKmZQOjn/WQUiCYUJwZPWeDjm4cilPYDzwXIkp23KMMSZmKl3hIZB
	 5wDmIPSTFWJQVqTV+5NPfpqTo+kQ/gYbVQED4HYi894ndx2Eqtvrqdp1MSzhdhCNtwnp3
	 UX9zJ6mwWwfn4yFHcfHR2ovX0PSG16bik5EgFI5/pQ20SxZkUEGqJMhSocoJFPZyqDD9g
	 HeYChpoGvZWtrCaUtPQ2DBZV+iN6LDgj9YS3z24snf4vDiPyWLOMaqsSEE5QKZ6mrvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YACbua7o;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F4606A327
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 06:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F1F4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YACbua7o
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b51a9606e8so150514a91.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 22:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795674198; x=1796278998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
        b=YACbua7oSN7sJw24HYX57m0e9cVdc1sjtYLdAIvO3Cg3hutEKad156pvmOXb2cEj3W
         pET12Z7zu6/oqTMbLIPxRWZxdAOyxPa3evc9VAD4XfUfNOHSV2e0CiD9OvSwNh8ND8MX
         3wbd6UmrU35bE/ykoZ+nC8Jr8UKnnRU1l06r8J/MhvMz4Z/Egpmjzj51PnH5KnWxhIly
         ErJIyJUFHfxnz8ZWR/nv5uFtbZ1VA+uNYnR3wpts0jwh+ViEMYs7BNUq5FiXwAt+DJ/G
         Fo5ADZQozTr/arFscBB9uNCCUOOSCu8Zn7/ANmdhJUl46PFLQqdXGxp63uz/7pawIzbM
         TI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674198; x=1796278998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bb5Je9p97xfNctApi5CrFhZd9ei04elcnBUavAD020=;
        b=eT/1+wkBIxzRlvv2Gqqj6bzPZeos3L3tciT4FNQR1fUdj+Fa7h+OsnWDZ/mgMbupKM
         z0zA4nvUerry3BAY/Pm+YO2TR8OrLaYG00fKWiE8oDtkSUIXgahxaQafgDOwT8MluOGv
         q5Yq1PSyH8Cz9ujVhZEv/LEa1dX59B5jBHQLkqf7LJrkgYMsiIxdOlDjDoKVxvx5CVlt
         J9g2SFQgNxxr7+UPV5ocOjoHua+YKPqIXcUJeSKPNTUnzRPjqK+jtKWRuDf5up3LdFb7
         kltTh10k2hFDMyw4j5t1+OF9Ig0BENCiX/CE4sEmRtDQgkp6xvnf4cSvkcmyrrfJZHSp
         KrqQ==
X-Forwarded-Encrypted: i=1; AL+hErE38XkoU4q+0GOe7Iy6HmTb3cDGio6bXiN1DP8iESocH/upAzibKzP26sd+EOV1wRxaclQBfhBVRhbPHS94bypP1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z81eFuH69FZfT5D9jNyYFA0dPrLdv6We56kyfDtBmhjEODGcita
	1uHTZJrFg4lYdZa1Vcw6zpghGaThUAz5DISebgbBr51Vap/n+Za2FYnt
X-Gm-Gg: AZFdTZe1Mgpgp/vsLAEMH3b/e8rWjwPolA3mqq55UWWRjR8nV1Uih+L63ry3wY10n0i
	myRXZLbvblVkdvIa3pojkv4lpeOJftCigCUHoUNlF2m1ziqKk3HcGaGIUCodj3e+Ik6/dkb13x1
	FoUlGbq4ADNKaZEe78mor2uQjAFUuf9PbpsMYqS3eWG0TxWk6LcPzTUCjVJDK1k/tsBckNHo810
	xJltpuIePNO0ya28eTiwuekXc13wbSP7JXAT47g6sHq1Ar6LefJz7hT3tTghtFYgPHUuMKM6j6x
	/6blHG2IJoNsvBWDWfOhrfYeZ/enaPwxvG5owt0r45ltXevQvN8d+rWQAWafuxkJbRmQA+6LSSB
	e7DnSObQK+NgPSY13QYpf0rk0qW+IQzfR0UhK8S1u+jg4WD+T28//GPd8K8OUtS5KKTTXoG4UNE
	11oOwXcauYoJGwMDH9WgPwCfLiTB8ll8WQ/zo6B5721VmMhPuMCFhzNcB6oSfDcn2ZZHuMjFKrR
	yRyZnb10TgoGq4RGACgIA54EzNKEfhuzKa/sojybzfjkQzXJVV97dbghhSw9yDFx2oB0YToKmHl
	o3ejaSzNr9D/xTGSN90d4bZS/2M7DmCyHzRDJXtz7Oz2gbt66jkSks4yv6Tx4wbAFPcs
X-Received: by 2002:a17:90b:2f07:b0:3b5:a68:297c with SMTP id 98e67ed59e1d1-3b50a689b5cmr2618272a91.66.1795674198424;
        Wed, 25 Nov 2026 22:23:18 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm18122486a91.0.2026.11.25.22.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:23:18 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	mfd@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>
Subject: [PATCH] mfd: rz-mtu3: Fix MTU5 timer start register offset
Date: Thu, 26 Nov 2026 13:23:07 +0700
Message-Id: <20261126062307.53943-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

rz_mtu3_get_tstr_offset() returns RZ_MTU3_TSTR for MTU5, which is the
index of TSTR in rz_mtu3_8bit_ch_reg_offs[], not a register offset.
rz_mtu3_start_stop_ch() and rz_mtu3_is_enabled() pass the result to the
shared register helpers, which add it to the MMIO base directly. For
MTU5 they therefore access offset 0x002, which is TMDR1 of MTU3, instead
of TSTR at offset 0xab4.

Reproduced on RZ/G2L SMARC with MTU3 in PWM mode 1 on MTIOC3A and a
temporary debugfs hook calling rz_mtu3_enable()/rz_mtu3_disable() on
MTU5:

                          TMDR1 (MTU3)   TSTR (MTU5)
  initial                     0x02           0x00
  MTU5 start, before fix      0x06           0x00
  MTU5 start, after fix       0x02           0x04

Before the fix, starting MTU5 switches MTU3 out of PWM mode 1 while
MTU5 itself never starts, and rz_mtu3_is_enabled() still reports MTU5
as running.

Look up the real offset in rz_mtu3_8bit_ch_reg_offs[].

No in-tree user starts or stops MTU5 today.

Fixes: 654c293e1687 ("mfd: Add Renesas RZ/G2L MTU3a core driver")
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/mfd/rz-mtu3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 7e1313a57abc..b7872ee0ba97 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -196,7 +196,7 @@ static u16 rz_mtu3_get_tstr_offset(struct rz_mtu3_channel *ch)
 		offset = RZ_MTU3_TSTRA;
 		break;
 	case RZ_MTU3_CHAN_5:
-		offset = RZ_MTU3_TSTR;
+		offset = rz_mtu3_8bit_ch_reg_offs[RZ_MTU3_CHAN_5][RZ_MTU3_TSTR];
 		break;
 	case RZ_MTU3_CHAN_6:
 	case RZ_MTU3_CHAN_7:

base-commit: ebb7a8dc1e74c705daffe11c2faf38ec2628f838
-- 
2.25.1

