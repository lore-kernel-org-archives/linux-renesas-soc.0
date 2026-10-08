Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220A04973BE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456218; cv=none; b=jKLNEqeAaNtHqVNVWJFMXwxiwSAuNRHSqDB4cjKVy3FB4s8Buzb1RXM1Ta8qNGIlwICaV4Ise/yWblTDYVlXSBPP1AjCohTeKmkJU/NNVCcjSQT69h34JF2v7QOLPFYOLdqO8j13ir4nh8RWYyoaS9oF8Z9eHX4pLB5a38laLNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456218; c=relaxed/simple;
	bh=M6D9aaF9YzenOEQjSguQl07lda02HnO0SBENTFTDcdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddYcJDSc8zkD3bL215zeW0rgiB8I3HFtEyuu5bdxEBK8o5KxatYRWmi1cmUhsTNimJGNYjWfT7eIz/oI+8Vor3sc63oBV+kfE5pq0+cM1W/4VPZciyJzULUTUGCmDG/yEe+zclQdpufKPFrP/vJLweaYCryuhigvjFnrv/TlDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ru8D1jET; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ru8D1jET"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so894294eec.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456216; x=1792061016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=ru8D1jET2dSztv6RGwn5H5YEhLcmlHauVuoLQhYOaqDuIupEpJwnEb+ujOWmo+WP/o
         WO8sFtDl5Hydvw4nJuegrBcYZ2DM4KESF+x+TT93EWUNNtjNREJLgv1QX95wCxOcgi6Q
         2IHyTxuWsZ6LGWuFyf6l/vp6CNBKBqXGDwjrAN2LT4OqGNEl762N985QMyTN3h0KAA/w
         FNXo+s4HH+6zNHucyE69peI/2UC4+G0YCiLMFo6JDNFyP3AnDODDQMQkNSFXyUjMCVyk
         nX3+ux8YhV2AAEAm0+TpvSO7RCC9PdGgXYjRRdMjYuMzAy87q8iotbqkzPxxmcGVRESF
         apKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456216; x=1792061016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=wr+f7vi0to3PxHyF1p/Dvhgb5hyIulgqagxySTDt5ch9XtultZYEVNJcTeOvhHfWum
         lWc5jGcMsyqkrgNLNPbliXGUElwBZsmioipeLPMsHgaZL7Go2GpxrT2GqjWW/g0E2p39
         n9lwbBJFGyd9+LYkrXp/HzAvxPGq0PdW+eXcZPpeF/U+Dk5nwuGVz7CXzATKNYHq1lfa
         54CbGKQtBtCCWkorulqVZqK92gc7rK5nHnO0ioVUmVrNAVEesMKCKA6x1gDozdqx/Iab
         +l3GNF6PTuGozzaFopfhyXD9Aiq70sjz2jBxfYHoiQ4s5Plz5uvvKUHwiV4WK/8BxtLy
         aBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzJwGv1Zpujh6P+e1R55S9HlLUqH7fNcTTP+T9QAScLRGQ00aGV6g6ioflciBhAxBd7kSWOpruY+xMSotekHl1lw==@vger.kernel.org
X-Gm-Message-State: AFuF++nZ52QIW3gnHW4AkTI09FeeWjOUj7y2eDAF42mE9newYawCNZvG
	qswu5S1ZvZit3PMQjvHSLcfGQWkJB07rFultjoyZBzNSuRYUje+nTQY9
X-Gm-Gg: AYBFou1B9rqt0KS0c/wj/KYT6E8MM42+ZwL8zKxct0KrvZNsnw7Hr5V6zlf0jY89dn5
	oo2S+vrhu+om4Up/bS7WeAArD8Air/wuuPUbHiLLSjPJtXABbT3dwRVLVndnfMFozLEaIPjF+cw
	V/doy7uVBvcbyPo9TYwGcbEXLId4cNyYQfI4QWKh3K4kS4p6OPlaPNPWxyguVq2yeEMBuwUiLlB
	Df77d5w+ntMb3I3FO+VDWOmVozPNkLER6eJwG4OIRuevOM4uvGzgBtNuyKcAOanbojTM4xSvZXi
	novGeRgIotF+Ae6RgraZb3/WWdhwzn/KpiqkCYHwx+6iPHINkNAhQhNku69H2gVZnKzY9s4/iuS
	xcQwRroeeFnoP269vxs4vVjvm2R1/s3jVB9mWgeJcHO4EbQIOtFiOIQ3C6/IG2MZEIuOFM7kf3x
	psj1IadCud23a6Wg80JBjQfQxqgIJduT/qnRd+mrckWKMO6kJgvxXxIMdAGdlhuSvYUpiYfcWw+
	g3c6g+P4WjrlIMfwurYIxIlyLn4+IkYAV2wEeuW6UwVjZ6yd8hFsLLpSS75y3edJPvqmOpDQNUT
	jwLllDzXnSl5KRGb8gyLuv0f
X-Received: by 2002:a05:693c:2402:b0:34c:e77c:f92d with SMTP id 5a478bee46e88-3515de8cbfemr6349033eec.33.1791456216244;
        Thu, 08 Oct 2026 03:43:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:35 -0700 (PDT)
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
Subject: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:25 +0700
Message-ID: <20261008103831.542533-19-phucduc.bui@gmail.com>
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
from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 7086fb7fc1eb..30e75fee5175 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,7 +269,7 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
-	return ret;
+	return 0;
 }
 
 static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
-- 
2.43.0

