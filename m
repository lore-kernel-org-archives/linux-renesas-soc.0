Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD23515965
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681972; cv=none; b=AA23tFgmwv2G39+WG17St/FFrgh1EJ/Xp4ArvqmBrrjtQYHKcs98UaPnlc9nxFG2lMxaHmaD+f8rhR2H7C3D2bkG63V9IbvYYCpIXq6DDSV9schF6TdtG+F+TpLJx+n86l9r6ADQfnGhgGXXqtP09m5jolObf5gV16diQB9UNbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681972; c=relaxed/simple;
	bh=QaMnkzX6EqShlGHNFpyUbUxZqjzej/lVJ2TWucKRB6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmMUeSV71XBN/i86ckmNqOC+2nzXNCMcRWW8pu07YikOFG+MwzJotIubQYPIaxigUqohMJbLwvTT6ip5SwbX0BjQY2ZUw7yvOps74hwZdmc2HNECtJ5CShPPf8OOoUOc2NfpG+7PqvxV2ZfKgglBv0yBMqOEfqjz3nu5I4YPHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXm6e9c8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXm6e9c8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso43550055e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790681968; x=1791286768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckbTsCWiYKNlzqXGD2Tr3x77O+MgOzPXQMoGVWRepJ4=;
        b=HXm6e9c8UAVxBE/jwrIo48Cy5NF9RMVUsQT50UIjzdGuBcxKQCK1HC8OawAWu+SBUD
         lK52J6l0W13sVTif/tzJgVSF0JLW7v10yWrHV7XUqP6Soc9sPLQOGv3fF7gwhGiFbq6+
         S0SZw4fO37dwY5koYu3wBYPOaBgf1sXryqLcl9tpKF/JwFjkQegjD2nJi4TdvXnxs8eE
         kifXDFEnx6pjZudx55xjwoLtFCrmQX01lljQL4YERGnX77oMzF+FPpRNASTlAO5n9P1l
         V73wGvkwqf5OdeS2yUvi8RHM2cwZ+0cQoG+MT9j3nJLgs3dMnsRYPjrz1F7J5XpxGoEE
         d4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681968; x=1791286768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckbTsCWiYKNlzqXGD2Tr3x77O+MgOzPXQMoGVWRepJ4=;
        b=aDgfezz4QPUpvgHSbNylp85pI2IPItOIvnWF1GNuwWpZC0FnhcbAxDD3RAOVgTQSxv
         kNYoFJtbBIpF6obyFg6W2UpaOwEMvgIUQDKjMN8AWQ7XHc73hDn4ZRUFFJqqr5RbZNu+
         4LNNZGA6fPg6HUUMZ7YOr8wO6TTzAuULoIKEbTIaqpI6iz+ClzAbn+DvR+9BB7yodlrB
         jdBOUEUIfwWpPTeicG+9XQOFtYMDgfKrwZYRI4qkCarQA9UW7BqltWsZV9aVtABXvvfL
         HwjltFfEA/+YmM8/+xeMORM2u4j3ktXn9qGEbcwcQo+eudrTOK26AwvlAgk2Jp7By4S2
         55qA==
X-Gm-Message-State: AFuF++mlTKLhEnfUZb0gQNEBLGpD8LaMsu5D9qsVpPUN0pSoCPRUUhfZ
	Q2achJYT8i7jGWN3rcfBiK8Kx8eSbkejd8V9VZbkwDrh39PpkAFBTBVD
X-Gm-Gg: AYBFou1xTXCSH2luCVS/p5ETewDuqXH6YFDkcPodU5tp0v6cNItbxCK5dH6eZjQ165B
	q3g5/1FBX/lBZsTjkDBGKLmz/nGp+u5ti8ojV6lNgYCeC2+LDU4i5kHX2imFwStoFK8QbvKIv50
	MR0pH59zzDaiSgkBE5v2ixkrp96tTyDioasU+gAtThgimoJb4juqTMqCBQDRTpd7JenanZob5yx
	i3njc1zMHUn25dIolddcgLGowlxzVWB5ZOQfp3almcTRjSBZoc3SCkZ2y5iVn5Y3Ui0MOg+Wlfy
	43ck8fre7v5qVXRxc8JBtB24WHLbejrxVi16EtqLG4ew6Xdt30GI1u6HB7U2Q+oqPiDyieqOWEQ
	bR/Iq2nU1Zegu9XDaYmXT1yZoMC9M9tfE+c+JE0c2y60749wPLpBiQyno2Gzub/cksjL5RUN4LH
	LOdbqVWueYpwn/XxNKS14UwQfmpZnv9LtkEX6n8tRw9pbjMoZ9SnROu0PneDrgxiFInFTu/1k73
	wVNkWqeCZqsDaDPyIX2kIQxAbfxAPt46gUVIYCyQpxHiAHqzFWuhq4XjZCekik0d6agCkQTULUP
	hhJvdOdCdVSjwN02rw==
X-Received: by 2002:a05:600c:1d06:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fe7bcc25dmr261575645e9.31.1790681967977;
        Tue, 29 Sep 2026 04:39:27 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm83215565e9.14.2026.09.29.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:39:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add ADC clocks and reset for R9A09G05[6/7] SoCs
Date: Tue, 29 Sep 2026 12:39:19 +0100
Message-ID: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds the necessary ADC clocks and reset controls
for the RZ/V2H(P) and RZ/V2N SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g057: Add ADC clocks and reset
  clk: renesas: r9a09g056: Add ADC clocks and reset

 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 3 files changed, 46 insertions(+)

-- 
2.55.0

