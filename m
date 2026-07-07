Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A10397331
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416630; cv=none; b=NKWcimnfuIkZKIyVMrZDU0z3cgRuXLFJ0IXgZsFj3Z2Iq6Zah6WcG4D295gJfHaaxKjJeb1uw5URxfa6w35Rq506gp2l4A2DB69kKPAZyc1YFA1FhK0hSOszzWlpic/XO/Gc3yDxkuQKa87qljtyR8eIwB9OcKJGoSG2Md6K03M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416630; c=relaxed/simple;
	bh=yp2B2gGjFuoQzAW/JY1plX3Rnv8eryOc6jDsNj0AFJk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qeIeBVSrorM5TVRSbm4WlTkd/nMXYJAZu3a8xOKTsL9jUu5XomLQOGfLz89+f+e5crmowhcJ5qahmG3YSsodGyiWAMZ1lfXN/+XF2UnuVldiqRyTdR2wneB5jLNFsCAq/AFvtuxay5VjLql3MZcJlh4f4YTsovO+s6wNOK5aEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWgVgOfX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWgVgOfX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so16724625ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783416628; x=1784021428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzQpFHJ/fNpPESLWciMsNy0ig1nfmSqgUNKGC1J6yuU=;
        b=MWgVgOfXuq7SewHUOvr00QO/oNJK9xryHXsaLvyHi1LjdIqpzG33D3ErR1yE53+ioI
         4AN9gUZWKhH9nJCoIt7gV0yuONvVpzh1P0e5seYvP+1HbmKVzDPK6x7PiHV62AWv2AbH
         9XyLSH+6G+0MLsMCGUXAopYoMuMlUW95ERxGbSBTKWPe/oIfYMzlZGfOazesMEEVxM54
         Ffdx7EmTNMcRnmY8WhT1XQvdoT3sSoHFcToadMn0NFm5Yw4HqH7jLCCHIupujv7HPcAp
         lD2GUy9GeYkXggwo9/I/OForzT+18mO0WftxlxvQH0ofgToB9nQJ2d9pL54+bVw0e0Pq
         Ig+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416628; x=1784021428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzQpFHJ/fNpPESLWciMsNy0ig1nfmSqgUNKGC1J6yuU=;
        b=mTf5t9bZ5k7NJlWaSuH/uDERuoo1DOsEbceL9baXJQMfgyZrYRE34S1kgUN6e0eaGC
         W5H1XJvcP7V4DD3WakgYIhHszBABBLMOln4IrgGOj2PQP8NyAXtK64Y7JwxQelTojWQq
         8uVs+fxMid+TsADT8BK9sG8p55OrIp2xNXN1S40Gwd20HBGRbvw4Ngi32hX8fzY2MZyU
         DAuSLf8jlQ+Yc5cuusTtupvw7wsWFtOQR8CAcDE8Aob1thl6cj8kpZ0J2eoM8aRmqqDd
         2Qb2iw2g6YdUHaGmAqKzZzoCOoepeuly6WcwQalVGX0sga0oj3sdEC4M0QUKKiY909JV
         BFwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqedCuEOPj0+1jwwnsXqntXIdd485dp5BB8yypno3L7pgbvnBdC4HaU8rfy8WVqanfl+kU55lqiVf/SAZUAxf3Y8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiauOFI8f40ApvYLAwQnI/NykhtNyX43kUWnRZaJw5fHzTzi1f
	xQs6kBm6HKleRPQI24l/4WCrqoNUACnFu58jImN3uhUWXp5KLHIuE4t/xb62Tg==
