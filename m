Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765235221DD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684670; cv=none; b=cy8o+ePaWibRAWZKqZj4hxW5i+wlVp8jzXygtGLZDzigdtONtk0a7Nm6I+ze6x/Auix5JK/TePYNhpO1DcAENyOZgtnzyhZg4smPIOZFkoa49YIfmpCQSGzHPVidv5JUJxuslYtv4aUxFDOf6sPcUTcp0yaqcLrNx9zZO4UlClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684670; c=relaxed/simple;
	bh=CPEi90r2204QF8UFqqmcvO4LpsvgMZ4QxnHpaWfz53M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nietXnxXRJLUZNnHZzVuIkasJ4W4INPUsIXyLI4bc0R5rxf18QLRKzjAUHdIKa9S+HW35UWXEa0LeySVnrV0+ikmBZMuxPyJ3S8FYYkszMglJ+3ESWctd1s/PbZmfYSSw5UuGzD/nuGvpn6kiZDQGdYC12wB3kT89xFvSGAHWqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+I6aKj/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+I6aKj/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so25558395e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684662; x=1791289462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boEWQcjTdM8NwmxpZiqZk6dpdmmjLo9Kr/Z9eFTkwPQ=;
        b=H+I6aKj/29h2MiSmHjYgjzTrCmW/x6GQaliYZ/UPHR/Bxrftljh8bYWng0wGWtXco+
         djNFiQ0xWXs+IIr6QPvoBCevf6GGlYpm3ZtNZNiLvntAFKIVFiUg/fKqDCQQCgIrmR7t
         BDME8DdB6yXTwTK0Kwo0y7vDmniR4nH2khPdBWnY4xF+ar/jbyxg1fiXWi5L/ZrbLBPn
         lDpYo72UtG0Bm13SyhPpOx4mSM063pojADCpxa1Zl7i5MBtqMqOc7LTM0LYRIW+vD+de
         aSoY4JdXmTVuFstQYIujl7frmxLaNjLCDZu6+yR9fm37BL0nU9nqK1G7ErfJ2YV4mbVw
         prfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684662; x=1791289462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=boEWQcjTdM8NwmxpZiqZk6dpdmmjLo9Kr/Z9eFTkwPQ=;
        b=Y1xkbCnoNNw3mH9Am38Z+pB11kIRht1AYSuToEdBYq8z0oNwiPPJlpsTdkgKwVQrHy
         ItO1ggzGSE0fw4Yrr/eSSVDwiOvyidX8bhIo3glF1dmPLUCqfF85vivlc+2aqF1fwJKH
         oKImq7GAxYdN4XhIXKAkjVszfNLMLfkmzM+R7E2JsVzX+qJJN3gcBWjtH9W/kinVR+SO
         BVQfGrPJvCxc15vS+meUPgabkKTctHI2C6lrM4RNWmQOIJpN9wB8FkGyh2tyUnhUXri4
         Pzh43f5sQHf6aqu2cO3oLHm3HyGVmnew7PrvGxgCweOtSKViKo4Pn3Yljbsw01s3ZJI+
         s2Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxDyIzLKoFRxBr0T6GmJr5OduXz/42qJSiWOo2uS8nodImwm1Uc6wx52qQW4dAg8udyGPWxNZxSPavBwy216eXMQQ==@vger.kernel.org
X-Gm-Message-State: AFuF++maVnzD/7z52oo3IrUL3rLnJvMABi+388eM8liPiG5ZwomKkuLD
	FC+ixiqo2wGPLhjCrn3ufz+TpMVYez6CHd16tCeBjMfbWH4YaFxhdOUE
X-Gm-Gg: AYBFou3Ulrl2R8YvF9uNmWzGMEixcA27swNoD66U0ipafZTdEyvO9SAOaGth7DKGIYk
	P366OKyDTGRDa33eB3+7Wi5wx7MMNFWjwLHG+ZZMJBJcUAofARIM5tq+5veoy1Xw4Ec2PJxe4dA
	fOl3ms0/CibExorXgcCP5V+CHB3Y1xBPH8ygCA6JuxdCGlxu8R8edEmSZ3r3TZFdcIIC6iI4LQj
	GhMbRN9Dgh8BTrvnUSuVksL27IbZ+wMrIjW1BDOusKm6IqnBJ7l8J5KWwKo09gae/sKk2b26Lq+
	+zPDEnqMTyUjvl5dBIN5s+1sG0gNyS+1Mh9j8Fmoqy/0pwA9G7pUznyh7Z8NGEU3PjdkGPk0DnM
	pFA+Yntu9D+eIp1+TTruj7fiLigFO2Kiwb+gIwZ4G0Go4qi1Q+/wsvKPMS33WzZvOCfiryj5GmT
	CPxlf3q7qs6+X1HploPE3lTTCAGa0GOUqx+LZNflNb9L+LYPO2OZ+qChv/U2/tabOxoBcQNC4Oc
	XeeDzS+JoJGWg0BUM9WDyU+t+MVdFImKY8cc+IIPZZjRjYtbF+ywQDxLJAiN5XXlPecyoUXiLb2
	cr9Ud6qUUgv6G96iCQ==
X-Received: by 2002:a05:600c:a09:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-4a0099c361cmr62461925e9.24.1790684661815;
        Tue, 29 Sep 2026 05:24:21 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfafa23sm70994965e9.14.2026.09.29.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:24:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] soc: renesas: r9a09g05[67]-sys: Instantiate power sequencer auxiliary device
Date: Tue, 29 Sep 2026 13:24:04 +0100
Message-ID: <20260929122407.219448-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/V2H(P) and RZ/V2N, the SYS_ADC_CFG.SY_MSTP_ADA bit controls the
power state of the A/D converter. RZ/V2H(P) has a single A/D converter
unit, while RZ/V2N has three units sharing the same bit.

Instantiate the power sequencer auxiliary device for both SoCs and
provide SoC-specific auxiliary device names so the power sequencer
driver can manage the shared power state across the ADC instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g056-sys.c | 2 ++
 drivers/soc/renesas/r9a09g057-sys.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
index e6a66688423f..3895583fde07 100644
--- a/drivers/soc/renesas/r9a09g056-sys.c
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -86,6 +86,8 @@ static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initco
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.print_id = rzv2n_sys_print_id,
+	.pwrrdy_pwrseq = true,
+	.pwrseq_aux_devname = "r9a09g056-pwrseq",
 };
 
 static bool rzv2n_regmap_readable_writeable_reg(unsigned int reg)
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 308492c31acb..b9def8dc73ae 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -89,6 +89,8 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.print_id = rzv2h_sys_print_id,
+	.pwrrdy_pwrseq = true,
+	.pwrseq_aux_devname = "r9a09g057-pwrseq",
 };
 
 static bool rzv2h_regmap_readable_writeable_reg(unsigned int reg)
-- 
2.55.0

