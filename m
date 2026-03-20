Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0BA3D1CD7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024928; cv=none; b=vF1zkDSOEO46m7x+t2X+BEpCIaXrWCsSFqvnylrSGR+U/arv+eyMxhVwyp0zsAnXS8v+I2Y0HFUuzKLxhcr/g/ASDE74dJlYF83kue5sxo9fDFAYvHeKiysjWcART0/c1o2rUdpxPyRQcJZ57lOzpG0UPShcHOBToreyraTWOIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024928; c=relaxed/simple;
	bh=ajk2mACS5mpdqChjmZkeYkW3z57bokdCuI8BeMuRKA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+eTcZBGNGEpjmn5opbCKRTxxa7Ivk2//JK253ZI0hIStffRDURKQm9TOoH+MnaNv55hFi8jd26veP+cEc47wZPZc1JPDTwXyq5ze6gQCEfa8juCwwx5Th0cs8NrCu0czg03F5OBeXJvLW/lP6YToob3sb5W1NlYFieBSBDHRow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jad05NVQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jad05NVQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fb14227cso21086595e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 09:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774024924; x=1774629724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0atMih6wv4MrL6fuegw3RReBHe0f+0yJzxdUtx87zE=;
        b=jad05NVQsTsJD/rZLub1YEfuZ2v+sZWXCpsL9PtkKfy2LSfqDHfpGBqNutJYqKRA6k
         1O71Em+D1OcsQ1ukeDoWcbkLsc2skWhayHPUsunLuuffVjpFercIQ/DNKfqYRk+Wiy2U
         U6oKPwL4LZwyshYFK/dqyhHocRqipf0aC/TksKW7YQwafswoys7xEUaP4EOhhD5T9ze/
         Pv7TaiPntygTupEPKTNzrcZTeVPx8kVe9rvwliCugivk7bBWJtjof7w+eEv7opA2aYSE
         oiubTb6bXEytPdshMDeVIWiZldrlXiwIZmfVGUvrZ0Vyv5I6ZLpXJuIkLf71E1y3z06p
         Ua6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774024924; x=1774629724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0atMih6wv4MrL6fuegw3RReBHe0f+0yJzxdUtx87zE=;
        b=LOUZaQsukaZ+7dTUm7JPu5oPXSS036j0z9qoqUajFB5oLNfNrsN7GzFGRWM+SDygD0
         dnxDlzo5ARDxp0rxTFaoY+R9PdStbuwl5k9t9IVUIS47kASgim8ge3ek5Q4X6Xcqfwyj
         u17M4ti4JUkBbKYd61Zam8v5nIY9DiYPEdJXqtgg66NFJkhVbrfksL+TGtMAj5/mPMlF
         pMsd96PNesq8d2xx82cfN1D6rRL0be80Ovk9eh5fz+ZUdLUDMLP3LX8xlgeLHvIuoCrL
         oncEywY1D+/q72qS6wkNqZo9z87FqLw/ECg+Jh9p81zYALJDkR7cRy47t/unSOdMb7Ys
         u4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0dM+8mQd5eVm3mh87ubVbcRPnQHe0UXODScJ3xZM0b7p0/5IXv97HdEAfhHbVyCX6K0G8vwlOJLF9h9YiDMNbTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+NeFz/BDmluG06/d9Tc5jEId3o/mO3PSHo96+uf3mBxHItLG
	FVBK70e/loRwT0RDOIWbzsPPf4qQzzXevKcNTa4Cswv4Pymn+2HFhaiL
X-Gm-Gg: ATEYQzxn8o/Kal46+wpRXWKD2u3nqgJnM5m492KqAzcRKYZkIWZGNim/nlHe7E/5DIl
	PEU7UEQ72CI9YHFVZpdGrGhCaEXyYTtGTalEa6YzmlevVkh9fybLcyKYkTap+tY/TmLZ8tc6xU3
	BbZiKSx/Wf2fS74ALVaBa9gDuYZvVQAPeSxb4V31l+9xpYtxhGLqSuvBjW1gq9G1PHJHjb6r7aH
	I6srQeinEhic7xkFnpIqPLE4b3aWpv9NsjHnz0G2cOxGzbtiwSEh+ygq61hp5GejpmkX22a+9iE
	NOjGk3hGBNYoJmmy/Z9RatL5a2MKeskNvqUrgBDs6XCDw/NtoClLTtAAy6TCKy2kgEGOAA0InRl
	gcF+VV22VyzpcDPANH0A57fWSvuZPfVZVf/hdBf+c/17gEzG95l5X+0uv/Yxtudl2l1jVbB6xvt
	jn5C7qyX6GN8rt5UHMc0z6hqxq1LbEEDY=
X-Received: by 2002:a05:600c:c167:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-486fedc3843mr55711415e9.11.1774024924016;
        Fri, 20 Mar 2026 09:42:04 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm7016575f8f.20.2026.03.20.09.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:42:03 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] drm/panfrost: Add GPU_PM_RT support for RZ/G3L SoC
Date: Fri, 20 Mar 2026 16:41:50 +0000
Message-ID: <20260320164158.487406-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L SoC is embedded with Mali-G31 GPU system. Add GPU_PM_RT support as
it needs to be assert/deassert the reset during suspend/resume.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 711f5101aa04..3d0bdba2a474 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1156,6 +1156,7 @@ static const struct of_device_id dt_match[] = {
 	  .data = &amlogic_data, },
 	{ .compatible = "amlogic,meson-g12a-mali",
 	  .data = &amlogic_data, },
+	{ .compatible = "renesas,r9a08g046-mali", .data = &default_pm_rt_data },
 	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
 	{ .compatible = "arm,mali-t604", .data = &default_data, },
 	{ .compatible = "arm,mali-t624", .data = &default_data, },
-- 
2.43.0

