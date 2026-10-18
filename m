Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B14594E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Oct 2026 02:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291620; cv=none; b=ItaZ6K30iSGgM64ihlrksZxXMwIpeEFpHohsG6huql9I7H3t/bp+AoZ5odkFemQFNHmq7U+frwNRm2tt48AbrAKHZ/Zw0TKgSa5DTvCMCHqgDlcrpZQtjzpydHJ5K1Gd7HtxAg/3cU9PkbtGyAtHSMip8AJcgA/nlm5lRbKcf6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291620; c=relaxed/simple;
	bh=L/rz686i3x+RUZOvwJlGil8/fc8KWkc+EpZkgvybyLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a9BDPCB03hHT/sGenYZjMOfj+Z+noaZM7pwxCvFy5fa0whS9Zrahcru4x3NloRveT3DlnbiNix/5BdUr9Oph4+m6c+383WY/Fwlb1E1dVZbGI37eCd66KqCuPhJ7dFrPCy9/3qj3Dqt5ZwRjG0G4k1x3ki03eImCjTrX0XFxLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzQqAC2g; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzQqAC2g"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53397554beaso12925261cf.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Oct 2026 19:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792291618; x=1792896418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgrg8W6lnkrXwWeLJ4XV9VoZQLYHNzAPN0f6A3bXfzc=;
        b=QzQqAC2ghDvfgnioeHY+Pw3cnTvcYm4Y2H81llUUkEaQ1SZXMZSwf4dtPXSEhH0CvC
         KS7mD4uy+OqADPs3+SCHqOp/rz5nJPn/RukBqm2uPLRxjmE3x0FDsB+cvtBLp1AugiMM
         3rfNVlj85BraKhX1SznppT2Z+huCf+uN9fEGDs0YUJf+XFjte4HLosSvP/PW+WhV8QoW
         9A/1x14uFqQjCmOLxBruHyjLg51UDnEI47unJpAbS+KADPILJXyJge5cgXy2N+dkboXm
         v46JVVa0DOZYvQKvmat9Tw+uRU1IpGBYyzOfFCyCN528r8LkFrkcN8hdkVbyMhjVhrQW
         hivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291618; x=1792896418;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fgrg8W6lnkrXwWeLJ4XV9VoZQLYHNzAPN0f6A3bXfzc=;
        b=NPZx/CvHruzFFyIwnL0LR76Dtjg8Mgy48C416mLi6Zp0IhuKe8b5pwbWgcpzOhvWRz
         YGVxfqyVFCVpLecnLufxKcHl0OVSxPxMvHoDMZPl/5lQnNyb6s1DbvxoMVzpHpFwlKWY
         VrOPXX4KBWDe/ukl5zJthRGC4N6zCbF80nL6W0UyK0olQWdKyTS2vg6zb+CBcBJG6t4I
         ef2Nhl5VerXs7GM3oJFM4q9OwtXGTl+TYeDQl2dxIjhA5tzEr1PrZhezVbxajcTnoQkl
         TKAtQKIt0DBSs/1ZeFdRCsz5vv+jcTYaKzGS3vObXWXb2Vw/w/a1dRxYKf47yza99eB0
         JVkw==
X-Forwarded-Encrypted: i=1; AKwUvByuYxVHAv1jTTLAo5d0vxZRhx8rdenEwxInY8x207Rh8AUaMQm277Lm0X44EvBkcSJ4pYctT76rppU20pVG3AXCbQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJvJaZnfQDX5Jerg3MUYssRuKHiM8t8JJXOPY1Chsfx2O8ho2Q4
	LXqmZAyxred4+GciTh4WcSc/WjeZdIGvSISin8q/ky8I/rYOHsf1ZSQ=
X-Gm-Gg: AYBFou2UpH/zPtBbM/BD9Tlqf/sbsfMZx2qVEn4SHbTIlFhzSQI0X5yPhJVdIeIeHxd
	anJl0yawjZiGUyNyLaQyOD/RubNbcUt+p5hgAP1ZMNLwAZz8ULPUikQ1Od00MzSCoMSqcwsZpYp
	pwL+Y6kaynjf4kSZjE6WB37R6Gy2kptTKFF45AnTvb5Q7IAgPrY3bHZC/vS6azfYgtq5cHPJxp4
	0d1NxSJWLCqO2eHm6x2FkC2fdZ3doQnbwALk7B0vQUOVNJ6AkmG0q5NOLbpFguYhxoLTVFPdDFf
	ziByVxwbBQkVkzjXmIbXHL//Cl1V+yTS9NKOjKp1SsYgo7n1ONL29OF2u/GOMI2lcGYUkB1B/5g
	fXBAhvdWmQKnx4rIMl6bFTXteFEQ716AoFuUrwY/EWFpQvCBy6mlaHfgHizcSXKt8BRRbuqRfp+
	lbz3yTJA02GCkdNjAPyy9LiIAPGbOAOmsb+mFEevC9L8X69KiUK8UKAILS9tbMWCAOMZioa4tWw
	6Qiyy68Yz30E768beWfS7ZpjMqYtQ2lsY1NHgtmdWb1weeYxTpxXelMxh6dTrwTZ+EFD0yCPcj5
	IQxAUJy1K0zDJ8d+N+LOJpe/beog
X-Received: by 2002:ac8:7f06:0:b0:535:f9db:4567 with SMTP id d75a77b69052e-53646103232mr63060221cf.64.1792291617890;
        Sat, 17 Oct 2026 19:46:57 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9f0sm62019456d6.10.2026.10.17.19.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:46:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Niklas =?UTF-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 0/2] media: rcar-isp: fix core registration and IRQ lifetime
Date: Sat, 17 Oct 2026 22:46:52 -0400
Message-ID: <20261018024654.3913088-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ISP core IRQ is registered before the RPPX1 object and interrupt
handler state are initialized. On removal, it remains registered until
after RPPX1 has been freed. A handler can therefore access RPPX1 outside
its lifetime.

Patch 1 prepares the return-value handling for the later IRQ request in
patch 2. It converts registration-stage -ENODEV to -ENXIO after cleanup,
so the parent does not mistake that failure for an absent optional core.
As requested by Niklas, the caller uses only the return value and does
not inspect core->base. Resource-setup results and the existing
channel-selector fallback behavior remain unchanged.

Patch 2 requests the IRQ after its dependencies are initialized and
releases it before destroying RPPX1. Its code is unchanged from v2.

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

Changes in v3:
- Replace the caller's core->base check with -ENODEV to -ENXIO translation
  at the registration error exit in risp_core_probe().
- Keep resource-setup return values and fallback behavior unchanged.
- Describe patch 1 as a prerequisite for patch 2, without assuming that
  the existing V4L2 registration helpers return -ENODEV.
- Keep the IRQ lifetime fix in patch 2 unchanged.

Changes in v2:
- Split the error-handling change into patch 1.
- Explain the RPPX1 allocation, free and pre-lock IRQ accesses in patch 2.

v2: https://lore.kernel.org/r/20261015004159.2202899-1-mhun512@gmail.com
v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com

Myeonghun Pak (2):
  media: rcar-isp: distinguish absent cores from registration failures
  media: rcar-isp: release the core interrupt before destroying RPPX1

 drivers/media/platform/renesas/rcar-isp/core.c      | 16 +++++++++++-----
 drivers/media/platform/renesas/rcar-isp/risp-core.h |  2 ++
 2 files changed, 13 insertions(+), 5 deletions(-)

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
