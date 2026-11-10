Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279552;
	b=im9vWsnz22oeLdt7IQYBNaaU/l3IN2NblK5oCf2vQ/wAxaNyy9Mn42uZRleg86tL6Z9k
	 IshUkTKCmT+kCgy13qgKDvePUmkgkOMIIBweeMbW0CjV4sLsJlkBD9ePwuIW3+0kJcc4e
	 zv76vOhfHHWBz8SUr7d4fKdw5xXKJNGUU2F5I2E4FlMcp84PsDFNA0QMw3SN5WOUy22Dc
	 u+Xf8wJriF9MWFXu5b9WQyZCOA7jZINnGXCZdddcUir6OzB3gbBS2u9UYToYP524P1yJQ
	 1rpXifBvd2qIeXc76jc1c3Xa9rE8O2DuI13vq3BtDvPCDuR534od6K/vCURd8B2gtxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
	b=kDvVeA6Xnbxx4fWm52VA7JpsT4l722HKKuzRY+1m3a0rO3RENJAVSwIkG7YoEZr5ixI0
	 5tDUM7BW2XI4krFNRIXaTd6sN4cB+KIAieSy/IDgmUuyhU47HmgSEFqwJOaLcYUcq7x9p
	 JygVSACxunb+w7y4qJNufvj1b9DUjI40e+RdKN/rP6ZAUX/q87nj+/6NlhHhGJiegZSLm
	 WhoDYc93zNUKUUs2/75M5V+jl23XuCMUDRM9TY3U6cfp8WCSHgsqHEfcfKCzT/2OK6bXQ
	 roxve3n6tchzCFQKnPSbga17xwbUtsKApZm8+tnshfl/XAwTQrxUtoghAbAAJtJ6lVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naWTOGU2;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE95606C6C2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FE95606C6C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naWTOGU2
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5495d549924so16173041cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 18:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279551; x=1794884351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
        b=naWTOGU2gSjd6fPilXqbw+pukxzR5XvO6U4Mrjw4nk8Re85wpSrdZEuq0RNODlTjSU
         9f7MW/awKMO8QcHu0p7sRT7MJCha/AkkaYl4ZH78a5vNjaspLgHy00QJv3jb4ySbeO86
         BMRZU+Xed9gwxgfh9dHbCaq/dw0TqaW2lmEEyLBs4B3tHXSrKbNwdOFJcl0HL+q3Iymw
         Cz+mLQh+MyT1gPGHj59aGSf8cmpQEWJSwWSeoE3zq9mEqLEsKifZMS16ycm4SF6mcKou
         OmdYtb8iCEMjctoNJyuor4nsiclIuzog0qauuwHXqlMdKtWsV9hlc2cEHpZW1SgjLiFx
         jHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279551; x=1794884351;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/llv2MA0Uu9HzZ4DlqqdaC1DQImqzo/WdhLsEFKXeG8=;
        b=cZ2+92l7nnvDp4Kny7QTdCBOiNqMFoDGqQuknBodcP8a3lgBnAix7f8akCeW9a5DeY
         tCJ4wmEoWcvcb6UhdpzjO1/8Y1CRXzUPZ9vzH8AO+iuEmrcn3dCMZ4BLT+LswctVZzt5
         rnH6zmMYuCjoVn4kJfn+93WZ9NUmH8ZCZifzR+n1EAtXrlC4nh487BSWQmf4/LnZatIG
         oIm6jlJDaPmSqR9O6j/RNvDFsK0yMS6bn/+74ySxaGEKvhYvkzwIDZoTnchrCOKylULZ
         gL72V7BuMTl72NHLsZyazdF/Nlzp+0tpgVJ7pbumv8nc37Qf3FmEsVT/liOFEMoLUQzT
         XLxA==
X-Forwarded-Encrypted: i=1; AL+hErFKexHweHo32mO1UNHgRnAqijWEgCvQj4G9HEciJ9maeFUQ8wsC14x2IUKkxi33lQCsGKHXRKykbEDuNxjuzThQIA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/0KCsYXtAjfixfl0kwjmo6jyynkvG4C3SGNTMrIylT1ck64et
	pdly0TMEtQbv8M67/7dFldTC+zA/k2eBx8cP+E2c+VLHqphqtYtZhUw=
