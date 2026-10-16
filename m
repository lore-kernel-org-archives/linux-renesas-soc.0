Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC951386561
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123875; cv=none; b=OArnBkrZE73000nBUqaR7bwPNRnV+4Z/n4uG3ON01Sydls4YLQ7nTE672dcI0jWwROM8ch41Ax3Kmwh7g0XsYp7g597rTV0uruJTvFdizkwmT3xSRyJWxnOZqnAP3dNbiEfoyPkoVIeyh2naFxmRTbvcIpxLP+q+Ta7X7PBzuZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123875; c=relaxed/simple;
	bh=fvLkZCJ3WJpgMh2sp/BTiEgwAehjZvHvIEf8HbSdvgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpDxXIc9hP5ijngmghgePtUd1EGsOaEGcrxsQA2Kg7PFLGXMfjyRlPKhQ6ji3p0ZQIq/SUf6HyCP2aMEQYK53sbN4LBDXh4tMM+FP0fuQskoX83Y8hHGcfYBqlcWuXNG1vi6qljvpBTK1UZQTN/UqXBzvH/meCBVyUh5pBsSab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWTcK6ml; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWTcK6ml"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e5378b281aso34411765ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123873; x=1792728673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=SWTcK6mlTespOusNMrVqRmrNuyI3yJHZ41HIRI9M2RQM3wqzAMKyhzPXyKt62tEwM4
         Rettv98CuFU9KUU7SnKoHG0496CGyYSJHM141302+uZvvzVSr3xWsAjd2N7T/y3//mT/
         rFoP3KyZX9CL/nKcLdY8SqwdYvmmsf/mCju5eHdCvMQLLXwZQB9srqPMYjyQ45Eb0bpW
         vW2gEQFJLqa2uAbZNITBboMpZK66VEm5RJTLT7DSHM4Gp7iSijFjEkg0c5YaQ0i4R6ck
         ePh0xbR9U9O03T1GiJU08h6nHpyPg95VtwdvPN6xUNTgu2ydFTMV0lZbUfn3LGNZo5YM
         9qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123873; x=1792728673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=rkmLSsJZGrACsT4shvdghg5P6tsMbW8rWz5xV3Jb8hPLgJVZy6DjIIBngAhDTKYMhr
         vWGyGPX9TFf1yh27olZ1ELtutxPey8nIKiWGfzqjdTpopX4hpN3RSTuoV/xsl2ea/hA+
         R/+MeSFq7jAmuSNxBPcfaK5q6+EWzys8IoX5UCtCKsHEfoQrnESIRXEtUxB4kXIZcmxU
         iM9sfdf0FZtjheV6n9iUn3Pkt3gmymxuWs7LqgV80DlMM+y3naQzzC93tjmJwHL6ROnD
         IrANcNHv/i18GkQslvjhr7p1csp/x5rZIWCxg30dIfXXUKYEBYTEhLQeFUigMhO/BP+c
         v9rA==
X-Forwarded-Encrypted: i=1; AKwUvBymHyjAvd+PpKzNx6GGrd3C9y/ZM6ZFRoe+pRLpkIZv+PZSt1E2a0uNk+c9NDQwTyqxmM0ZFi9W5DmyGv+OtRt5LA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKBiSz54kjY94k/ZOndD9wF/7wHtL/nvr0gYCuCpmV8XSOfJzEb
	4Sj+RfW5S9pLnOicceHjZZMvYUX5CEbBg8jiZdBx5SFhVEI7JRvXTq8r
X-Gm-Gg: AYBFou2uSpvaLqvexzS345iUfFyVeUpbY4iqCfXven/LGfExynfEIVKy6vueI6CPszU
	BJ8PCUz1xgy5mQ+Ql5BqF/qVSv+RRViEwtSRx7OtfNn8ydMxnVTsj2d/XfQggWW3rpekeTl+G6D
	NtDzMTRNctxEThQewdlatGSYj0o4SKNVrrB7mLfEjBW2/0EudeTmabVKWHy4yyXwouUArYgwclf
	vs03KzgEpGGSPsDCxR1FhEqfwwHI/1FD+jJQ57FyEG8Y1Vi9CS+vH43Do+i4vDAtjN25h7bEjOD
	ivAmmteWW8Zu0SvJo3Xi4RQMz/+BKT7acdAfAUrzzhvrc1f4Icw3BcOC662lDSpOV9zBrwcSilr
	WWrdmw9FuchFDgZpjcJ+JpmrdrbNlHNRTugBKiHVbZkoubqdENAUCY1EC4GsA6IiQo2ygbfdSCv
	05KZEq+ZudoGged+vRr1dE9yapb5cghjgcyN/CosPmLtFCaP5A8owO1wFc01L2iBtEW20qqzXNp
	jvFpPdgSsD45zRgV6q8iLc9eVfkT4P8ZuXCyDtI9mJFsEQsm0YfTRrEZU3B236nDJZFNCbl6fEW
	9KPL8G+0jDvAOg==
X-Received: by 2002:a17:903:19cf:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2e842ce7c78mr210820935ad.45.1792123873102;
        Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:12 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>,
	Chancel Liu <chancel.liu@gmail.com>
Subject: [PATCH 05/11] ASoC: imx-pcm-rpmsg: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:40 +0700
Message-ID: <20261016040946.521195-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .open() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 30e75fee5175..85b7c929a28a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,6 +269,12 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

