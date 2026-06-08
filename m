Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C803ED124;
	Mon,  8 Jun 2026 20:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949804; cv=none; b=HY9/USIGgEEmWwvVKMwd3mBsBsCbSmHEA2GKCf7I1Kdo3H2R+z/apQGEMI8Et/cYvVqJJJYuioXR4yX6poO3Qnhn5mYjz1Ul+ZI7iy+ugqN7H/HMoqnk4Fr73kQXtUOo5M4/zL8Xo0UMJJ2diJ5iVrLHFVFvkKYNwjTd+iyxKG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949804; c=relaxed/simple;
	bh=B0eN8qck19HYNg4ngTDGX8MKsNaymMnqZpcjL8CDQW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLvPEsm+HxilIvwmOFfGmboszprUAXdAZDTjQDPyKE5pJOPeut5CIUf0jBsU+lOlm2vpPUAJ1JsbWsoBgpoi9aFcdOJZksqedLYBjthROnC4GP3VxxunZQSGWbulYpX1nvLIsrAhm3/5c6Zun3dE/LkV5Il3hLzhdfYUgTHf+pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYlgAbpe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYlgAbpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B80C1F00893;
	Mon,  8 Jun 2026 20:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949801;
	bh=V8FpqfK6BrNGzXwyagk5netU9fKT6/4/WWtxZJz6REo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CYlgAbpewYwlBMRSlX7tg2SrLooa/aacJJE/A67/cjnmG5ZZZaW1Tri6up6oMtYLs
	 V/qOjlIffVMoeVbfJG8R9Jp4Hx72clhGZXGL1y4Xp6yhAcFFCOBR76IYrcX5rnL3DU
	 CuK8CgJ07dqX7lO5qEuUz8uJY874Z3+phDY1EMfqW4neRWxeXCNXLGHzzCHsWjbYoI
	 ZwO3n5s78gx9qfm5zq8wvPERAIfEiIwpSeKkcv+3Pz58IdcUMmeHlz4rgk76mJxc35
	 WBiCSU+d+hjemN5l2aAZeo7CaciFZt57J5+D1pcCSM8vU5PlsbJvkHM6zexZEcetr5
	 8/trAzQRZhaeA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 16/17] i3c: renesas: Drop unnecessary tab
Date: Mon,  8 Jun 2026 23:15:42 +0300
Message-ID: <20260608201543.804902-17-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608201543.804902-1-claudiu.beznea@kernel.org>
References: <20260608201543.804902-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove an unnecessary tab to make the code cleaner.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 6572934a1837..b6c282c53a54 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -109,7 +109,7 @@
 #define  NCMDQP_DATA_LENGTH(x)	FIELD_PREP(GENMASK(31, 16), x)
 
 #define NRSPQP			0x154 /* Normal Respone Queue */
-#define  NRSPQP_NO_ERROR			0
+#define  NRSPQP_NO_ERROR		0
 #define  NRSPQP_ERROR_CRC		1
 #define  NRSPQP_ERROR_PARITY		2
 #define  NRSPQP_ERROR_FRAME		3
-- 
2.43.0

