Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB7C5218A0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684669; cv=none; b=os7USNkFmTPSSY71FCHM+zGHcdGI5ae3iXzzD93QssgvuH0sfZ/aQDp5OjMhsXUmcVj5c0f+qP2bZV/IylVBnVIWqD/YDdQO2sdWv3dpJyuG30NBnfmJ1hTtwx59XOFJpwf6HR37T2nAEGGoHvtkUY0xVaXzHWxkR+/ILjS1Z/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684669; c=relaxed/simple;
	bh=l7JUlcdxUdbVr9PpUiwfgJ8/noDknqrKGPkiFy6dD5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XBogzNbMKRw/BzCUZFBuZpdT6FQFy60uL8IgOf910f8+kjGkWGhqugaKKc3XjExWpHhF+N0XTrxLJk/t8AO8qy0nJ6lXUYUdiqFIb2MWSmuyR9+wAf0tTHri/1XyKby0KeRaX6QKOF9PFJ0zAtUBTqstBQQA8H9loVX5z+NiH1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEmrF/9d; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEmrF/9d"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so30869065e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684660; x=1791289460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBOXZc0qdz6ZNCoiP6xwhuNMyL4baEtGYSge9bdsO9g=;
        b=QEmrF/9dVOoFsyXBDu2uyiOLiaWksetKYlv1j/Z/BVJJLxgEVauCicNklLANwNe3cO
         E8Gq7OBfrLd1zirMMDQ9W5SmwgFrCWowho9c4N+Gdsa+/LNkTwhS9yb8VLTTuqOAwXst
         GleYe0PktyGgSjL6RArMx2YqR9ZXF9x6giu+m2dDa7e1nRdkMYY1BC13xHURF9ND7T5m
         mktuCImlwZJ8KHI5DpAHnl11qg9n8qO+kC74yAglR4fgvjHeU7MziOyc6typ8tElizb+
         5uIuMAex1Z0C4t2rC6LSTiKlfYs/eXpktXfSx+ViJj/oVNuRskY/zMktJ5Pd1zPNNPTf
         TDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684660; x=1791289460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBOXZc0qdz6ZNCoiP6xwhuNMyL4baEtGYSge9bdsO9g=;
        b=OSPLnw7j7YN01jeAoOxMkqFpJYDjdRd6DnDSgzj5bXnueF0neG7L08mD+9P2l5jOTi
         gF/hA0HzuWaGRNmqIqP54pw4J6ELGoxbFzHsV8RGlm+33UkIUXRz8/s5Laaw0sHLbhem
         vHt4OhqJXJ79yNXa7FsmLJWYq3KQ/mt10GZIXJtuw2s+SPG8C9n7hDFu23E/o+jF0AUW
         hTyX1HQbZwi4WMpXOqNuRlEyyU8NulNd9vyFT1ti4a3zhhUf/IYBvz27l6vNJDxG3CMT
         WlZrn5sl/NjzaSsuAGh9TE0/H+48WuCmhUG4PNKbOhF8fQNcajNAPaZbwbt6F9I1WcQa
         tCew==
X-Forwarded-Encrypted: i=1; AKwUvBybhEHampK8WiyQT+bsgLkp8UFvwwae4Qb1OpRFRUZV/K6PRyp4WlNewsFaEU/PvPUp84SEQmpJ0TMQMHGpJAkSsA==@vger.kernel.org
X-Gm-Message-State: AFuF++kaYh7Mnh1ySmUSHtjWJ7cml8Bm62EHmSwwL6KX8XgF23QB6jS3
	ur9S1+pQ/aVrRSMlRJ2gghH2aHeTxuCEt2HDwQJfr4+Sd83YGjSKqXTN
X-Gm-Gg: AYBFou0P36fjaQ4NeEYdmuUmoQDRB/agQtUi69sfxVQz9lfyKIP0TIXsoMYplKhBIUO
	eKhdJ5dy8qLZNkJ7tWgoAwbdqPqkdhuUDBvUEmbBh2Jz8FjYXjGtKCFw/IKczFWB2yyqRyiZXkZ
	oCwbxDsNJGBehxAPEW22o+XplT5G4BhHTHOmO4U+xQM+J8pb879Zp4Av5NBTF5pt05EM5MQMlLK
	53qjHF0bO2V1Y6D6UOSVeN3R2nGvIWO5pnNJL7vDfjZ//9L5/VDWtB5V3HIRWF29D5UhVy3uNEW
	gGvrRRFAvBm33yxi7tI84qd32fUca6R6ckLgj/h0zCsqnWGOE3ShDUDguBK5iDci85RyQoeUfJF
	ZusAHRHb42DHusVM1f8XgvWDc4qtGkeeD9QI/+0mtzv5x7AsPLPX4HexpIuCgOB8yeXJUCKA1Ll
	JzaDy5pc58f9tvSbhgcVuwV+6Od1QjKjWf64iSbbUhoSx2BMjv0/0HKT8XKon8gGpmKFvpk7BpD
	PWoSidp0xsgK1rI1v/oEMxMgy91SjrdK6SULTX7du3Y1ahbTSj1C0DMPD8WBdvEqxJmRei2eFrt
	iFEvanUM4gJu2FT6xQ==
X-Received: by 2002:a05:600c:3514:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-49fe6701e7emr276449655e9.35.1790684660244;
        Tue, 29 Sep 2026 05:24:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfafa23sm70994965e9.14.2026.09.29.05.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:24:19 -0700 (PDT)
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
Subject: [PATCH 0/5] Add ADC power sequencing support for RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 29 Sep 2026 13:24:02 +0100
Message-ID: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for ADC power sequencing on the RZ/V2H(P)
and RZ/V2N SoCs. It introduces per-SoC probe functions for the
renesas-pwrrdy power sequencer driver and ensures that the necessary
Kconfig options are selected for these SoCs.

Note, the ADC driver and binding patches have been posted separately.

Merge strategy:
option #1:
 - Once the pwrseq-renesas-pwrrdy driver is merged in only then
   the sysc driver can be merged via renesas tree.
option #2:
 - Merge all the patches via renesas tree.

Cheers,
Prabhakar

Lad Prabhakar (5):
  soc: renesas: rz-sysc: Make power sequencer auxiliary device name SoC
    specific
  soc: renesas: r9a09g05[67]-sys: Instantiate power sequencer auxiliary
    device
  power: sequencing: renesas-pwrrdy: Add per-SoC probe via driver data
  power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and RZ/V2N A/D
    converter support
  soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for
    RZ/V2H and RZ/V2N

 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 109 +++++++++++++++++-
 drivers/soc/renesas/Kconfig                   |   4 +
 drivers/soc/renesas/r9a08g046-sysc.c          |   1 +
 drivers/soc/renesas/r9a09g056-sys.c           |   2 +
 drivers/soc/renesas/r9a09g057-sys.c           |   2 +
 drivers/soc/renesas/rz-sysc.c                 |   6 +-
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 7 files changed, 122 insertions(+), 4 deletions(-)

-- 
2.55.0