X-Gm-Gg: AYBFou32VnK0D7CLn1SKc1UxLq3h9QaJXOKGTeT0JGcGHO1zBz99soYp6maGMh3/n3s
	bLap4sNVCEU5fFPX+wqbauGrg8u52h99+aTOS8Vv9DdBnFMuf3oDSe+APAyKy7jXRkuhVz0Yugv
	EnhrPx8HCNyVqKclF1/neGz7CQrmD598r2FZbO8eaubkPGNB7aNfrgw6aXSUH0vqeRTYe3d9RkH
	saLi7nebHIyaEg0Yz4dr/e7brjvMSBu0vIylJxhxpMAj8Ys4zohqBGWFyWxSzcPnfvIwa6+zWtT
	Lnkd/QWA0DJ4gOsaLZMGOKr2xhB/nUFya1flPB4J3FjKXjp5O19beOUW5iiH10OvVTMIrbSRGbj
	47p7PSyc9AMzT7d801iDviVpJidfn/jbZx3lVyxRFnzJOlAYTLs2p55gU2p4wrnzHIVkdvP0ZkZ
	vAKUsnNJZFjmzqCMoXM+M4dNE51MvJUmUHtlZH7UuqpIsLjdVJWjXgjH1z5wcoTmUlKdLy+ukhj
	6cXBwHBlT6S3JH3l6Mb0KRRRt65CIqsM+7Obu7QVdHFC86uMz7PCMtknxhyXR7V/q8EeXY+E8xJ
	ixCFkmb6N2tssbd8j4cOVR8eNwgIVvOhBdA/5RI4DYbbypAsjOBJZhe2D6MTvrCJl6ll+hjj3iE
	fHPhhXC1JmoyJyNdeD++fMlAF1JEyxVMXv7/goJ0n0G/9rElEjRsWEpjE2Fflgwrb4e2REWiCJm
	+aOxFmWjMG8nw=
X-Received: by 2002:a05:622a:164a:b0:535:20cf:96a5 with SMTP id d75a77b69052e-55524dffe9fmr21124881cf.7.1794279551084;
        Mon, 09 Nov 2026 18:59:11 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm12601771cf.27.2026.11.09.18.59.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:59:09 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 2/2] media: rcar-isp: distinguish absent cores from probe failures
Date: Mon,  9 Nov 2026 21:59:05 -0500
Message-Id: <08f232218753608ed1a95744d6de14c70a3104b3.1794278853.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794278853.git.mhun512@gmail.com>
References: <cover.1794278853.git.mhun512@gmail.com>
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
Content-Transfer-Encoding: 8bit

risp_probe() interprets -ENODEV as an absent optional core, but resource
setup also returns it for initialization failures and deferred probing.

Reserve -ENODEV for missing core MMIO or the renesas,vspx property.
Preserve clock/reset errors, defer until the referenced VSPX device
exists, and use -ENXIO for malformed VSPX data or failed RPPX1 creation.
Convert remaining resource -ENODEV errors to -ENXIO so the parent
rejects failed initialization instead of continuing with the channel
selector.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Suggested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v5:
- Regenerate for git send-email; no code changes from v4.

No hardware runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 14f3c8f3505..0a322014f3d 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -800,20 +800,20 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
-		return -ENODEV;
+		return PTR_ERR(core->clk);
 
 	core->rstc = devm_reset_control_get(&pdev->dev, "core");
 	if (IS_ERR(core->rstc))
-		return -ENODEV;
+		return PTR_ERR(core->rstc);
 
 	of_vspx = of_parse_phandle(pdev->dev.of_node, "renesas,vspx", 0);
 	if (!of_vspx)
-		return -ENODEV;
+		return -ENXIO;
 
 	vspx = of_find_device_by_node(of_vspx);
 	of_node_put(of_vspx);
 	if (!vspx)
-		return -ENODEV;
+		return -EPROBE_DEFER;
 
 	/* Attach to VSP-X */
 	core->vspx.dev = &vspx->dev;
@@ -840,7 +840,7 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	clk_disable_unprepare(core->clk);
 
 	if (!core->rpp) {
-		ret = -ENODEV;
+		ret = -ENXIO;
 		goto err_put_vspx;
 	}
 
@@ -860,10 +860,15 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	core->csrstc = csrstc;
 	core->csbase = csbase;
 
+	/* Keep channel-selector-only configurations working. */
+	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "core") ||
+	    !of_find_property(pdev->dev.of_node, "renesas,vspx", NULL))
+		return -ENODEV;
+
 	ret = risp_core_probe_resources(core, pdev);
 	if (ret) {
 		core->base = NULL;
-		return ret;
+		return ret == -ENODEV ? -ENXIO : ret;
 	}
 
 	ret = v4l2_device_register(core->dev, &core->v4l2_dev);