X-Gm-Gg: AfdE7ckR/XyMaKKzojRbC8M82nJv4e0mc6UTizZStTmKuLM/tLdKf0QMCwoYM76lqyh
	feaVaJfkKUDBm8fFaDE94clP0YKEyKTZnLZOEBDZjpidVo3vgjE4oEteZW2Q6/nQAMvH9P156ju
	vHktbUyYP/ljhpK4t+8sYCrMCk2qTQYKamAcjZyc0d2mWx+IrByjpK+tJMcSCTeWnrFcLFBa6TF
	Z58fRgl7pWfdtApSOVsj9JC7tGouVGPf+j4yMKNviDMhrpEptwsA2fwS1O5FGvPUWXTLrIaIBv8
	E4GyqRjy8hGT6VtaUS97SWblxNMAG5rNYpgnKeCzapzvHGrCiuHzT550/JTMahJN8PNOq4pFGPc
	6TPnzLJ+UWUzF9JTIxtyhSEPTNfkhOyHiJiUWJFJXxXeliL6Mx1CWSv9i0COQ+LKTMxEdqBGRMF
	A7W9Ignhilg95gzgBxC5Hf5hqD7CpE4/oRAmwahH2o8eU0GQU=
X-Received: by 2002:a17:903:b87:b0:2c9:97a7:f543 with SMTP id d9443c01a7336-2ccbf056ae4mr43993585ad.41.1783416628565;
        Tue, 07 Jul 2026 02:30:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm8569795ad.4.2026.07.07.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:30:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4] drm: shmobile: Fix white screen after resume when LCDC is stopped
Date: Tue,  7 Jul 2026 16:30:04 +0700
Message-ID: <20260707093004.987846-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The LCDC on R8A7740 may show a completely white screen after resuming
from suspend (s2idle or s2ram).

After resume, both Set A and Set B registers are reset to 0. As the
Frame End interrupt is not generated while the controller is stopped
(DO=0), the hardware register switching mechanism is not triggered.
Consequently, Set A remains at 0x00000000 even though a valid Start
Address is written to Set B, resulting in a white screen.

This is a timing-dependent race condition. In some configurations,
debug options slow down the resume path enough for a Frame End
interrupt to occur, which can mask the issue.

Fix this by priming both register sets with the Start Address while the
controller is stopped, ensuring a valid base address is available
immediately after resume.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note:
It was originally posted in March and has already received both 
Reviewed-by and Tested-by tags. I'm resending it to bring it back 
to attention in case it was overlooked.

Changes in v4:
 - No functional changes.
 - Resend.

Changes:
 - v3 
   Update commit message, add Tested-by and Reviewed-by tags 
 - v2 
   Fix incorrect use of lcdc_write_mirror() for LDSA2R in
   the DO=0 path; use lcdc_write() to update both register
   sets as intended.


 .../gpu/drm/renesas/shmobile/shmob_drm_plane.c  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 148de34af785..92e7fb464cb3 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -70,6 +70,7 @@ static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
 	struct shmob_drm_plane_state *sstate = to_shmob_plane_state(state);
 	struct shmob_drm_device *sdev = to_shmob_device(splane->base.dev);
 	struct drm_framebuffer *fb = state->fb;
+	u32 ldcnt2r;
 
 	/* TODO: Handle YUV colorspaces. Hardcode REC709 for now. */
 	lcdc_write(sdev, LDDFR, sstate->format->lddfr | LDDFR_CF1);
@@ -78,11 +79,19 @@ static void shmob_drm_primary_plane_setup(struct shmob_drm_plane *splane,
 	/* Word and long word swap. */
 	lcdc_write(sdev, LDDDSR, sstate->format->ldddsr);
 
-	lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
-	if (shmob_drm_format_is_yuv(sstate->format))
-		lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
+	ldcnt2r = lcdc_read(sdev, LDCNT2R);
+
+	if (ldcnt2r & LDCNT2R_DO) {
+		lcdc_write_mirror(sdev, LDSA1R, sstate->dma[0]);
+		if (shmob_drm_format_is_yuv(sstate->format))
+			lcdc_write_mirror(sdev, LDSA2R, sstate->dma[1]);
 
-	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+		lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
+	} else {
+		lcdc_write(sdev, LDSA1R, sstate->dma[0]);
+		if (shmob_drm_format_is_yuv(sstate->format))
+			lcdc_write(sdev, LDSA2R, sstate->dma[1]);
+	}
 }
 
 static void shmob_drm_overlay_plane_setup(struct shmob_drm_plane *splane,
-- 
2.43.0

