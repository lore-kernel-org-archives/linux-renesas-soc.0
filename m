Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038429;
	b=lILQy8muJQRsnW4RrDuz3rlRR74N4nSoD63iy59xDi2TS7PxEsvk+HN7ZAwkWMx1zwcU
	 xTgPMuqbHoVu89hbZDt04/MEa8t4nzUODIq3dVQNbZSpEYWn0jUsWqvyIgrgp/hkWDI/J
	 UR1YVc609TmGGUOoooHuFpZMhwhlyYQTFn6YNNNAqEa/CUSdTVBJItewXzJaJ9LhYOvTu
	 IHZLMnzDfRY90UOt5lEwgAzzsG/YcJ5iigMyMDVZIkLjipSW/J5DM3J+cASMQlbvFsYDZ
	 BUDX26Z60B9Q9q7URE3s+ILjcPUtbq860vwC7y7pBMI/1Jez+l86Wdz5tq/WtiIxs+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038429;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=pRYMWLi8Ryx7ULuay95kcoiFY2SObkN9QN+kkR5g6so=;
	b=a4fAlwK+IMziLXNcGfzFeq1MpY37+oQiTyHKQc7Ul3Io+Fn/1HOKTjEiMx2kTX6PdnfS
	 fZRiDk/fLWx4fHd8rmoSNXN9i/pIH0eYZoMwEnNYy7zjZIBXj2kVc75Aqtlx2+FMCqiS/
	 9BE9qnXk8LmmVVohrphcGT59tC2CBIjXv0hozJWidJC5GVy+tKc559G8hDxSa8PbIT8qO
	 h4h/5G1SeobXLSNjQwYL46bRV7mTKttm3kJxSg2bOAUq7MY33s/9tY/WDmCgn000nd7n5
	 3c6PdMvpV3Wn5oapp8OC7uB/MqYHnp0dF1TJbpRYCgqppEzDe3EZud1XshBm7GhGMrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ev3De79Z;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66426606A325
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 21:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66426606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ev3De79Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795038430; x=1826574430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=92wBFKxoEBsVppYwDkeMq089FqzVB+htTNUJjvh+OsA=;
  b=Ev3De79Z2RrzDbs6PVgCTwZdxl38txOQ1UplEDKdYmbeIUlA0K6TfXLQ
   Ptf9rwQd2JhglgStt7P6jpRCov/hKsekFwB/paEDBuoxOWRMlTXmgBfKF
   UHWiAN5ItT9wVtxWsixgTP6WdkBjFj8ZY0ELpIlwR9kzZO95twWVUkz/i
   EKJ9XtHD0K7iyaKlMbt/JvWT5tp868Jo41pGWM8polmeZ2+He+H+kcgCA
   zzlMZBhvvob0zNirfn4VWZz/fBjk1rTj9ZlHGX31i7E/LhXkAcePjpy5G
   AiDGZyRZmr2JKmOPFmoeSnGNgwqgnZjCjLM2INGMnRrqIy6bIwt6JiuTK
   g==;
X-CSE-ConnectionGUID: NGoPDdVrSRmHEclbFohB0g==
X-CSE-MsgGUID: qvqH0Pm/QAG+re+O5q2ZnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3763830"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3763830"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:47:09 -0800
X-CSE-ConnectionGUID: iIYF2PdyToyRzvPP/gbi6A==
X-CSE-MsgGUID: 7KGfucU8SUafr/3x8NrfDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10142877"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:47:07 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 20/20] drm/rcar-du: Allow VSP and writeback build with COMPILE_TEST=y
Date: Wed, 18 Nov 2026 23:45:17 +0200
Message-ID: <20261118214518.29317-21-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make DRM_RCAR_VSP selectable with COMPILE_TEST=y, and enable the hidden
DRM_RCAR_WRITEBACK option by default, so the VSP and writeback code gets
built for greater coverage. Builds fine on x86, x86_64, arm and arm64 at
least.

Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/renesas/rcar-du/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
index 80bd770ae0f6..5394f131c58f 100644
--- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
@@ -76,7 +76,7 @@ config DRM_RCAR_MIPI_DSI
 	select RESET_CONTROLLER
 
 config DRM_RCAR_VSP
-	bool "R-Car DU VSP Compositor Support" if ARM
+	bool "R-Car DU VSP Compositor Support" if ARM || COMPILE_TEST
 	default y if ARM64
 	depends on DRM_RCAR_DU
 	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
@@ -85,5 +85,5 @@ config DRM_RCAR_VSP
 
 config DRM_RCAR_WRITEBACK
 	bool
-	default y if ARM64
+	default y if ARM64 || COMPILE_TEST
 	depends on DRM_RCAR_DU
-- 
2.56.0

