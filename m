Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16BE3E49E4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456024; cv=none; b=t90GqyV1PpRnBUjp1+xfiQ45lT+D1atlKh2YswstPktZ1GLQ8bPjMBavohZMeaWxHPs3Vlt37CIUarNO+rP+QWzUwT3fr1u8sxdqkeHnu2b+D7ff00FTMhHdVyQr7Qy5ryM68QHXfPu+S/zf+OFn2JL2x+xnuOpaZ7RzL2bI+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456024; c=relaxed/simple;
	bh=aAJwqH/KKsd5BFgyPNOpN1XC3DMyvJ2Ee51+WOeaFBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpfSltvLFTiurgropqXOVBif8Wqk2UeqU3YfasPx4JX6DSUAQNWRrg7WQOAUgPhEpnqFhCX+wFY3JOPQU4Kh57toDU+z/jZ4Fgc6d+8kiPZ7EG/EGan+TuytHzFCp1OkJMuof9Q9YeYlbSOGjTdYmJ/YNSOhljhTgJe7q2IX9Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4lD3ZPf; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4lD3ZPf"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35120d43ecaso7719410eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456022; x=1792060822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9Ry8JRaSeFrVq0Ud0+uxs62YoBNOy3ejKA8MS9Fs2w=;
        b=X4lD3ZPfeQcGsMQTUiJaPNGSoWdlpV1BWgJM9a7+nPkyvzWrl2UdLSl9Y5jbRtWunz
         Eu211goiSVVa256kmngY1NjBmdGQUYnqCKazn21GwNggbAl/Q8wAwIbnTF6HG7P1DVEJ
         pFTxy0jjmaxDtT0aUc5dsAj4a1Cpc94B9ufORRq30fVr81uLb9LQXiGDb5oKE6Mc+ZH+
         I1OggFmbkVaDwD+4AdZTadXMY2zL4sDysgdDpEhtjL4ubmNU7kb7qvxn+ZVGt/LvBCEp
         qxLGK8w81TCCKjf3RxCGRi3X8/QV6g6JYkjtAI5WNrlVwydhkQmIpnLpuskh9WTS3R4Z
         ynUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456022; x=1792060822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9Ry8JRaSeFrVq0Ud0+uxs62YoBNOy3ejKA8MS9Fs2w=;
        b=vrZqVnItecMCA9gTW2MVf25TzvGU+kpTcTGo7cs8VMYdfiAAguy5qPxCFEeF0wKn0p
         UTProJdxO9kXTy/sBTgMJ5IRetW7pUOOWUSdpti1zwp4t8iLdBK53OW9brvgo94ebRB/
         qADm44XBHS/mw7PB8k6vzUWGKR8YhRTN2Ij3zkLwSqFO5DmO6w6Dui2bjHoAzL1s3xIf
         EG84SRi9fwdiv0ks+RxCsvPYeq/YMs+5ZNV0pwVQ/jwoDLfSBsvP+jg0LoNWUaRsvlfa
         24DriFfs0nFqwmzSb4VH+HpQSdINXoyGJzlvRDjOHtA0Ymi3VlHVoEa05zkuBrAr0Lr4
         HkLw==
X-Forwarded-Encrypted: i=1; AKwUvBzGWM+iknyC6mOQGEMlnjYm+jPuDtU2OoDTsF13WiIKhhu8EEzvLaC0uop6yaWcdagUpX6taF2MkpaqA5G22nhsYg==@vger.kernel.org
X-Gm-Message-State: AFuF++lTUP4EzYHEWrJBA61Hsz/De6ztb6w8UjOBPusIqiyMJicZ7HWA
	koqv0D5RqO2D6Yx+Dt0whPTsfqY3OZihtSLyRaknuE3WvJIRTNloxYo8
X-Gm-Gg: AYBFou3idjltlEHmhEX2TqqDrYl9LelNs4UifFGOI0kibXyvj/Yh4S7Gp3KNOhY4/sz
	98qMZJj77ycbOt159gUyzVG+SqfMDoB36EIlSHBceB+FN9ocolOUvqq9AQg7Fx05TDky4C75Ay1
	g8z1ovmyZVTEjA7/Q0IO4tosWbDAg4Cx6LFBIiZbOhewA12/N4z1/iigV9/L4Yj0xQwxSHP5nhP
	D10mkypnngAJFchIO1rTtqBGM+0mt95e8E/2dKE5WaeLVTSR75FdEEJj0F2gK24ahOK2tm2PuJh
	+L9d60UzXIrlJcoa+ciFcAJQUO7EYBMCsWaKuMKjBKvxVmlZNGPM8aMr5M3gapK+EVujD1aIKEu
	SKVZQ7hnWUfobhp1cpY79CnM/TDJmNJdEb6iYmnjRaCiOSosKS3FDLLBCDPHYtMRfx5OdLyQ2QM
	rHSLsqWGN9DeJSpZ5xK22qH78Bupd1suZyxvKNYTyl+TT2Kh1uu+tkG4NNmksPZqHH+i68nYayP
	6w1AfB2DZS3OfMPnfJ6TR92gHAuEIVRlhYqC0XrbHkZQ6x6TOmR1fxuXBO34OfSsvhkUBDe8JZ4
	jdRoje+QBuguE1lKEy/fHLm2
X-Received: by 2002:a05:693c:414b:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3515def434bmr6671263eec.23.1791456022013;
        Thu, 08 Oct 2026 03:40:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/24] ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:12 +0700
Message-ID: <20261008103831.542533-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4a767b1d039a ("ASoC: amd: add acp3x pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 3f59b753243d..c0481a9ba858 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,7 +233,7 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

