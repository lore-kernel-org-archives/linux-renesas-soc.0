Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A923612F1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028762; cv=none; b=fXB9JNqQvNynHks0QT7AmWqY3O60bDokU7YaGF2cM05LsJyYJSCKjqF9GUyZf92yN8kWmMZs5Dg4thOW0Lutf/mPyalwgU4Z+IkIzVmhlfjeqwSyZOypcG0QI71tQIMrVXTBauAuxdi2FElcEbC10Hes3LBbXdyjCPVLvA2zEhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028762; c=relaxed/simple;
	bh=MChSqGnxO0vcLQoIbJBZYB9F790qawBg1rHdme95xaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+QCrR45FQn+9yeedSN6QPo3WEzlt9czbxKX6OFFTZcyEmpb7ltHaHnbHEagCA0xbopbDSt/7/B7xn2wlP+5iIgDLv5dTI5PRmHBLMDxXTv9SRnu7cWRhsxeeXpmNaBk2ZX9lcG8TmkxxlqhmegItRQ1PwVdvRoQa5sjUuvYsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwX3UICF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwX3UICF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e60f9af6e6so12925615ad.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2026 18:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028760; x=1792633560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+glVHzZv3mmREWfVKTa0Xbh8v/mgn1NgWb1AqzOGiM=;
        b=ZwX3UICFyz/GbyOGlt4Joa0eIN8JVA9a+6rDY0CrlJh7p/6bMiDZ1xt1QT0VYidwCD
         mAGelWvLoIK0NtUQ3J5vqf1KzJ98YC3OCWPEo2OsS5EGSQc0NeH6HSDHFUL3V+aTmOQS
         3/md2hXIFK8MNOZAVbYIXFOJRPOuEHA5uSsCAIKvT4s+hvxM8nKshMEguyxsUVd7/Uv/
         bDSxSbiqefsuDZkaKUp+EXDcR5sBf+BwWKMgPSIwYnBVfUnBVNejSvWRQWiieg+0SoOO
         yOpXVDAOem3eHQCcut8bfWs/GfRgyL0BTjowKUSxquZlT+JVcbIMfzywe2u6HTIZwXEe
         6yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028760; x=1792633560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+glVHzZv3mmREWfVKTa0Xbh8v/mgn1NgWb1AqzOGiM=;
        b=cJNk2S2k0XIBtjMQgDOhfx7YZ4TC8/j7q3t67+pwzTT3rG30V8RL5x0+Pt1bH65dYi
         VGk8wX6rLxeVBu/Wz75wSPo94F6r+/KS1Q0p3v0vToqD+nJ+HeeaVyqZ5Xe8SfoLfvrM
         zNnmv1/O5jPVd/hj0dkRfdzT7YhKSVtk8Xd4r/p+A1B3//9KIoITAUgXNsqukkO2tjht
         YNAjqGVp44+h9uzXNtuyfJlywg/jAOZ9YvicovSD05RsohWnONae8dCZFc8oA976F9d6
         cqJbP19+Hn3cUTO1vcLZf5ovh/f192A0IwySdtlMh7val/HP/6t0HK76yGQ7R3PfOidS
         aAog==
X-Forwarded-Encrypted: i=1; AKwUvBws1yjDcN4Uux8zRo7WlBqeGk26H5Ef55ohwlPZrJqQMxgM/h0oGipwLa6rpG9ld308OpSS0M3JOoXsNnwQG2li7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYK7u3qmXLd09hHgcSLn1Fbv+fuRNcxSyD5x1ga0+c4EWQ2uldfs
	SkmXrqwD1Ata1e6VbEOuTQpdm8xul/IO9V+IVD/b0tdEJp1hMLkhyXok
X-Gm-Gg: AYBFou1+4XdtVhrVFRvdNB5Z2GFjTml6ZwX5xgpf9Mp/TTBuDI1qFMpSqRuZmfDlkUe
	2DRuLEGM0aTbC6AcE2X9GX6CcigRvkOoXLq5uNR0naaFbr5/dWSQuVL0iYwDgroF05Lwx1rv0Jm
	y4kJJhN35AD0RGVY2WAHv0ds4aAHbJD1WC4Rx2OeoiU31ElbcHRY68HyWT0H8AyICKxpQy31Ys4
	X1Qj/eyQi0fm+qd6L5TquKJbXKfV4ECrsCBjw16/RTnkgPPMn8xFvr9de/8T5WMXb4AvQXuodC9
	XkDlh+K3MQ0LgmOn8rz271yknziECstoDv/OpauL3YI17p5F/O+AwlGXMiwmqyc+53hAQ4qPhEH
	VVdzmOBiUeLQSfkhwOgKUNqWeX3GC+4zfH4obzrC2AKlTFAcKwhBYk1GK3bLNb6wKXS2Tg11eti
	vI7ndW9Ejd9Vg88AVPDASlvCBQv77v0MbYibWj6yGMqVT1Bmsp6xwyKgXUW1xs7iT1UP3mN/09e
	i1WqyeGFy+LpKVbYEGfOvhGtoV/AhKuw+lSJ/nlm4qvjpMA0/s1dfaZHdMVgnaSYcqV9V8GUS5d
	Oz0HMQ3Hc1fnQco=
X-Received: by 2002:a17:902:ccc4:b0:2e8:695f:96d2 with SMTP id d9443c01a7336-2e8695f9ae1mr130100745ad.25.1792028760086;
        Wed, 14 Oct 2026 18:46:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:58 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 07/25] ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:06 +0700
Message-ID: <20261015014324.5569-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp6x_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: ceb4fcc13ae5 ("ASoC: amd: add acp6x pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 40c4d833f4ed..cba2509faaa1 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,7 +209,13 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

