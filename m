Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0B497B7C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456268; cv=none; b=UcYzP/C/JZs99z+9LB80uGOlFp9ywtgvaUdmu63WV0Uis6WDqRO+FiAE4EpyyB3nZsF7SecxV0ZlruKA3c2+c6OnQ8TK6EJAycahFkwY/o0iIp7I8KWWqMA6u0eo37QFbAgbWJelQcHGm0LbQRDO59x2k53738Y9rCZSCcOvBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456268; c=relaxed/simple;
	bh=IeY1UCp2zv3XkIJvaFQJCH/Jamzhz2wdmHX15Fsk8cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQFNN5KNWl+PIZ0Qor8P2UGn0UifvQp9XWXvHpSpoXxXlVVNT20hCtDKunKPrINqvbAFSWwiEwvaT/8ii8avmXbu4/T7gSd3tiXl6twzcSuvKkMecX+vEqO2L+QaHohwdnc7nNmVGijY9pSk4/wS1e2uuvzkV3WhgerYqBOvAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffn5R3Ob; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffn5R3Ob"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-351767ef18cso1965720eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456266; x=1792061066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuLwPV5SkTfLeBmEQBHF5wyNVMglPos+3a2Ytz5Xtg0=;
        b=ffn5R3Ob5Qn6zW8sklPbadf5IoNbMq1dE1nGZz9O/S0iZ1b6n7PbU8fnuRPMZWbWAO
         KQ9z+dtGwThqsQPbQpEfyTIpakhvexBxu5isnhchFYKKs3fddJe9zBDalUMUMiYipNGS
         WfZRP9AlAGB50RZoYx10jDMc6t3f0arCa1M3P/qNhJWMiPuIebn38JA00PgAo0h2M0hu
         aLi89P2aL6uMBNDYFzHC2kCHLeuWzJTzFaBrRA6/z/5o/AMD3eZ3n+oCF4WIEOmFlseo
         HSwwnlkRA16UJkYxn+Nf8u9z4Dc/Dtq0qIoQmudtqgRoR8EoDaneg/3tvDj08tWUEURg
         LmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456266; x=1792061066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuLwPV5SkTfLeBmEQBHF5wyNVMglPos+3a2Ytz5Xtg0=;
        b=CmFuvhiCjEDRKrA2OyGPMPIP8Qy8lIB8JXJUKs686LtITKAqE+xKXRGyx0EkAteseS
         elHrDsFeY/kDvLF2CMOMAn1nl0p+B9pE2PWtKqed/ahg7ztd/X0o3c68Xig9kh1pewGO
         H0X7pmD//CGkkQ/yKRC2oxnnOr7oDUPinIEuphOA9ujC36eHF5ZG87WVybdxuW/B6MsP
         yIcwVnWJLXn7uLY7U8/mbwQ0lQyTIu/kRKK3UxE+4djoV8cF4aSmMJiYFR10omoUtAV/
         6LDLq2lwsVOGU18dgUi4ljxuKvuh6scmalaaHd3nVmSiYRwG7M2FJdmnE4g3Ib9HQlaJ
         Wf1g==
X-Forwarded-Encrypted: i=1; AKwUvByANS774+hpl+zftq91hMwP5AKvC30wDOJ93Ejuq/b157+P+OWAdDJ7aDikHsV+QUbP+fEZONl1PtmEjNxCELJX/A==@vger.kernel.org
X-Gm-Message-State: AFuF++kStW25yc2BLxK9hHfzv6aRQBQRIbCVckKOFeplsNx1REvhii99
	plEIzJ+wpr6r9SZi9QJPfBEue+Y3r+FktWY2BK8DUPq/jbBelh5OIX9p
X-Gm-Gg: AYBFou2MdnbdtWswiCGaamxsz4x2WGBQBUE7Ee+gX4MSGaAnBIeriL3BwJpAuMq6QXB
	unR6CgbcYS4/e1B/NGjHPkLx/veawd+t3jcuflWt10sVluw5kehLcCXjWRIDlaT/AgK0fjMuC2b
	4H+dFVhXckxX2fJErf4C+iDaZliMdSgbrrq74zY1P+YOYsoXEtNKhaickb7zUzEXAO7f8mIRF7/
	RwmUV9+mdm/eC7pGqTa6CoPCXzRNiJkz5VR3fiRJW0vn57UX96qx0DN1+Ebpv3vyoCV3CLSD9Y7
	JC9auTctwiQbt6Bq/fwmIxk4T5e+WNB/avS4RFhDiyHA35xfeX4xgXJLonnTQiAMCZ9Tx/utDBx
	iqnGK+Kt7yueV+3gqimIAMQHCdZbsOg/RFnn2Cv4ggFlXphYs4IsKw0Mi09WnXkBmxXCpk/bVPq
	CdADfqZEVcAt+2BIqm41+ttCp0rVK7uqe9SN7JlOzPt7rYJKagcAPmGIMXgFqDzdGhVaf6OcX2X
	2zYrkq3AQ4+LVah0ih2FYixrsVxB8xTsRcVSEUWCmKmtrAA0xpv5EeQgMkcO2Ibl4iY+pobQCCV
	JZ2g9jw1BMVQgQ==
X-Received: by 2002:a05:7300:d408:b0:34a:e7ba:863c with SMTP id 5a478bee46e88-3515dde5512mr6327305eec.18.1791456265752;
        Thu, 08 Oct 2026 03:44:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:24 -0700 (PDT)
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
Subject: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:28 +0700
Message-ID: <20261008103831.542533-22-phucduc.bui@gmail.com>
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
from msiof_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: c61caec22820 ("ASoC: renesas: add MSIOF sound support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rcar/msiof.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 128543fc4fc9..9fead9a22cdc 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -427,10 +427,12 @@ static int msiof_open(struct snd_soc_component *component,
 	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 
 open_err_dma:
-	if (ret < 0)
+	if (ret < 0) {
 		dma_release_channel(chan);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int msiof_close(struct snd_soc_component *component,
-- 
2.43.0

