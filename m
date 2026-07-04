Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256C1208D0
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187633; cv=none; b=OzYdVxReBpXhkElIZldPJONCnYG3N5Xod+gOOFDCvojXzVDU1uUV096VLeidVBY5Jnv2GQw5pkSQC2EaE5SDYfx+N8fXAAV3HWAF/b7f/loeEhlrh0sWQOBR28Gpzgf5c3j5wHqPiigKwrPnzF8FbRzacut1VuaG1Sd/jk73bzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187633; c=relaxed/simple;
	bh=35nwSOQ07RSdbmMk0T5r+J++6twNGq7wEcf4jJZIyhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=utzjumI/XDjFewMVr8uVFYOv0bDtWp3ChKLzsgKJ+lrJ/2+6nupo1nJGo9tvWeIHoIbAC4wrUGdfy62jeHWx0t71Pr1nXI4FuNeAmQAmxPgrjtGsnSGMK/KbkRF4D+zfoXVgt+Y05AJ0TZIszTubgodBK6Ve8/ykPj5E3iGrULc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omWA6th9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omWA6th9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso773813a91.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187630; x=1783792430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGOj+lcLEIoUGW5g1S/36ZoafArbXJU/eQ3z+w9OW4s=;
        b=omWA6th9XpeF+e7vdyGIGZW4xDu+E90p2GrG/FCL7oQTomNQi/ly77sbDrKNfKGPrg
         bLbBmClUy7D9XL5fZ7/br/GqHXMOvX7X2GJBb8OQmqIlmnYCQRo0WdBQXnvMEmzktO6q
         Ro2mixXBeme4tc7CH7Gx1wdOiFifHTvT88HAdxKqFjjyqZgjfGs/dHZVGtcEy5M2ME8K
         cQ1IHFk7k6LwPOwm30MmevINxTSF5oYEz1fPk9v0fO7phK1ij8AQP8oyfLMNoo6kR7yw
         7y4xz6NvTytQ8mriN6hmoxOc8k3zEOPVKiufJPHXXvIt2RnukQPj9dFSWcfef+5pDYNu
         tylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187630; x=1783792430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGOj+lcLEIoUGW5g1S/36ZoafArbXJU/eQ3z+w9OW4s=;
        b=L1UwlQlPhacr1OkSQfXZWlmbXvVJxHNFVsOUGk4Jh4z2zVv9vdeAsRVXbJQZx4XdJv
         a6coPn2IJZXtzDiBO2E421qQys9BhRgD5EdE9tbGARH0cV4q50Rcvg5BacoXTNMlAtxi
         DA5mvKAfJlAJWArS6dcb9ZSBnv76Fcpw5vJnUKYobwSHmGI3OxKTozcwi4belaZO7CS+
         EIQtKlhRoJUrR/EDftIndOAHd/zMrODK1v6BMopu//SO722uO9sOfQBck4O1xfD8+I+m
         m/gQjkSm0BKCaAW/uZTMVzcdyBV14wRonTE2OMrL2KkT9Yqx6xRims/s9n7xDgdaXPd6
         mJmg==
X-Gm-Message-State: AOJu0YxMF6g6mdlCkg7TIplHW2IyUPt4z/1iDpHye0buqqrNyhfrV1MT
	A2zfT6bV9fSlTFMSJ0vRlS4IbS4wSGSR90gbk2o0BeAA1HbzkgWj/uw6
X-Gm-Gg: AfdE7ckIIp5fjTbUw/uhJxhusPDF+akx2AuaBoYSJQ0vsib2/24WlSohp/D4er4tK9c
	1IsDK3/Jk/GCmkj/DtujOdRrSdKhir1E3RqHzzFktLCiX86rt1uw2rsjvWLKWtaHoIqkNHYIdwT
	NbSIJ5FhIPb03ai5S6U2lC/iJozZmLt+sAznWWWqDxhDUtji6M6MZVxlOU1WR/CIVBLHshe3FSA
	7Lk4B1usxAOpAmHmlcBb6llJyK34gO3Ft2u2p8RgcXhvRfprb56GPmAD1/HqrZRzHVkXhBHMhez
	k1RncQHKt6qSO8KjhzGmFOe0TaSu2dBOgI0w731wze0d2lKCExwlY0FVNTbhLpd7ZhhZHwMY4lg
	nRWXtEMvHTaHt0w+y9NKaU1HTFK0UWvcUZeSJ2Hv7huznU9L8r4B5K4s2NB5gxeswaekDnlIBIK
	HNcCRy4iRYcLTzF8Me5WyVDFT8y/LQKhSQXGLEJY4x/6Q=
X-Received: by 2002:a17:90b:3b91:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38280d9b8afmr4152886a91.10.1783187630445;
        Sat, 04 Jul 2026 10:53:50 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.53.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:53:50 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:39 +0530
Message-ID: <20260704174638.66302-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series addresses missing `media_entity_cleanup()` calls across
multiple Renesas platform drivers (`rcar-csi2`, `csisp`, `rcar-vin`, and
`rzg2l-cru`).

While `media_entity_cleanup()` is currently a no-op when
CONFIG_MEDIA_CONTROLLER is disabled (and even when enabled in modern
kernels, as pads are rarely dynamically allocated anymore), the media
subsystem guidelines strictly require drivers to call it to prevent future
leaks if the core framework behavior changes.

Changes in v3:
- Addressed maintainer feedback from Jacopo Mondi to fix an unused-label
  compilation error in `rcar-csi2.c`. The teardown inversion is now handled
  cleanly inside the existing error path without requiring a new label.

Changes in v2:
- Introduced dedicated error labels in probe paths where shared error labels
  previously caused `media_entity_cleanup()` to be skipped or improperly
  called.

Biren Pandya (4):
  media: renesas: rcar-csi2: Add missing media_entity_cleanup()
  media: renesas: csisp: Add missing media_entity_cleanup()
  media: renesas: rcar-core: Add missing media_entity_cleanup()
  media: renesas: rzg2l-core: Add missing media_entity_cleanup()

 drivers/media/platform/renesas/rcar-csi2.c            | 2 ++
 drivers/media/platform/renesas/rcar-isp/csisp.c       | 5 ++++-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)

