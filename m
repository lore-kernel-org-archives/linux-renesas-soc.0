Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768607;
	b=wVZvCp9w98f1abGqSN056MOKuOfHInX65pEwYLoezom3zyI6z9HSjT7HW43/J6bFG0Z+
	 0GfuOubE7HLqFVhOZ/K0jWLru4xL/mgSKY5Z2B2S4GRcwP1tjVnwYh9v4ixAiILeT8wax
	 JSjCIGNWQRIKhFUEaUGnNf2mOTt+ETDemlEQASwu2Y9E6XEkMHfZaG8XCqrgK6G+AGRSi
	 hwr3gr7vjSc5Xpk7qatTSWHEo056t05Lyfw2UmfTg4pJCFSczB4uTRbeLgfPrYADCr/IA
	 NOiJGmNwsmELKQNrR6WHs8MpVZaaN3cfKfQRwMXuNRZvFXnu/kAqGsVJWX14LWGIYGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Db+joe8rpw399lL58pGgMb5PYNQLeC5tKwj9k0QIVOA=;
	b=QHNMnYZbmtBq6hCZStS14QbsJ8lJW1qB90VL2Yv8QW2Tu5oIaFDpiB+4s+5ZEwf8PTVC
	 l90k0ZT6RcEG6eWoPz+YJjOdK8B6bumx/Qfef3L1JWq+nUGJpCfrZDXYKlMxa60lTrYSB
	 VxPbsAvZ5rTB2ScGD7n2Ofk8bEiRNTYC0mwkEAsIclFrrGDIOIuCadsAir2apkYgp1AGN
	 eTqHrCi7qNOaoYPlGzV0xYS1INMsTZgjZ3vtgM+wwlxGUcONCbvJ3ffwUMMwzEnrj/lSD
	 +dB1d/LggJUPcjeiE6GtscCHMhoPObYCj+R0MsHGTgwYTkJluEijGeoar8Nj9hS1KHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K914BApr;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC3D606A31C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 08:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CC3D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K914BApr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so79017085e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 00:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768606; x=1796373406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Db+joe8rpw399lL58pGgMb5PYNQLeC5tKwj9k0QIVOA=;
        b=K914BAprYdabZwltvD+D7iBmXnO1hjFFIlxPoORHYa0kJgn+V9Gfb2lEm2wO0dGyAO
         x/QHMYNxJI3CxeLZ95p9nvJAEW49GeMMhPS4h71jC9i1+mWBDkQKMhEPH78JLZCocFgq
         2UxM1p7VPVmkKIowcUFcwPkU2UmVNNkniX3Zz5Zvss4U3V71UnTL+IEYXHrtWh6o9rmn
         gLd/HFpWF+3CWQKmcElu81fIFf3LmzDa3JPRwMvmTrqEcV2Oropq8YmlCno3F6TgYLnD
         /9A3Ho6Hx2WIP1ME3wn567SrYexhAqbptVPhRv6/p+AHaj7RTnltDvGz0Tn9WOiE49vk
         FOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768606; x=1796373406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Db+joe8rpw399lL58pGgMb5PYNQLeC5tKwj9k0QIVOA=;
        b=pDohcUXpGoNKS1FHLE23ohZ3PR3/KziNQx14auQT0ElfCSQQ3F5/851YeJt11L5Whd
         qh5z2wy9nAOd1oXy7oaEKxm+F9RbJGQZm70bQev/0ckMXZ8XoIG4XTYtmYXCGmWjHcTd
         CfCNYTCmgBOpIFbxjDBBglDufv2ZSB+9vQtRHveHGnyFkea1OIpImpcgP9qUJH78A6CN
         FGUQ2XkWh+Lo/a5WTwy3iUdb85CGrRam7eMJ/1SzbrEgoYW9pyT0XnrsLM/Zi5v8iqDB
         XIn0TN4ADSMyUCflsrrXZxB3vpdPzxjqv2kL0jh+plF3d6ujA3pjomw/RUji3qjna6fJ
         uVOg==
X-Forwarded-Encrypted: i=1; AL+hErHgsT/+BLOygzzcVECXo+8elxNWTGSAfpgAfsuIawEx5rOolTNNnY9dI8rGOBI6Y9dcVgpZ5CNeyC+j/UAswxrKCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/KJISitzUVqKuV0OoNaBHOiOSxlIY8uvgKW+HPQaJOTx2PpTKE
	VAtuMYzs1DfCggT8gX1LwLIMIuYiys0Q15zFdeOqHTtedtErKJGvOSw/
X-Gm-Gg: AZFdTZev65zBpT+8/9dhUnegJd/ozJFrVDDSOmHXPBfULZ1YC8LInu0p16C37qvDUEf
	gq1UOyqfctREvX7ml0wUfHE1xO8iLkHDCov886511RmgcWU0e17KkQgV0Oizt0ptJsAIx1g52vG
	3A7gXAW04yTxiwHrQ/G1CmyY+MuVG+KWeacl+W2cEqGSZo/ylvpO1PE4H4sssF/7EQ+AFCSf76R
	yzRsSlHgnwoMFOd89je8+zMTMXeIOCotYutQf9BccyFHThMjwv1RhvSOKBrFJb9EAwqiBoi2KnI
	AjuaIysFUJkD3K4ZP4qTdlTT7Pg/2u4Q6n0etmqcT0KM3uuJoNQPXolHnQRHz0ib9KRPhv5/+Nt
	qhys50W2mQ2+rsAJY6Wdl70vMvBXp1EYhhHFL3aENWlH1dWLc2sHqw4MU7I6o7ULi/T5ACf3rom
	zFqRFu5b4lzgIeC7RNt77p71xrF1SYR2zK8BPVIcMBf38qwrVzbWaa9j6O5fo4QVgngWw5zLht+
	ULLG8iEel8cw9gKIagZP4bbZKdVlPdoyMhCAfh1IWoq2p3xEXTiwuQHWeVLQKHNE7zFhx9vzyil
	mm1+0Zuoa7IqSu1ySxUDZBxMHn2PYOvV56ZoyqmHM4RkpRlckMFf2dnphqO6PCMT2IyaM/zF51F
	L1dQ=
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr468832785e9.1.1795768605767;
        Fri, 27 Nov 2026 00:36:45 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:ff94:bbe1:5ba9:635a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm820464965e9.6.2026.11.27.00.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:36:45 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable RZ/G3L LVDS driver
Date: Fri, 27 Nov 2026 08:36:40 +0000
Message-ID: <20261127083642.131486-1-biju.das.au@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L SMARC EVK uses the RZ/G3L LVDS driver.
Enable DRM_RZG3L_LVDS so the display works on this board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a22..aad8ea31c76b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1057,6 +1057,7 @@ CONFIG_DRM_PL111=m
 CONFIG_DRM_RCAR_DU=m
 CONFIG_DRM_RCAR_DW_HDMI=m
 CONFIG_DRM_RZG2L_DU=m
+CONFIG_DRM_RZG3L_LVDS=m
 CONFIG_DRM_ROCKCHIP=m
 CONFIG_ROCKCHIP_VOP2=y
 CONFIG_ROCKCHIP_ANALOGIX_DP=y
-- 
2.43.0

